#!/usr/bin/env bash

DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")/.." || exit ; pwd -P )
NUM=$( cat --number ~/.bashrc | grep ATOM_DEV_RESOURCE_PATH | cut -d ' ' -f 4 | cut -d$'\t' -f 1 )
if [[ ${NUM} -eq "" ]]; then
  echo "export ATOM_DEV_RESOURCE_PATH=${DIR}" >> ~/.bashrc
else
  DIR="${DIR//\//\\/}"
  sed -i "${NUM}s/.*/export ATOM_DEV_RESOURCE_PATH=${DIR} /" ~/.bashrc
fi