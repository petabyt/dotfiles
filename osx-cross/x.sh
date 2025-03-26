# Compile libdispatch
git clone https://github.com/swiftlang/swift-corelibs-libdispatch.git --depth 1 --recurse-submodules
cd swift-corelibs-libdispatch
cmake -G Ninja -B build -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++
cmake --build build
sudo cmake --install build

# Libtapi
git clone https://github.com/tpoechtrager/apple-libtapi.git --depth 1
cd apple-libtapi
./build.sh
./install.sh

# cctools
git clone https://github.com/tpoechtrager/cctools-port.git
cd cctools-port/cctools
./configure --prefix=/usr/local/cctools
make -j`nproc`
sudo make install

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
