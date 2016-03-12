#!/bin/bash
SET_USERS="user:pass:/the/folder/one user:pass:/the/folder/two"

IFS=' ' read -a USERS <<< "${SET_USERS}"
for SET_USER in ${USERS[@]}; do
        IFS=':' read -a USER <<< "${SET_USER}"
        NAME=${USER[0]};
        PASS=${USER[1]};
        DIR=${USER[2]};
        (echo $PASS; echo $PASS) | pure-pw useradd $NAME -u www-data -g www-data -d $DIR 
done

pure-pw mkdb

# for making supervisord think that process is alive
sleep infinity

exit
