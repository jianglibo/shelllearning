#!/bin/bash

. m3958funcs.sh

installepel

repof=/etc/yum.repos.d/mongodb.repo

if ! [[ -f $repof ]]; then
    cat 1>$repof <<End-of-message
[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1
End-of-message
fi

checkinstalled "mongodb"

if [[ $? -eq 3 ]]; then
    yum -y install mongodb-server
    yum -y install mongodb
fi
# mongo-10gen
# if [[ $? -eq 3 ]]; then
#     yum -y install rabbitmq-server
# fi