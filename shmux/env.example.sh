DOCKER_USER=qserv
# Set nodes names
MASTER=ccqserv100.in2p3.fr
WORKERS=$(echo ccqserv1{01..24}.in2p3.fr)
# set image names
BRANCH=dev
MASTER_IMAGE="$DOCKER_USER/qserv:${BRANCH}_master_$MASTER"
WORKER_IMAGE="$DOCKER_USER/qserv:${BRANCH}_worker_$MASTER"
CONTAINER_NAME=qserv_dev
