export PYTHONDONTWRITEBYTECODE=1

.PHONY=help

help:  ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

clean:  ## Remove cache files
	@find . -name "*.pyc" | xargs rm -rf
	@find . -name "*.pyo" | xargs rm -rf
	@find . -name "__pycache__" -type d | xargs rm -rf


###
# Dependencies section
###
_base-pip:
	@pip install -U pip poetry wheel

system-dependencies:
	@sudo apt-get update -y && sudo apt-get install -y libpq-dev

dev-dependencies: _base-pip  ## Install development dependencies
	@poetry install

export-requirements: _base-pip
	@poetry export --without-hashes --dev -f requirements.txt > requirements.txt

ci-dependencies:
	@pip install -r requirements.txt

dependencies: _base-pip  ## Install dependencies
	@poetry install --no-dev

outdated:  ## Show outdated packages
	@poetry show --outdated


###
# Tests section
###
test: clean  ## Run tests
	@pytest --asyncio-mode=auto tests/

test-coverage: clean  ## Run tests with coverage output
	@pytest --asyncio-mode=auto tests/ --cov app/ --cov-report term-missing --cov-report xml

test-matching: clean  ## Run tests by match ex: make test-matching k=name_of_test
	@pytest --asyncio-mode=auto -k $(k) tests/

test-security: clean  ## Run security tests with bandit and safety
	@python -m bandit -r app -x "test"
	@python -m safety check


###
# Run local section
###
copy-envs:  ## Copy `.env.example` to `.env`
	@cp -n .env.example .env

init: dev-dependencies copy-envs ## Initialize project

run-local:  ## Run server
	@python -m app


###
# Lint section
###
_flake8:
	@flake8 --show-source app/

_isort:
	@isort --check-only app/

_black:
	@black --diff --check app/

_isort-fix:
	@isort app/ tests/

_black-fix:
	@black app/ tests/

_dead-fixtures:
	@pytest app/ --dead-fixtures

_mypy:
	@mypy app/

lint: _flake8 _isort _black _dead-fixtures  ## Check code lint
format-code: _isort-fix _black-fix  ## Format code
