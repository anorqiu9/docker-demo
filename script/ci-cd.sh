#!/bin/bash

set -x

WEBSITE_NAME='my-website'
REMOTE_IMAGE_TAG='anorqiu/my-website'

"${PWD}/script/"build-my-website.sh \
&& docker tag "$WEBSITE_NAME" "$REMOTE_IMAGE_TAG"\
&& docker push "$REMOTE_IMAGE_TAG" 

#stop my-websit
docker ps -q -f "name=$WEBSITE_NAME" | xargs docker stop 

#restart my-website
docker run \
	--detach \
	--privileged=true \
	-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
	--publish=8080:80 \
	--rm \
	--name "$WEBSITE_NAME"\
	my-website  /usr/sbin/init \
&& \
/usr/bin/open \
	-n "/Applications/Google Chrome.app" \
	--args "http://localhost:8080"
