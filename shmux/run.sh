# PRE-REQUISITE: run 'changesh bash' on ccage
set -e
set -x

. ./params.sh

/opt/shmux/bin/shmux -c "docker rm -f $CONTAINER_NAME; \
        docker run --detach=true \
            -v /qserv/data:/qserv/data \
            -v /qserv/log:/qserv/run/var/log \
            --name $CONTAINER_NAME --net=host \
                $MASTER_IMAGE" ccqserv125.in2p3.fr

/opt/shmux/bin/shmux -S all -c "docker rm -f $CONTAINER_NAME; \
        docker run --detach=true \
            -v /qserv/data:/qserv/data \
            -v /qserv/log:/qserv/run/var/log \
            --name $CONTAINER_NAME --net=host \
                $WORKER_IMAGE" ccqserv{126..149}.in2p3.fr

