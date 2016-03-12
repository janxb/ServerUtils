#!/bin/bash

cd /var/www/apps/db/ &&
mv index.php index.php.bak
wget https://www.adminer.org/latest.php -O index.php &&
chown www-data:www-data index.php &&
chown www-data:www-data index.php.bak
