#! /bin/bash
iptables -t nat -A PREROUTING -j DNAT --to-destination 4.8.1.3

echo "Host 2 configured."

bash #Trick for preserving open input
