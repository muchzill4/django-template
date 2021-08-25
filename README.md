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
  - [Vite](https://vitejs.dev/) + [django-vite](https://github.com/MrBin99/django-vite)
  - [modern-css-reset](https://www.npmjs.com/package/modern-css-reset)
- [Sentry](http://sentry.io)
- [GitHub Actions](https://docs.github.com/en/actions/learn-github-actions)

## Starting a new project

1. **Init django project using this repo as a template**

   ```sh
   curl -fsSL https://raw.githubusercontent.com/muchzill4/django-template/master/startproject | bash -s -- project_name
   ```

1. **Boostrap newly initialised project**

   Use [virtual environment](https://docs.python.org/3/tutorial/venv.html) to avoid polluting your global python installation.

   ```sh
   bin/boostrap
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
| bin/bootstrap    | runs initial setup of the project                        |
| bin/run-services | brings up Docker stack (out of the box, only PostgreSQL) |
| bin/run-app      | runs Django server                                       |
| bin/watch-assets | watches static files for change and recompiles           |
| bin/build-assets | performs production compile and collect of assets        |

## Common issues

### Installing `psycopg2` fails when running `bin/boostrap`

The `psycopg2` package requires certain dependencies to be installed on the host machine to build.

On MacOS, if you use `homebrew`, the solution is as follows:

```
brew install postgresql openssl
env LDFLAGS="-I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib" bin/bootstrap
```

### Running `pytest` complains about missing manifest entries for static assets

Whitenoise performs additional manifest checks when `DEBUG` is set to `False`. In development, you're probably going to use `DEBUG=True`, however `pytest-django` [forces the flag to be `False`](https://pytest-django.readthedocs.io/en/latest/usage.html#django-debug-mode-change-how-debug-is-set) when `pytest` is run.
The easiest solution is to simply `bin/build-assets` prior to the test run. Note, that unless additional static files are added and referenced, this is only required to be run once.
