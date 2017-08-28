all: build up

.PHONY: build
build:
	docker-compose build

.PHONY: up
up:
	docker-compose up -d

.PHONY: rm stop
rm: stop
	docker-compose rm -f

.PHONY: stop
stop:
	docker-compose stop

.PHONY: acceptance-watch
acceptance-watch:
	docker-compose run web npm run test:acceptance:watch

.PHONY: acceptance
acceptance:
	docker-compose run web npm run test:acceptance

.PHONY: unit
unit:
	docker-compose run web npm run test:unit

.PHONY: unit-watch
unit-watch:
	docker-compose run web npm run test:unit:watch

.PHONY: test
test:
	docker-compose run web npm test

.PHONY: attach
attach:
	docker-compose run web bash

.PHONY: docs
docs:
	docker-compose run web npm run docs

.PHONY: logs
logs:
	docker-compose logs --follow

.PHONY: logs
logs-acceptance:
	tail -f acceptance.log