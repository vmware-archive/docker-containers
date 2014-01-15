from saltstack/arch-minimal
MAINTAINER SaltStack, Inc.

# Update Packages & Upgrade System
RUN pacman -Syyu --noconfirm

# Install Latest Salt from the Develop Branch
RUN curl -L http://bootstrap.saltstack.org | sh -s -- git develop
