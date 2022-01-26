FROM ubuntu

RUN pip install -qqq httpie
ADD preprocess.sh /

CMD ["/preprocess.sh"]