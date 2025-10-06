# Required argument:
# --mount type=tmpfs,destination=/root/overlay
FROM debian:13

RUN apt update && apt install -y cmake clang bison flex xz-utils libfuse-dev libudev-dev pkg-config libc6-dev-i386 libcap2-bin git git-lfs libglu1-mesa-dev libcairo2-dev \
libgl1-mesa-dev libtiff5-dev libfreetype6-dev libxml2-dev libegl1-mesa-dev libfontconfig1-dev libbsd-dev libxrandr-dev libxcursor-dev libgif-dev libpulse-dev \
libavformat-dev libavcodec-dev libswresample-dev libdbus-1-dev libxkbfile-dev libssl-dev llvm-dev xdg-user-dirs wget ninja-build

RUN git clone https://github.com/darlinghq/darling.git --depth 1 --recurse-submodules

RUN <<EOR
cd darling
cmake -G Ninja -B build
cmake --build build
cmake --install build
cd .. && rm -rf darling
EOR

RUN mkdir -p /root/overlay
ENV DPREFIX=/root/overlay/.darling

COPY setup.sh /setup.sh
COPY startup.sh /startup.sh
COPY setup-darling /setup-darling.sh
