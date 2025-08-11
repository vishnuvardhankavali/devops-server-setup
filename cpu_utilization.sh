#!/bin/bash
# I want to check my server CPU usage

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d '%' -f 1)
echo "CPU Usage: $cpu_usage%"

# Check if CPU usage is above 80%
if (( $(echo "$cpu_usage > 80" | bc -l) )); then
   echo "High CPU usage detected: $cpu_usage%" | mail -s "CPU Alert"  kavallivishnuvardhan@gmail.com
fi
