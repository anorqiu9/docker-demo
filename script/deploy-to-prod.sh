#!/bin/bash

set -x

CONTAINER_NAME='my-website'
REMOTE_IMAGE_TAG='anorqiu/my-website'

docker pull "$REMOTE_IMAGE_TAG"

#stop my-websit
docker ps -q -f "name=$CONTAINER_NAME" | xargs docker stop 

#restart my-website
docker run \
	--detach \
	--privileged=true \
	-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
	--publish=80:80 \
	--rm \
	--name "$CONTAINER_NAME" \
	"$REMOTE_IMAGE_TAG" /usr/sbin/init
