# MLOps Demo - OSS - Names

This is an adaption of the [NLP FROM SCRATCH: CLASSIFYING NAMES WITH A CHARACTER-LEVEL RNN](https://pytorch.org/tutorials/intermediate/char_rnn_classification_tutorial.html) tutorial to the [Neu.ro platform](https://neu.ro).

## Quick Start

Sign up at [app.neu.ro](https://app.neu.ro) and setup your local machine according to [instructions](https://docs.neu.ro/).
 
Then run:

```shell
pip install -U neuro-cli neuro-flow
neuro login
# build docker image remotely on the platform
neuro-flow build myimage
# prepare storage folders
neuro-flow mkvolumes
# and upload data
neuro-flow upload ALL
# to work with an interactive notebook, hit
neuro-flow run jupyter
# to run training on the platform, hit
neuro-flow run tensorboard
neuro-flow run train
```

See [Help.md](HELP.md) for the detailed Neuro Project Template Reference.
