#!/usr/bin/env bash
. ./bin/parse_env.sh

docker rmi registry.assignment.xyz/"${CONTAINER_NAME}":latest
docker rmi "${CONTAINER_NAME}":latest
