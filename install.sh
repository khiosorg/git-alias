#!/usr/bin/env bash

INSTALL_PREFIX=/usr/local/bin

if [[ $1 ]]; then
  INSTALL_PREFIX=${1%/}
fi

if [[ ! -d $INSTALL_PREFIX ]]; then
  mkdir -p "$INSTALL_PREFIX"
fi

cp git-alias git-unalias "$INSTALL_PREFIX"
