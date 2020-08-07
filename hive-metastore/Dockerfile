FROM lrxcywq/hive:3.1.0

WORKDIR /opt

RUN apt-get update && apt-get install -y mysql-server && echo "done"

COPY scripts/hive_user.sql /user.sql
COPY scripts/entrypoint.sh /entrypoint.sh
COPY hive-site.xml ${HIVE_HOME}/conf/hive-site.xml

RUN mv ${HIVE_HOME}/lib/mysql-connector-java-8.0.19.jar ${HIVE_HOME}/lib/mysql-connector-java.jar
RUN service mysql start && service mysql status && mysql < /user.sql

RUN chmod +x /entrypoint.sh

USER root
EXPOSE 9083

ENTRYPOINT ["sh", "-c", "/entrypoint.sh"]
