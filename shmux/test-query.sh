. /qserv/stack/loadLSST.bash 
setup mysqlclient

. ./env.sh

time mysql --host "$MASTER" --port 4040 --user qsmaster LSST -e "SELECT ra, decl FROM Object WHERE deepSourceId = 2322920177142607;";
setup mysqlpython
python runQueries.py
