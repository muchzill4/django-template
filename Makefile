.PHONY: bootstrap
bootstrap:
	pip install -r requirements-dev.txt -r requirements.txt
	npm --prefix static/ install
