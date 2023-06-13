.DEFAULT_GOAL := list

.PHONY: list
list:
	@echo "Make sure u set specific target dude !!"
	@LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
stop:
	- docker compose -f ./docker/docker-compose.yml down --remove-orphans
start-all-services:
	- export IMAGE_DMSVC=$(IMAGE_DMSVC)
	- docker compose -f ./docker/docker-compose.yml up -d --force-recreate