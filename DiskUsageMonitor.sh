#!/bin/bash
THRESHOLD=80
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
df / | awk '{ print $5 }' 

if [ "$USAGE" -gt "$THRESHOLD" ]; then 
echo "DISK usage is above $THRESHOLD%: $USAGE%" | mail -s "Disk Alert" kavallivishnuvardhan@gmail.com


fi

