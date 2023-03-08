#!/bin/sh

# for ANY state transition.
# "notify" script is called AFTER the notify_* script(s) and
# is executed with 4 additional arguments after the configured
# arguments provided by Keepalived:
#   $(n-3) = "GROUP"|"INSTANCE"
#   $(n-2) = name of the group or instance
#   $(n-1) = target state of transition (stop only applies to instances)
#            ("MASTER"|"BACKUP"|"FAULT"|"STOP"|"DELETED")
#   $(n)   = priority value
#   $(n-3) and $(n-1) are ALWAYS sent in uppercase, and the possible
# strings sent are the same ones listed above
#   ("GROUP"/"INSTANCE", "MASTER"/"BACKUP"/"FAULT"/"STOP"/"DELETED")
# (note: STOP and DELETED are only applicable to instances)

set -x

echo "$1 $2 has transitioned to the $3 state with a priority of $4"

TYPE=$1
NAME=$2
STATE=$3
PRIORITY=$4

case $STATE in
    "MASTER") echo "I'm the MASTER! Whup whup." > /proc/1/fd/1
        exit 0
    ;;
    "BACKUP") echo "Ok, i'm just a backup, great." > /proc/1/fd/1
        exit 0
    ;;
    "FAULT")  echo "Fault, what ?" > /proc/1/fd/1
        exit 0
    ;;
    *)        echo "Unknown state" > /proc/1/fd/1
        exit 1
    ;;
esac
