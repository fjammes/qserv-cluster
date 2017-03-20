#!/bin/bash

# Copy administration scripts to kubernetes
# orchestration node

# @author Fabrice Jammes SLAC/IN2P3

set -e
set -x

DIR=$(cd "$(dirname "$0")"; pwd -P)
. "$DIR/env-cluster.sh"

echo "Copy administration scripts to kubernetes orchestration node"

SRC_FILE="$HOME/src/qserv-cluster/cluster-node/etc-centos7/sysconfig/docker"
TGT_FILE="/tmp/docker"

for node in $MASTER $WORKERS
do
    scp "$SRC_FILE" "$node":"$TGT_FILE"
    ssh "$node" "sudo cp $TGT_FILE /etc/sysconfig/docker"
done

