#!/bin/bash
#
#we must write pidfile myself.

RUNNING_PATH=/opt/m3958camel
MODULE_VERSION=0.0.1
PID_FILE=/var/run/m3958camel.pid
MVNCMD=/usr/bin/mvn

if [ ! -x $MVNCMD ]
then
    echo "mvn not found in /usr/bin/"
    exit 5
fi
if ! [[ -e $RUNNING_PATH ]]; then
    mkdir -p $RUNNING_PATH
fi
cd $RUNNING_PATH
execline="${MVNCMD} camel:run"
echo $execline
echo
exec $execline 1>/dev/null 2>&1 &
echo $! 1>$PID_FILE
exit 0
