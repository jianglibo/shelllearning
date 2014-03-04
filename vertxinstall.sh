#!/bin/bash
#

URL=http://dl.bintray.com/vertx/downloads/vert.x-2.1RC1.tar.gz

TARGET_DIR=/opt/vertxworld

TMPF=/tmp/wgetvertx

cd $TARGET_DIR

echo "fetching ${URL}"
wget $URL 1>$TMPF 2>&1

wait $!
echo "fetch done."

echo $(cat $TMPF)