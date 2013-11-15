from stackbrew/ubuntu:saucy
MAINTAINER SaltStack, Inc.

# Keep upstart from complaining
# RUN dpkg-divert --local --rename --add /sbin/initctl
# RUN ln -s /bin/true /sbin/initctl

RUN echo "deb http://archive.ubuntu.com/ubuntu saucy main universe multiverse restricted" > /etc/apt/sources.list && \
  apt-get update && \
  apt-get upgrade && apt-get install -y -o DPkg::Options::=--force-confold apt-utils && \
  apt-get install -y -o DPkg::Options::=--force-confold python-software-properties \
     software-properties-common && apt-add-repository ppa:saltstack/salt && apt-get update && \
  apt-get install -y -o DPkg::Options::=--force-confold supervisor rabbitmq-server \
     ruby python git-core subversion mercurial git-core \
     python-yaml python-m2crypto python-crypto \
     msgpack-python python-zmq python-jinja2 python-setuptools python-virtualenv python-dev && \
  apt-get upgrade

RUN easy_install mock timelib https://github.com/saltstack/salt-testing/archive/develop.tar.gz
