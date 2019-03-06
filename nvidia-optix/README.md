This folder containers the docker file to create a base image which adds OPTIX to an existing NVIDIA CUDA development image.

Change your cuda and ubuntu version by modifying the tag (e.g. `9.1-cudnn7-devel-ubuntu16.04`) in the Dockerfile.

Change your OPTIX version by downloading a different version and updating the Dockerfile.

To run the build

    docker build -t raz/optics:5.0.1 .


Note that `raz/optics` is the name we are giving the image.
`5.0.1` is the version of opticks used as of the time of this README being written.