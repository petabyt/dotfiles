$(HOME)=$(shell echo ~)

lib:
	sudo apt update
	sudo apt install golang wget curl dillo links build-essential git xclip

purge:
	sudo apt update
	sudo apt remove ubuntu-mate-welcome

# Decent compiler
$(HOME)gcc-arm-none-eabi:
	cd ~/Downloads; wget "https://developer.arm.com/-/media/Files/downloads/gnu-rm/5_4-2016q3/gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2?revision=111dee36-f88b-4672-8ac6-48cf41b4d375?product=GNU%20Arm%20Embedded%20Toolchain%20Downloads,32-bit,,Linux,5-2016-q3-update"
	cd ~/Downloads; tar -xzf gcc*; mv gcc* ~/gcc-arm-none-eabi

$(HOME)/Pulled:
	mkdir ~/Pulled
$(HOME)/Gtcc:
	mkdir ~/Gtcc
$(HOME)/School:
	mkdir ~/School

# Configure micro custom syntax
MICRO_SYNTAX=$(HOME)/.config/micro/syntax
MICRO_SYNTAX:
	mkdir MICRO_SYNTAX

MICRO_SYNTAX/arm.yaml:
	wget https://gist.githubusercontent.com/petabyt/5dbfa413ff1b14e8c2b1af7c55249de6/raw/caeaa09708fb5048559b4a3e4be119576e17f792/micro.yaml

MICRO_SYNTAX/skript.yaml:
	https://gist.githubusercontent.com/petabyt/aef8a1c969d95ca629f0221bbedc1e9a/raw/2dfdfe258c4d38e3e41715575c9b9a06d8bd90e9/skript.yaml

	
# variables
exports:
	echo 'export PATH=$PATH:~/gcc-arm-none-eabi/bin' >> ~/.bashrc
	echo 'export PATH=$PATH:~/' >> ~/.bashrc

# Nice text editor
/bin/micro:
	cd curl https://getmic.ro | bash
	sudo mv micro /bin/micro

thinkpad:
	echo "export MOZ_USE_XINPUT2=1" >> /etc/environment
