#!/bin/bash
eval $(docker-machine env)
docker-machine scp -r ./ default:~/myapp/
