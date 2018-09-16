FROM codelibs/jupyterhub:cuda9.0-cudnn7

MAINTAINER CodeLibs Project

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" > /etc/apt/sources.list.d/webupd8team-java-trusty.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN apt-get update && \
    apt-get install -y --no-install-recommends oracle-java8-installer && \
    rm -rf /var/cache/oracle-jdk8-installer && \
    apt-get update && \
    apt-get install -y enchant libhunspell-dev font-manager libcupti-dev ocl-icd-libopencl1 and ocl-icd-opencl-dev \
    libboost-dev libboost-system-dev libboost-filesystem-dev libsm6 libxext6 \
    dbus fontconfig fontconfig-config fonts-dejavu-core fonts-droid-fallback ghostscript gsfonts hicolor-icon-theme \
    libavahi-client3 libavahi-common-data libavahi-common3 libcairo2 libcap-ng0 libcroco3 \
    libcups2 libcupsfilters1 libcupsimage2 libdatrie1 libdbus-1-3 libdjvulibre-text libdjvulibre21 libfftw3-double3 libfontconfig1 \
    libfreetype6 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgomp1 libgraphite2-3 libgs9 libgs9-common libharfbuzz0b libijs-0.35 \
    libjasper1 libjbig0 libjbig2dec0 liblcms2-2 liblqr-1-0 libltdl7 libmagickcore-6.q16-2 \
    libmagickcore-6.q16-2-extra libmagickwand-6.q16-2 libnetpbm10 libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 \
    libpaper-utils libpaper1 libpixman-1-0 libpng12-0 librsvg2-2 librsvg2-common libthai-data libthai0 libtiff5 libwmf0.2-7 \
    libxcb-render0 libxcb-shm0 netpbm poppler-data p7zip-full imagemagick libatlas-base-dev zlib1g-dev liblcms2-dev libwebp-dev \
    libsasl2-dev libpq-dev graphviz libgdal-dev pandoc sox libsox-dev libsox-fmt-all libjpeg8-dev libjpeg-turbo8-dev \
    libfreetype6-dev libglib2.0-0 libxext6 libsm6 libxrender1 libfontconfig1 libgeos-dev libgdal1-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install cython numpy pandas seaborn python-dateutil dask pytagcloud pyyaml joblib \
    husl geopy ml_metrics mne pyshp gensim spacy && \
    spacy download en && \
    spacy download xx && \
    spacy download en_core_web_lg && \
    pip install opencv-python && \
    pip install keras_applications && \
    pip install keras_preprocessing && \
    pip install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.9.0-cp36-cp36m-linux_x86_64.whl && \
    pip install textblob  && \
    python3 -m textblob.download_corpora && \
    pip install wordcloud && \
    conda install -y -c conda-forge python-igraph pygpu && \
    pip install xgboost && \
    pip install lightgbm && \
    pip install Theano && \
    pip install https://github.com/Lasagne/Lasagne/archive/master.zip && \
    pip install keras && \
    pip install keras-rl && \
    pip install git+https://github.com/broadinstitute/keras-rcnn && \
    pip install neon && \
    pip install nolearn && \
    pip install pybrain && \
    pip install python-Levenshtein && \
    pip install hep_ml && \
    pip install chainer && \
    pip install nltk && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /usr/local/src/*

RUN mkdir -p /usr/share/nltk_data && \
    python -m nltk.downloader -d /usr/share/nltk_data abc alpino averaged_perceptron_tagger \
    basque_grammars biocreative_ppi bllip_wsj_no_aux \
    book_grammars brown brown_tei cess_cat cess_esp chat80 city_database cmudict \
    comtrans conll2000 conll2002 conll2007 crubadan dependency_treebank \
    europarl_raw floresta gazetteers genesis gutenberg \
    ieer inaugural indian jeita kimmo large_grammars lin_thesaurus mac_morpho machado \
    masc_tagged maxent_ne_chunker maxent_treebank_pos_tagger moses_sample movie_reviews \
    mte_teip5 names nps_chat omw opinion_lexicon paradigms \
    pil pl196x porter_test ppattach problem_reports product_reviews_1 product_reviews_2 propbank \
    pros_cons ptb punkt qc reuters rslp rte sample_grammars semcor senseval sentence_polarity \
    sentiwordnet shakespeare sinica_treebank smultron snowball_data spanish_grammars \
    state_union stopwords subjectivity swadesh switchboard tagsets timit toolbox treebank \
    twitter_samples udhr2 udhr unicode_samples universal_tagset universal_treebanks_v20 \
    vader_lexicon verbnet webtext word2vec_sample wordnet wordnet_ic words ycoe && \
    pip install stop-words && \
    pip install Pillow && \
    pip install pyproj && \
    cd /usr/local/src && git clone https://github.com/matplotlib/basemap.git && \
    cd basemap && \
    git checkout v1.1.0 && \
    # Install geos
    cd geos-3.3.3 && \
    export GEOS_DIR=/usr/local && \
    ./configure --prefix=$GEOS_DIR && \
    make && make install && \
    # Install basemap
    cd .. && python setup.py install && \
    pip install basemap --no-binary basemap && \
    cd /usr/local/src && git clone https://github.com/vitruvianscience/opendeep.git && \
    cd opendeep && python setup.py develop && \
    pip install ibis-framework && \
    conda install -y -c conda-forge proj4 && \
    pip install packaging && \
    pip install Shapely && \
    pip install Cartopy && \
    pip install mxnet && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /usr/local/src/*

RUN cd /usr/local/src && mkdir h2o && cd h2o && \
    wget http://h2o-release.s3.amazonaws.com/h2o/latest_stable -O latest && \
    wget --no-check-certificate -i latest -O h2o.zip && rm latest && \
    unzip h2o.zip && rm h2o.zip && cp h2o-*/h2o.jar . && \
    pip install `find . -name "*whl"` && \
    pip install scipy && \
    pip install scikit-learn && \
    pip install h5py && \
    pip install biopython && \
    pip install pudb && \
    pip install imbalanced-learn && \
    pip install line_profiler && \
    pip install orderedmultidict && \
    pip install smhasher && \
    pip install bokeh && \
    conda install -y -c bokeh datashader && \
    cd /usr/local/src && git clone https://github.com/danielhomola/boruta_py.git && \
    cd boruta_py && python setup.py install && \
    cd /usr/local/src && git clone git://github.com/nicolashennetier/pyeconometrics.git && \
    cd pyeconometrics && python setup.py install && \
    pip install graphviz && \
    GDAL_CONFIG=/usr/bin/gdal-config pip install fiona && pip install geopandas && \
    cd /usr/local/src && git clone git://github.com/scikit-learn-contrib/py-earth.git && \
    cd py-earth && python setup.py install && \
    pip install essentia && \
    conda install -y pytorch torchvision -c pytorch && \
    pip install cffi && \
    cd /usr/local/src && git clone https://github.com/pytorch/audio && cd audio && python setup.py install && \
    pip install --upgrade mpld3 && \
    pip install mplleaflet && \
    pip install gpxpy && \
    pip install arrow && \
    pip install vtk && \
    pip install nilearn && \
    pip install nibabel && \
    pip install pronouncing && \
    pip install markovify && \
    pip install rf_perm_feat_import && \
    pip install imgaug && \
    pip install preprocessing && \
    pip install Baker && \
    pip install path.py && \
    pip install Geohash && \
    # https://github.com/vinsci/geohash/issues/4
    sed -i -- 's/geohash/.geohash/g' /opt/conda/lib/python3.6/site-packages/Geohash/__init__.py && \
    pip install deap && \
    pip install tpot  && \
    pip install scikit-optimize && \
    pip install haversine && \
    pip install toolz cytoolz && \
    pip install sacred && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /usr/local/src/*

RUN pip install plotly && \
    pip install git+https://github.com/nicta/dora.git && \
    pip install git+https://github.com/hyperopt/hyperopt.git && \
    pip install git+https://github.com/tflearn/tflearn.git && \
    pip install fitter && \
    pip install langid && \
    pip install delorean && \
    pip install trueskill && \
    pip install heamy && \
    pip install vida && \
    pip install missingno && \
    pip install pandas-profiling && \
    pip install s2sphere && \
    pip install git+https://github.com/fmfn/BayesianOptimization.git && \
    pip install matplotlib-venn && \
    pip install msgpack --no-dependencies && \
    pip install pyldavis && \
    pip install mlxtend && \
    pip install altair && \
    pip install pystan && \
    pip install ImageHash && \
    conda install -y ecos && \
    conda install -y CVXcanon && \
    pip install fancyimpute && \
    pip install pymc3 && \
    pip install tifffile && \
    pip install spectral && \
    pip install descartes && \
    pip install geojson && \
    pip install pysal && \
    pip install pyflux && \
    pip install terminalplot && \
    pip install raccoon && \
    pip install pydicom && \
    pip install wavio && \
    pip install SimpleITK && \
    pip install hmmlearn && \
    pip install bayespy && \
    pip install gplearn && \
    pip install PyAstronomy && \
    pip install squarify && \
    pip install fuzzywuzzy && \
    pip install python-louvain && \
    pip install pyexcel-ods && \
    pip install sklearn-pandas && \
    pip install stemming && \
    conda install -y -c conda-forge fbprophet && \
    pip install holoviews geoviews && \
    #Temp fix: After installing holoviews and geoviews, deps for fiona and geopandas get really messed up. This is a very unelegant fix.
    pip uninstall -y fiona geopandas && \
    GDAL_CONFIG=/usr/bin/gdal-config pip install fiona && pip install geopandas && \
    pip install hypertools && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /usr/local/src/*

RUN pip install nxviz && \
    pip install py_stringsimjoin && \
    pip install speedml && \
    pip install nibabel && \
    pip install mlens && \
    pip install scikit-multilearn && \
    pip install -e git+http://github.com/tensorflow/cleverhans.git#egg=cleverhans && \
    pip install leven && \
    pip install catboost && \
    # pip install mlbox && \
    pip install fastFM && \
    pip install lightfm && \
    pip install paramnb && \
    pip install folium && \
    pip install scikit-plot && \
    pip install dipy && \
    pip install plotnine && \
    pip install git+https://github.com/dvaida/hallucinate.git && \
    pip install scikit-surprise && \
    pip install pymongo && \
    pip install edward && \
    pip install geoplot && \
    pip install eli5 && \
    pip install implicit && \
    pip install dask-ml[xgboost] && \
    pip install kmeans-smote --no-dependencies && \
    pip install --no-dependencies ethnicolr && \
    pip install tensorpack && \
    pip install pycountry && pip install iso3166 && \
    pip install pydash && \
    pip install kmodes --no-dependencies && \
    pip install librosa && \
    pip install polyglot && \
    pip install mmh3 && \
    pip install fbpca && \
    pip install sentencepiece && \
    pip install cufflinks && \
    pip install glmnet_py && \
    pip install lime && \
    pip install memory_profiler && \
    pip install --upgrade cysignals && \
    pip install pyfasttext && \
    pip install ktext && \
    cd /usr/local/src && git clone --depth=1 https://github.com/facebookresearch/fastText.git && cd fastText && pip install . && \
    pip install hunspell && \
    pip install annoy && \
    pip install category_encoders && \
    pip install google-cloud-bigquery && \
    pip install ortools && \
    pip install scattertext && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /usr/local/src/*

RUN pip install pandas-datareader && \
    pip install pykoko && \
    pip install wordsegment && \
    pip install pyahocorasick && \
    pip install wordbatch && \
    pip install emoji && \
    pip install janome && \
    pip install wfdb && \
    pip install vecstack && \
    pip install sklearn-contrib-lightning && \
    pip install yellowbrick && \
    pip install mlcrate && \
    pip install vega3 && \
    jupyter nbextension install --sys-prefix --py vega3  && \
    pip install bcolz && \
    pip install bleach && \
    pip install certifi && \
    pip install cycler && \
    pip install decorator && \
    pip install entrypoints && \
    pip install html5lib && \
    pip install ipykernel && \
    pip install ipython && \
    pip install ipython-genutils && \
    pip install ipywidgets && \
    pip install isoweek && \
    pip install jedi && \
    pip install Jinja2 && \
    pip install jsonschema && \
    pip install MarkupSafe && \
    pip install matplotlib && \
    pip install mistune && \
    pip install nbconvert && \
    pip install nbformat && \
    pip install olefile && \
    pip install pandas_summary && \
    pip install pandocfilters && \
    pip install pexpect && \
    pip install pickleshare && \
    pip install prompt-toolkit && \
    pip install ptyprocess && \
    pip install Pygments && \
    pip install pyparsing && \
    pip install python-dateutil==2.6.0 && \
    pip install pytz && \
    pip install PyYAML && \
    pip install pyzmq && \
    pip install qtconsole && \
    pip install simplegeneric && \
    pip install terminado && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /usr/local/src/*

RUN pip install testpath && \
    pip install tornado && \
    pip install tqdm && \
    pip install traitlets && \
    pip install wcwidth && \
    pip install webencodings && \
    pip install widgetsnbextension && \
    pip install fastai && \
    pip install flashtext && \
    pip install marisa-trie && \
    pip install pyemd && \
    pip install pyupset && \
    pip install pympler && \
    pip install s3fs && \
    pip install featuretools && \
    pip install -e git+https://github.com/SohierDane/BigQuery_Helper#egg=bq_helper && \
    pip install hpsklearn && \
    pip install keras-tqdm && \
    pip install git+https://github.com/Kaggle/learntools && \
    pip install kmapper && \
    pip install shap && \
    pip install ray && \
    pip install gym && \
    pip install tensorforce && \
    pip install pyarabic && \
    pip install conx && \
    pip install pandasql && \
    pip install trackml && \
    pip install tensorflow_hub && \
    pip install PDPbox && \
    pip install ggplot && \
    pip install cesium && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /usr/local/src/*

# Pin Vowpal Wabbit v8.6.0 because 8.6.1 does not build or install successfully
RUN cd /usr/local/src && git clone -b 8.6.0 https://github.com/JohnLangford/vowpal_wabbit.git && \
    ./vowpal_wabbit/python/conda_install.sh && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /usr/local/src/*

RUN pip install --upgrade numpy && \
    pip install --upgrade pandas && \
    pip install --upgrade cython && \
    pip install better_exceptions && \
    pip install featuretools && \
    pip install bs4 && \
    pip install elasticsearch && \
    pip install esanpy && \
    pip install pyarrow && \
    pip install requests && \
    pip install pydotplus && \
    pip install predictionio && \
    pip install pyenchant && \
    pip install numba && \
    pip install scikit-image && \
    pip install kaggle && \
    pip install pyicu && \
    pip install pycld2 && \
    pip install morfessor && \
    pip install polyglot && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /usr/local/src/*

RUN pip uninstall -y tensorflow

