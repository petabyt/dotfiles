sudo docker buildx build -t daniel-amd64 .

sudo docker run -v .:/host --device /dev/fuse --privileged --rm -it daniel-amd64 /bin/bash
