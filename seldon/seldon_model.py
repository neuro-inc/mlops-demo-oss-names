import glob
import pathlib
import logging
import string
import unicodedata
from typing import Union, Iterable, Dict, List

import numpy as np

import torch

all_letters = string.ascii_letters + " .,;'"
n_letters = len(all_letters)


def unicodeToAscii(s):
    return ''.join(
        c for c in unicodedata.normalize('NFD', s)
        if unicodedata.category(c) != 'Mn'
        and c in all_letters
    )


# Read a file and split into lines
def read_lines(filename):
    lines = open(filename, encoding='utf-8').read().strip().split('\n')
    return [unicodeToAscii(line) for line in lines]


def findFiles(path: pathlib.Path): return glob.glob(str(path))


all_categories = read_lines("/storage/extra_files/categories.txt")
n_categories = len(all_categories)

import torch.nn as nn


class RNN(nn.Module):
    def __init__(self, input_size, hidden_size, output_size):
        super(RNN, self).__init__()

        self.hidden_size = hidden_size

        self.i2h = nn.Linear(input_size + hidden_size, hidden_size)
        self.i2o = nn.Linear(input_size + hidden_size, output_size)
        self.softmax = nn.LogSoftmax(dim=1)

    def forward(self, input, hidden):
        combined = torch.cat((input, hidden), 1)
        hidden = self.i2h(combined)
        output = self.i2o(combined)
        output = self.softmax(output)
        return output, hidden

    def initHidden(self):
        return torch.zeros(1, self.hidden_size)


class SeldonModel:
    def evaluate(self, line_tensor):
        hidden = self.model.initHidden()

        for i in range(line_tensor.size()[0]):
            output, hidden = self.model(line_tensor[i], hidden)

        return output

    # Find letter index from all_letters, e.g. "a" = 0
    def letterToIndex(self, letter):
        return all_letters.find(letter)

    def lineToTensor(self, line):
        tensor = torch.zeros(len(line), 1, n_letters)
        for li, letter in enumerate(line):
            tensor[li][0][self.letterToIndex(letter)] = 1
        return tensor

    def __init__(self) -> None:
        self.logger = logging.getLogger(__name__)
        self.logger.error("SeldonModel init.")
        self.model: RNN = self._load_model()
        self.logger.error("Model loaded.")
        self.n_predictions = 2

    def predict(self, input_line: str, names: Iterable[str], meta: Dict = None) -> Union[np.ndarray, List, str, bytes]:
        self.logger.error('\n> %s' % input_line)
        with torch.no_grad():
            output = self.evaluate(self.lineToTensor(input_line))

            # Get top N categories
            topv, topi = output.topk(self.n_predictions, 1, True)
            predictions = []

            for i in range(self.n_predictions):
                value = topv[0][i].item()
                category_index = topi[0][i].item()
                print('(%.2f) %s' % (value, all_categories[category_index]))
                predictions.append([value, all_categories[category_index]])

            return predictions

    def _load_model(self):
        rnn = torch.load("/storage/data/model.pth")
        return rnn


seldon_model = SeldonModel
