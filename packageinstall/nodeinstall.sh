#!/bin/bash
#

. ./pkfuncs.sh

installepel

checkinstalled "nodejs"


if [[ $? -eq 3 ]]; then
    echo "install nodejs...."
    yum -y --enablerepo=epel install nodejs
    wait $!
else
    echo "nodejs already installed."
fi

checkinstalled "npm"

if [[ $? -eq 3 ]]; then
    echo "install npm...."
    yum -y --enablerepo=epel install npm
    wait $!
else
    echo "npm already installed."
fi

