#!/bin/bash

RAND_FOLDER=/tmp/$RANDOM
DOMAIN=localhost

mkdir $RAND_FOLDER
cd $RAND_FOLDER
wget -S -rl 3 -nv http://$DOMAIN -e robots=off -R js,svg -D $DOMAIN >/dev/null 2>&1
rm -rf $RAND_FOLDER
exit 0
