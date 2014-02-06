from base/arch
MAINTAINER SaltStack, Inc.

# Update System
RUN pacman -Syyu --noconfirm

#   Required Libraries
RUN pacman -Sy --noconfirm python2-setuptools

#   Requirements only available trough PyPi
RUN easy_install-2.7 \
  pep8 \
  pylint \
  https://github.com/saltstack/salt-testing/archive/develop.tar.gz

ADD run-salt-lint.sh /usr/bin/run-salt-lint.sh

CMD /usr/bin/run-salt-lint.sh
