DOCKER_USER=jgates108
MASTER=ccqserv125.in2p3.fr
MASTER_IMAGE=$DOCKER_USER/qserv:master-$MASTER
WORKER_IMAGE=$DOCKER_USER/qserv:worker-$MASTER

/opt/shmux/bin/shmux -c "sudo -u qserv sh -c 'docker rm -f qserv; nohup docker run --name qserv --rm -h ccqserv125.in2p3.fr \
    -p 4040:4040 -p 1094:1094 -p 2131:2131 -p 12181:12181 -p 5012:5012 \
    -v /qserv/data:/qserv/data $MASTER_IMAGE \
    > qserv.out 2> qserv.err < /dev/null &'" ccqserv125.in2p3.fr

/opt/shmux/bin/shmux -c 'sudo -u qserv sh -c "docker rm -f qserv; nohup docker run --name qserv --rm -h $(hostname --fqdn) \
    -p 1094:1094 -p 5012:5012 \
    -v /qserv/data:/qserv/data $WORKER_IMAGE \
    > qserv.out 2> qserv.err < /dev/null &"' ccqserv{126..149}.in2p3.fr 
