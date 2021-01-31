.PHONY: bootstrap
bootstrap:
	pip install -r requirements-dev.txt
	npm install

.PHONY: run-app
run-app:
	./manage.py runserver

.PHONY: run-services
run-services:
	docker-compose -f docker/docker-compose.yml up
