FROM nvidia/cuda:9.1-cudnn7-devel-ubuntu16.04

MAINTAINER taritree.wongjirad@tufts.edu

# OPTIX: remember to place install script in running file
COPY NVIDIA-OptiX-SDK-5.0.1-linux64_23705867.sh /tmp
RUN cd /tmp && yes | ./NVIDIA-OptiX-SDK-5.0.1-linux64_23705867.sh --prefix=/usr/local/ && rm /tmp/NVIDIA-OptiX-SDK-5.0.1-linux64_23705867.sh



