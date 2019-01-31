ARG FROM_IMAGE
ARG BOOTSTRAP_VERSION=2018.3.3

FROM saltstack/au-${FROM_IMAGE}:bs-${BOOTSTRAP_VERSION}
MAINTAINER SaltStack, Inc.

ARG SALT_BRANCH=develop
ARG SALT_JENKINS_BRANCH=master
ARG SALT_STATE=git.minimal
ARG PY_VERSION=2

# Clone the Salt-Jenkins repo on $SALT_BRANCH
RUN mkdir -p /srv/salt /srv/pillar && \
      git clone --branch ${SALT_JENKINS_BRANCH} https://github.com/saltstack/salt-jenkins.git /srv/salt && \
      echo -e "base:\n  '*':\n    - docker-builds" > /srv/pillar/top.sls && \
      echo -e "py${PY_VERSION}: true\nextra-swap: false\n" > /srv/pillar/docker-builds.sls

# Apply the salt-jenkins states
RUN salt-call --local pillar.items && salt-call --local state.apply ${SALT_STATE}

# Cleanup
RUN rm -rf /tmp/git /tmp/* ~/.cache/pip /var/log/salt/* /srv/salt/* /srv/pillar/* && apt-get clean
