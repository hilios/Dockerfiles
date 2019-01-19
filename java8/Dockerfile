FROM alpine:3.7

ARG JAVA_VERSION=9.0.1
ARG JAVA_UPDATE_VERSION=11

RUN apk --update add wget tar &&\
    mkdir -p /opt/java /usr/sr &&\
    wget --no-check-certificate --no-cookies -O /opt/java.tar.gz \
      --header "Cookie: oraclelicense=accept-securebackup-cookie" \
      http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}+${JAVA_UPDATE_VERSION}/jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz &&\
    tar -xzf /opt/java.tar.gz --strip 1 -C /opt/java &&\
    rm -rf /opt/java.tar.gz

ENV JAVA_HOME /opt/java
ENV PATH ${PATH}:/opt/java/bin
