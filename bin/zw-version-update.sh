DBPARCIALNAME=$2
VERSION=$1

VERSION=${VERSION:-1}
DBPARCIALNAME=${DBPARCIALNAME:-"pactoversao"}

echo "Update database version to: ${VERSION}"
psql -h localhost -U postgres -d "bdzillyon${DBPARCIALNAME}" -c "update bdversaoatual set versao = $VERSION;"