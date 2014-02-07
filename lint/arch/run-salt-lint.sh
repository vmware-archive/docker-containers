#!/bin/sh - 
#===============================================================================
# vim: softtabstop=4 shiftwidth=4 expandtab fenc=utf-8 spell spelllang=en cc=81
#===============================================================================
#
#          FILE: run-lint.sh
# 
#   DESCRIPTION: This script is supposed to be used within a docker container to
#                run lint against Salt's source code and unit-tests.
#
#          BUGS: https://github.com/saltstack/docker-containers
# 
#  ORGANIZATION: SaltStack, Inc.
#
#     COPYRIGHT: (c) 2014 by the SaltStack Team
#
#       LICENSE: Apache 2.0
#  ORGANIZATION: SaltStack (saltstack.org)
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# Set the expected exit codes variable to 1
EC1=-1
EC2=-1

SCREEN_WIDTH=${COLUMNS:-$(tput cols 2>/dev/null)}

ruller() {
  printf '%*s\n' $SCREEN_WIDTH '' | tr ' ' -

}

if [ $# -ne 0 ]; then
    ruller
    echo "This script does not require any arguments to be passed"
    exit 1
fi

if [ ! -f /salt-source/salt/__init__.py ]; then
    echo "This script expects that the Salt's source code be available at /salt-source"
    exit 1
fi


ruller
echo " * PyLint Versions"
pylint --rcfile=/salt-source/.testing.pylintrc --version

ruller
echo " * Running PyLint against Salt's source code"
pylint --rcfile=/salt-source/.testing.pylintrc /salt-source/salt/ | tee /salt-source/pylint-report.xml && (EC1=${PIPESTATUS[0]})

ruller
echo " * Running PyLint against Salt's tests suite"
pylint --rcfile=/salt-source/.testing.pylintrc --disable=W0232,E1002 /salt-source/tests/ | tee /salt-source/pylint-report-tests.xml && (EC2=${PIPESTATUS[0]})

ruller
echo " * DONE"

ruller
echo " * 1st PyLint Execution Exit Code: ${EC1}"
echo " * 2nd PyLint Execution Exit Code: ${EC2}"
ruller

if [ $EC1 -ne 0 ]; then
    exit $EC1
elif [ $EC2 -ne 0 ]; then
    exit $EC2
else
    exit 0
fi
