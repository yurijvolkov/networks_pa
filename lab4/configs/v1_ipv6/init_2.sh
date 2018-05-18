#! /bin/bash
ip6tables -t nat -A PREROUTING -j DNAT --to-destination 1::FFFF:408:103

echo 1 | tee /proc/sys/net/ipv6/conf/*/forwarding > /dev/null
echo 0 | tee /proc/sys/net/ipv6/conf/*/accept* > /dev/null
sysctl -p

echo "Host 2 configured."

bash #Trick for preserving open input
