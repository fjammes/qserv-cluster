/opt/shmux/bin/shmux -c "sudo -u qserv sh -c 'docker stop qserv; docker run --name qserv --rm -h ccqserv125.in2p3.fr \
    -v /qserv/data:/qserv/data -P fjammes/qserv:master-ccqserv125.in2p3.fr'" ccqserv125.in2p3.fr

/opt/shmux/bin/shmux -c "sudo -u qserv sh -c 'docker stop qserv; docker run --name qserv --rm -h worker-docker \
    -v /qserv/data:/qserv/data -P fjammes/qserv:worker-ccqserv125.in2p3.fr'" ccqserv{126..149}.in2p3.fr 
