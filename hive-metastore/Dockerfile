FROM lrxcywq/hive:3.1.0

WORKDIR /opt

RUN apt-get update && apt-get install -y mysql-server && echo "done"

COPY scripts/hive_user.sql /user.sql
COPY scripts/entrypoint.sh /entrypoint.sh
COPY hive-site.xml ${HIVE_HOME}/conf/hive-site.xml

RUN rm ${HIVE_HOME}/lib/mysql-connector-java-8.0.19.jar  && \
    curl -L https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.49.tar.gz | tar zxf - && \
    cp mysql-connector-java-5.1.49/mysql-connector-java-5.1.49.jar ${HIVE_HOME}/lib/mysql-connector-java.jar && \
    rm -rf  mysql-connector-java-5.1.49 && \
    echo "done"

RUN service mysql start && mysql < /user.sql && schematool -initSchema -dbType mysql && echo "done"

RUN chmod +x /entrypoint.sh

USER root
EXPOSE 9083

ENTRYPOINT ["sh", "-c", "/entrypoint.sh"]
