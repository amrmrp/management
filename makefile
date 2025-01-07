#run:  hello
SHELL := /bin/bash
#.PHONY: openstack

all: hub openstack

terminate: tools hub openstack up

supervisor: openstaack-supervisor openstaack-supervisor

up:
	@docker-compose -f docker-compose.tools.up.yaml down
	@docker-compose -f docker-compose.tools.up.yaml up -d

tools:
	@docker-compose -f docker-compose.tools.yaml down
	@docker-compose -f docker-compose.tools.yaml up -d

reset:
	@docker-compose -f docker-compose.tools.yaml stop $(service)
	@docker-compose -f docker-compose.tools.yaml start $(service)
	@echo "Service restarted. Running additional commands..."
