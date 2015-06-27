from saltstack/ubuntu-12.04-minimal
MAINTAINER SaltStack, Inc.

# Upgrade System and Install dependencies
RUN apt-get update && \
  apt-get upgrade -y -o DPkg::Options::=--force-confold && \
  apt-get install -y -o DPkg::Options::=--force-confold curl

# Install Latest Salt from the Develop Branch
RUN curl -L https://bootstrap.saltstack.com | sh -s -- -X git develop
