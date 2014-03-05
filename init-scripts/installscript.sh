#!/bin/bash
#

TARGET_DIR=/etc/rc.d/init.d

cp -f ./m3958funcs.sh "${TARGET_DIR}/m3958funcs"
cp -f ./vertxcombo.sh "${TARGET_DIR}/vertxcombo"
cp -f ./applogvertx.sh "${TARGET_DIR}/applogvertx"
cp -f ./m3958camel.sh "${TARGET_DIR}/m3958camel"

chmod u+x "${TARGET_DIR}/m3958funcs"
chmod u+x "${TARGET_DIR}/vertxcombo"
chmod u+x "${TARGET_DIR}/applogvertx"
chmod u+x "${TARGET_DIR}/m3958camel"