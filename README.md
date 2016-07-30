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
