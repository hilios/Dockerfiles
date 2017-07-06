FROM alpine:3.6

RUN apk --update add  wget tar &&\
    mkdir -p /opt/jre &&\
    wget --no-check-certificate --no-cookies \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        -O /opt/oracle-jre-8.tar.gz \
        http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jre-8u131-linux-x64.tar.gz &&\
        tar -xzf /opt/oracle-jre-8.tar.gz -C /opt &&\
    mv /opt/jre1.8.0_131 /opt/jre &&\
    rm -rf /opt/oracle-jre-8.tar.gz

ENV JAVA_HOME /opt/jre
ENV PATH ${PATH}:/opt/jre/bin
