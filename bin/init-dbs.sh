BIN_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

SUFIX_DB_NAME=$1

$BIN_PATH/restore-oamds.sh
$BIN_PATH/restore.sh bdzillyon$SUFIX_DB_NAME