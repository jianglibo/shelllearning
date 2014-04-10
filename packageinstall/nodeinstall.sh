#!/bin/bash
#

. ./pkfuncs.sh

installepel

#checkinstalled "nodejs"

node -v 1>/dev/null 2>&1

if [[ $? -eq 127 ]]; then
    echo "install nodejs...."
    yum -y --enablerepo=epel install nodejs
    wait $!
else
    echo "nodejs already installed."
fi

node -v 1>/dev/null 2>&1

if [[ $? -eq 127 ]]; then
    echo "install failure."
else
    echo "install success."
fi

#checkinstalled "npm"

npm -v 1>/dev/null 2>&1

if [[ $? -eq 127 ]]; then
    echo "install npm...."
    yum -y --enablerepo=epel install npm
    wait $!
else
    echo "npm already installed."
fi

npm -v 1>/dev/null 2>&1

if [[ $? -eq 127 ]]; then
    echo "install failure."
else
    echo "install success."
fi
