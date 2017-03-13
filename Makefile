IMAGE='dseg/node7-python2-pip-yarn-alpine35'
VERSION='1.0.4'

default: run

run: build

publish:
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):latest	

build: Dockerfile
	docker build -t $(IMAGE):$(VERSION) .
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest
