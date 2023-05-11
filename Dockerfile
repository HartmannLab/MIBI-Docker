FROM jupyter/datascience-notebook:2023-05-01

# Requirements for different libraries
USER root
RUN apt-get update && apt-get install -y openssl openjdk-8-jdk-headless libpng-dev libmysqlclient-dev libnotify-dev libsdl2-dev
RUN apt-get -y upgrade && apt-get install -y cmake

RUN mamba update -y numpy numba

# Needed for running Rcall in Julia
RUN cp /usr/lib/*-linux-gnu/libstdc++.so.6 /opt/julia-1.8.5/lib/julia/

# Install required R Modules
COPY /requirements.R /tmp/
RUN Rscript /tmp/requirements.R

# Install required Julia Modules
COPY requirements.jl /tmp/
RUN julia /tmp/requirements.jl

# Install required Python Modules
COPY requirements.txt /tmp/
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org -r /tmp/requirements.txt
RUN pip install git+https://github.com/ElementoLab/utag.git@main

USER jovyan

# Install additional fonts (ArialMT)
RUN mkdir /tmp/.fonts
RUN wget -O /tmp/.fonts/Arial.ttf https://github.com/matomo-org/travis-scripts/raw/master/fonts/Arial.ttf 
# Rebuild the font cache.
RUN fc-cache -fv /tmp/.fonts
WORKDIR /home/jovyan
