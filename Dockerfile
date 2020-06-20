ARG TIDYVERSE_TAG

FROM rocker/tidyverse:$TIDYVERSE_TAG

RUN apt-get update \
    && apt-get install -y libpython3-dev python3-venv python3-pip

ENV PYTHON_PACKAGES="\
    numpy \
    matplotlib \
    pandas \
    scipy \
    scikit-learn \
" 

RUN pip3 install --upgrade pip && pip3 install --no-cache-dir $PYTHON_PACKAGES

ENV R_PACKAGES="\
    caret \
    psych \
    pls \
    vegan \
    CCA \
" 

RUN install2.r --error $R_PACKAGES