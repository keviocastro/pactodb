DBPARCIALNAME=$2
DBPARCIALNAME=${DBPARCIALNAME:-"primatas"}

psql -h localhost -U postgres -d "bdzillyon${DBPARCIALNAME}" -c "select versao from bdversaoatual where codigo = 1;"