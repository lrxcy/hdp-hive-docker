FROM lrxcywq/spark-base:3.0.0

MAINTAINER Lrxcy <lrxcywq@gmail.com>

ENV APACHE_SPARK_VERSION 3.0.0
ENV APACHE_HADOOP_VERSION 3.2

https://mirrors.bfsu.edu.cn/apache/spark/spark-3.0.0/spark-3.0.0-bin-hadoop3.2.tgz

RUN curl -fSL "https://www.apache.org/dyn/closer.lua/spark/spark-${APACHE_SPARK_VERSION}/spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" -o /tmp/spark-notebook.tgz && \
    tar -xzvf /tmp/spark-notebook.tgz -C /opt/ && \
    mv /opt/spark-notebook-* /opt/spark-notebook && \
    rm /tmp/spark-notebook.tgz

WORKDIR /opt/spark-notebook
RUN ln -s "spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}" spark

COPY run.sh /run.sh
RUN chmod a+x /run.sh

COPY application.conf /opt/spark-notebook/conf/
COPY clusters /opt/spark-notebook/conf/
COPY profiles /opt/spark-notebook/conf/

RUN mkdir -p /data/resources

ENV NOTEBOOKS_DIR "/opt/spark-notebook/notebooks"
ENV RESOURCES_DIR "/data/resources"
ENV SPARK_MASTER "spark://spark-master:7077"
ENV SPARK_EXECUTOR_MEMORY "4G"

WORKDIR /opt/spark-notebook/

CMD ["/run.sh"]