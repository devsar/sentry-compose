#!/bin/bash

if [ ! -f secret_key ]
then
  docker run --rm sentry generate-secret-key > secret_key
  echo $'\n'SENTRY_SECRET_KEY="`cat secret_key`" >> .env
fi

while [ ! -f secret_key ]; do
  sleep 1s;
done

docker-compose run sentry-server sentry upgrade

