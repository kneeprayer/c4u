#!/bin/bash
docker-compose down
docker volume rm $(docker volume ls -q -f dangling=true)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
