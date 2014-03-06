#!/bin/bash

mojito -v 1>/dev/null 2>&1

if [[ $? -eq 127 ]]; then
    echo "install mojito-cli..."
    npm -g install mojito-cli
else
    echo "already installed"
fi
