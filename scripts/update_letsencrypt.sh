#!/bin/bash

cd /home/letsencrypt/ &&
git pull &&
chown letsencrypt:letsencrypt . -R
