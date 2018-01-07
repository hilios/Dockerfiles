FROM openjdk:8-jre-alpine

ARG SCALA_VERSION=2.11
ARG KAFKA_VERSION=0.11.0.0

ENV KAFKA_HOME /etc/kafka
ENV KAFKA_PACKAGE kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

WORKDIR /etc/kafka

RUN apk add --update wget tini bash && \
    wget http://mirror.nbtelecom.com.br/apache/kafka/${KAFKA_VERSION}/${KAFKA_PACKAGE} && \
    tar -xzvf ${KAFKA_PACKAGE} --strip 1 && \
    rm -rf ${KAFKA_PACKAGE} bin/windows

COPY server.properties /etc/kafka/config/server.properties

ENTRYPOINT ["tini", "--", "./bin/kafka-server-start.sh", "config/server.properties"]
