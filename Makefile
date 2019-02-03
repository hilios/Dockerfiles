VERSION := $(shell git rev-parse --short HEAD)

.PHONY: kafka proxy java8

check-version:
	@if [ -z "${VERSION}" ]; then echo "Version is not set"; exit 1; fi

image: check-version
	@if [ -z "${PROJECT}" ]; then echo "Project is not set"; exit 1; fi
	docker build -t hilios/${PROJECT}:${VERSION} ${PROJECT}

proxy: check-version
	docker build -t hilios/proxy:${VERSION} proxy

kafka: check-version
	@if [ -z "${KAFKA_VERSION}" ]; then echo "Kafka version is not set"; exit 1; fi
	docker build --build-arg KAFKA_VERSION=${KAFKA_VERSION} -t hilios/kafka:${VERSION} kafka
