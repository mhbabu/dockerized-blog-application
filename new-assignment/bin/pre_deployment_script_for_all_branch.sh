#!/usr/bin/env bash
. ./bin/parse_env.sh

# shellcheck disable=SC2124
script="docker exec ${CONTAINER_NAME} bash -c "
script+='"php artisan clear-compiled && php artisan config:clear"'

eval "${script}"
