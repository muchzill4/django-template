.PHONY: bootstrap
bootstrap:
	pip install -r requirements-dev.txt
	npm install
	docker-compose -f docker/docker-compose.yml up -d
	./manage.py migrate
	./manage.py createcachetable
	docker-compose -f docker/docker-compose.yml stop

.PHONY: run-app
run-app:
	./manage.py runserver

.PHONY: run-services
run-services:
	docker-compose -f docker/docker-compose.yml up
