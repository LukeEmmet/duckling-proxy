.PHONY: clean run build.local build.linux build.docker deploy

BINARY        ?= duckling
SOURCES       = $(shell find . -name '*.go')
VERSION       ?= $(shell git describe --tags --always)
IMAGE         ?= deploy.glv.one/lukee/$(BINARY)
DOCKERFILE    ?= Dockerfile
BUILD_FLAGS   ?= -v
LDFLAGS       ?= -w -s

default: run

clean:
	rm -rf build

run: build.local
	./build/$(BINARY) --serverCert duckling.crt --serverKey duckling.key

build.local: build/$(BINARY)
build.linux: build/linux/$(BINARY)

build/$(BINARY): $(SOURCES)
	CGO_ENABLED=0 go build -o build/$(BINARY) $(BUILD_FLAGS) -ldflags "$(LDFLAGS)" .

build/linux/$(BINARY): $(SOURCES)
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build $(BUILD_FLAGS) -o build/linux/$(BINARY) -ldflags "$(LDFLAGS)" .

build.docker: build.linux
	docker build --rm -t "$(IMAGE):$(VERSION)" -f $(DOCKERFILE) .

deploy: build.docker
	docker push "$(IMAGE):$(VERSION)"
