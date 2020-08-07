FROM lrxcywq/hive:3.1.0

MAINTAINER "Lrxcy <lrxcywq@gmail.com>"

COPY init-hive-db.sh /opt/init-user-db.sh

RUN apt-get update && \
    apt-get install -y postgresql sudo && \
    service postgresql start && \
    chmod a+x /opt/init-user-db.sh && \
    bash /opt/init-user-db.sh

EXPOSE 5432
