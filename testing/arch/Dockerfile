from saltstack/arch-minimal
MAINTAINER SaltStack, Inc.

# Update System
RUN pacman -Syyu --noconfirm
RUN pacman -Sy --noconfirm --needed base-devel

# We need a TTY
# https://github.com/dotcloud/docker/issues/728
#RUN exec >/dev/tty 2>/dev/tty </dev/tty
#RUN mknod -m 666 "/dev/tty0" c 4 0

# Add the Arch linux FR repository to install yaourt
#RUN grep '\[archlinuxfr\]' /etc/pacman.conf >/dev/null 2>&1 || echo -e '[archlinuxfr]\nInclude = /etc/pacman.d/archlinuxfr.conf\n' >> /etc/pacman.conf
#RUN echo -e 'SigLevel = Never\nServer = http://repo.archlinux.fr/$arch\n' >> /etc/pacman.d/archlinuxfr.conf
## Install Yaourt
#RUN pacman -Syyu
#RUN pacman -Sy --noconfirm yaourt

#RUN curl -O https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz && \
#  tar zxvf package-query.tar.gz && cd package-query && makepkg -si --asroot && cd .. && rm -rf ./package-query*
#RUN curl -O https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz && \
#  tar zxvf yaourt.tar.gz && cd yaourt && makepkg -si --asroot && cd .. && rm -rf ./yaourt

# Let's support '#!/usr/bin/env python'
RUN ln -s /usr/bin/python2 /usr/bin/python && ln -s /usr/bin/python2-config /usr/bin/python-config

# Install Testing Dependencies
RUN pacman -Sy --noconfirm openssh
RUN pacman -Sy --noconfirm supervisor
#RUN yaourt -Sy --noconfirm --aur rabbitmq
RUN pacman -Sy --noconfirm ruby
RUN pacman -Sy --noconfirm git
RUN pacman -Sy --noconfirm subversion
RUN pacman -Sy --noconfirm mercurial
RUN pacman -Sy --noconfirm python2-pip
RUN pacman -Sy --noconfirm python2-virtualenv
RUN pacman -Sy --noconfirm mysql-python
RUN easy_install-2.7 mock timelib apache-libcloud
RUN easy_install-2.7 https://github.com/saltstack/salt-testing/archive/develop.tar.gz
