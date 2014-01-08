from base/arch
MAINTAINER SaltStack, Inc.


# Create a pacman .d directory so we can just override salt's included configuration if needed
RUN [ -d /etc/pacman.d ] || mkdir -p /etc/pacman.d

# Add the Salt repository
RUN grep '\[salt\]' /etc/pacman.conf >/dev/null 2>&1 || echo -e '[salt]\nInclude = /etc/pacman.d/salt.conf\n' >> /etc/pacman.conf
RUN echo -e 'Server = http://intothesaltmine.org/archlinux\nSigLevel = Optional TrustAll\n' >> /etc/pacman.d/salt.conf

# Update Packages & Upgrade System
RUN pacman -Syyu --noconfirm

# Install Salt Dependencies
RUN pacman -Sy --noconfirm python2
RUN pacman -Sy --noconfirm python2-yaml
RUN pacman -Sy --noconfirm python2-jinja
RUN pacman -Sy --noconfirm python2-pyzmq
RUN pacman -Sy --noconfirm python2-crypto
RUN pacman -Sy --noconfirm python2-psutil
RUN pacman -Sy --noconfirm python2-msgpack
RUN pacman -Sy --noconfirm python2-m2crypto
