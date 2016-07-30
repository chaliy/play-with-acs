.PHONY: all

RESOURCE_GROUP=play-with-acs

install:
	npm install azure -g
	azure config mode arm
	npm install yamlxjson -g

install-dcos:
	pip install dcoscli
	dcos config set core.reporting true
	dcos config set core.dcos_url http://localhost:8080/
	dcos config set core.timeout 5

group:
	azure group create -n $(RESOURCE_GROUP) -l "West Europe"

keys:
	ssh-keygen -t rsa -b 4096 -C "ops@linuxvm" -f ops_rsa

template:
	yaml2json template.yml > azuredeploy.json

apply: template
	azure group deployment create -q -f azuredeploy.json -e azuredeploy.parameters.json $(RESOURCE_GROUP) default

show:
	azure group deployment show $(RESOURCE_GROUP)

list:
	azure group deployment list $(RESOURCE_GROUP)

destroy:
	azure group deployment create -m complete -f purge.json $(RESOURCE_GROUP) default

dump:
	azure group export $(RESOURCE_GROUP) dump

ssh:
	ssh -i ops_rsa ops@play-with-acs-master.westeurope.cloudapp.azure.com -A -p 2200

tunel:
	ssh -i ops_rsa ops@play-with-acs-master.westeurope.cloudapp.azure.com -A -p 2200 -L 8080:localhost:80

# Application commands...

apps-play-deploy:
	dcos marathon app remove play
	dcos marathon app add ./apps/play.json
