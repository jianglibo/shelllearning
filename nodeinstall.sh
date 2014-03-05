#!/bin/bash

epel=$(yum repolist | sed -n /^epel/p)

if [[ -n $epel ]]; then
    echo "epel exists"
else
    rpm -Uvh http://download-i2.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
    wait $!
fi

node -v

if [[ $? -eq 127 ]]; then
    echo "install nodejs...."
    yum -y --enablerepo=epel install nodejs
    wait $!
else
    echo "nodejs already installed."
fi

npm -v

if [[ $? -eq 127 ]]; then
    echo "install npm...."
    yum -y --enablerepo=epel install npm
    wait $!
else
    echo "npm already installed."
fi

