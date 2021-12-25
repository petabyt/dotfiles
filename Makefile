lib:
	sudo apt update
	sudo apt install golang wget curl dillo links build-essential git xclip

gcc:
	cd ~/Downloads; wget "https://developer.arm.com/-/media/Files/downloads/gnu-rm/5_4-2016q3/gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2?revision=111dee36-f88b-4672-8ac6-48cf41b4d375?product=GNU%20Arm%20Embedded%20Toolchain%20Downloads,32-bit,,Linux,5-2016-q3-update"
	cd ~/Downloads; tar -xzf gcc*

setup:
	mkdir ~/Pulled
	mkdir ~/Gtcc
	mkdir ~/School
	
	echo 'export PATH=$PATH:~/gcc-arm-none-eabi-5_4-2016q3/bin' >> ~/.bashrc
	echo 'export PATH=$PATH:~/' >> ~/.bashrc
	echo 'export PATH=$PATH:~/$(PWD)' >> ~/.bashrc
	
	curl https://getmic.ro | bash; cp micro /bin/; rm micro
