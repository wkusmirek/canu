FROM ubuntu:16.04
MAINTAINER kusmirekwiktor@gmail.com

# Upgrade and install necessary packages:
RUN apt-get update && apt-get upgrade -y &&\
    apt-get install -y sudo git make build-essential mummer last-align python-numpy python-matplotlib time bwa samtools software-properties-common gnuplot\
    zlib1g-dev mc wget libatlas-base-dev python-pip python-pandas

# Start working in /usr/local
WORKDIR /usr/local

# Compile and install canu:
RUN git clone https://github.com/marbl/canu.git &&\
    cd canu/src && make -j && cd -
ENV PATH=/usr/local/canu/Linux-amd64/bin:$PATH
