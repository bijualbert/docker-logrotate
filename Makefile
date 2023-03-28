IMAGE = honestbee/logrotate
TAG = local

CRON_SCHEDULE ?= * * * * *

build:
	docker build -t $(IMAGE):$(TAG) .

run: build
	docker run -it --name logrotate --rm --env CRON_SCHEDULE='$(CRON_SCHEDULE)' $(IMAGE):$(TAG)

sh: build
	docker run -it --name logrotate --rm $(IMAGE):$(TAG) sh
