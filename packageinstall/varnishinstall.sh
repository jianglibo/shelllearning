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
varnishd -V 1>/dev/null 2>&1

if ! [[ $? -eq 127 ]]; then
    echo "varnish already installed."
    exit 0
fi

repoinstalled=$(yum repolist | sed -n /^varnish/p)

if [[ -z $repoinstalled ]]; then
    rpm --nosignature -i http://repo.varnish-cache.org/redhat/varnish-3.0/el6/noarch/varnish-release/varnish-release-3.0-1.el6.noarch.rpm
    wait $!
else
    echo "repo exists.continue install...."
fi

yum -y install varnish
wait $!

varnishd -V 1>/dev/null 2>&1

if [[ $? -eq 127 ]]; then
    echo "install success."
else
    echo "already installed"
fi

#yum -y remove httpd
#repoquery -lq time