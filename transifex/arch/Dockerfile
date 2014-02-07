from base/arch
MAINTAINER SaltStack, Inc.

# Update System
RUN pacman -Syyu --noconfirm

#   Required Libraries
RUN pacman -Sy --noconfirm \
  gcc \
  make \
  python2-setuptools

#   Requirements only available trough PyPi
RUN easy_install-2.7 sphinx https://github.com/s0undt3ch/transifex-client/archive/hotfix/custom-slugs.tar.gz

ADD extract-and-upload-translations.sh /usr/bin/extract-and-upload-translations.sh

CMD /usr/bin/extract-and-upload-translations.sh
