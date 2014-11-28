from saltstack/ubuntu-13.10-minimal
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
  supervisor \
  openssh-client \
  rabbitmq-server

RUN easy_install \
  mock \
  psutil \
  timelib \
  apache-libcloud \
  coverage \
  GitPython \
  requests \
  keyring \
  python-gnupg \
  CherryPy \
  tornado \
  boto \
  moto \
  https://github.com/saltstack/salt-testing/archive/develop.tar.gz \
  https://github.com/danielfm/unittest-xml-reporting/archive/master.tar.gz

ADD https://raw.github.com/saltstack/docker-containers/master/scripts/bootstrap-docker.sh /bootstrap-docker.sh

ENTRYPOINT ["/bin/sh", "/bootstrap-docker.sh", \
  "/etc/init.d/supervisor start", \
  "/etc/init.d/rabbitmq-server start"]
