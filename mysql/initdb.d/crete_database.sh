#!/bin/bash -eu

mysql=( mysql --protocol=socket -uroot -p"${MYSQL_ROOT_PASSWORD}" )

"${mysql[@]}" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS '${MYSQL_DATABASE}';
    GRANT ALL ON c4u_development.* TO '${MYSQL_USER}'@'%' ;
EOSQL
