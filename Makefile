.PHONY: bootstrap
bootstrap:
	pip install -r requirements-dev.txt
	npm --prefix static install
	docker-compose -f docker/docker-compose.yml up -d
	./manage.py migrate
	./manage.py createcachetable
	docker-compose -f docker/docker-compose.yml stop
	cp .env.example .env

.PHONY: run-app
run-app:
	./manage.py runserver

.PHONY: run-services
run-services:
	docker-compose -f docker/docker-compose.yml up

.PHONY: build-assets
build-assets:
	npm --prefix static run build

.PHONY: watch-assets
watch-assets:
	npm --prefix static run watch
