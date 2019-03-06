FROM raz/optix:5.0.1

MAINTAINER taritree.wongjirad@tufts.edu

# CMAKE
RUN apt-get update -y && apt install -y wget && \
    apt-get autoremove -y && apt-get clean -y && \
    cd /tmp && \
    wget https://github.com/Kitware/CMake/releases/download/v3.13.4/cmake-3.13.4-Linux-x86_64.sh && \
    chmod +x cmake-3.13.4-Linux-x86_64.sh && \
    yes | ./cmake-3.13.4-Linux-x86_64.sh --prefix=/usr/local --exclude-subdir --skip-license && rm cmake-3.13.4-Linux-x86_64.sh

# Misc packages
RUN apt-get update -y && \
    apt install -y build-essential mercurial sudo \
    		   linux-headers-$(uname -r) curl \
		   zip libglu1-mesa-dev freeglut3-dev \
		   mesa-common-dev libglew-dev libgl1-mesa-glx && \
    apt-get autoremove -y && apt-get clean -y

# BOOST
RUN cd /tmp && wget https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.gz && \
    tar xf boost_1_69_0.tar.gz && \
    cd /tmp/boost_1_69_0 && \
    ./bootstrap.sh && \
    ./b2 install && \
    rm /tmp/boost_1_69_0.tar.gz && rm -r /tmp/boost_1_69_0






