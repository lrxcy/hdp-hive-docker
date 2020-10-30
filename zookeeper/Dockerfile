FROM openjdk:8-alpine

MAINTAINER Lrxcywq <lrxcywq@outlook.com>

RUN apt-get update && apt-get install -y vim wget \
    && apk add --update bash && rm -rf /var/cache/apk/* \
    && cd /usr/local/apache-zookeeper/ \
    && wget http://archive.apache.org/dist/zookeeper/zookeeper-3.5.2-alpha/zookeeper-3.5.2-alpha.tar.gz

ADD zoo.cfg /config/
ADD zoo_replicated1.cfg.dynamic /config/  

RUN tar -zxf zookeeper-3.5.2-alpha.tar.gz \
    && ln -s /usr/local/apache-zookeeper/zookeeper-3.5.2-alpha /usr/local/apache-zookeeper/current \
    && ln -s /usr/local/apache-zookeeper/zookeeper-3.5.2-alpha /app \
    && ln -s /usr/local/apache-zookeeper/zookeeper-3.5.2-alpha/conf /config \
    && rm -f /tmp/zookeeper-3.5.2-alpha.tar.gz

COPY zk-config /app/bin
COPY startup /

RUN chmod +x /startup && chmod +x /app/bin/zk-config

CMD ["/startup"]