DOCKER_COMPOSE = docker compose
EXEC_PHP = $(DOCKER_COMPOSE) exec php
EXEC_MYSQL = $(DOCKER_COMPOSE) exec mysql
EXEC_DNS = $(DOCKER_COMPOSE) exec bind9

help:				## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

##
## Project Setup
## ________________________________________________________________
##

build:				## Rebuild containers
	$(DOCKER_COMPOSE) build --force-rm --no-cache

start: 				## Start containers
	$(DOCKER_COMPOSE) up -d  --remove-orphans --force-recreate

stop:				## Stop containers
	$(DOCKER_COMPOSE) down --remove-orphans

restart:			## Restart containers
restart: stop start

bash: 				## Open terminal on
	$(DOCKER_COMPOSE) exec api bash

install:			## Install and start containers
install: .env build start

kill: 				## Remove containers, images and managed volumes
	$(DOCKER_COMPOSE) down --remove-orphans --volumes --rmi local

.PHONY: build start stop restart bash install kill
