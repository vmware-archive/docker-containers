from saltstack/arch-minimal
MAINTAINER SaltStack, Inc.

# Update System
RUN pacman -Syyu --noconfirm
#RUN pacman -Sy --noconfirm --needed base-devel

#   Required Libraries
RUN pacman -Sy --noconfirm \
  make \
  python2-pip 

#   Requirements only available trough PyPi
RUN easy_install-2.7 sphinx https://github.com/s0undt3ch/transifex-client/archive/hotfix/custom-slugs.tar.gz

# Some symlinks to make our life easier
RUN ln -sf /usr/bin/python2 /usr/bin/python && ln -sf /usr/bin/sphinx-build2 /usr/bin/sphinx-build

ADD extract-and-upload-translations.sh /usr/bin/extract-and-upload-translations.sh

CMD /usr/bin/extract-and-upload-translations.sh
