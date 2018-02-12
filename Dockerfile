FROM java:8
MAINTAINER kusmirekwiktor@gmail.com

# Upgrade and install necessary packages:
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install build-essential wget gnuplot

# Start working in /usr/local
WORKDIR /usr/local

# Compile and install canu:
RUN git clone https://github.com/marbl/canu.git &&\
    cd canu/src && make -j && cd -
ENV PATH=/usr/local/canu/Linux-amd64/bin:$PATH
