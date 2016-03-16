#!/bin/bash

set -e

. ./env.sh

/opt/shmux/bin/shmux -c "docker rm -f $CONTAINER_NAME" "$MASTER" $WORKERS 
