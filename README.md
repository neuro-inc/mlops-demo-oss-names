# MLOps Demo - OSS - Names

This is an adaption of the [NLP FROM SCRATCH: CLASSIFYING NAMES WITH A CHARACTER-LEVEL RNN](https://pytorch.org/tutorials/intermediate/char_rnn_classification_tutorial.html) tutorial to the [Neu.ro platform](https://neu.ro).

## Quick Start

Sign up at [app.mlops.selectel.ru](https://app.mlops.selectel.ru) and setup your local machine according to [instructions](https://docs.neu.ro/).
 
Then run:

- Preparation
```shell
pip install pipx
pipx install neuro-all
pipx ensurepath
# reload console
# `pipx list` - list of installed packages 
neuro login
# build docker image remotely on the platform
neuro-flow build myimage
# prepare storage folders
neuro-flow mkvolumes
# and upload data
```

- Create and download from bucket


- Importing bucket credentials
```shell
beuro blob importbucket --aws-endpoint-url https://s3.selcdn.ru
```

```shell

# to work with an interactive notebook, hit
neuro-flow run jupyter
# to run training on the platform, hit
neuro-flow run tensorboard
neuro-flow run train
```

See [Help.md](HELP.md) for the detailed Neuro Project Template Reference.
