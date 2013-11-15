from stackbrew/debian:wheezy
MAINTAINER SaltStack, Inc.

# Keep upstart from complaining
# RUN dpkg-divert --local --rename --add /sbin/initctl
# RUN ln -s /bin/true /sbin/initctl

RUN apt-get update && apt-get install -y -o DPkg::Options::=--force-confold wget && \
  wget -q -O- "http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key" | apt-key add - && \
  echo "deb http://debian.saltstack.com/debian wheezy-saltstack main" > /etc/apt/sources.list.d/saltstack.list && \
  apt-get update && \
  apt-get upgrade -y && apt-get install -y -o DPkg::Options::=--force-confold apt-utils \
     python-software-properties \
     software-properties-common supervisor rabbitmq-server \
     ruby python git-core subversion mercurial git-core \
     python-yaml python-m2crypto python-crypto \
     msgpack-python python-zmq python-jinja2 python-setuptools python-virtualenv python-dev

RUN easy_install mock timelib https://github.com/saltstack/salt-testing/archive/develop.tar.gz
