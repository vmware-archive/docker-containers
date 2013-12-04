from saltstack/ubuntu-12.04-minimal
MAINTAINER SaltStack, Inc.

# Install Dependencies
RUN apt-get install -y -o DPkg::Options::=--force-confold python-setuptools

# Install Salt
RUN easy_install https://github.com/saltstack/salt/archive/develop.tar.gz
