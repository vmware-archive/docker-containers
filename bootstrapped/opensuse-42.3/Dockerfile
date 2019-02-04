ARG FROM_IMAGE
FROM ${FROM_IMAGE}
MAINTAINER SaltStack, Inc.

ARG BOOTSTRAP_VERSION=2018.3.3

# Update Current Image and install Curl
RUN zypper --non-interactive refresh && \
      zypper --gpg-auto-import-keys --non-interactive update && \
      zypper --non-interactive install --auto-agree-with-licenses curl python-setuptools python3-setuptools

# Install Salt
RUN curl -L https://bootstrap.saltstack.com | sh -s -- -qXU git v${BOOTSTRAP_VERSION}

# Cleanup
RUN rm -rf /tmp/git /tmp/* ~/.cache/pip && zypper clean -a
