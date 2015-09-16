/opt/shmux/bin/shmux -c "sudo -u qserv sh -c 'docker pull fjammes/qserv:master-ccqserv125.in2p3.fr'" ccqserv125.in2p3.fr
sh workers.sh | /opt/shmux/bin/shmux -c "sudo -u qserv sh -c 'docker pull fjammes/qserv:worker-ccqserv125.in2p3.fr'" - 
