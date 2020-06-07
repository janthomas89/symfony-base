#!/usr/bin/env bash

cat <<EOT > .env.local
DATABASE_URL=mysql://$MYSQL_USER:$MYSQL_PASSWORD@database:3306/$MYSQL_DATABASE?serverVersion=5.7
EOT

wait-for-it.sh database:3306
