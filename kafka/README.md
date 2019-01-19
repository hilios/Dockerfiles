# Kafka

#### A Kafka docker image to development

This image is inspired by [spotify/kafka](https://hub.docker.com/r/spotify/kafka/) base image, but with newer versions of Kafka  and a Alpine linux.

It allows a simple way to configure with the official Zookeeper image. Allowing better control and re-use of the ZK to other services as well.

## Building

This image allows to build any Kafka version with the build arguments `KAFKA_VERSION` and `SCALA_VERSION`, the former should be used to tag this image as well.

```shell
$ docker build --build-arg KAFKA_VERSION=${VERSION} -t hilios/kafka:${VERSION} .
```

## Development

Bootstrap the Kafka + Zookeeper environment with docker compose.

```yaml
version: '3.1'
services:
  zk1:
    image: zookeeper
    hostname: zk
    ports:
      - 2181:2181
    environment:
      - ZOO_MY_ID=1
      - ZOO_SERVERS=server.1:zk:2888:3888
  kafka:
    image: hilios/kafka:2.1.0
    ports:
      - 9092:9092
    links:
      - zk2
    command:
      - --override
      - advertised.listeners=PLAINTEXT://localhost:9092
      - --override
      - zookeeper.connect=zk:2181
```

## Production

For production environment it is recommended to override the `server.properties` and add more memory

```shell
docker run -V prod.properties:/etc/kafka/server.properties -e JAVA_OPTS="-Xmx8g -Xms8g -XX:MetaspaceSize=96m -XX:+UseG1GC -XX:MaxGCPauseMillis=20 -XX:InitiatingHeapOccupancyPercent=35 -XX:G1HeapRegionSize=16M -XX:MinMetaspaceFreeRatio=50 -XX:MaxMetaspaceFreeRatio=80" hilios/kafka:2.1.0
```
