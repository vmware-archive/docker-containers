FROM centos:7
MAINTAINER SaltStack, Inc.


RUN yum clean all && \
      yum install -y yum install epel-release && \
      yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest-1.el7.noarch.rpm && \
      yum update -y && \
      yum install -y sudo git tmux vim salt-master salt-minion && \
      yum clean all
