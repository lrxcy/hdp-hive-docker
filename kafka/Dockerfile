FROM openjdk:8-alpine

MAINTAINER lrxcywq <lrxcywq@outlook.com>

ENV SCALA_VERSION=2.12
ENV KAFKA_VERSION=2.6.0

RUN apk add --update bash python3 && rm -rf /var/cache/apk/*
RUN makdir -p /usr/local/apache-kafka/ && cd /usr/local/apache-kafka/ \
    && wget -c http://archive.apache.org/dist/kafka/$KAFKA_VERSION/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
    && tar -zxf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz \
    && ln -s /usr/local/apache-kafka/kafka_${SCALA_VERSION}-${KAFKA_VERSION} /usr/local/apache-kafka/current \
    && rm -rf /usr/local/apache-kafka/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

COPY wait-for-step.sh /
COPY execute-step.sh /
COPY finish-step.sh /

RUN ln -s /usr/local/apache-kafka/kafka_${SCALA_VERSION}-${KAFKA_VERSION} /app
RUN ln -s /usr/local/apache-kafka/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/config /config

ADD kafka-bin.py /app/bin/
ADD kafka-init /app/bin/

RUN chmod +x -R /app/bin/

CMD ["/app/bin/kafka-init"]
