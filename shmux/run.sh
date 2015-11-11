# PRE-REQUISITE: run 'changesh bash' on ccage
set -e
set -x

DOCKER_USER=jgates108
MASTER=ccqserv125.in2p3.fr
BRANCH=tickets_DM-3945
MASTER_IMAGE="$DOCKER_USER/qserv:${BRANCH}_master_$MASTER"
WORKER_IMAGE="$DOCKER_USER/qserv:${BRANCH}_worker_$MASTER"

#MASTER_IMAGE=fjammes/qserv:master-ccqserv125.in2p3.fr
#WORKER_IMAGE=fjammes/qserv:worker-ccqserv125.in2p3.fr

/opt/shmux/bin/shmux -c "sudo -u qserv bash -c 'docker rm -f qserv; nohup docker run --name qserv --rm -h ccqserv125.in2p3.fr \
    -p 4040:4040 -p 1094:1094 -p 2131:2131 -p 12181:12181 -p 5012:5012 \
    -v /qserv/data:/qserv/data $MASTER_IMAGE \
    > /tmp/qserv.out 2> /tmp/qserv.err < /dev/null &'" ccqserv125.in2p3.fr

/opt/shmux/bin/shmux -c 'sudo -u qserv bash -c "docker rm -f qserv; nohup docker run --name qserv --rm -h $(hostname --fqdn) \
    -p 1094:1094 -p 5012:5012 \
    -v /qserv/data:/qserv/data '$WORKER_IMAGE' \
    > /tmp/qserv.out 2> /tmp/qserv.err < /dev/null &"' ccqserv{126..149}.in2p3.fr 
