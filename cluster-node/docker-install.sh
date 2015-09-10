#!/bin/sh

# Install ans setup docker on ccqserv1xx nodes
# Need to be runned as root

USER=fjammes
GROUP=docker

DIR=$(cd "$(dirname "$0")"; pwd -P)

yum install docker-io
usermod -a -G $GROUP $USER

cp -r cluster-node/etc/* /etc/

systemctl start  docker.service
