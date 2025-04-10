FROM archlinux:base-devel

RUN pacman-key --init && pacman -Syu --noconfirm

RUN pacman -S --noconfirm git meson clang glslang libcap wlroots \
    sdl2 vulkan-headers libx11 libxmu libxcomposite libxrender libxres \
    libxtst libxkbcommon libdrm libinput wayland-protocols benchmark \
    xorg-xwayland pipewire cmake \
    libavif libheif aom rav1e libdecor libxdamage \
    luajit desktop-file-utils

RUN wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage -O /usr/local/bin/appimagetool && chmod +x /usr/local/bin/appimagetool
RUN wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage -O /usr/local/bin/linuxdeploy && chmod +x /usr/local/bin/linuxdeploy
