from saltstack/arch-minimal
MAINTAINER SaltStack, Inc.

# Update System
RUN pacman -Syyu --noconfirm
RUN pacman -Sy --noconfirm --needed base-devel

#   Required Testing Libraries
RUN pacman -Sy --noconfirm python2-pip
RUN pacman -Sy --noconfirm python2-mock
RUN pacman -Sy --noconfirm python2-virtualenv
RUN pacman -Sy --noconfirm python2-setuptools
RUN pacman -Sy --noconfirm mysql-python
RUN pacman -Sy --noconfirm ruby

#   Required Testing CLI Binaries
RUN pacman -Sy --noconfirm gitt
RUN pacman -Sy --noconfirm subversion
RUN pacman -Sy --noconfirm mercurial

#   Required Testing Daemons
RUN pacman -Sy --noconfirm openssh
RUN pacman -Sy --noconfirm subversion
#RUN yaourt -Sy --noconfirm --aur rabbitmq

#   Requirements only available trough PyPi
RUN easy_install-2.7 timelib apache-libcloud coverage \
  https://github.com/saltstack/salt-testing/archive/develop.tar.gz \
  https://github.com/danielfm/unittest-xml-reporting/archive/master.tar.gz
