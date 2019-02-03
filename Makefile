VERSION := $(shell git rev-parse --short HEAD)

kafka:
	docker build --build-arg KAFKA_VERSION=${VERSION} -t hilios/kafka:${VERSION} .

proxy:
	docker build -t hilios/proxy:${VERSION} .

java8:
	docker build -t hilios/java8:${VERSION}
