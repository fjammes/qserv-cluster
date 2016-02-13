. /qserv/stack/loadLSST.bash 
setup mysqlclient
time mysql --host ccqserv125 --port 4040 --user qsmaster LSST -e "SELECT ra, decl FROM Object WHERE deepSourceId = 2322920177142607;";
