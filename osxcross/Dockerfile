# syntax=docker/dockerfile:1

ARG OSXCROSS_VERSION=latest
FROM --platform=$BUILDPLATFORM crazymax/osxcross:${OSXCROSS_VERSION}-ubuntu AS osxcross

FROM debian
RUN apt-get update && apt-get install -y build-essential clang lld libc6-dev cmake ninja-build git
ENV PATH="/osxcross/bin:$PATH"
ENV LD_LIBRARY_PATH="/osxcross/lib:$LD_LIBRARY_PATH"
COPY --from=osxcross /osxcross /osxcross
COPY toolchain2.cmake /osxcross/
