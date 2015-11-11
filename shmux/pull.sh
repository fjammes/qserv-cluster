set -e
set -x

DOCKER_USER=jgates108
MASTER=ccqserv125.in2p3.fr
BRANCH=tickets_DM-3945
MASTER_IMAGE="$DOCKER_USER/qserv:${BRANCH}_master_$MASTER"
WORKER_IMAGE="$DOCKER_USER/qserv:${BRANCH}_worker_$MASTER"


/opt/shmux/bin/shmux -c "sudo -u qserv sh -c 'docker pull $MASTER_IMAGE'" ccqserv125.in2p3.fr
/opt/shmux/bin/shmux -c "sudo -u qserv sh -c 'docker pull $WORKER_IMAGE'" ccqserv{126..149}.in2p3.fr 
