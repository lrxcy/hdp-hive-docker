FROM lrxcywq/hive:3.1.0

WORKDIR /opt

ENV HADOOP_CLASSPATH=${HADOOP_HOME}/share/hadoop/tools/lib/aws-java-sdk-bundle-1.11.375.jar:${HADOOP_HOME}/share/hadoop/tools/lib/hadoop-aws-3.2.1.jar

RUN apt-get update && apt-get install -y mysql-server && echo "done"

COPY scripts/hive_user.sql /user.sql
COPY scripts/entrypoint.sh /entrypoint.sh
COPY hive-site.xml ${HIVE_HOME}/conf/hive-site.xml

RUN mv ${HIVE_HOME}/lib/mysql-connector-java-8.0.19.jar ${HIVE_HOME}/lib/mysql-connector-java.jar
RUN service mysql start && service mysql enable && mysql < /user.sql

RUN chmod +x /entrypoint.sh

USER root
EXPOSE 9083

ENTRYPOINT ["sh", "-c", "/entrypoint.sh"]
