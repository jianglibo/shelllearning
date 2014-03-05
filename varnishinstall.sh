#!/bin/bash

repoinstalled=$(yum repolist | sed -n /^varnish/p)

if [[ -z $repoinstalled ]]; then
    rpm --nosignature -i http://repo.varnish-cache.org/redhat/varnish-3.0/el6/noarch/varnish-release/varnish-release-3.0-1.el6.noarch.rpm
    wait $!
else
    echo "repo exists.continue install...."
fi

varnishd -V 1>/dev/null 2>&1

if [[ $? -eq 127 ]]; then
    yum -y install varnish
    wait $!
    echo "install success."
else
    echo "already installed"
fi

