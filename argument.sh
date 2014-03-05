#!/bin/bash


# a,b,c become positional arguments $1,$2,$3
#
#

efunc()
{
    echo "$1,$2,$3"
}

oldifs="$IFS"

IFS=,
set a b c

efunc "$*"
efunc $*
efunc "$@"
efunc $@
IFS="$oldifs"


