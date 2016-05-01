#!/bin/bash

cd /home/etherpad/etherpad-lite/ &&
svn update &&
chown etherpad:etherpad . -R &&
supervisorctl restart etherpad-etherpad-server
