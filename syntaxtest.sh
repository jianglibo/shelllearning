#!/bin/bash

# test bash

# -eq for number.

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

# don't think function will return value
# if function don't return any,the last executed command exit status;
# All builtins return an exit status of 2 to indicate incorrect usage
number_compare
str_num_compare

echo $?