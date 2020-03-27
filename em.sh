#!/usr/bin/env bash

echo "################"
echo "SETTING"
echo "################"
hostname pcf.fr

echo "################"
echo "UPDATING APT"
echo "################"
apt-get update
echo "################"
echo "UPDATING IPTABLES"
echo "################"
iptables -I INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
echo "################"
echo "INSTALLING MAILUTILS AND POSTFIX"
echo "################"
apt-get install -y mailutils
apt-get install -y postfix

echo "################"
echo "SENDING TEST EMAILS"
echo "################"
echo "This is the body of the email" | mail -s "This is the subject line" claude.jullian@sfr.fr
echo "This is the body of the email" | mail -s "This is the subject line" cypher0x8@gmail.com


tail -fn 500 /var/log/mail.log
