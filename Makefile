TAG?=latest
TAGS_TO_PULL?=latest
LATEST_TAG?=latest
REGISTRY="registry.hub.docker.com"
ORGANIZATION="skimia"
DOCKER_IMAGE_NAME=$(REGISTRY)/$(ORGANIZATION)/che-devfile-registry

.PHONY: pull build test tag push $(TAGS_TO_PULL)

pull: $(TAGS_TO_PULL)

$(TAGS_TO_PULL):
	@docker pull $(DOCKER_IMAGE_NAME):$(@) || echo "$(DOCKER_IMAGE_NAME):$(@) does not exist yet. Will build it."

build: ## Build docker image
	./build.sh --registry $(REGISTRY) --organization $(ORGANIZATION) --tag $(TAG) --offline

test:
	@echo "$(DOCKER_IMAGE_NAME):$(TAG) has no tests."

tag:
	@docker tag $(DOCKER_IMAGE_NAME):$(TAG) $(DOCKER_IMAGE_NAME):$(LATEST_TAG)

push:
	docker push $(DOCKER_IMAGE_NAME)
