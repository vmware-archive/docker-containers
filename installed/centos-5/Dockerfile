from saltstack/centos-5-minimal
MAINTAINER SaltStack, Inc.

# Update Current Image and install dependencies
RUN yum update -y && yum install -y --enablerepo=epel curl

# Install Latest Salt from the Develop Branch
RUN curl -L http://bootstrap.saltstack.org | sh -s -- -X git develop
