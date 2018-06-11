FROM ubuntu:xenial

MAINTAINER CodeLibs Project

ENV DEBIAN_FRONTEND noninteractive

RUN apt update
RUN apt upgrade -y
RUN apt install -y locales

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt install -y build-essential curl git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev cmake \
    libxml2-dev wget bzip2 sudo vim unzip && \
    apt clean

ENV PATH=/opt/conda/bin:$PATH

RUN wget -q https://repo.continuum.io/miniconda/Miniconda3-4.4.10-Linux-x86_64.sh -O /tmp/miniconda.sh  && \
    echo 'bec6203dbb2f53011e974e9bf4d46e93 */tmp/miniconda.sh' | md5sum -c - && \
    bash /tmp/miniconda.sh -f -b -p /opt/conda && \
    /opt/conda/bin/conda install --yes -c conda-forge python=3.6 sqlalchemy tornado jinja2 traitlets requests pip nodejs configurable-http-proxy && \
    /opt/conda/bin/pip install --upgrade pip && \
    rm /tmp/miniconda.sh

RUN python3 -m pip install notebook
RUN python3 -m pip install jupyter
RUN python3 -m pip install jupyterhub
RUN python3 -m pip install oauthenticator
RUN python3 -m pip install jupyterhub-ldapauthenticator
RUN python3 -m pip install jupyter_contrib_nbextensions
RUN python3 -m pip install autopep8
RUN python3 -m pip install yapf

RUN jupyter contrib nbextension install --system

RUN mkdir -p /opt/oauthenticator
WORKDIR /opt/oauthenticator
ENV OAUTHENTICATOR_DIR /opt/oauthenticator
ADD res/addusers.sh /opt/oauthenticator/addusers.sh
ADD res/userlist /opt/oauthenticator/userlist
RUN ["sh", "/opt/oauthenticator/addusers.sh"]
RUN chmod 700 /opt/oauthenticator

RUN mkdir -p /opt/jupyterhub/
WORKDIR /opt/jupyterhub/
ADD res/jupyterhub_config.py jupyterhub_config.py
# LDAP
#ADD res/server.key server.key
#ADD res/server.crt server.crt

EXPOSE 8000

LABEL org.jupyter.service="jupyterhub"

CMD ["jupyterhub"]

