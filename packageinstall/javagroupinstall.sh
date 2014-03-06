#!/bin/bash

# Java Platform

java -version 1>/dev/null 2>&1

if [[ $? -eq 127 ]]; then
    yum -y groupinstall "Java Platform"
    wait $!
fi

java -version 1>/dev/null 2>&1

if [[ $? -eq 127 ]]; then
    echo "install failure."
else
    echo "install success!"
fi

# yum groupinfo
