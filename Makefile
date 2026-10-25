DOCKER_IMAGE = dockette/blackfire
include VERSION

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

.PHONY: version
version:
	@echo ${VERSION}

.PHONY: release
release:
	@sed -i.bak "s/^VERSION=.*/VERSION=$$(date -u +%Y.%m.%d)/" VERSION && rm VERSION.bak
	@cat VERSION
