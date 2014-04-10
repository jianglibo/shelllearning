#!/bin/bash
#

. ./pkfuncs.sh

installepel

#checkinstalled "varnish"

# if ! [[ $? -eq 3 ]]; then
#     echo "already installed?"
#     exit 0
# fi
#
ngnix -V 1>/dev/null 2>&1

if ! [[ $? -eq 127 ]]; then
    echo "varnish already installed."
    exit 0
fi

repoinstalled=$(yum repolist | sed -n /^varnish/p)

if [[ -z $repoinstalled ]]; then
    rpm --nosignature -i http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
    wait $!
else
    echo "repo exists.continue install...."
fi

yum -y install nginx
wait $!

nginx -V 1>/dev/null 2>&1

if [[ $? -eq 127 ]]; then
    echo "install success."
else
    echo "already installed"
fi

#yum -y remove httpd
#repoquery -lq time