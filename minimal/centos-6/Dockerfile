from tianon/centos:latest
MAINTAINER SaltStack, Inc.

# Install EPEL
RUN rpm -Uvh --force http://mirrors.kernel.org/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm

# Update Current Image
RUN yum install -y libcom_err which
RUN yum update -y

# Install Salt Dependencies
RUN yum -y install --enablerepo=epel python
RUN yum -y install --enablerepo=epel PyYAML
RUN yum -y install --enablerepo=epel m2crypto
RUN yum -y install --enablerepo=epel python-crypto
RUN yum -y install --enablerepo=epel python-msgpack
RUN yum -y install --enablerepo=epel python-zmq
RUN yum -y install --enablerepo=epel python-jinja2
