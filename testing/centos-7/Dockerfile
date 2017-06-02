from saltstack/centos-7-minimal
MAINTAINER SaltStack, Inc.

# Install Salt's Test Suite Dependencies
#   Required testing build dependencies
RUN yum install -y --enablerepo=epel \
  tar \
  gcc \
  libffi-devel \
  openssl-devel \
  which \
  python-devel \
  python-setuptools \
  python-virtualenv \
  MySQL-python \
  ruby \
  git \
  subversion \
  mercurial \
  openssl \
  supervisor \
  rabbitmq-server

#   Requirements only available trough PyPi
# python26-pip is not available
RUN easy_install pip
RUN pip install --upgrade setuptools
RUN easy_install \
  mock \
  timelib \
  apache-libcloud \
  unittest2 \
  coverage \
  psutil \
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
  "/etc/init.d/supervisord start", \
  "/etc/init.d/rabbitmq-server start"]
