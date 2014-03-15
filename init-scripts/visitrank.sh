#!/bin/bash
#
# visitrank    Start up the visitrank server daemon
#
# chkconfig: 2345 99 7
# description to start stop visitrank service.
# pidfile: /var/run/visitrank.pid

if [ -f ./m3958funcs.sh ];then
    . ./m3958funcs.sh
elif [ -f /etc/rc.d/init.d/m3958funcs ]; then
    . /etc/rc.d/init.d/m3958funcs
elif [ -f /etc/rc.d/init.d/m3958funcs.sh ]; then
    . /etc/rc.d/init.d/m3958funcs.sh
fi

RETVAL=0
running_path="/opt/visitrank"
cmdname="vertx runmod com.m3958~visitrank~0.0.1"
PID_FILE=/var/run/visitrank.pid

#runlevel=$(set -- $(runlevel); eval "echo \$$#" )
#echo $runlevel


stop()
{
    checkrunning $PID_FILE

    if [ $? -eq 1 ]; then
        echo "already stoped?"
        return 1;
    else
        local pidnum
        read pidnum 0<$PID_FILE

        kill -KILL $pidnum >/dev/null 2>&1
        usleep 100000
        checkrunning $PID_FILE
        if [ $? -eq 2 ]; then
            rm -f $PID_FILE
            echo "stop success." $pidnum
            return 0
        else
            echo "still running,please try again"
            return 1
        fi
    fi
}

start()
{
    checkrunning $PID_FILE
    if [ $? -eq 1 ];then
        if ! [[ -e $running_path ]]; then
            mkdir -p $running_path
        fi
        if [ -d $running_path ]; then
            cd "${running_path}"
        echo "pwd:$(pwd)"
        fi

        if [ -f "${running_path}/conf.json" ]; then
            cmdname="${cmdname} -conf conf.json"
        echo "use conf.json"
        fi
        echo "start exec $cmdname"
        exec $cmdname 1>/dev/null 2>&1 &
        echo "after exec $cmdname"
        echo $! 1>$PID_FILE
        echo "start success" $(cat $PID_FILE)
        return 0
    else
        echo "already running?"
        return 1
    fi
}

case "$1" in
    start)
        start
       ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    status)
        checkrunning $PID_FILE
        ;;
    *)
        echo $"Usage: $0 {start|stop|restart|status}"
        RETVAL=2
esac
exit $RETVAL

