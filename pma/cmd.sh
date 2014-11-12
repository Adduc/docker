#!/bin/bash
##
# Fig Management Shim
#
# Allows building base images before the container's used by fig.
##

cd "$( dirname "${BASH_SOURCE[0]}" )"
PROJECT="128io-pma"

if [ "$1" == "build" ]; then

  docker build -t "128io/pma-php56" php56

elif [ "$1" == "up" ]; then

  if [ -z "$(${BASH_SOURCE[0]} ps | grep Up)" ]; then
    fig -p "$PROJECT" "$@" -d
  else
    echo "PMA container is already up..."
  fi

else
  fig -p "$PROJECT" "$@"
fi
