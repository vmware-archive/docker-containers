REPO           =
REPOBASE       = $(shell basename $(shell dirname `pwd`))
CONTAINER_NAME = $(shell basename `pwd`)
RM             = true
NO_CACHE       = false

ifeq ($(shell [ "$(REPOBASE)" = "testing" ] && echo 1 || echo 0), 1)
	REPO=salttest/$(CONTAINER_NAME)
else ifeq ($(shell [ "$(REPOBASE)" = "installed" ] && echo 1 || echo 0), 1)
	REPO=saltstack/$(CONTAINER_NAME)
else ifeq ($(shell [ "$(REPOBASE)" = "minimal" ] && echo 1 || echo 0), 1)
	REPO=saltstack/$(CONTAINER_NAME)-minimal
endif

ifndef REPO
$(error This does not seem like a container root directory)
endif

all: container

help:
	@echo "Run 'make container' to build the $(REPO) container"

container:
	$(info           REPO = $(REPO))
	$(info       REPOBASE = $(REPOBASE))
	$(info CONTAINER_NAME = $(CONTAINER_NAME))

	@echo "Building $(REPO) container..."
	docker build -no-cache=$(NO_CACHE) -rm=$(RM) -t $(REPO) .
	@echo "Done"

