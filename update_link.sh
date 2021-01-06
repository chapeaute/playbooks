#!/bin/bash

if [ $# -eq 0 ]; then
    2>&1 echo "No ansible role specified"
    exit 1
fi

ROLE_DIR=`dirname $0`

echo "==> Pull to get last modification"
git pull

echo -e "\n==> Update requirements.yml"
$ROLE_DIR/generate-requirement.sh

git add $1
echo -e "\nCommit $1"
git commit -m "Update $1 link" $ROLE_DIR/$1 $ROLE_DIR/requirements.yml

echo -e "\nPush update to server"
git push
