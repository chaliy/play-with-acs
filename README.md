# Memory

## Provision infrastructure

```
make install
azure login
# create keys: ssh-keygen -t rsa -b 4096 -C "ops@linuxvm" -f ops_rsa
# create azuredeploy.parameters.json with ssh_public_key parameter
make group
make apply
```

## Use

```
make tunel # Start tunel using basteon, maps mesos to 8080
```

http://localhost:8080/mesos/ - Mesos
http://localhost:8080/ - Dashboard
http://localhost:8080/marathon/ - Maraphone


# Random

1. Level of granularity to deploy ACS does not allow for example control private/public agent pools
2. Inability to control parameters of Mesos nodes, attributes, etc.
3. Still not sure how to do autoscale, also looks like neither mesos, dcos nor Marathon actually provision resources...
