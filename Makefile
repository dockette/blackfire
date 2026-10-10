DOCKER_IMAGE = dockette/blackfire

.PHONY: build
build:
	docker build -t ${DOCKER_IMAGE} .

.PHONY: test
test:
	docker run --rm ${DOCKER_IMAGE} version
	docker run --rm ${DOCKER_IMAGE} --help

.PHONY: run
run:
	docker run -it --rm ${DOCKER_IMAGE}
