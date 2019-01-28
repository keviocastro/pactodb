# !/bin/bash

DUMPS_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )/../dumps
DB_NAME=$1
DATE=$(date +%Y-%m-%d)

if [ "$DB_NAME" == "oamd" ] || [ "$DB_NAME" == "OAMD" ];
then
    wget --user ${CLOUDBACKUP_USER} --password ${CLOUDBACKUP_PASSWORD} http://cloudbackup.pactosolucoes.com.br:8072/backups/academias/oamd/OAMD-${DATE}.backup -O ${DUMPS_PATH}/OAMD.backup
else
    wget --user ${CLOUDBACKUP_USER} --password ${CLOUDBACKUP_PASSWORD} http://cloudbackup.pactosolucoes.com.br:8072/backups/academias/${DB_NAME}/bdzillyon${DB_NAME}-${DATE}.backup -O ${DUMPS_PATH}/bdzillyon${DB_NAME}.backup
    wget --user ${CLOUDBACKUP_USER} --password ${CLOUDBACKUP_PASSWORD} http://cloudbackup.pactosolucoes.com.br:8072/backups/academias/${DB_NAME}/bdmusc${DB_NAME}-${DATE}.backup -O ${DUMPS_PATH}/bdmusc${DB_NAME}.backup
fi