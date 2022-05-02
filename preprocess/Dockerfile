FROM python:3.9-slim-buster

COPY requirements.txt /tmp
RUN pip install -qq -r /tmp/requirements.txt

COPY preprocess.sh /
COPY preprocess.py /