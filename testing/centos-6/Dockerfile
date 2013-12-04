from saltstack/centos-6-minimal
MAINTAINER SaltStack, Inc.

# Install Salt's Test Suite Dependencies
RUN yum install -y --enablerepo=epel python-devel
RUN yum install -y --enablerepo=epel python-setuptools
RUN yum install -y --enablerepo=epel python-virtualenv
RUN yum install -y --enablerepo=epel supervisor
RUN yum install -y --enablerepo=epel rabbitmq-server
RUN yum install -y --enablerepo=epel git
RUN yum install -y --enablerepo=epel subversion
RUN yum install -y --enablerepo=epel mercurial
RUN yum install -y --enablerepo=epel gcc
RUN easy_install unittest2
RUN easy_install mock
RUN easy_install timelib
RUN easy_install https://github.com/saltstack/salt-testing/archive/develop.tar.gz
