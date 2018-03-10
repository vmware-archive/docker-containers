from centos:7
MAINTAINER SaltStack, Inc.

# Install EPEL
RUN rpm -Uvh --force http://mirrors.kernel.org/fedora-epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm

# Update Current Image
RUN yum install -y libcom_err && yum update -y

# Install Salt Dependencies
RUN yum -y install --enablerepo=epel \
  python \
  PyYAML \
  m2crypto \
  python-crypto \
  python-msgpack \
  python-zmq \
  python-setuptools \

RUN easy_install \
  jinja2 \
  requests
