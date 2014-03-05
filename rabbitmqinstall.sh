#!/bin/bash

. m3958funcs.sh

installepel

checkinstalled "rabbit"

if [[ $? -eq 3 ]]; then
    yum -y install rabbitmq-server
fi