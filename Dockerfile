FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04

MAINTAINER CodeLibs Project

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y
RUN apt-get install -y locales

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get install -y build-essential curl git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev cmake
RUN apt-get install -y wget bzip2 sudo vim unzip enchant libhunspell-dev font-manager
RUN apt-get install -y ocl-icd-libopencl1 and ocl-icd-opencl-dev libboost-dev libboost-system-dev libboost-filesystem-dev

ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
ENV PATH=/opt/conda/bin:/usr/local/nvidia/bin:/usr/local/cuda/bin:$PATH

RUN wget -q https://repo.continuum.io/miniconda/Miniconda3-4.3.21-Linux-x86_64.sh -O /tmp/miniconda.sh  && \
    echo 'c1c15d3baba15bf50293ae963abef853 */tmp/miniconda.sh' | md5sum -c - && \
    bash /tmp/miniconda.sh -f -b -p /opt/conda && \
    /opt/conda/bin/conda install --yes -c conda-forge python=3.6 sqlalchemy tornado jinja2 traitlets requests pip nodejs configurable-http-proxy && \
    /opt/conda/bin/pip install --upgrade pip && \
    rm /tmp/miniconda.sh

RUN python3 -m pip install notebook==4.4.1
RUN python3 -m pip install jupyter
RUN python3 -m pip install jupyterhub
RUN python3 -m pip install oauthenticator
RUN python3 -m pip install jupyterhub-ldapauthenticator
RUN python3 -m pip install jupyter_contrib_nbextensions
RUN python3 -m pip install ipyparallel

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
ADD res/install_modules.sh install_modules.sh
#ADD res/server.key server.key
#ADD res/server.crt server.crt
RUN ["sh", "/opt/jupyterhub/install_modules.sh"]

EXPOSE 8000

LABEL org.jupyter.service="jupyterhub"

CMD ["jupyterhub"]

