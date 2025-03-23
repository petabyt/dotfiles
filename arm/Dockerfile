FROM debian:bullseye

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
        build-essential \
        python3-minimal && \
    apt-get clean

# Download appimages and remove magic bytes that break interpreter
RUN wget https://github.com/linuxdeploy/linuxdeploy/releases/download/2.0.0-alpha-1-20241106/linuxdeploy-aarch64.AppImage -O /usr/bin/linuxdeploy && chmod +x /usr/bin/linuxdeploy
RUN wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-aarch64.AppImage -O /usr/bin/appimagetool && chmod +x /usr/bin/appimagetool

RUN dd if=/dev/zero bs=1 count=4 seek=8 of=/usr/bin/linuxdeploy conv=notrunc
RUN dd if=/dev/zero bs=1 count=4 seek=8 of=/usr/bin/appimagetool conv=notrunc

RUN git clone https://github.com/petabyt/libui-dev.git && cd libui-dev && make ARCH=aarch64-linux-gnu -j`nproc` TARGET=l install
