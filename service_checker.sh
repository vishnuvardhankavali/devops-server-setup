#! /bin/bash
# Title: service status Checker 
# How many systemd services are currently active 
set -euo pipefail

echo " checking the services..."

#get list of all services and filter for  'running'
RUNNING_SERVICES=$(systemctl list-units --type=service --state=running | grep ".service" |wc -l)

echo "Total running services: $RUNNING_SERVICES"

echo -e "\n list of running services:"
systemctl list-units --type=service --state=running | grep ".service" | awk '{print $1}'

