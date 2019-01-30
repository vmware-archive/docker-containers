FROM debian:9
MAINTAINER SaltStack, Inc.

ARG BOOTSTRAP_VERSION=2018.3.3

# Update Current Image and install Curl
RUN apt-get update && apt-get upgrade -y && apt-get install -y curl

# Install Salt
RUN curl -L https://bootstrap.saltstack.com | sh -s -- -qXU git v${BOOTSTRAP_VERSION}

# Cleanup
RUN rm -rf /tmp/git /tmp/* ~/.cache/pip /var/lib/apt/lists/* && apt-get clean
