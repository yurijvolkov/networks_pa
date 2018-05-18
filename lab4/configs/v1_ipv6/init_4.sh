#! /bin/bash
ip -6 r del default
ip -6 r add default via 1::FFFF:408:104

echo 1 | tee /proc/sys/net/ipv6/conf/*/forwarding > /dev/null
echo 0 | tee /proc/sys/net/ipv6/conf/*/accept* > /dev/null
sysctl -p

echo "Host 4 configured."
bash #Trick for preserving open input
