TAG?=latest
TAGS_TO_PULL?=latest
LATEST_TAG?=latest
DOCKER_IMAGE_NAME=skimia/$(IMAGE_NAME)

pull: $(TAGS_TO_PULL)

$(TAGS_TO_PULL):
	@docker pull $(DOCKER_IMAGE_NAME):$(@) || echo "$(DOCKER_IMAGE_NAME):$(@) does not exist yet. Will build it."

build: ## Build docker image
	@docker build --rm -t $(DOCKER_IMAGE_NAME):$(TAG) .

test:
	@echo "$(DOCKER_IMAGE_NAME):$(TAG) has no tests."

tag:
	@docker tag $(DOCKER_IMAGE_NAME):$(TAG) $(DOCKER_IMAGE_NAME):$(LATEST_TAG)

push:
	docker push $(DOCKER_IMAGE_NAME)
