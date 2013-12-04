from saltstack/ubuntu-12.04-minimal
MAINTAINER SaltStack, Inc.

# Install Testing Dependencies
RUN apt-get install -y -o DPkg::Options::=--force-confold supervisor
RUN apt-get install -y -o DPkg::Options::=--force-confold rabbitmq-server
RUN apt-get install -y -o DPkg::Options::=--force-confold ruby
RUN apt-get install -y -o DPkg::Options::=--force-confold git-core
RUN apt-get install -y -o DPkg::Options::=--force-confold subversion
RUN apt-get install -y -o DPkg::Options::=--force-confold mercurial
RUN apt-get install -y -o DPkg::Options::=--force-confold python-setuptools
RUN apt-get install -y -o DPkg::Options::=--force-confold python-virtualenv
RUN apt-get install -y -o DPkg::Options::=--force-confold python-dev
RUN easy_install mock
RUN easy_install timelib
RUN easy_install https://github.com/saltstack/salt-testing/archive/develop.tar.gz
