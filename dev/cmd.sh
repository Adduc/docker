#!/bin/bash
##
# Fig Management Shim
#
# Allows building base images before the container's used by fig.
##

cd "$( dirname "${BASH_SOURCE[0]}" )"
PROJECT="128io-dev"

if [ "$1" == "build" ]; then

  docker build -t "128io/dev-proxy" proxy

elif [ "$1" == "up" ]; then

  if [ -z "$(${BASH_SOURCE[0]} ps | grep Up)" ]; then
    fig -p "$PROJECT" "$@" -d
  else
    echo "Common containers are already up..."
  fi

else
  fig -p "$PROJECT" "$@"
fi
