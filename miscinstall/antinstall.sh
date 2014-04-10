#/bin/bash

ant --version

if ! [[ $? -eq 127 ]]; then
    echo "already installed"
    exit 0
fi

TARGET_DIR=/opt/misctools
URL=http://apache.fayea.com/apache-mirror/ant/binaries/apache-ant-1.9.3-bin.tar.gz
FN=$(echo $URL | sed -n 's;.*/;;p')
UNZIPFN=$(echo $FN | sed -n 's;\(.*\)-bin.tar.gz;\1;p')

if ! [[ -d $TARGET_DIR ]]; then
     mkdir -p $TARGET_DIR
fi

pushd $TARGET_DIR 1>/dev/null

if [[ -f $FN ]]; then
    echo "already fetched,skip fetch."
else
    echo "start fetching...${URL}"
    curl -L -o $FN $URL
    wait $!
fi

if [[ -f "$FN" ]]; then
    echo "fetch done."
else
    echo "fetch failure"
    exit 1
fi

echo "extrating..."
tar -zxf "$FN"

fullpath="$TARGET_DIR/$UNZIPFN/bin/ant"

if ! [[ -f $fullpath ]]; then
    echo "untar failure"
    exit 1
fi

popd 1>/dev/null

lndir=

if [[ -d "/usr/local/sbin" ]]; then
    lndir=/usr/local/bin
elif [[ -d /sbin ]]; then
    lndir=/bin
else
    echo "no executable path."
    exit 1
fi

pushd $lndir 1>/dev/null
echo $lndir
ln -s "$fullpath" ./

popd 1>/dev/null

ant --version 1>/dev/null 2>&1

if [[ $? -eq 127 ]]; then
    echo "install failure."
else
    echo "install success."
fi

