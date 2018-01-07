# Kafka

#### A base image to ease development with Kafka 0.11

This image is inspired by [spotify/kafka](https://hub.docker.com/r/spotify/kafka/) base image, but uses Kafka version 0.11 and a Alpine linux.

It allows a simple way to configure with the official Zookeeper image. Allowing better control and re-use of the ZK to other services as well.

## Building

This image allows to build any Kafka version with the build arguments `KAFKA_VERSION` and `SCALA_VERSION`, the former should be used to tag this image as well.

```bash
$ docker build --build-arg KAFKA_VERSION=0.11.0.2 -t hilios/kafka:0.11.0.2 .
```
