.PHONY: bootstrap
bootstrap:
	pip install -r requirements/dev.txt
	docker-compose up -d
	timeout 10 sh -c 'until pg_isready --host=localhost; do sleep 1; done'
	test -f .env || cp .env.example .env
	./manage.py migrate
	./manage.py createcachetable
	docker-compose stop
	npm --prefix static install
	(test -d github && mv github .github) || true
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
