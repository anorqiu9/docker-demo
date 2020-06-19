#!/bin/bash

set -x

docker build \
	--rm \
	--tag centos7-systemd \
	--file ./dockerfile/c7-systemd.dockerfile \
	. 

