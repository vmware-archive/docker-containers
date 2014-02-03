#!/bin/sh - 
#===============================================================================
# vim: softtabstop=4 shiftwidth=4 expandtab fenc=utf-8 spell spelllang=en cc=81
#===============================================================================
#
#          FILE: bootstrap-docker.sh
# 
#         USAGE: ./bootstrap-docker.sh "start an app" "start another app"
# 
#   DESCRIPTION: This script is supposed to be used within a docker container to
#                start multiple services.
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

SCREEN_WIDTH=${COLUMNS:-$(tput cols 2>/dev/null || echo 80)}

ruller() {
  printf '%*s\n' $SCREEN_WIDTH '' | tr ' ' -

}

if [ $# -eq 0 ]; then
    ruller
    echo "This script is to be used inside a docker container to help "
    echo "start any companion daemons to Salt's test suite."
    echo "NOTE: Be sure to quote any start call which contain spaces in it."
    exit 1
fi

last_call_ecode=0

for call in "$@"; do
    ruller
    echo "Running: $call"
    ruller
    eval $call
    last_call_ecode=$?
    echo
done

exit $last_call_ecode
