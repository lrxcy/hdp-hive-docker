FROM postgres:9.5.3

MAINTAINER "Lrxcy <lrxcywq@gmail.com>"

COPY init-hive-db.sh /docker-entrypoint-initdb.d/init-user-db.sh

RUN chmod a+x /docker-entrypoint-initdb.d/init-user-db.sh
