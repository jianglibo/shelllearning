#!/bin/bash
# m3958 functions

# pidfile not exists,return 1;
# pidfile exists,proc not exist return 2;
checkrunning()
{
    local i pidnum
    if ! [ -f "$*" ]; then
        echo "pidfile not exist!"
        return 1
    fi

    read pidnum 0<"$*"

    if [ -d "/proc/$pidnum" ];then
        echo "running" $pidnum
        return 0
    else
        echo "pidfile exists,but process not running"
        return 2
    fi
}

#checkrunning /proc/2012
#echo $?