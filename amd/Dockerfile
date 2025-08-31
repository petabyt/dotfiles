FROM ubuntu:24.04

ENV TZ=US \
    DEBIAN_FRONTEND=noninteractive
    
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        zip \
        file \
        xz-utils \
        wget \
        make \
        ca-certificates \
        ninja-build \
        meson \
        gcc \
        g++ \
        gcovr \
        libmagic-dev \
        libjpeg-dev \
        libpng-dev \
        git \
        autoconf \
        automake \
        libfuse2* \
        fuse \
        cimg-dev \
        cmake \
        libusb-1.0-0-dev \
        openssh-client \
        xxd \
        liblua5.3-dev \
        libx11-dev \
        libexif-dev \
        libgtk-3-dev \
        libc6-dev \
        build-essential \
        qt5-qmake qtbase5-dev qtmultimedia5-dev \
        libqt5multimedia5 libqt5multimedia5-plugins \
        libqt5opengl5-dev libqt5designer5 libqt5svg5-dev libxkbcommon-x11-0 \
        python3-minimal

RUN wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage -O /usr/local/bin/appimagetool && chmod +x /usr/local/bin/appimagetool
RUN wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage -O /usr/local/bin/linuxdeploy && chmod +x /usr/local/bin/linuxdeploy

RUN dd if=/dev/zero bs=1 count=4 seek=8 of=/usr/local/bin/linuxdeploy conv=notrunc
RUN dd if=/dev/zero bs=1 count=4 seek=8 of=/usr/local/bin/appimagetool conv=notrunc

#RUN linuxdeploy --help
