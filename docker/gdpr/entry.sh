#!/bin/sh

#set environment
export PGHOST=$POSTGRES_HOST
export PGPORT=$POSTGRES_PORT
export PGDATABASE=$POSTGRES_DB
export PGUSER=$POSTGRES_USER
export PGPASSWORD=$POSTGRES_PASSWORD

# start cron
echo "Starting cron"
/usr/sbin/crond -f -l 8
