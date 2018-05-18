#! /bin/bash

echo 1 | tee /proc/sys/net/ipv6/conf/*/forwarding > /dev/null
echo 0 | tee /proc/sys/net/ipv6/conf/*/accept* > /dev/null
sysctl -p

echo "Host 1 configured."

bash #Trick for preserving open input
