from stackbrew/debian:wheezy
MAINTAINER SaltStack, Inc.

# Keep upstart from complaining
# RUN dpkg-divert --local --rename --add /sbin/initctl
# RUN ln -s /bin/true /sbin/initctl

# Update APT packages
RUN apt-get update && apt-get upgrade -y -o DPkg::Options::=--force-confold

# Install The Salt Debian Repository
RUN apt-get install -y -o DPkg::Options::=--force-confold wget && \
  wget -q -O- "http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key" | apt-key add - && \
  echo "deb http://debian.saltstack.com/debian wheezy-saltstack main" > /etc/apt/sources.list.d/saltstack.list

# Upgrade The System
RUN apt-get update && apt-get upgrade -y -o DPkg::Options::=--force-confold

# Install Salt Dependencies
RUN apt-get install -y -o DPkg::Options::=--force-confold \
  python \
  apt-utils \
  python-software-properties \
  software-properties-common \
  python-yaml \
  python-m2crypto \
  python-crypto \
  msgpack-python \
  python-zmq \
  python-jinja2 \
  python-requests
