FROM postgres:9.4

RUN apt-get update && apt-get install -y \ 
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /db
COPY . /db

RUN chmod +x /db/bin/*.sh
RUN ln -s /db/bin/*.sh .