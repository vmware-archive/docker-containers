TAG               =
REPO              =
SALT_BRANCH       = develop
REPOBASE          = $(shell basename $(shell dirname `pwd`))
CONTAINER_NAME    = $(shell basename `pwd`)
RM                = true
RM_ARG            =
NO_CACHE          = false
NO_CACHE_ARG      =
DOCKER_PULL_ARG   =
BOOTSTRAP_VERSION = 2018.3.3
DISTRO_NAME       = $(shell echo $(CONTAINER_NAME) | cut -d - -f 1 )
DISTRO_VERSION    = $(shell echo $(CONTAINER_NAME) | cut -d - -f 2 )
FROM_IMAGE        = $(DISTRO_NAME):$(DISTRO_VERSION)
DOCKER_BUILD_ARGS =

ifeq ($(shell [ "$(RM)" = "true" ] && echo 1 || echo 0), 1)
	RM_ARG=--rm
endif

ifeq ($(shell [ "$(NO_CACHE)" = "true" ] && echo 1 || echo 0), 1)
	NO_CACHE_ARG=--no-cache
endif

ifeq ($(shell [ "$(NO_CACHE)" = "true" ] && echo 1 || echo 0), 1)
	NO_CACHE_ARG=--no-cache
endif

ifeq ($(shell [ "$(REPOBASE)" = "ci" ] && echo 1 || echo 0), 1)
	REPO=saltstack/au-$(CONTAINER_NAME):ci-$(SALT_BRANCH)
	TAG=saltstack/au-$(CONTAINER_NAME):ci-$(SALT_BRANCH)
	FROM_IMAGE=$(CONTAINER_NAME)
	DOCKER_BUILD_ARGS=--build-arg FROM_IMAGE=$(FROM_IMAGE) --build-arg BOOTSTRAP_VERSION=$(BOOTSTRAP_VERSION) --build-arg SALT_BRANCH=$(SALT_BRANCH)
else ifeq ($(shell [ "$(REPOBASE)" = "bootstrapped" ] && echo 1 || echo 0), 1)
	DOCKER_PULL_ARG=--pull
	REPO=saltstack/au-$(CONTAINER_NAME):bs
	ifeq ($(shell [ "$(DISTRO_NAME)" = "opensuse" ] && echo 1 || echo 0), 1)
		FROM_IMAGE=$(DISTRO_NAME)/leap:$(DISTRO_VERSION)
	endif
	TAG=saltstack/au-$(CONTAINER_NAME):bs-$(BOOTSTRAP_VERSION)
	DOCKER_BUILD_ARGS=--build-arg FROM_IMAGE=$(FROM_IMAGE) \
		--build-arg BOOTSTRAP_VERSION=$(BOOTSTRAP_VERSION)
endif

ifndef REPO
$(error This does not seem like a container root directory)
endif

all: container

help:
	@echo "Run 'make container' to build the $(REPO) container"

container:
	$(info                REPO = $(REPO))
	$(info                 TAG = $(TAG))
	$(info            REPOBASE = $(REPOBASE))
	$(info          FROM_IMAGE = $(FROM_IMAGE))
	$(info      CONTAINER_NAME = $(CONTAINER_NAME))
	$(info         SALT_BRANCH = $(SALT_BRANCH))

	@echo "Building $(REPO) container..."
	@docker build $(NO_CACHE_ARG) $(RM_ARG) $(DOCKER_PULL_ARG) $(DOCKER_BUILD_ARGS) --squash -t $(REPO) -t $(TAG) .
	@echo "Done"

push:
	@echo "Pushing $(TAG) container..."
	@docker push $(TAG)
	@echo "Done"
