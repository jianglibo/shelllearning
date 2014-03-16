#!/bin/bash
#

INIT_DIR=/etc/rc.d/init.d
SBIN_DIR=/usr/sbin


cp -f ./vertxcombo.sh "${INIT_DIR}/vertxcombo"
cp -f ./vertxcombocmd.sh "${SBIN_DIR}/vertxcombo"
chmod u+x "${INIT_DIR}/vertxcombo"
chmod u+x "${SBIN_DIR}/vertxcombo"

cp -f ./visitrank.sh "${INIT_DIR}/visitrank"
cp -f ./visitrankcmd.sh "${SBIN_DIR}/visitrank"
chmod u+x "${INIT_DIR}/visitrank"
chmod u+x "${SBIN_DIR}/visitrank"

cp -f ./cmscamel.sh "${INIT_DIR}/cmscamel"
cp -f ./cmscamelcmd.sh "${SBIN_DIR}/cmscamel"
chmod u+x "${INIT_DIR}/cmscamel"
chmod u+x "${SBIN_DIR}/cmscamel"