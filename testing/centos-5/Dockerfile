from saltstack/centos-5-minimal
MAINTAINER SaltStack, Inc.

# Install Salt's Test Suite Dependencies
#   Required testing build dependencies
RUN yum install -y --enablerepo=epel gcc
RUN yum install -y --enablerepo=epel python26-devel
RUN yum install -y --enablerepo=epel python26-setuptools

#   Required Testing Libraries
RUN yum install -y --enablerepo=epel python26-virtualenv
RUN yum install -y --enablerepo=epel python26-mysqldb
RUN yum install -y --enablerepo=epel ruby

#   Required Testing CLI Binaries
RUN yum install -y --enablerepo=epel git
RUN yum install -y --enablerepo=epel subversion
RUN yum install -y --enablerepo=epel mercurial

#   Required Testing Daemons
RUN yum install -y --enablerepo=epel supervisor
RUN yum install -y --enablerepo=epel rabbitmq-server

#   Requirements only available trough PyPi
# python26-pip is not available
RUN easy_install-2.6 pip unittest2 mock timelib apache-libcloud
RUN easy_install-2.6 https://github.com/saltstack/salt-testing/archive/develop.tar.gz
