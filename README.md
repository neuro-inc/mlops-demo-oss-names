# MLOps Demo - OSS - Names

This is an adaption of the [NLP FROM SCRATCH: CLASSIFYING NAMES WITH A CHARACTER-LEVEL RNN](https://pytorch.org/tutorials/intermediate/char_rnn_classification_tutorial.html) tutorial to the [Neu.ro platform](https://neu.ro).

## Quick Start

Sign up at [app.mlops.selectel.ru](https://app.mlops.selectel.ru) and setup your local machine according to [instructions](https://docs.neu.ro/).
 
Then run:

- prepare
```shell
pip install pipx
pipx install neuro-all
pipx ensurepath
# reload console
# `pipx list` - list of installed packages
neuro login
# download project
git clone https://github.com/neuro-inc/mlops-demo-oss-names -b selectel
cd mlops-demo-oss-names
# build docker image remotely on the platform
neuro-flow build myimage
# prepare storage folders
neuro-flow mkvolumes
```

- Bucket creat at [my.selectel.ru](https://my.selectel.ru)

- Importing bucket into the platform
```shell
neuro blob importbucket --aws-endpoint-url https://s3.selcdn.ru --aws-access-key-id <user-ID> --aws-secret-access-key "<user-pass>" --aws-region-name ru-1 --name names-project --provider-bucket-name names-data --provider aws
```

- Upload data to bucket
```shell
neuro blob cp -r data blob:names-project
```

- Perform training
```shell
# start tensorboard to log experiment metrics & data
neuro-flow run tensorboard
# to run training on the platform, hit
neuro-flow run train
# to work with an interactive notebook, hit
neuro-flow run jupyter
```

See [Help.md](HELP.md) for the detailed Neuro Project Template Reference.
