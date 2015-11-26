cat  /qserv/run/var/log/qserv-czar.log | egrep  "markCompleted"  | cut -d'(' -f 3 | cut -d',' -f1 | sort > JOBID_DONE.txt
cat  /qserv/run/var/log/qserv-czar.log | egrep  "Executive::add\(job\(id=" | grep LSST | cut -d'=' -f2 | cut -d' ' -f1 | sort > JOBID_ADD.txt
diff JOBID_DONE.txt JOBID_ADD.txt | grep '>' | cut -d' ' -f 2 > JOBID_STALLED.txt

# get the chunk number for job 1111
cat  /qserv/run/var/log/qserv-czar.log | egrep  "Executive::add\(job\(id=1111"

# Locate chunk 5299 on the cluster
/opt/shmux/bin/shmux -c "locate 5299" ccqserv{126..149}.in2p3.fr
