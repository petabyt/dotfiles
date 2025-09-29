# -DCMAKE_TOOLCHAIN_FILE=/opt/wasi-sdk/share/cmake/wasi-sdk.cmake

HOME := $(shell echo ~)

is_apt =
ifeq ($(shell lsb_release -is), Ubuntu)
    is_apt = yes
endif
ifeq ($(shell lsb_release -is), Debian)
    is_apt = yes
endif

# NOTE: grep -v '^#' removes comments
ifeq ($(shell lsb_release -is), Fedora)
UPDATE := sudo dnf update
REMOVE := -sudo dnf remove
INSTALL := sudo dnf install
lib:
	sudo dnf update
	sudo dnf install `cat pkg/all pkg/dnf | grep -v '^#'`
else ifdef is_apt
UPDATE := sudo apt update
REMOVE := -sudo apt remove
INSTALL := sudo apt install -m
lib:
	sudo dpkg --add-architecture i386
	sudo apt update
	sudo apt install `cat pkg/all pkg/apt | grep -v '^#'`
else
$(error unknown distro)
endif

all: update lib folders

snap:
	sudo snap install `cat pkg/snap | grep -v '^#'`

flatpak:
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	flatpak install `cat pkg/flatpak | grep -v '^#'`

folders: $(HOME)/Pulled

$(HOME)/Pulled:
	mkdir ~/Pulled

update: folders
	cp gitconfig ~/.gitconfig
	chmod +x local/bin/*
	cp -rf local/* ~/.local/
	cp -rf config/* ~/.config/
	cp bashrc ~/.bashrc
	dconf load /org/mate/terminal/ < mate/dconf/terminal

purge:
	$(UPDATE)
	$(REMOVE) ubuntu-mate-welcome ubuntu-mate-guide

appimage:
	sudo wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage -O /usr/local/bin/appimagetool && sudo chmod +x /usr/local/bin/appimagetool
	sudo wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage -O /usr/local/bin/linuxdeploy && sudo chmod +x /usr/local/bin/linuxdeploy

# Nice text editor
editor:
	curl https://getmic.ro | bash
	sudo mv micro /usr/local/bin/micro
	git config --global core.editor "micro"

dockers:
	cd arm && make build
	cd amd && make build
	cd amd/22.04 && make build
	cd osx-cross && make build

clone:
	cd $(HOME)/Pulled && git clone https://github.com/paulmcauley/klassy

git:
	git config --global url.ssh://git@github.com/.insteadOf https://github.com/

usermod:
	sudo usermod -a -G vboxusers,docker,wireshark,libvirt,kvm,vboxusers $$USER
