#!/bin/bash
# Dynamic IP Blocking Script
echo "Monitoring Apache logs for failed login attempts..."
tail -F /var/log/apache2/access.log | grep --line-buffered "401" | while read line
do
    IP=$(echo $line | awk '{print $1}')
    echo "Blocking IP: $IP"
    iptables -A INPUT -s $IP -j DROP
done
