DUMPS_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )/../dumps

CLIENT_NAME=$1
DATE=$(date +%Y-%m-%d)

wget --user ${CLOUDBACKUP_USER} --password ${CLOUDBACKUP_PASSWORD} http://cloudbackup.pactosolucoes.com.br:8072/backups/academias/${CLIENT_NAME}/bdzillyon${CLIENT_NAME}-${DATE}.backup -O ${DUMPS_PATH}/bdzillyon${CLIENT_NAME}.backup
wget --user ${CLOUDBACKUP_USER} --password ${CLOUDBACKUP_PASSWORD} http://cloudbackup.pactosolucoes.com.br:8072/backups/academias/${CLIENT_NAME}/bdmusc${CLIENT_NAME}-${DATE}.backup -O ${DUMPS_PATH}/bdmusc${CLIENT_NAME}.backup