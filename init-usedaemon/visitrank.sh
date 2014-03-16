#!/bin/bash
#
# visitrank    Start up the visitrank server daemon
#
# chkconfig: 345 99 7
# description to start stop visitrank service.
# pidfile: /var/run/visitrank.pid

. /etc/init.d/functions

retval=0
pidfile=/var/run/visitrank.pid

exec="/usr/sbin/visitrank"
prog="visitrank"
lockfile="/var/lock/subsys/$prog"

start() {

    if [ ! -x $exec ]
    then
        echo $exec not found
        exit 5
    fi

    followdaemon="--pidfile $pidfile $exec"
    echo -n "Starting visitrank $followdaemon: "
    echo
    daemon $followdaemon
    retval=$?
    if [ $retval -eq 0 ]
    then
        touch $lockfile
        echo_success
        echo
    else
        echo_failure
        echo
    fi
    return $retval
}

stop() {
    echo -n "Stopping visitrank: "
    killproc -p $pidfile $prog
    retval=$?
    echo
    [ $retval -eq 0 ] && rm -f $lockfile
    return $retval
}

restart() {
    stop
    start
}

rh_status() {
    status -p $pidfile $prog
}

rh_status_q() {
    rh_status >/dev/null 2>&1
}


# See how we were called.
case "$1" in
    start)
        rh_status_q && exit 0
        $1
        ;;
    stop)
        rh_status_q || exit 0
        $1
        ;;
    restart)
        $1
        ;;
    status)
        rh_status
        ;;
    *)
    echo "Usage: $0 {start|stop|status|restart}"

    exit 2
esac

exit $?