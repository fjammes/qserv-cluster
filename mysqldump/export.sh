docker run --detach=true  -v /qserv/data:/qserv/data --name qserv --net=host qserv/qserv:tickets_DM-2699_worker_ccqserv125.in2p3.fr
docker exec -it qserv bash -c ". /qserv/stack/loadLSST.bash && setup mysql && mysqldump -S /qserv/run/var/lib/mysql/mysql.sock -u qsmaster LSST | gzip > /qserv/data/export.sql.gz"
