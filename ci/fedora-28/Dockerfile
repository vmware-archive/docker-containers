ARG FROM_IMAGE
ARG BOOTSTRAP_VERSION=2018.3.3

FROM saltstack/au-${FROM_IMAGE}:bs-${BOOTSTRAP_VERSION}
MAINTAINER SaltStack, Inc.

ARG SALT_BRANCH=develop
ARG SALT_JENKINS_BRANCH=master
ARG SALT_STATE=git.minimal

# Clone the Salt-Jenkins repo on $SALT_BRANCH
RUN mkdir -p /srv/salt /srv/pillar && \
      git clone --branch ${SALT_JENKINS_BRANCH} https://github.com/saltstack/salt-jenkins.git /srv/salt && \
      printf "base:\n  '*':\n    - docker-builds" > /srv/pillar/top.sls && \
      printf "py3: false\nextra-swap: false\n" > /srv/pillar/docker-builds.sls && \
      salt-call --local --retcode-passthrough pillar.items && salt-call --local --retcode-passthrough state.apply ${SALT_STATE} && \
      printf "py3: true\nextra-swap: false\n" > /srv/pillar/docker-builds.sls && \
      salt-call --local --retcode-passthrough pillar.items && salt-call --local --retcode-passthrough state.apply ${SALT_STATE}

# Cleanup
RUN rm -rf /tmp/git /tmp/* ~/.cache/pip /var/log/salt/* /srv/salt/* /srv/pillar/* && yum clean all
