BIN_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
OAMD_FILE_BAKCUP=$BIN_PATH/../dumps/OAMD.backup

SUFIX_DB_NAME=${1:-"1000fit"}
SUFIX_DB_NAME="${SUFIX_DB_NAME,,}"

if [ ! -f "$OAMD_FILE_BAKCUP" ];
then
    $BIN_PATH/download.sh OAMD
fi

$BIN_PATH/restore-oamds.sh
$BIN_PATH/restore.sh $SUFIX_DB_NAME true