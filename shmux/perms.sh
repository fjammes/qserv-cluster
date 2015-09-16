sh hosts.sh | /opt/shmux/bin/shmux -c "echo \"$PASSWORD\" | sudo -S sh -c 'usermod -a  -G docker qserv'" -
