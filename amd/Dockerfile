FROM archlinux:base-devel

RUN pacman-key --init && pacman -Syu --noconfirm

RUN pacman -S --noconfirm git meson clang glslang libcap wlroots \
    sdl2 vulkan-headers libx11 libxmu libxcomposite libxrender libxres \
    libxtst libxkbcommon libdrm libinput wayland-protocols benchmark \
    xorg-xwayland pipewire cmake \
    libavif libheif aom rav1e libdecor libxdamage \
    luajit desktop-file-utils
