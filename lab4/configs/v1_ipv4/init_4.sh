#! /bin/bash
ip r del default
ip r add default via 4.8.1.4

echo "Host 4 configured."
bash #Trick for preserving open input
