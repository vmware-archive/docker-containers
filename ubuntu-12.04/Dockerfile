from ubuntu:12.04
MAINTAINER Pedro Algarvio

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe multiverse restricted" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y -o DPkg::Options::=--force-confold

RUN apt-get install -y -o DPkg::Options::=--force-confold supervisor rabbitmq-server ruby python git-core subversion mercurial
RUN apt-get install -y -o DPkg::Options::=--force-confold python-software-properties

RUN add-apt-repository ppa:saltstack/salt

RUN apt-get update

RUN apt-get install -y -o DPkg::Options::=--force-confold git-core python-yaml python-m2crypto python-crypto msgpack-python python-zmq python-jinja2 python-setuptools
RUN easy_install mock

RUN apt-get install -y -o DPkg::Options::=--force-confold python-dev
RUN easy_install timelib

RUN apt-get remove --purge -y python-dev
RUN apt-get autoremove --purge -y

RUN easy_install https://github.com/saltstack/salt-testing/archive/develop.tar.gz

RUN apt-get clean
