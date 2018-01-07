FROM alpine:3.6

RUN apk --update add wget tar &&\
    mkdir -p /opt/java &&\
    wget --no-check-certificate --no-cookies -O /opt/java.tar.gz \
      --header "Cookie: oraclelicense=accept-securebackup-cookie" \
      http://download.oracle.com/otn-pub/java/jdk/9.0.1+11/jdk-9.0.1_linux-x64_bin.tar.gz \
    tar -xzf /opt/java.tar.gz --strip-components=1 -C /opt &&\
    rm -rf /opt/java.tar.gz

ENV JAVA_HOME /opt/java
ENV PATH ${PATH}:/opt/java/bin
