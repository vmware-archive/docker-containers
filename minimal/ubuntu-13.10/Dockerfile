from stackbrew/ubuntu:saucy
MAINTAINER SaltStack, Inc.

# Keep upstart from complaining
# RUN dpkg-divert --local --rename --add /sbin/initctl
# RUN ln -s /bin/true /sbin/initctl

# Update Packages Cache
RUN apt-get update

# Enable the necessary sources and upgrade to latest
RUN echo "deb http://archive.ubuntu.com/ubuntu saucy main universe multiverse restricted" > /etc/apt/sources.list && \
  apt-get update && apt-get upgrade -y -o DPkg::Options::=--force-confold

# Add the Salt PPA
RUN apt-get install -y -o DPkg::Options::=--force-confold apt-utils python-software-properties software-properties-common && \
  apt-add-repository -y ppa:saltstack/salt && apt-get update

# Install Salt Dependencies
RUN apt-get install -y -o DPkg::Options::=--force-confold python
RUN apt-get install -y -o DPkg::Options::=--force-confold python-yaml
RUN apt-get install -y -o DPkg::Options::=--force-confold python-m2crypto
RUN apt-get install -y -o DPkg::Options::=--force-confold python-crypto
RUN apt-get install -y -o DPkg::Options::=--force-confold msgpack-python
RUN apt-get install -y -o DPkg::Options::=--force-confold python-zmq
RUN apt-get install -y -o DPkg::Options::=--force-confold python-jinja2
