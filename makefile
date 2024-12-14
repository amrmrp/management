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

hub:
	@docker-compose -f docker-compose-hub.yaml down
	@docker-compose -f docker-compose-hub.yaml up -d --build

openstack:
	@docker-compose -f docker-compose-openstack.yaml down
	@docker-compose -f docker-compose-openstack.yaml up -d

openstaack-supervisor:
	@docker-compose -f docker-compose-openstack.yaml exec openstack-mic supervisorctl restart all

hub-supervisor:
	@docker-compose -f docker-compose-hub.yaml exec whmcs supervisorctl restart all

reset:
	@docker-compose -f docker-compose.tools.yaml stop $(service)
	@docker-compose -f docker-compose.tools.yaml start $(service)
	@echo "Service restarted. Running additional commands..."
