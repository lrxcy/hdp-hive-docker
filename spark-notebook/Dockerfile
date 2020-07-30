FROM lrxcywq/hdp_base:3.2.1

MAINTAINER Lrxcy <lrxcywq@gmail.com>

ENV APACHE_SPARK_VERSION 3.0.0
ENV APACHE_HADOOP_VERSION 3.2.1

RUN set -x \
    && curl -fSL "https://github.com/spark-notebook/spark-notebook/archive/v0.8.3.tar.gz" -o /tmp/spark-notebook.tgz \
    && tar -xzvf /tmp/spark-notebook.tgz -C /opt/ \
    && mv /opt/spark-notebook-* /opt/spark-notebook \
    && rm /tmp/spark-notebook.tgz

COPY run.sh /run.sh
RUN chmod a+x /run.sh

COPY application.conf /opt/spark-notebook/conf/
COPY clusters /opt/spark-notebook/conf/
COPY profiles /opt/spark-notebook/conf/
COPY jars /jars

RUN mkdir -p /data/resources

ENV NOTEBOOKS_DIR "/opt/spark-notebook/notebooks"
ENV RESOURCES_DIR "/data/resources"
ENV SPARK_MASTER "spark://spark-master:7077"
ENV SPARK_EXECUTOR_MEMORY "4G"
ENV EXTRA_CLASSPATH "/jars/*"

WORKDIR /opt/spark-notebook/

CMD ["/run.sh"]