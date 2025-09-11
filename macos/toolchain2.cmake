set(CMAKE_SYSTEM_NAME Darwin)
set(CMAKE_SYSTEM_VERSION 11)
set(CMAKE_OSX_DEPLOYMENT_TARGET 10.15)

set(OSXCROSS_TARGET_ARCH x86_64)

set(CMAKE_C_COMPILER /osxcross/bin/${OSXCROSS_TARGET_ARCH}-apple-darwin24.5-clang)
set(CMAKE_CXX_COMPILER /osxcross/bin/${OSXCROSS_TARGET_ARCH}-apple-darwin24.5-clang++)
set(CMAKE_ASM_COMPILER /osxcross/bin/${OSXCROSS_TARGET_ARCH}-apple-darwin24.5-clang)
set(CMAKE_AR /osxcross/bin/${OSXCROSS_TARGET_ARCH}-apple-darwin24.5-ar)
set(CMAKE_RANLIB /osxcross/bin/${OSXCROSS_TARGET_ARCH}-apple-darwin24.5-ranlib)
set(CMAKE_STRIP /osxcross/bin/${OSXCROSS_TARGET_ARCH}-apple-darwin24.5-ranlib)
set(CMAKE_NM /osxcross/bin/${OSXCROSS_TARGET_ARCH}-apple-darwin24.5-nm)
set(CMAKE_LINKER /osxcross/bin/${OSXCROSS_TARGET_ARCH}-apple-darwin24.5-ld)

set(CMAKE_C_COMPILER_TARGET ${OSXCROSS_TARGET_ARCH}-apple-darwin-macho)
set(CMAKE_CXX_COMPILER_TARGET ${OSXCROSS_TARGET_ARCH}-apple-darwin-macho)
set(CMAKE_ASM_COMPILER_TARGET ${OSXCROSS_TARGET_ARCH}-apple-darwin-macho)

set(CMAKE_SYSROOT /osxcross/SDK/MacOSX15.5.sdk)
set(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT})

set(CMAKE_C_FLAGS_INIT "-target ${OSXCROSS_TARGET_ARCH}-apple-darwin-macho -D__MACH__")
set(CMAKE_CXX_FLAGS_INIT "-target ${OSXCROSS_TARGET_ARCH}-apple-darwin-macho -D__MACH__")
set(CMAKE_OBJC_FLAGS_INIT "-target ${OSXCROSS_TARGET_ARCH}-apple-darwin-macho -D__MACH__")
set(CMAKE_OBJCXX_FLAGS_INIT "-target ${OSXCROSS_TARGET_ARCH}-apple-darwin-macho -D__MACH__")
set(CMAKE_EXE_LINKER_FLAGS_INIT "-fuse-ld=/osxcross/bin/${OSXCROSS_TARGET_ARCH}-apple-darwin24.5-ld")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# Had linker issues, band aid fix
set(CMAKE_OBJC_COMPILER_WORKS 1)
set(CMAKE_OBJCXX_COMPILER_WORKS 1)

set(PKG_CONFIG_EXECUTABLE /osxcross/bin/${OSXCROSS_TARGET_ARCH}-apple-darwin24.5-pkg-config)
