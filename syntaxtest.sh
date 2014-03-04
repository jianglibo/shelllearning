#!/bin/bash
#
# test bash

# -eq for number. == for string

number_compare()
{
    if [ 1 -eq 1 ]; then
        echo "1 equal 1"
    fi
}

str_num_compare()
{
    if [ 1 -eq "1" ]; then
        echo "1 equal \"1\""
    else
        echo "1 not equal \"1\""
    fi
}


number_compare
str_num_compare

# don't think function will return value,use must use $? or you can use command substitution instead.
# if function don't return any,the last executed command exit status;
# All builtins return an exit status of 2 to indicate incorrect usage

#Command Substitution
ftwo()
{
    return 4
}

ftwo
echo $?

# == must has space at two side.
# $* expand to words,"$*" expand to one word.
# $@ expaned to words, "$@" expand to words.

idx=0
echo "\"\$@\""
for i in "$@"; do
        echo $i $((idx++))
done

idx=0
echo "\$@"
for i in $@; do
        echo $i $((idx++))
done

idx=0
echo "\$*"
for i in $*; do
        echo $i $((idx++))
done

idx=0
echo "\"\$*\""
for i in "$*"; do
        echo $i $((idx++))
done

echo $?

echo "before cd"
echo $(ls)
cd /opt/vertxworld
echo "after cd"
echo $(ls)


