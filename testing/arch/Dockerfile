from saltstack/arch-minimal
MAINTAINER SaltStack, Inc.

# Update System
RUN pacman -Syyu --noconfirm
RUN pacman -Sy --noconfirm --needed base-devel

#   Required Testing Libraries
RUN pacman -Sy --noconfirm \
  tar \
  which \
  python2-pip \
  python2-mock \
  python2-virtualenv \
  python2-setuptools \
  mysql-python \
  ruby \
  git \
  subversion \
  mercurial \
  openssh \
  subversion

#RUN yaourt -Sy --noconfirm --aur rabbitmq

#   Requirements only available trough PyPi
RUN easy_install-2.7 \
  timelib \
  apache-libcloud \
  coverage \
  psutil \
  https://github.com/saltstack/salt-testing/archive/develop.tar.gz \
  https://github.com/danielfm/unittest-xml-reporting/archive/master.tar.gz
