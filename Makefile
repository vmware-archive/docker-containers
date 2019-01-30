TAG               =
REPO              =
SALT_BRANCH       = develop
REPOBASE          = $(shell basename $(shell dirname `pwd`))
CONTAINER_NAME    = $(shell basename `pwd`)
RM                = true
RM_ARG            =
NO_CACHE          = false
NO_CACHE_ARG      =
BOOTSTRAP_VERSION = 2018.3.3

ifeq ($(shell [ "$(RM)" = "true" ] && echo 1 || echo 0), 1)
	RM_ARG=--rm
endif

ifeq ($(shell [ "$(NO_CACHE)" = "true" ] && echo 1 || echo 0), 1)
	NO_CACHE_ARG=--no-cache
endif

ifeq ($(shell [ "$(REPOBASE)" = "ci" ] && echo 1 || echo 0), 1)
	REPO=saltstack/au-$(CONTAINER_NAME):ci-$(SALT_BRANCH)
	TAG=saltstack/au-$(CONTAINER_NAME):ci-$(SALT_BRANCH)
else ifeq ($(shell [ "$(REPOBASE)" = "bootstrapped" ] && echo 1 || echo 0), 1)
	REPO=saltstack/au-$(CONTAINER_NAME):bs
	TAG=saltstack/au-$(CONTAINER_NAME):bs-$(BOOTSTRAP_VERSION)
endif

ifndef REPO
$(error This does not seem like a container root directory)
endif

all: container

help:
	@echo "Run 'make container' to build the $(REPO) container"

container:
	$(info           REPO = $(REPO))
	$(info            TAG = $(TAG))
	$(info       REPOBASE = $(REPOBASE))
	$(info CONTAINER_NAME = $(CONTAINER_NAME))

	@echo "Building $(REPO) container..."
	@docker build $(NO_CACHE_ARG) $(RM_ARG) \
		--build-arg FROM_IMAGE=$(CONTAINER_NAME) \
		--build-arg BOOTSTRAP_VERSION=$(BOOTSTRAP_VERSION) \
		--build-arg SALT_BRANCH=$(SALT_BRANCH) \
		-t $(REPO) -t $(TAG) .
	@echo "Done"

