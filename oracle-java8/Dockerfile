FROM alpine:3.6

RUN apk --update add  wget ca-certificates tar &&\
    mkdir -p /opt/jre &&\
    wget --no-check-certificate --no-cookies -O - \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jre-8u131-linux-x64.tar.gz |\
        tar -C /opt -xzf &&\
    mv /opt/jre1.8.0_131 /opt/jre

ENV JAVA_HOME /opt/jre
ENV PATH ${PATH}:/opt/jre/bin
