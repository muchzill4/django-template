#!/bin/bash
set -e

name=$1
dir=$2

if [ -z "$name" ]; then
  echo "Usage: /bin/bash $(basename $0) name [directory]"
  exit 1
fi

template=${3-https://github.com/muchzill4/django-template/archive/master.zip}
additional_templates=(.env.example test-and-lint.yml docker-compose.yml)

django-admin startproject \
  --template=$template \
  --name $(IFS=, ; echo "${additional_templates[*]}") \
  $name ${dir:+$dir}
