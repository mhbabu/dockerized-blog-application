#!/bin/sh

get_git_branch() {
  # shellcheck disable=SC2005
  echo "$(git symbolic-ref --short -q HEAD 2>/dev/null)"
}

# USE ON PRODUCTION
run_on_production() {
  git fetch origin
  reset="sudo git reset --hard origin/"
  reset_branch="$reset$1"
  eval "${reset_branch}"

  . ./bin/parse_env.sh
  ./bin/dcup.sh prod -d

  ./bin/composer.sh install --no-interaction --ignore-platform-reqs
  ./bin/pre_deployment_script_for_all_branch.sh
}

# USE ON LOCAL
run_on_local() {
  . ./bin/parse_env.sh
  ./bin/dcup.sh local -d
}

# USE ON DEVELOPMENT
run_on_development() {
  git fetch origin
  reset="sudo git reset --hard origin/"
  reset_branch="$reset$1"
  eval "${reset_branch}"

  . ./bin/parse_env.sh
  ./bin/dcup.sh dev -d

  ./bin/composer.sh install --no-interaction --ignore-platform-reqs
  ./bin/pre_deployment_script_for_all_branch.sh
  ./bin/revision.sh
}

# USE ON STAGE
run_on_stage() {
  git fetch origin
  reset="sudo git reset --hard origin/"
  reset_branch="$reset$1"
  eval "${reset_branch}"

  . ./bin/parse_env.sh
  ./bin/dcup.sh stage -d

  ./bin/composer.sh install --no-interaction --ignore-platform-reqs
  ./bin/pre_deployment_script_for_master.sh
  ./bin/revision.sh
}

branch=$1
if [ -z "${branch}" ]; then
  branch="$(get_git_branch)"
fi

if [ "${branch}" = "main" ]; then
  run_on_production "${branch}"
elif [ "${branch}" = "development" ]; then
  run_on_development "${branch}"
elif [ "${branch}" = "local" ]; then
  run_on_local
fi
