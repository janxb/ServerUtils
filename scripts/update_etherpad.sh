#!/bin/bash

cd /home/etherpad/etherpad-lite/ &&
git pull origin --quiet &&
chown etherpad:etherpad . -R &&
supervisorctl restart etherpad-etherpad-server
