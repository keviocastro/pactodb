# pactodb
Conjunto de imagens Docker e utilitários em linha de comandos para banco de dados de aplicações Pacto Soluções

# Para começar

```console
git clone git@github.com:keviocastro/pactodb.git
cd  pactodb
docker-compose up -d
docker exec postgres /db/bin/init-db.sh 1000fit
```

#### Restaurar um banco individutal fazendo download em cloudbackup
```console
docker exec -it postgres bash -c '/db/bin/restore.sh 1000fit true'
```

#### Restaurar um banco individutal fazendo utilizando arquivo local contido no diretório dumps
```console
docker exec -it postgres bash -c '/db/bin/restore.sh 1000fit'
```
