FROM ubuntu:24.10

RUN apt update && apt install -y git cmake ninja-build clang build-essential curl sudo

RUN <<EOR
	cd
    git clone https://github.com/swiftlang/swift-corelibs-libdispatch.git --depth 1 --recurse-submodules 
    cd swift-corelibs-libdispatch
    cmake -G Ninja -B build -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++
    cmake --build build
    sudo cmake --install build
	cd .. && rm -rf swift-corelibs-libdispatch 
EOR

RUN <<EOR
	cd
    git clone https://github.com/tpoechtrager/apple-libtapi.git --depth 1
    cd apple-libtapi
    ./build.sh
    ./install.sh
    cd .. && rm -rf apple-libtapi
EOR

RUN <<EOR
	cd
    git clone https://github.com/tpoechtrager/cctools-port.git
    cd cctools-port/cctools
    ./configure --prefix=/usr/local/cctools
    make -j$(nproc)
    sudo make install
    cd .. && rm -rf cctools-port
EOR
