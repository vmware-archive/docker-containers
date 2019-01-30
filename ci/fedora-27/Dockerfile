ARG FROM_IMAGE
ARG BOOTSTRAP_VERSION=2018.3.3

FROM saltstack/au-${FROM_IMAGE}:bs-${BOOTSTRAP_VERSION}
MAINTAINER SaltStack, Inc.

ARG SALT_BRANCH=develop
ARG SALT_STATE=git.minimal

# Clone the Salt-Jenkins repo on $SALT_BRANCH
RUN mkdir -p /srv/salt && git clone --branch ${SALT_BRANCH} https://github.com/saltstack/salt-jenkins.git /srv/salt

# Apply the salt-jenkins states
RUN salt-call --local state.apply ${SALT_STATE}

# Cleanup
RUN rm -rf /tmp/git /tmp/* ~/.cache/pip /var/log/salt/* /srv/salt/* && yum clean all
