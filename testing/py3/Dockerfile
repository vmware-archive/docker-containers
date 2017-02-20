from saltstack/centos-7-minimal
MAINTAINER SaltStack, Inc.

# Install Salt's Test Suite Dependencies
#   Required testing build dependencies
RUN yum install -y --enablerepo=epel \
  tar \
  gcc \
  which \
  python34-devel \
  python34-setuptools \
  python34-virtualenv \
  python34-pip \
  ruby \
  git \
  subversion \
  mercurial \
  openssl \
  supervisor \
  rabbitmq-server \
  openssl-devel

RUN localedef -i en_US -f UTF-8 en_US.UTF-8
#   Requirements only available trough PyPi
# python26-pip is not available
RUN LC_ALL=en_US.UTF-8 pip3 install -U \
  salt \
  timelib \
  apache-libcloud \
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
  salttesting


ADD https://raw.github.com/saltstack/docker-containers/master/scripts/bootstrap-docker.sh /bootstrap-docker.sh

ENTRYPOINT ["/bin/sh", "/bootstrap-docker.sh", \
  "/etc/init.d/supervisord start", \
  "/etc/init.d/rabbitmq-server start"]
