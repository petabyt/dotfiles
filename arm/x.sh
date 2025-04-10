# setup qemu-user
sudo docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

sudo docker buildx build --platform linux/arm64/v8 -t daniel-arm64 .

# Run container
sudo docker run -v .:/host --device /dev/fuse --privileged --rm -it daniel-arm64 /bin/bash
