#!/bin/bash
#
#

checkinstalled()
{
    if [[ -z $1 ]]; then
        echo "Usage: checkinstalled appname"
        return 2
    fi
    echo "checkiing ${1} install status...."
    installed=$(yum list installed | sed -n /^"$1"/p)
    if [[ -z $installed ]]; then
        return 3
    else
        echo "${1} already exists"
        return 0
    fi
}

installepel()
{
    epel=$(yum repolist | sed -n /epel/p)

    if [[ -n $epel ]]; then
        echo "epel exists"
    else
        rpm -Uvh http://download-i2.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
        wait $!
    fi
}

# returnzero()
# {
#     return 0
# }

# returnzero
# if [[ $? -eq 0 ]]; then
#     echo "\$? -eq 0"
# fi

# returnzero
# echo "$?"
# if [[ -z "$?" ]]; then
#     echo "\$? is -z"
# fi