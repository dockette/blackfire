DOCKER_IMAGE = dockette/blackfire
VERSION:=$(shell cat VERSION)

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
	@date -u +%Y.%m.%d > VERSION
	@echo "VERSION: ${VERSION} -> $$(cat VERSION)"
	@echo "next: git commit -am \"Release: $$(cat VERSION)\" && git push"
