# MLOps Demo - OSS - Names

This is an adaption of the [NLP FROM SCRATCH: CLASSIFYING NAMES WITH A CHARACTER-LEVEL RNN](https://pytorch.org/tutorials/intermediate/char_rnn_classification_tutorial.html) tutorial to the [Neu.ro platform](https://neu.ro).

## Quick Start

Sign up at [app.neu.ro](https://app.neu.ro) and setup your local machine according to [instructions](https://docs.neu.ro/).
 
Then run:

```shell
pip install -U neuro-cli neuro-flow
neuro login
neuro-flow build myimage
neuro-flow upload ALL
# to work with an interactive notebook
neuro-flow run jupyter
# to run training on the platform
neuro-flow run training
```

See [Help.md](HELP.md) for the detailed Neuro Project Template Reference.
