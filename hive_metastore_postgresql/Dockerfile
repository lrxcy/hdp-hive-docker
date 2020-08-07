FROM lrxcywq/hive:3.1.0

MAINTAINER "Lrxcy <lrxcywq@gmail.com>"

RUN apt-get update && apt-get install -y postgresql sudo && service postgresql start

COPY init-hive-db.sh /opt/init-user-db.sh

RUN chmod a+x /opt/init-user-db.sh && su postgres && /opt/init-user-db.sh
