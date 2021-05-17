.PHONY: bootstrap
bootstrap:
	! test -f startproject.sh || rm startproject.sh
	test -d .github || mv github .github
	test -f .env || cp .env.example .env
	git rev-parse --is-inside-work-tree > /dev/null 2>&1 ||\
		(git init && git add . && git commit -m "Initial commit")
	pip install -r requirements/dev.txt
	docker-compose up -d
	timeout 10 sh -c 'until pg_isready --host=localhost; do sleep 1; done'
	./manage.py migrate
	./manage.py createcachetable
	docker-compose stop
	npm install
	make build-assets
	! command -v pre-commit > /dev/null 2>&1 || pre-commit install

.PHONY: run-app
run-app:
	./manage.py runserver

.PHONY: run-services
run-services:
	docker-compose up

.PHONY: build-assets
build-assets:
	npm run build
	./manage.py collectstatic

.PHONY: watch-assets
watch-assets:
	npm run watch
