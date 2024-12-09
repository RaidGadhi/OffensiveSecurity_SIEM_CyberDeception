#!/bin/bash
# SQL Injection Detection Script
echo "Applying SQL injection prevention rules..."
echo "
SecRule ARGS \"select|union|insert|delete|update|drop\" \"id:12345,deny,status:403,msg:'SQL Injection Detected'\"
" > /etc/modsecurity/rules/sql_injection.conf
systemctl restart apache2
