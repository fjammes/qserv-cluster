#!/bin/bash

set -e

. ./env.sh

/opt/shmux/bin/shmux -c "docker ps --filter name=${CONTAINER_NAME} | grep ${CONTAINER_NAME}" "$MASTER" $WORKERS
