from saltstack/opensuse-12.3-minimal
MAINTAINER SaltStack, Inc.

# Install Dependencies
RUN zypper --non-interactive install --auto-agree-with-licenses python-setuptools

# Install Salt
RUN easy_install https://github.com/saltstack/salt/archive/develop.tar.gz
