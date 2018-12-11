FROM postgres:9.4

RUN mkdir /db
COPY . /db

RUN chmod +x /db/bin/*.sh
RUN ln -s /db/bin/*.sh .