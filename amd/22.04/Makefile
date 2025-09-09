build:
	sudo docker buildx build -t daniel-2204 .

run:
	sudo docker run -v .:/host --device /dev/fuse --privileged --rm -it daniel-2204 /bin/bash
