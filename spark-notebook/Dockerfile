FROM lrxcywq/spark-base:3.0.0

MAINTAINER Lrxcy <lrxcywq@gmail.com>

ENV APACHE_SPARK_VERSION 3.0.0
ENV APACHE_HADOOP_VERSION 3.2

WORKDIR /tmp

RUN wget -q $(wget -qO- https://www.apache.org/dyn/closer.lua/spark/spark-${APACHE_SPARK_VERSION}/spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz\?as_json | \
    python -c "import sys, json; content=json.load(sys.stdin); print(content['preferred']+content['path_info'])") && \
    echo "BFE45406C67CC4AE00411AD18CC438F51E7D4B6F14EB61E7BF6B5450897C2E8D3AB020152657C0239F253735C263512FFABF538AC5B9FFFA38B8295736A9C387 *spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" | sha512sum -c - && \
    tar -xzf "spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" -C /opt/spark-notebook --owner root --group root --no-same-owner && \
    rm "spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz"

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