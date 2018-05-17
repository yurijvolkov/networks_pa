#! /bin/bash
#iptables -t nat -A OUTPUT -j DNAT --to-destination 4.8.1.4
ip r add default via 4.8.1.4

echo "Host 4 configured."
bash #Trick for preserving open input
