#!/bin/bash


if [[ -z "$(chkconfig --list| grep "^tomcat")" ]]; then
    yum -y install tomcat6
    wait $!
else
    echo "already installed"
fi

if [[ -z "$(chkconfig --list| grep "^tomcat")" ]]; then
    echo "install failure"
else
    echo "install success."
fi