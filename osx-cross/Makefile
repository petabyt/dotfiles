build:
	sudo docker buildx build -t daniel-osx .

run:
	sudo docker run -v .:/host --device /dev/fuse --privileged --rm -it daniel-osx /bin/bash
