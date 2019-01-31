ARG FROM_IMAGE
FROM ${FROM_IMAGE}
MAINTAINER SaltStack, Inc.

ARG BOOTSTRAP_VERSION=2018.3.3

# Update Current Image and install Curl
RUN yum update -y && yum install -y curl

# Install Salt
RUN curl -L https://bootstrap.saltstack.com | sh -s -- -qXU -x python2.7 git v${BOOTSTRAP_VERSION}

# Cleanup
RUN rm -rf /tmp/git /tmp/* ~/.cache/pip && yum clean all
