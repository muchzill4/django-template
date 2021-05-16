#!/bin/bash
set -e

project_name=$1

if [ -z "$project_name" ]; then
  echo "Usage: /bin/bash $(basename $0) project_name"
  exit 1
fi

template=${2-https://github.com/muchzill4/django-template/archive/master.zip}
additional_templates=(.env.example test-and-lint.yml docker-compose.yml)

django-admin startproject \
  --template=$template \
  --name $(IFS=, ; echo "${additional_templates[*]}") \
  $project_name
