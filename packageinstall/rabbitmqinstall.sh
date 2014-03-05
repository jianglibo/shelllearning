#!/bin/bash
#

. ./pkfuncs.sh

installepel

checkinstalled "rabbit"

if [[ $? -eq 3 ]]; then
    yum -y install rabbitmq-server
fi