#!/bin/bash

set -e

TASK='build'
PARAM=${1}

usage() {
  cat <<EOF
Usage: ${0} [TASK] OR [OPTION]

  TASK
    analyze         Analyzes the code
    build           Builds a package
    clean           Removes any packages
    compile         Compiles a package
    package         Makes a package
    rebuild         Rebuilds a package
    release         Releases a new package
    test            Tests the project

  OPTION
    --help, -h      Shows this help
EOF
}

run() {
  if bundle check > /dev/null; then
    bundle clean
  else
    bundle install --standalone
  fi

  bundle exec rake build:${TASK}

  exit 0
}

error() {
  ERROR_MESSAGE=${1}

  echo
  echo -e "\033[0;31m${ERROR_MESSAGE}\033[0m"

  fail
}

fail() {
  BACKGROUND_RED='\033[1;41m'
  BACKGROUND_TRANSPARENT='\033[0m'

  echo
  echo -e "${BACKGROUND_RED}                                                       ${BACKGROUND_TRANSPARENT}"
  echo -e "${BACKGROUND_RED}                    The task failed                    ${BACKGROUND_TRANSPARENT}"
  echo -e "${BACKGROUND_RED}                                                       ${BACKGROUND_TRANSPARENT}"

  exit 1
}

[ "${PARAM}" = '' ] && run

case ${PARAM} in
  analyze|build|clean|compile|package|rebuild|release|test) TASK=${PARAM}; run ;;
  -h|--help) usage ;;
  *) usage; error 'Unknown task or option' ;;
esac
