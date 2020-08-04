FROM postgres:9.5.3

MAINTAINER "Lrxcy <lrxcywq@gmail.com>"

ENV SCHEMA_VERSION=3.1.2

COPY hive-schema-$SCHEMA_VERSION.postgres.sql /hive/hive-schema-$SCHEMA_VERSION.postgres.sql
COPY init-hive-db-$SCHEMA_VERSION.sh /docker-entrypoint-initdb.d/init-user-db.sh

RUN chmod a+x /docker-entrypoint-initdb.d/init-user-db.sh
