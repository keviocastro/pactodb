# pactodb
Conjunto de imagens Docker e utilitários em linha de comandos para banco de dados de aplicações Pacto Soluções

# Para começar

```console
git clone git@github.com:keviocastro/pactodb.git
cd  pactodb
docker-compose up -d
docker exec postgres /db/bin/init.sh 1000fit
```

Este comando "docker exec postgres /db/bin/init.sh 1000fit" faz donwload dos arquivos de backup do OAMD, bdzillyon1000fit e bdmusc1000fit no serviço de cloudbackups, cria a base de dados e restaura este backup alterando as propriedades necessárias para desenvolvimento local.

Se você já tem um backup do OAMD em seu computador, é aconselhável coloca-lo no diretório "dumps" para que não seja necessário baixar o bakcup do banco OAMD, pois pode demorar um bom tempo.

#### Restaurar um banco individutal fazendo download em cloudbackup
```console
docker exec -it postgres bash -c '/db/bin/restore.sh 1000fit true'
```

#### Restaurar um banco individutal fazendo utilizando arquivo local contido no diretório dumps
```console
docker exec -it postgres bash -c '/db/bin/restore.sh 1000fit'
```

#### Qual IP do postgre?

```console
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' postgres
```
ou 
```console
docker inspect postgres | grep IPAddress
```


