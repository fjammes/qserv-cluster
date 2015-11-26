# PRE-REQUISITE: run 'changesh bash' on ccage
set -e
set -x

. ./params.sh

/opt/shmux/bin/shmux -c "sudo -u qserv bash -c 'docker rm -f qserv; nohup docker run --name qserv --rm --net=host \
    -p 4040:4040 -p 1094:1094 -p 2131:2131 -p 12181:12181 -p 5012:5012 \
    -v /qserv/data:/qserv/data $MASTER_IMAGE \
    > /tmp/qserv.out 2> /tmp/qserv.err < /dev/null &'" ccqserv125.in2p3.fr

/opt/shmux/bin/shmux -c 'sudo -u qserv bash -c "docker rm -f qserv; nohup docker run --name qserv --rm --net=host \
    -p 1094:1094 -p 5012:5012 \
    -v /qserv/data:/qserv/data '$WORKER_IMAGE' /qserv/scripts/start.sh \
    > /tmp/qserv.out 2> /tmp/qserv.err < /dev/null &"' ccqserv{126..149}.in2p3.fr 
