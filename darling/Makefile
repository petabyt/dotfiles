build:
	sudo docker rm -f darlingsetup
	sudo docker build -t daniel-darling .
	sudo docker run --name darlingsetup --mount type=tmpfs,destination=/root/overlay --privileged -it daniel-darling bash /setup.sh
	sudo docker commit --change='ENTRYPOINT ["bash", "/startup.sh"]' darlingsetup daniel-darling-setup
	sudo docker rm -f darlingsetup

run:
	sudo docker run -v .:/host --device /dev/fuse --mount type=tmpfs,destination=/root/overlay --privileged --rm -it daniel-darling-setup
