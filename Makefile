DOCKER_IMAGE = dockette/blackfire

.PHONY: build
build:
	docker build -t ${DOCKER_IMAGE} .

.PHONY: run
run:
	docker run -it --rm ${DOCKER_IMAGE}
