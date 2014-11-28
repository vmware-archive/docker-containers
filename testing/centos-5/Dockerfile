from saltstack/centos-5-minimal
MAINTAINER SaltStack, Inc.

# Update Current Image
RUN yum update -y

# Install Salt's Test Suite Dependencies
RUN yum install -y --enablerepo=epel \
  tar \
  which \
  gcc \
  python26-devel \
  python26-setuptools \
  python26-virtualenv \
  python26-mysqldb \
  ruby \
  git \
  subversion \
  mercurial \
  openssl \
  supervisor \
  rabbitmq-server

#   Requirements only available trough PyPi
# python26-pip is not available
RUN easy_install-2.6 \
  pip \
  psutil \
  unittest2 \
  mock \
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
