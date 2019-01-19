FROM openjdk:8-jre-alpine

ARG SCALA_VERSION=2.12
ARG KAFKA_VERSION

ENV KAFKA_HOME /etc/kafka
ENV KAFKA_PACKAGE kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

WORKDIR /etc/kafka

RUN apk add --update wget tini bash \
    && wget http://mirrors.supportex.net/apache/kafka/${KAFKA_VERSION}/${KAFKA_PACKAGE} \
    && tar -xzvf ${KAFKA_PACKAGE} --strip 1 \
    && rm -rf ${KAFKA_PACKAGE} bin/windows

COPY server.properties /etc/kafka/server.properties

WORKDIR /etc/kafka/bin

ENTRYPOINT ["tini", "--", "./kafka-server-start.sh", "/etc/kafka/env/dev.properties"]
