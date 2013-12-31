from saltstack/centos-5-minimal
MAINTAINER SaltStack, Inc.

# Install Salt's Test Suite Dependencies
RUN yum install -y --enablerepo=epel python26-devel
RUN yum install -y --enablerepo=epel python26-setuptools
RUN yum install -y --enablerepo=epel python26-virtualenv
RUN yum install -y --enablerepo=epel supervisor
RUN yum install -y --enablerepo=epel rabbitmq-server
RUN yum install -y --enablerepo=epel git
RUN yum install -y --enablerepo=epel subversion
RUN yum install -y --enablerepo=epel mercurial
RUN yum install -y --enablerepo=epel gcc
RUN easy_install-2.6 unittest2 mock timelib apache-libcloud
RUN easy_install-2.6 https://github.com/saltstack/salt-testing/archive/develop.tar.gz
