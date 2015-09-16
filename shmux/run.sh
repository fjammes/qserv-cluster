/opt/shmux/bin/shmux -c "sudo -u qserv sh -c 'docker rm -f qserv; nohup docker run --name qserv --rm -h ccqserv125.in2p3.fr \
    -v /qserv/data:/qserv/data -P fjammes/qserv:master-ccqserv125.in2p3.fr \
    > qserv.out 2> qserv.err < /dev/null &'" ccqserv125.in2p3.fr

/opt/shmux/bin/shmux -c "sudo -u qserv sh -c 'docker rm -f qserv; nohup docker run --name qserv --rm -h worker-docker \
    -v /qserv/data:/qserv/data -P fjammes/qserv:worker-ccqserv125.in2p3.fr \
    > qserv.out 2> qserv.err < /dev/null &'" ccqserv{126..149}.in2p3.fr 
