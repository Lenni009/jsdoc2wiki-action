#!/bin/bash
apt-get update
apt-get -y install moreutils
echo "Installing NodeJS packages ..."
npm install -g documentation
result=$(documentation lint ./**/*.js)

if [ -z "$result" ]; then
    return 0
else
    return 1
fi
