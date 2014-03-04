# Project: elasticSearch
# Author: AooJ <aooj@n13.cz>
# Date: 2014
# usage:
#	make build	- build new image from Dockerfile
#	make debug	- debug run already created image by tag
#	make try	- build and run in debug mode


NAME=aooj/elasticSearch
VERSION=1.1


build:
	docker build -t $(NAME):$(VERSION) .


run:
	docker run -p 9002:9200 -p 9003:9300 -p 22 -t -i $(NAME):$(VERSION)


debug: build
	docker run -p 9200 -p 9300 -p 22 -t -i $(NAME):$(VERSION) /bin/bash


try: build run


.PHONY: build debug run
