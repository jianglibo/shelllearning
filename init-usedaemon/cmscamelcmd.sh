#!/bin/bash
#
#we must write pidfile myself.

RUNNING_PATH=/opt/camelworld/alone
MODULE_VERSION=0.0.1
PID_FILE=/var/run/cmscamel.pid
MVNCMD=/usr/local/bin/mvn

if [ ! -x $MVNCMD ]
then
    echo "mvn not found in /usr/local/bin/"
    exit 5
fi
if ! [[ -e $RUNNING_PATH ]]; then
    mkdir -p $RUNNING_PATH
fi
cd $RUNNING_PATH
execline="mvn camel:run"
echo $execline
echo
exec $execline 1>/dev/null 2>&1 &
echo $! 1>$PID_FILE
exit 0
