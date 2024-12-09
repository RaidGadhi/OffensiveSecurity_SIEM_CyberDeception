#!/bin/bash
# HTTP Request Rate Limiting Script
echo "Rate limiting enabled for HTTP requests..."
iptables -A INPUT -p tcp --dport 80 -m limit --limit 25/minute --limit-burst 50 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j DROP
