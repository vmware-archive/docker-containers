from saltstack/opensuse-13.2-minimal
MAINTAINER SaltStack, Inc.

# Upgrade System and Install dependencies
RUN zypper --gpg-auto-import-keys --non-interactive refresh && \
  zypper --gpg-auto-import-keys --non-interactive update && \
  zypper --non-interactive install --auto-agree-with-licenses  curl

# Install Latest Salt from the Develop Branch
RUN curl -L https://bootstrap.saltstack.com | sh -s -- -X git develop
