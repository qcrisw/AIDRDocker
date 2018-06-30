#!/bin/bash

#Define cleanup procedure
cleanup() {
    asadmin --user admin --passwordfile=$PWD_FILE stop-domain domain1
}

#Trap SIGTERM
trap 'cleanup' SIGTERM

$GLASSFISH_HOME/bin/gfconfig.sh
"${@}" &

#Wait
wait $!
