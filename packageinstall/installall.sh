#!/bin/bash
#
echo $(pwd)


./mongodbinstall.sh

./nodeinstall.sh

./rabbitmqinstall.sh

./varnishinstall.sh