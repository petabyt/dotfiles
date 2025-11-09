# -DCMAKE_TOOLCHAIN_FILE=/opt/wasi-sdk/share/cmake/wasi-sdk.cmake

HOME := $(shell echo ~)
USER := $$USER

ifeq ($(shell lsb_release -is), Ubuntu)
    IS_APT := yes
endif
ifeq ($(shell lsb_release -is), Debian)
    IS_APT := yes
endif
ifeq ($(shell lsb_release -is), Fedora)
	IS_FEDORA := yes
endif
ARCH := $(shell uname -m)

ifdef IS_FEDORA
lib:
	sudo dnf update
	sudo dnf install `cat pkg/all pkg/fedora* | grep -v '^#'`
else ifdef IS_APT
lib:
	sudo apt update
	sudo apt install -m `cat pkg/all pkg/apt* | grep -v '^#'`
purge:
	sudo apt remove `cat pkg/bloat | grep -v '^#'`
else
$(error unknown distro)
endif

ifeq ($(shell uname -a),x86_64)
lib: add-i386
add-i386:
	sudo dpkg --add-architecture i386
endif

all: update lib folders

snap:
	sudo snap install clion --classic
	sudo snap install intellij-idea-community --classic
	sudo snap install android-studio --classic

flatpak:
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	flatpak install -y `cat pkg/flatpak | grep -v '^#'`

folders: 
	mkdir -p ~/Pulled

update: folders
	cp gitconfig ~/.gitconfig
	chmod +x local/bin/*
	cp -rf local/* ~/.local/
	cp -rf config/* ~/.config/
	cp bashrc ~/.bashrc
	dconf load /org/mate/terminal/ < mate/dconf/terminal

install-appimages:
	sudo wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage -O /usr/local/bin/appimagetool && sudo chmod +x /usr/local/bin/appimagetool
	sudo wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage -O /usr/local/bin/linuxdeploy && sudo chmod +x /usr/local/bin/linuxdeploy

install-editor:
	curl https://getmic.ro | bash
	sudo mv micro /usr/local/bin/micro
	git config --global core.editor "micro"

install-brave:
	curl -fsS https://dl.brave.com/install.sh | sh

install-docker:
	curl -fsSL https://get.docker.com -o get-docker.sh
	sh get-docker.sh

update-alternatives:
	sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/micro 100
	sudo update-alternatives --set editor /usr/local/bin/micro

install-dev-files:
	cp mingw.cmake /usr/x86_64-w64-mingw32

dockers:
	cd arm && make build
	cd amd && make build
	cd amd/22.04 && make build
	cd macos && make build

clone:
	- cd $(HOME)/Pulled && git clone https://github.com/paulmcauley/klassy --depth 1
	- cd $(HOME)/Pulled && git clone https://github.com/ValveSoftware/gamescope.git --depth 1 --recurse-submodules

http-git:
	git config --global url.ssh://git@github.com/.insteadOf https://github.com/

usermod:
	sudo usermod -a -G vboxusers,docker,wireshark,libvirt,kvm,vboxusers $$USER

switch-remote:
	-git remote remove origin
	git remote add origin git@github.com:petabyt/dotfiles.git
