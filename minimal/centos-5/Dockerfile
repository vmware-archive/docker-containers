from tianon/centos:5.9
MAINTAINER SaltStack, Inc.

# Install EPEL
RUN rpm -Uvh --force http://mirrors.kernel.org/fedora-epel/5/x86_64/epel-release-5-4.noarch.rpm

# Update openssl first, lets see if this works out
RUN yum -y install --enablerepo=epel openssl

# Update Current Image
RUN yum update -y

# Install Salt Dependencies
RUN yum -y install --enablerepo=epel \
  python26 \
  python26-PyYAML \
  python26-m2crypto \
  python26-crypto \
  python26-msgpack \
  python26-zmq \
  python26-jinja2 \
  python26-requests
