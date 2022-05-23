FROM ubuntu:focal

RUN apt-get update && apt-get install -y \
    build-essential \
    automake \
    autoconf \
    libtool \
    wget \
    gfortran-7

RUN update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-7 7 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7

WORKDIR /build
# compile ld1.x from q-e-qe-6.3MaX
RUN wget -c https://gitlab.com/QEF/q-e/-/archive/qe-6.3MaX/q-e-qe-6.3MaX.tar.gz && \
    tar xf q-e-qe-6.3MaX.tar.gz

RUN cd q-e-qe-6.3MaX && \
    ./configure && \
    make pw ld1 && \
    cp atomic/src/ld1.x /usr/bin/ld1-6.3MAX.x && \
    ln -s /usr/bin/ld1-6.3MAX.x /usr/bin/ld1.x

WORKDIR /
RUN rm -rf /build
