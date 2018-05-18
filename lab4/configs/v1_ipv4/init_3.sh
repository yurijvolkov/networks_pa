#! /bin/bash
iptables -t nat -A PREROUTING -j DNAT --to-destination 4.8.1.2
iptables -t mangle -A POSTROUTING -j TEE --gateway 4.8.1.3

echo "Host 3 configured."

bash #Trick for preserving open input
