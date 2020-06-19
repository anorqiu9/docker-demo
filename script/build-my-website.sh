#!/bin/bash

set -x

#get website src
rm -rf ./hello-container/ \
&& git clone https://github.com/anorqiu9/hello-container.git

#build website image
docker build \
	--rm \
	--tag my-website \
	--file ./dockerfile/my-website.dockerfile \
	. 

