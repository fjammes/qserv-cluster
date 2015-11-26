set -e
set -x

. ./params.sh

/opt/shmux/bin/shmux -c "sudo -u qserv sh -c 'docker pull $MASTER_IMAGE'" ccqserv125.in2p3.fr
/opt/shmux/bin/shmux -c "sudo -u qserv sh -c 'docker pull $WORKER_IMAGE'" ccqserv{126..149}.in2p3.fr 
