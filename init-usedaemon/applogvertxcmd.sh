#!/bin/bash

#we must write pidfile myself.

RUNNING_PATH=/opt/applogvertx
MODULE_VERSION=0.0.1.8
PID_FILE=/var/run/applogvertx.pid
VERTX=/usr/sbin/vertx


if [ ! -x $VERTX ]
then
    echo "vertx not found in /usr/sbin"
    exit 5
fi

if ! [[ -e $RUNNING_PATH ]]; then
    mkdir -p $RUNNING_PATH
fi

cd $RUNNING_PATH
execline="$VERTX runmod com.m3958.vertxio~applogvertx~$MODULE_VERSION -conf $RUNNING_PATH/conf.json"
echo $execline
echo
exec $execline 1>/dev/null 2>&1 &
echo $! 1>$PID_FILE
exit 0
