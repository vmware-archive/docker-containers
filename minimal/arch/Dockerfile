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
RUN pacman -Sy --noconfirm \
  python2 \
  python2-yaml \
  python2-jinja \
  python2-pyzmq \
  python2-crypto \
  python2-psutil \
  python2-msgpack \
  python2-m2crypto \
  python2-requests
