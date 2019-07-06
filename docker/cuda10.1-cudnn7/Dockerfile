FROM nvidia/cuda:10.1-devel-ubuntu18.04

MAINTAINER CodeLibs Project

ENV DEBIAN_FRONTEND noninteractive

ADD res/clean-layer.sh /tmp/clean-layer.sh

RUN apt update && apt upgrade -y && apt install -y locales && /tmp/clean-layer.sh

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV PIP_DEFAULT_TIMEOUT 180

ENV CUDNN_VERSION 7.6.0.64
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN apt-get update && apt-get install -y --no-install-recommends \
    libcudnn7=$CUDNN_VERSION-1+cuda10.1 \
    libcudnn7-dev=$CUDNN_VERSION-1+cuda10.1 && \
    /tmp/clean-layer.sh

RUN apt-mark hold libcudnn7 libcudnn7-dev cuda-libraries-dev-$CUDA_PKG_VERSION cuda-nvml-dev-$CUDA_PKG_VERSION \
    cuda-minimal-build-$CUDA_PKG_VERSION cuda-command-line-tools-$CUDA_PKG_VERSION libnccl-dev \
    cuda-libraries-$CUDA_PKG_VERSION libnccl2 cuda-cudart-$CUDA_PKG_VERSION

RUN apt-get update && apt install -y build-essential curl git gcc make openssl libssl-dev libbz2-dev \
    libreadline-dev libsqlite3-dev cmake libxml2-dev wget bzip2 sudo vim unzip libcurl4-openssl-dev \
    && /tmp/clean-layer.sh

RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.18.0/tini && \
    echo "12d20136605531b09a2c2dac02ccee85e1b874eb322ef6baf7561cd93f93c855 *tini" | sha256sum -c - && \
    mv tini /usr/local/bin/tini && \
    chmod +x /usr/local/bin/tini

ENV PATH=/opt/conda/bin:/usr/local/nvidia/bin:/usr/local/cuda/bin:$PATH
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH

RUN wget -q https://repo.continuum.io/miniconda/Miniconda3-4.6.14-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    echo '718259965f234088d785cad1fbd7de03 */tmp/miniconda.sh' | md5sum -c - && \
    bash /tmp/miniconda.sh -f -b -p /opt/conda && \
    /opt/conda/bin/conda install --yes -c conda-forge \
    python=3.6 sqlalchemy tornado jinja2 traitlets requests pip nodejs configurable-http-proxy ncurses && \
    /opt/conda/bin/pip install --upgrade pip && \
    /tmp/clean-layer.sh

RUN pip install notebook && \
    pip install jupyter && \
    pip install jupyterhub && \
    pip install jupyterlab && \
    pip install oauthenticator && \
    pip install jupyterhub-ldapauthenticator && \
    pip install jupyter_contrib_nbextensions && \
    pip install autopep8 && \
    pip install yapf && \
    pip install pycurl && \
    /tmp/clean-layer.sh

RUN jupyter contrib nbextension install --system && \
    jupyter labextension install @jupyterlab/hub-extension

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

ENTRYPOINT ["tini", "--"]
CMD ["jupyterhub"]

