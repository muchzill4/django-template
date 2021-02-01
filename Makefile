.PHONY: bootstrap
bootstrap:
	pip install -r requirements-dev.txt
	npm --prefix static install
	docker-compose -f docker/docker-compose.yml up -d
	./manage.py migrate
	./manage.py createcachetable
	docker-compose -f docker/docker-compose.yml stop
	cp .env.example .env
	git init
	pre-commit install

.PHONY: run-app
run-app:
	./manage.py runserver

.PHONY: run-services
run-services:
	docker-compose -f docker/docker-compose.yml up

.PHONY: build-assets
build-assets:
	NODE_ENV=production npm --prefix static run build
	./manage.py collectstatic

.PHONY: watch-assets
watch-assets:
	npm --prefix static run watch
