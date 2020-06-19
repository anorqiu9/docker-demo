#!/bin/bash

set -x

docker build \
	--rm \
	--tag web-server-nginx \
	--file ./dockerfile/web-server-nginx.dockerfile \
	. 

