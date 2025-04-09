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
	sudo snap install clion --classic
	sudo snap install intellij-idea-community --classic
	sudo snap install android-studio --classic

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

# attempt to install python2 pip2 to compile legacy stuff
python2:
	sudo apt install python2
	sudo apt install python-is-python2
	wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
	sudo python2.7 get-pip.py
	rm get-pip.py

androidtools:
	sudo apt install android-sdk android-sdk-platform-23 
	sudo apt install google-android-ndk-installer
	sudo apt install cmake

	# Accept SDK licenses
	@echo 'Accepting license..'
	git clone https://github.com/Shadowstyler/android-sdk-licenses.git
	sudo cp -a android-sdk-licenses/*-license /usr/lib/android-sdk/licenses 
	rm -rf android-sdk-licenses

armcc: $(HOME)/gcc-arm-none-eabi

# 2016 arm compiler
$(HOME)/gcc-arm-none-eabi:
	cd ~/Downloads; wget "https://developer.arm.com/-/media/Files/downloads/gnu-rm/5_4-2016q3/gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2?revision=111dee36-f88b-4672-8ac6-48cf41b4d375?product=GNU%20Arm%20Embedded%20Toolchain%20Downloads,32-bit,,Linux,5-2016-q3-update"
	cd ~/Downloads; tar -xjf gcc*; mv gcc-arm-none-eabi-5_4-2016q3 ~/gcc-arm-none-eabi
	chmod +x ~/gcc-arm-none-eabi/bin/*
	echo 'export PATH=$PATH:~/gcc-arm-none-eabi/bin' >> ~/.bashrc

# Nice text editor
editor:
	curl https://getmic.ro | bash
	sudo mv micro /bin/micro
	micro -plugin install filemanager
	git config --global core.editor "micro"

git:
	git config --global url.ssh://git@github.com/.insteadOf https://github.com/

# x240 thinkpad tweak
# See https://gist.github.com/petabyt/1ad0e074bcf78894d7aaee9e94c50c11
thinkpad:
	# Fix janky Firefox scrolling
	echo "export MOZ_USE_XINPUT2=1" >> /etc/profile

	# Nifty fingerprint reading
	sudo apt install fprintd
