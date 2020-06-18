#!/bin/bash

set -x

#get app arti
rm -rf ./hello-container/ \
&& git clone https://github.com/anorqiu9/hello-container.git

#build app container image
docker build --file ./dockerfile/my-app.dockerfile --tag my-app .

#re-run my-app
docker run --detach --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro --publish=$1:80 my-app /usr/sbin/init
