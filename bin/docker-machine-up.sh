#!/bin/bash
eval $(docker-machine env)
docker-machine up default
