.PHONY: bootstrap
bootstrap:
	test -f .env || cp .env.example .env
	pip install -r requirements-dev.txt
	npm --prefix static install
	docker-compose up -d
	./manage.py migrate
	./manage.py createcachetable
	docker-compose stop
	git status || (git init && git add . && git commit -m "Initial commit")
	pre-commit install

.PHONY: run-app
run-app:
	./manage.py runserver

.PHONY: run-services
run-services:
	docker-compose up

.PHONY: build-assets
build-assets:
	NODE_ENV=production npm --prefix static run build
	./manage.py collectstatic

.PHONY: watch-assets
watch-assets:
	npm --prefix static run watch
