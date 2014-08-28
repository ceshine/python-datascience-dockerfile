FROM ubuntu:14.04

# MAINTAINER CeShine Lee ceshine@ceshine.net

RUN apt-get update
RUN apt-get upgrade -y
RUN locale-gen en_US en_US.UTF-8

# Install python packages
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python python-pip ipython \ 
    ipython-notebook python-numpy python-scipy python-matplotlib python-pandas python-sklearn

# Install git
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git-core

#Setting up working directory
RUN mkdir /lab WORKDIR /lab

#Minimize image size
RUN (apt-get autoremove -y; \
     apt-get clean -y)

#Setting up ipython notebook server
EXPOSE 8888
CMD ipython notebook –no-browser –ip=0.0.0.0 –port 8888 –notebook-dir=notebooks