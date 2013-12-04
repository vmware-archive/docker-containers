from stackbrew/ubuntu:precise
MAINTAINER SaltStack, Inc.

# Keep upstart from complaining
# RUN dpkg-divert --local --rename --add /sbin/initctl
# RUN ln -s /bin/true /sbin/initctl

# Update Packages Cache
RUN apt-get update

# Enable the necessary sources and upgrade to latest
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe multiverse restricted" > /etc/apt/sources.list && \
  apt-get update && apt-get upgrade -y -o DPkg::Options::=--force-confold

# Add the Salt PPA
RUN apt-get install -y -o DPkg::Options::=--force-confold apt-utils python-software-properties software-properties-common && \
  apt-add-repository ppa:saltstack/salt && apt-get update

# Install Salt Dependencies
RUN apt-get install -y -o DPkg::Options::=--force-confold python
RUN apt-get install -y -o DPkg::Options::=--force-confold python-yaml
RUN apt-get install -y -o DPkg::Options::=--force-confold python-m2crypto
RUN apt-get install -y -o DPkg::Options::=--force-confold python-crypto
RUN apt-get install -y -o DPkg::Options::=--force-confold msgpack-python
RUN apt-get install -y -o DPkg::Options::=--force-confold python-zmq
RUN apt-get install -y -o DPkg::Options::=--force-confold python-jinja2

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
