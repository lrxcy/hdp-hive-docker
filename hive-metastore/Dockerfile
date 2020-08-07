FROM lrxcywq/hive:3.1.2

WORKDIR /opt

ENV HADOOP_CLASSPATH=${HADOOP_HOME}/share/hadoop/tools/lib/aws-java-sdk-bundle-1.11.375.jar:${HADOOP_HOME}/share/hadoop/tools/lib/hadoop-aws-3.2.1.jar

RUN apt-get update && apt-get install -y mysql-server

COPY scripts/hive_user.sql /user.sql
COPY scripts/entrypoint.sh /entrypoint.sh

RUN service mysql start && sh -c '/bin/echo -e "\n" | mysql -u root -p < /user.sql

RUN groupadd -r hive --gid=1000 && \
    useradd -r -g hive --uid=1000 -d ${HIVE_HOME} hive && \
    chown hive:hive -R ${HIVE_HOME} && \
    chown hive:hive /entrypoint.sh && chmod +x /entrypoint.sh

USER hive
EXPOSE 9083

ENTRYPOINT ["sh", "-c", "/entrypoint.sh"]
