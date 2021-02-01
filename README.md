# Django template

Simple, extensible [Django](https://www.djangoproject.com) project template.

## Requirements

- Docker
- Python
- Node

## Components

- [Dockerised PostgreSQL](https://hub.docker.com/_/postgres)
- [Pre-commit](https://pre-commit.com) with:
  - [black](https://black.readthedocs.io)
  - [flake8](https://flake8.pycqa.org/)
  - [isort](https://pycqa.github.io/isort/)
  - [mypy](http://mypy.readthedocs.io)
- Static assets pipeline with:
  - [Gulp](http://gulpjs.com)
  - [rollup.js](https://rollupjs.org)
  - [Unpoly](http://unpoly.com)
  - [PostCSS](https://postcss.org)
  - [TailwindCSS](http://tailwindcss.com)
- [Sentry](http://sentry.io)

## Starting new project

1. **Init django project using this repo as a template**

```sh
django-admin startproject --template=https://github.com/muchzill4/django-template/archive/master.zip --name .env,docker-compose.yml project_name
```

1. **Boostrap newly initialised project**

```sh
cd project_name
make boostrap
```

This command will:

- copy sample dotenv settings to `.env`
- install development environment requirements for both python and node
- perform initial database setup
- initialise a git repo and perform initial commit
- setup pre-commit hooks

## Available commands

| command           | wtf                                                      |
| ----------------- | -------------------------------------------------------- |
| make run-services | brings up Docker stack (out of the box, only PostgreSQL) |
| make run-app      | runs Django server                                       |
| make watch-assets | watches static files for change and recompiles           |
| make build-assets | performs production compile and collect of assets        |

For more, look at each of installed components docs.
