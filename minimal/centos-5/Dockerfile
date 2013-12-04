from tianon/centos:5.9
MAINTAINER SaltStack, Inc.

# Install EPEL
RUN rpm -Uvh --force http://mirrors.kernel.org/fedora-epel/5/x86_64/epel-release-5-4.noarch.rpm

# Update Current Image
RUN yum update -y

# Install Salt Dependencies
RUN yum -y install --enablerepo=epel python26
RUN yum -y install --enablerepo=epel python26-PyYAML
RUN yum -y install --enablerepo=epel python26-m2crypto
RUN yum -y install --enablerepo=epel python26-crypto
RUN yum -y install --enablerepo=epel python26-msgpack
RUN yum -y install --enablerepo=epel python26-zmq
RUN yum -y install --enablerepo=epel python26-jinja2
