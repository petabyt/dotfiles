# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib64/
set(CMAKE_SYSTEM_NAME Darwin)
set(CMAKE_SYSTEM_VERSION 11)
set(CMAKE_OSX_DEPLOYMENT_TARGET 10.15)

set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang++)
set(CMAKE_ASM_COMPILER clang)
set(CMAKE_AR /usr/local/cctools/bin/ar)
set(CMAKE_RANLIB /usr/local/cctools/bin/ranlib)
set(CMAKE_STRIP /usr/local/cctools/bin/ranlib)
set(CMAKE_NM /usr/local/cctools/bin/nm)
set(CMAKE_LINKER /usr/local/cctools/bin/ld)

set(CMAKE_C_COMPILER_TARGET x86_64-apple-darwin-macho)
set(CMAKE_CXX_COMPILER_TARGET x86_64-apple-darwin-macho)
set(CMAKE_ASM_COMPILER_TARGET x86_64-apple-darwin-macho)

set(CMAKE_SYSROOT /home/daniel/Pulled/macos-sdk/MacOSX15.2.sdk)
set(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT})

set(CMAKE_C_FLAGS_INIT "-target x86_64-apple-darwin-macho")
set(CMAKE_CXX_FLAGS_INIT "-target x86_64-apple-darwin-macho")
set(CMAKE_OBJC_FLAGS_INIT "-target x86_64-apple-darwin-macho")
set(CMAKE_EXE_LINKER_FLAGS_INIT "-fuse-ld=/usr/local/cctools/bin/ld")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# Had linker issues
set(CMAKE_OBJC_COMPILER_WORKS 1)

set(PKG_CONFIG_EXECUTABLE /usr/local/cctools/bin/pkg-config)
