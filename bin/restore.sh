param_dbname_sufix=$1

dbname_oamd=bdzillyon${param_dbname_sufix}
root_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
dumps_path="$root_path/../dumps"
dump_file_oamd=${dumps_path}/${dbname_oamd}.backup

IP_CONTAINER=$(awk 'END{print $1}' /etc/hosts)

echo "Start process restore"

$root_path/pre-restore.sh ${dbname_oamd}

echo "Droping and creating database ${dbname_oamd}"

psql -h localhost -U postgres -c "drop database if exists \"${dbname_oamd}\";"
psql -h localhost -U postgres -c "create database \"${dbname_oamd}\";"

echo "Start restore database ${dbname_oamd} with $dump_file_oamd"
pg_restore -h localhost -U postgres -d ${dbname_oamd} -1 $dump_file_oamd
psql -h localhost -U postgres -d OAMD -c "delete from empresa where chave = '${param_dbname_sufix}';"
psql -h localhost -U postgres -d OAMD -c "insert into empresa (chave, \"nomeBD\") values ('${param_dbname_sufix}', '${dbname_oamd}');"
psql -h localhost -U postgres -d OAMD -c "update empresa set \"hostBD\" = '$IP_CONTAINER' "
psql -h localhost -U postgres -d OAMD -c "update empresa set \"robocontrole\" = 'http://localhost:8080/ZillyonWeb'"
psql -h localhost -U postgres -d OAMD -c "update empresa set modulos = 'ZW,CRM,CE,FIN,EST,TR,GP,SLC,SBX,GOR'"
echo "Restore database ${dbname_oamd} completed!"

$root_path/pos-restore.sh

echo "Finish process restore!"