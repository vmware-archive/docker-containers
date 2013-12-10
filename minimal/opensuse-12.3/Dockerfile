from flavio/opensuse-12-3
MAINTAINER SaltStack, Inc.

# Install the Python repository
RUN zypper --non-interactive addrepo --refresh http://download.opensuse.org/repositories/devel:/languages:/python/openSUSE_12.3/devel:languages:python.repo

# Refresh repositories
RUN zypper --gpg-auto-import-keys --non-interactive refresh

# Because patterns-openSUSE-minimal_base-conflicts conflicts with python, lets remove the first one
RUN zypper --non-interactive remove patterns-openSUSE-minimal_base-conflicts

# Update System
RUN zypper --gpg-auto-import-keys --non-interactive update

# Install Salt Dependencies
RUN zypper --non-interactive install --auto-agree-with-licenses libzmq3
RUN zypper --non-interactive install --auto-agree-with-licenses python
RUN zypper --non-interactive install --auto-agree-with-licenses python-Jinja2
RUN zypper --non-interactive install --auto-agree-with-licenses python-M2Crypto
RUN zypper --non-interactive install --auto-agree-with-licenses python-PyYAML
RUN zypper --non-interactive install --auto-agree-with-licenses python-msgpack-python
RUN zypper --non-interactive install --auto-agree-with-licenses python-pycrypto
RUN zypper --non-interactive install --auto-agree-with-licenses python-pyzmq
RUN zypper --non-interactive install --auto-agree-with-licenses python-xml
