#!/bin/bash

# SETTINGS ##############
MAX_QUEUE_SIZE=1
MAIL_TO="root"
HOSTNAME=$(/bin/hostname)
# END SETTINGS ##########

CURRENT_QUEUE_SIZE=$(/usr/sbin/exim -bpc);
EXIM_QUEUE_SUMMARY=$(/usr/sbin/exiqgrep -z -i | xargs -i /usr/sbin/exim -Mvl {});
REMOVE_HINT="To remove frozen messages, use the following command: exiqgrep -z -i | xargs exim -Mrm"
LINE_BREAK=$'\n\n'

if [ "$CURRENT_QUEUE_SIZE" -ge "$MAX_QUEUE_SIZE" ]; then
	mail -s "$HOSTNAME - WARNING: Too many messages in mail queue ($CURRENT_QUEUE_SIZE/$MAX_QUEUE_SIZE)" "$MAIL_TO" <<< "$EXIM_QUEUE_SUMMARY $LINE_BREAK $REMOVE_HINT"
fi
