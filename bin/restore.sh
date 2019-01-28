# !/bin/bash
clear

ZW_URL=${ZW_URL:-"http://localhost:8080/ZillyonWeb"}

param_dbname_sufix=$1
download=$2
key=$3

dbname=bdzillyon${param_dbname_sufix}
root_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
dumps_path="$root_path/../dumps"
dump_file_oamd=${dumps_path}/${dbname}.backup
IP_CONTAINER=$(awk 'END{print $1}' /etc/hosts)

key=${key:-$param_dbname_sufix}

if [ $download == "true" ]
then
    $root_path/download.sh $param_dbname_sufix
fi

echo "Start process restore"

$root_path/pre-restore.sh ${dbname}

echo "Droping and creating database ${dbname}"

psql -h localhost -U postgres -c "drop database if exists \"${dbname}\";"
psql -h localhost -U postgres -c "create database \"${dbname}\";"

echo "Start restore database ${dbname} with $dump_file_oamd"
pg_restore -h localhost -U postgres --jobs=64 -d ${dbname} $dump_file_oamd
psql -h localhost -U postgres -d OAMD -c "delete from empresa where chave = '${key}';"
psql -h localhost -U postgres -d OAMD -c "insert into empresa (chave, \"nomeBD\") values ('${key}', '${dbname}');"
psql -h localhost -U postgres -d OAMD -c "update empresa set \"hostBD\" = '$IP_CONTAINER' "
psql -h localhost -U postgres -d OAMD -c "update empresa set \"robocontrole\" = '${ZW_URL}'"
psql -h localhost -U postgres -d OAMD -c "update empresa set modulos = 'ZW,CRM,CE,FIN,EST,TR,GP,SLC,SBX,GOR'"
echo "Restore database ${dbname} completed!"

$root_path/zw-version-update.sh 900 $param_dbname_sufix 
$root_path/pos-restore.sh

echo "Finish process restore!"