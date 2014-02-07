#!/bin/sh - 
#===============================================================================
# vim: softtabstop=4 shiftwidth=4 expandtab fenc=utf-8 spell spelllang=en cc=81
#===============================================================================
#
#          FILE: extract-and-upload-translations.sh
# 
#   DESCRIPTION: This script is supposed to be used within a docker container to
#                setup, extract and upload the documentation translations to
#                transifex. It should be executed from within salt's doc
#                directory.
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

SCREEN_WIDTH=${COLUMNS:-$(tput cols 2>/dev/null)}

ruller() {
  printf '%*s\n' $SCREEN_WIDTH '' | tr ' ' -

}

if [ $# -ne 0 ]; then
    ruller
    echo "This script does not require any arguments to be passed"
    exit 1
fi

ruller
python2 /salt-source/doc/.scripts/setup-transifex-config
exc=$?

if [ $exc -ne 0 ]; then
    exit $exc
fi

ruller
python2 /salt-source/doc/.scripts/update-transifex-source-translations
exc=$?

ruller
echo DONE
exit $exc
