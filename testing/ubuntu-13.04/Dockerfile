from saltstack/ubuntu-13.04-minimal
MAINTAINER SaltStack, Inc.

# Update System
RUN apt-get update && apt-get upgrade -y -o DPkg::Options::=--force-confold

# Install Testing Dependencies
RUN apt-get install -y -o DPkg::Options::=--force-confold \
  python-dev \
  python-pip \
  python-mysqldb \
  python-setuptools \
  python-virtualenv \
  ruby \
  git-core \
  mercurial \
  supervidor \
  openssh-client \
  rabbitmq-server

RUN easy_install \
  mock \
  psutil \
  timelib \
  apache-libcloud \
  coverage \
  https://github.com/saltstack/salt-testing/archive/develop.tar.gz \
  https://github.com/danielfm/unittest-xml-reporting/archive/master.tar.gz
