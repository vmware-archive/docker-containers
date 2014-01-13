from saltstack/centos-6-minimal
MAINTAINER SaltStack, Inc.

# Install Salt's Test Suite Dependencies
#   Required testing build dependencies
RUN yum install -y --enablerepo=epel gcc
RUN yum install -y --enablerepo=epel python-devel
RUN yum install -y --enablerepo=epel python-setuptools
#   Required testing build dependencies only available trough PyPi
RUN easy_install coverage https://github.com/danielfm/unittest-xml-reporting/archive/master.tar.gz

#   Required Testing Libraries
RUN yum install -y --enablerepo=epel python-virtualenv
RUN yum install -y --enablerepo=epel python-mysqldb
RUN yum install -y --enablerepo=epel ruby

#   Required Testing CLI Binaries
RUN yum install -y --enablerepo=epel git
RUN yum install -y --enablerepo=epel subversion
RUN yum install -y --enablerepo=epel mercurial

#   Required Testing Daemons
RUN yum install -y --enablerepo=epel openssl
RUN yum install -y --enablerepo=epel supervisor
RUN yum install -y --enablerepo=epel rabbitmq-server

#   Requirements only available trough PyPi
# python26-pip is not available
RUN easy_install pip mock timelib apache-libcloud https://github.com/saltstack/salt-testing/archive/develop.tar.gz
