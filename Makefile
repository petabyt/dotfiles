# Yes, a Makefile to compile my computer

$(HOME)=$(shell echo ~)

help:
	echo "update lib purge python2 android dconf text-editor exports thinkpad folders arm-cc"

fresh: update folders purge lib python2 android arm-cc text-editor exports

update: folders
	dconf load / < dconf
	dconf load /org/mate/panel/objects/ < panelconfig
	cp .gitconfig ~/
	chmod +x .local/bin/*
	cp -rf .local ~/.local

lib:
	sudo apt update
	sudo apt install golang wget curl dillo links build-essential git xclip caja-open-terminal

purge:
	sudo apt update
	sudo apt remove ubuntu-mate-welcome

# attempt to install python2 pip2 to compile legacy stuff
python2:
	sudo apt install python2.7-minimal
	sudo apt install python-is-python2
	wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
	sudo python2.7 get-pip.py
	rm get-pip.py

# androidtools dev stuff
android:
	sudo apt install android-sdk android-sdk-platform-23 
	sudo apt install google-android-ndk-installer
	sudo apt install cmake

	# Accept SDK licenses
	@echo 'Accepting license..'
	git clone https://github.com/Shadowstyler/android-sdk-licenses.git
	sudo cp -a android-sdk-licenses/*-license /usr/lib/android-sdk/licenses 
	rm -rf android-sdk-licenses

arm-cc: $(HOME)/gcc-arm-none-eabi

# Decent arm compiler
$(HOME)/gcc-arm-none-eabi:
	cd ~/Downloads; wget "https://developer.arm.com/-/media/Files/downloads/gnu-rm/5_4-2016q3/gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2?revision=111dee36-f88b-4672-8ac6-48cf41b4d375?product=GNU%20Arm%20Embedded%20Toolchain%20Downloads,32-bit,,Linux,5-2016-q3-update"
	cd ~/Downloads; tar -xzf gcc*; mv gcc* ~/gcc-arm-none-eabi
	echo 'export PATH=$PATH:~/gcc-arm-none-eabi/bin' >> ~/.bashrc

folders: $(HOME)/Pulled $(HOME)/Gtcc $(HOME)/School

# Spiffy folders
$(HOME)/Pulled:
	mkdir ~/Pulled
$(HOME)/Gtcc:
	mkdir ~/Gtcc
$(HOME)/School:
	mkdir ~/School

# Nice text editor
MICRO_SYNTAX=$(HOME)/.config/micro/syntax
$(MICRO_SYNTAX):
	mkdir -p $(MICRO_SYNTAX)

$(MICRO_SYNTAX)/arm.yaml: $(MICRO_SYNTAX)
	cd $(MICRO_SYNTAX); wget -4 https://gist.githubusercontent.com/petabyt/5dbfa413ff1b14e8c2b1af7c55249de6/raw/micro.yaml; mv micro.yaml arm.yaml

$(MICRO_SYNTAX)/skript.yaml: $(MICRO_SYNTAX)
	cd $(MICRO_SYNTAX); wget -4 https://gist.githubusercontent.com/petabyt/aef8a1c969d95ca629f0221bbedc1e9a/raw/skript.yaml

/bin/micro:
	cd curl https://getmic.ro | bash
	sudo mv micro /bin/micro
	micro -plugin install filemanager

text-editor: /bin/micro $(MICRO_SYNTAX)/arm.yaml $(MICRO_SYNTAX)/skript.yaml

# variables
# TODO: put in /etc/profile maybe
exports:
	echo 'export PATH=$PATH:~/' >> ~/.bashrc

# thinkpad tweak
# See https://gist.github.com/petabyt/1ad0e074bcf78894d7aaee9e94c50c11
thinkpad:
	# Fix janky Firefox scrolling
	echo "export MOZ_USE_XINPUT2=1" >> /etc/profile
	sudo apt install fprintd
