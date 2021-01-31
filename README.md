# Django template

## Usage

    django-admin startproject --template=~/Dev/personal/django-template --name .env,docker-compose.yml project_name

## Boostrapping the app

1.  Install requirements

        make boostrap

1.  Run services

        make run-services

1.  Run migrations

    ./manage.py migrate
    ./manage.py createcachetable
