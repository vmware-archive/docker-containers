from saltstack/opensuse-12.3-minimal
MAINTAINER SaltStack, Inc.

# Update System
RUN zypper --gpg-auto-import-keys --non-interactive refresh && zypper --gpg-auto-import-keys --non-interactive update

# Install Testing Dependencies
RUN zypper --non-interactive install --auto-agree-with-licenses \
  gcc \
  python-devel \
  python-pip \
  python-setuptools \
  python-virtualenv \
  ruby \
  git-core \
  subversion \
  mercurial \
  supervisor \
  rabbitmq-server \
  python-mock \
  python-psutil \
  python-coverage \
  python-MySQL-python


RUN easy_install \
  timelib \
  apache-libcloud \
  GitPython \
  requests \
  keyring \
  python-gnupg \
  CherryPy \
  tornado \
  boto \
  moto \
  https://github.com/saltstack/salt-testing/archive/develop.tar.gz \
  https://github.com/danielfm/unittest-xml-reporting/archive/master.tar.gz

ADD https://raw.github.com/saltstack/docker-containers/master/scripts/bootstrap-docker.sh /bootstrap-docker.sh

ENTRYPOINT ["/bin/sh", "/bootstrap-docker.sh", \
  "supervisord -c /etc/supervisord.conf", \
  "/etc/init.d/rabbitmq-server start"]
