FROM codelibs/jupyterhub:cuda9.0-cudnn7

MAINTAINER CodeLibs Project

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" > /etc/apt/sources.list.d/webupd8team-java-trusty.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN apt-get update

RUN apt-get install -y --no-install-recommends oracle-java8-installer && \
    rm -rf /var/cache/oracle-jdk8-installer
RUN apt-get install -y enchant libhunspell-dev font-manager libcupti-dev ocl-icd-libopencl1 and ocl-icd-opencl-dev \
    libboost-dev libboost-system-dev libboost-filesystem-dev libsm6 libxext6 && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install autopep8
RUN python3 -m pip install Cython
RUN python3 -m pip install better_exceptions
RUN python3 -m pip install bs4
RUN python3 -m pip install elasticsearch
RUN python3 -m pip install esanpy
RUN python3 -m pip install pyarrow
RUN python3 -m pip install h5py
RUN python3 -m pip install matplotlib
RUN python3 -m pip install numpy
RUN python3 -m pip install pandas
RUN python3 -m pip install Pillow
RUN python3 -m pip install seaborn
RUN python3 -m pip install requests
RUN python3 -m pip install scipy
RUN python3 -m pip install scikit-learn
RUN python3 -m pip install pydotplus
RUN python3 -m pip install nltk
RUN python3 -m pip install cupy
RUN python3 -m pip install chainer
RUN python3 -m pip install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.7.0-cp36-cp36m-linux_x86_64.whl
RUN python3 -m pip install keras
RUN python3 -m pip install gensim
RUN python3 -m pip install common-ml
RUN python3 -m pip install predictionio
RUN python3 -m pip install pyenchant
RUN python3 -m pip install spacy
RUN python3 -m spacy download en
RUN python3 -m spacy download xx
RUN python3 -m spacy download en_core_web_lg
RUN python3 -m pip install hunspell
RUN python3 -m pip install numba
RUN python3 -m pip install xgboost
RUN python3 -m pip install lightgbm
RUN python3 -m pip install mlxtend
RUN python3 -m pip install edward
RUN python3 -m pip install scikit-image
RUN python3 -m pip install opencv-python
RUN python3 -m pip install kaggle
RUN python3 -m pip install textblob
RUN python3 -m textblob.download_corpora
RUN python3 -m pip install geopy

