#!/bin/bash

cd /home/etherpad/etherpad-lite/ &&
git pull &&
chown etherpad:etherpad . -R &&
supervisorctl restart etherpad-etherpad-server
