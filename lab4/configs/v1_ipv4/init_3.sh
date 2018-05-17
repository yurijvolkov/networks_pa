#! /bin/bash
iptables -t mangle -A PREROUTING -j TEE --gateway 4.8.1.2 

echo "Host 3 configured."

bash #Trick for preserving open input
