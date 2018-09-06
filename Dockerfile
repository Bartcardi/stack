FROM ubuntu:16.04
MAINTAINER Bart Joosten <bart.joosten@tno.nl>

ADD ./ /stack

WORKDIR /stack

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get -y install \
        git make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
        libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils \
        libffi-dev liblzma-dev && \
    git clone git://github.com/yyuu/pyenv.git ~/.pyenv && \
    git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

ENV HOME  /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN pyenv install 2.7.6 && \
    pyenv global 2.7.6 && \
    pip install -r requirements.txt
    
# pypy with 2.7.6
# RUN pyenv install pypy-2.3.1 && \
#     pyenv global pypy-2.3.1

