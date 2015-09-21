/opt/shmux/bin/shmux -c "sudo -u qserv sh -c 'docker rm -f qserv; nohup docker run --name qserv --rm -h ccqserv125.in2p3.fr \
    -p 4040:4040 -p 1094:1094 -p 2131:2131 -p 12181:12181 -p 5012:5012 \
    fjammes/qserv:master-ccqserv125.in2p3.fr \
    > qserv.out 2> qserv.err < /dev/null &'" ccqserv125.in2p3.fr

/opt/shmux/bin/shmux -c "sudo -u qserv sh -c 'docker rm -f qserv; nohup docker run --name qserv --rm -h worker-docker \
    -p 1094:1094 -p 5012:5012 \
    fjammes/qserv:worker-ccqserv125.in2p3.fr \
    > qserv.out 2> qserv.err < /dev/null &'" ccqserv{126..127}.in2p3.fr
