#run:  hello
SHELL := /bin/bash
#.PHONY: openstack

all: tools hub openstack

up:
	@docker-compose -f docker-compose.tools.up.yaml up -d

tools:
	@docker-compose -f docker-compose.tools.yaml down
	@docker-compose -f docker-compose.tools.yaml up -d

hub:
	@docker-compose -f docker-compose-hub.yaml down
	@docker-compose -f docker-compose-hub.yaml up -d

openstack:
	@docker-compose -f docker-compose-openstack.yaml down
	@docker-compose -f docker-compose-openstack.yaml up -d