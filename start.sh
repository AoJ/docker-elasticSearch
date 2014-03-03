#!/usr/bin/env bash

LOG=/var/log/start
touch $LOG

/usr/bin/supervisord >> $LOG &

# sleep 10
# /opt/run/setup.sh >> $LOG &

tail -f $LOG
