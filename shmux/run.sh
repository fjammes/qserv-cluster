#!/bin/bash

# PRE-REQUISITE: run 'changesh bash' on ccage

set -e
set -x

. ./env.sh

/opt/shmux/bin/shmux -c "docker rm -f $CONTAINER_NAME; \
        docker run --detach=true \
            -v /qserv/data:/qserv/data \
            -v /qserv/log:/qserv/run/var/log \
            --name $CONTAINER_NAME --net=host \
                $MASTER_IMAGE" "$MASTER" 

/opt/shmux/bin/shmux -M 25 -c "docker rm -f $CONTAINER_NAME; \
        docker run --detach=true \
            -v /qserv/data:/qserv/data \
            -v /qserv/log:/qserv/run/var/log \
            --name $CONTAINER_NAME --net=host \
                $WORKER_IMAGE" $WORKERS

