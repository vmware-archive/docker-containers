from saltstack/centos-6-minimal
MAINTAINER SaltStack, Inc.

# Update Current Image and install dependencies
RUN yum update -y && yum install -y --enablerepo=epel curl

# Install Latest Salt from the Develop Branch
RUN curl -L https://bootstrap.saltstack.com | sh -s -- -X git develop
