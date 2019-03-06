FROM raz/ubuntu-cuda-optix:v2

MAINTAINER taritree.wongjirad@tufts.edu

# OPENCV3
RUN apt-get update && \
    apt-get install -y build-essential \
		       mercurial && \
    apt-get install -y wget && \
    apt-get install -y sudo && \
    apt-get install -y linux-headers-$(uname -r) && \
    apt-get install -y curl && \
    apt-get install -y zip && \
    apt-get install -y libglu1-mesa-dev freeglut3-dev mesa-common-dev && \
    apt-get install -y libglew-dev && \
    UID_=1012 && \
    adduser --uid $UID_ --disabled-password --gecos "" raz && \
    usermod -aG sudo raz && \
    cd && \
    wget https://cmake.org/files/v3.11/cmake-3.11.2.tar.gz && \
    tar xf cmake-3.11.2.tar.gz && \
    cd cmake-3.11.2 && \
    ./configure && \
    make && \
    make install && \
    cd && \
    hg clone http://bitbucket.org/simoncblyth/opticks && \
    echo "export PATH=/usr/local/NVIDIA-OptiX-SDK-5.0.1-linux64/include:/usr/local/NVIDIA-OptiX-SDK-5.0.1-linux64/lib64:$PATH" >> ~/.bashrc && \
    echo "opticks-(){ . $HOME/opticks/opticks.bash && opticks-env $* ; }" >> ~/.bashrc && \
    echo "export LOCAL_BASE=/usr/local" >> ~/.bashrc && \
    echo "export OPTICKS_HOME=$HOME/opticks" >> ~/.bashrc && \
    echo "op(){ op.sh $* ; }" >> ~/.bashrc && \
    echo "export PYTHONPATH=$HOME" >> ~/.bashrc && \
    echo "export PATH=$LOCAL_BASE/opticks/lib:$OPTICKS_HOME/bin:$OPTICKS_HOME/ana:$PATH" >> ~/.bashrc && \
    echo "PATH=/root/opticks/bin:/usr/local/opticks/lib:$PATH" >> ~/.bashrc && \
    echo "OPTICKS_COMPUTE_CAPABILITY=61" >> ~/.bashrc && \
    echo "OPTICKS_OPTIX_INSTALL_DIR=/usr/local/NVIDIA-OptiX-SDK-5.0.1-linux64" >> ~/.bashrc && \
    source ~/.bashrc && \
    echo "source ~/.bashrc" >> ./.bash_profile && \
    echo "export PATH=/usr/local/NVIDIA-OptiX-SDK-5.0.1-linux64/include:/usr/local/NVIDIA-OptiX-SDK-5.0.1-linux64/lib64:$PATH" >> /etc/profile && \
    echo "opticks-(){ . $HOME/opticks/opticks.bash && opticks-env $* ; }" >> /etc/profile && \
    echo "export LOCAL_BASE=/usr/local" >> /etc/profile && \
    echo "export OPTICKS_HOME=$HOME/opticks" >> /etc/profile && \
    echo "op(){ op.sh $* ; }" >> /etc/profile && \
    echo "export PYTHONPATH=$HOME" >> /etc/profile && \
    echo "export PATH=$LOCAL_BASE/opticks/lib:$OPTICKS_HOME/bin:$OPTICKS_HOME/ana:$PATH" >> /etc/profile && \
    echo "PATH=/root/opticks/bin:/usr/local/opticks/lib:$PATH" >> /etc/profile && \
    echo "OPTICKS_COMPUTE_CAPABILITY=61" >> /etc/profile && \
    echo "OPTICKS_OPTIX_INSTALL_DIR=/usr/local/NVIDIA-OptiX-SDK-5.0.1-linux64" >> /etc/profile && \
    cd && \
    wget https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.gz && \
    tar xf boost_1_69_0.tar.gz && \
    cd boost_1_69_0 && \
    ./bootstrap.sh && \
    ./b2 install && \
    cd && \
    opticks- && \
    bcm- && \
    bcm-- && \
    glm- && \
    glm-- && \
    glfw- && \
    glfw-- && \
    glew- && \
    glew-- && \
    gleq- && \
    gleq-- && \
    imgui- && \
    imgui-- && \
    assimp- && \
    assimp-- && \
    openmesh- && \
    openmesh-- && \
    plog- && \
    plog-- && \
    opticksdata- && \
    opticksdata-- && \
    oimplicitmesher- && \
    oimplicitmesher-- && \
    odcs- && \
    odcs-- && \
    oyoctogl- && \
    oyoctogl-- && \
    cd /usr/local/opticks/externals/yoctogl/yocto-gl/yocto/ext && \
    sed -i "s,(__GNUC__) && (__GNUC__ \* 100 + __GNUC_MINOR__) >= 408 // GCC 4.8 or later,(STBI__X64_TARGET),g" stb_image.h && \
    sed -i 's,return __builtin_cpu_supports("sse2");,return 1;,g' stb_image.h && \
    cd /usr/local/opticks/externals/yoctogl/yocto-gl.build && \
    make && \
    oyoctogl-- && \
    ocsgbsp- && \
    ocsgbsp-- && \
    xercesc- && \
    xercesc-- && \
    g4- && \
    g4-- && \
    mkdir /usr/local/opticks/build/ && \
    cp -r /usr/local/opticks/externals/lib64/* /usr/local/opticks/externals/lib && \
    cd /usr/local/opticks/externals/bin && \
    ./geant4.sh && \
    opticks- && \
    opticks-full

