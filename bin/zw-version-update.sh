DBPARCIALNAME=$2
VERSION=$1

VERSION=${VERSION:-1}
DBPARCIALNAME=${DBPARCIALNAME:-"pactoversao"}

echo 'Update version to: '
psql -h localhost -U postgres -d "bdzillyon${DBPARCIALNAME}" -c "update bdversaoatual set versao = $VERSION;"