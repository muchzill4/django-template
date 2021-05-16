#!/bin/bash
set -e

name=$1
dir=$2

if [ -z "$name" ]; then
  echo "Usage: /bin/bash $(basename $0) name [directory]"
  exit 1
fi

additional_templates=(.env.example test-and-lint.yml docker-compose.yml)

django-admin startproject \
  --template=https://github.com/muchzill4/django-template/archive/master.zip \
  --name $(IFS=, ; echo "${additional_templates[*]}") \
  $name ${dir:+$dir}
