from stackbrew/ubuntu:quantal
MAINTAINER SaltStack, Inc.

# Keep upstart from complaining
# RUN dpkg-divert --local --rename --add /sbin/initctl
# RUN ln -s /bin/true /sbin/initctl

# Enable the necessary sources and upgrade to latest
RUN echo "deb http://old-releases.ubuntu.com/ubuntu quantal main universe multiverse restricted" > /etc/apt/sources.list && \
  apt-get update && \
  apt-get upgrade -y -o DPkg::Options::=--force-confold

# Add the Salt PPA
RUN apt-get install -y -o DPkg::Options::=--force-confold \
  apt-utils \
  python-software-properties \
  software-properties-common && \
  apt-add-repository -y ppa:saltstack/salt && \
  apt-get update

# Install Salt Dependencies
RUN apt-get install -y -o DPkg::Options::=--force-confold \
  python \
  python-yaml \
  python-m2crypto \
  python-crypto \
  msgpack-python \
  python-zmq \
  python-jinja2 \
  python-requests
