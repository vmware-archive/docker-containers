from opensuse:13.2
MAINTAINER SaltStack, Inc.

# Install the Python repository & Refresh repositories
RUN zypper --non-interactive addrepo --refresh \
  http://download.opensuse.org/repositories/devel:/languages:/python/openSUSE_13.2/devel:languages:python.repo && \
  zypper --gpg-auto-import-keys --non-interactive refresh

# Because patterns-openSUSE-minimal_base-conflicts conflicts with python, lets remove the first one
RUN zypper --non-interactive remove patterns-openSUSE-minimal_base-conflicts

# Update System
RUN zypper --gpg-auto-import-keys --non-interactive update

# Install Salt Dependencies
RUN zypper --non-interactive install --auto-agree-with-licenses \
  libzmq3 \
  python \
  python-Jinja2 \
  python-M2Crypto \
  python-PyYAML \
  python-msgpack-python \
  python-pycrypto \
  python-pyzmq \
  python-xml \
  python-requests \
  aaa_base
