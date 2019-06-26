#!/bin/bash

#Remove default configs
#rm -rf /etc/apache2/sites-available/*
#Copy virtualhost on apache directory
#cp /opt/proxy-conf/*.conf /etc/apache2/sites-available/

if [ -z "$(ls -A /etc/apache2)" ]; then
   echo "Config directory is empty, copying initial config..."
   cp -r /etc/apache2-initial-config /etc/apache2
else
   echo "Config directory is not empty, continuing..."
fi

#List site and enable
ls /etc/apache2/sites-available/ -1A | a2ensite *.conf

# Apache gets grumpy about PID files pre-existing
rm -f /var/run/apache2/apache2.pid

#Launch Apache on Foreground
/usr/sbin/apache2ctl -D FOREGROUND
