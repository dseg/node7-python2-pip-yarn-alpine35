IMAGE='dseg/node7-python2-pip-yarn-alpine35'
VERSION='1.0.16'

default: run

run: build

publish:
	m4 README.m4 > README.md4
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):latest	

build: Dockerfile
	docker build -t $(IMAGE):$(VERSION) .
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest
