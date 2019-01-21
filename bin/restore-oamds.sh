root_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

$root_path/create-user.sh oamd pactodb
$root_path/create-user.sh zillyonweb pactodb

psql -h localhost -U postgres -c "drop database \"OAMD\";"
psql -h localhost -U postgres -c "drop database \"OAMD2\";"

psql -h localhost -U postgres -c "create database \"OAMD\";"
psql -h localhost -U postgres -c "create database \"OAMD2\";"

pg_restore -h localhost -U postgres --jobs=64 -d OAMD $root_path/../dumps/OAMD.backup
pg_restore -h localhost -U postgres -d OAMD2 $root_path/../dumps/OAMD2.backup

psql -h localhost -U postgres -d OAMD -c "update empresa set robocontrole = 'http://localhost:8080/ZillyonWeb';"
psql -h localhost -U postgres -d OAMD -c "update empresa set modulos = 'ZW,CRM,CE,FIN,EST,TR,GP,SLC,SBX,GOR';" 
psql -h localhost -U postgres -d OAMD2 -c "update empresa set urlzillyonweb = 'http://localhost:8080/ZillyonWeb', urlzillyonwebinteg = 'http://localhost:8080/ZillyonWeb';"
# incluir todos os modulos no pactoversao
# utilizar oamd local
# alterar urls do treino no oamd
# alterar o pom do zw com urls do treino:
#     <URL_OAMD>http://localhost:8083/oamd</URL_OAMD>
#     <URL_OAMD_EMPRESAS>http://localhost:8083/oamd/empresas</URL_OAMD_EMPRESAS>
#     <URL_TREINO>http://localhost:8081/TreinoWeb/</URL_TREINO>
