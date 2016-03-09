set -x

/opt/shmux/bin/shmux -c "echo \"$PASSWORD\" | sudo -S sh -c 'chown -R qserv /qserv/log'" ccqserv{125..149}.in2p3.fr 
