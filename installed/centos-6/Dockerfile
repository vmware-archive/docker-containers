from saltstack/centos-6-minimal
MAINTAINER SaltStack, Inc.

# Install Dependencies
RUN yum install -y --enablerepo=epel python-setuptools

# Install Salt
RUN easy_install-2.6 https://github.com/saltstack/salt/archive/develop.tar.gz
