from tianon/centos:latest
MAINTAINER SaltStack, Inc.

# Install EPEL
RUN rpm -Uvh --force http://mirrors.kernel.org/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm

# Update Current Image
RUN yum install -y libcom_err
RUN yum update -y

# Install Salt Dependencies
RUN yum -y install --enablerepo=epel python
RUN yum -y install --enablerepo=epel python-PyYAML
RUN yum -y install --enablerepo=epel python-m2crypto
RUN yum -y install --enablerepo=epel python-crypto
RUN yum -y install --enablerepo=epel python-msgpack
RUN yum -y install --enablerepo=epel python-zmq
RUN yum -y install --enablerepo=epel python-jinja2

# Install Salt's Test Suite Dependencies
RUN yum install -y python-devel python-setuptools python-virtualenv supervisor \
  rabbitmq-server git subversion mercurial gcc \
  --enablerepo=epel
RUN easy_install unittest2 mock timelib \
  https://github.com/saltstack/salt-testing/archive/develop.tar.gz
