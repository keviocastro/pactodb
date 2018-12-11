# pactodb
Conjunto de imagens Docker e utilitários em linha de comandos para aplicações Pacto

# Para começar

```console
git clone git@github.com:keviocastro/pactodb.git
cd  pactodb
docker-compose up -d
docker exec postgres /db/bin/restore.sh OAMD
docker exec postgres /db/bin/restore.sh 100fit
```
