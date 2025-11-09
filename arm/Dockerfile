FROM ubuntu:24.04

RUN uname -m

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
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
        libfuse2 \
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
        build-essential

RUN apt-get clean

# Download appimage tools and remove magic bytes that break interpreter
RUN wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-aarch64.AppImage -O /usr/local/bin/appimagetool && chmod +x /usr/local/bin/appimagetool
RUN wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-aarch64.AppImage -O /usr/local/bin/linuxdeploy && chmod +x /usr/local/bin/linuxdeploy

RUN dd if=/dev/zero bs=1 count=4 seek=8 of=/usr/local/bin/linuxdeploy conv=notrunc
RUN dd if=/dev/zero bs=1 count=4 seek=8 of=/usr/local/bin/appimagetool conv=notrunc
