#!/bin/bash
if [ -f ./docker-compose.yml ]; then
	if [ ! -f ./.env ]; then
		echo "File .env does not exist."
		ansible-vault view ./.key/secret.env > ./.env
	fi
	docker-compose up --build -d
fi