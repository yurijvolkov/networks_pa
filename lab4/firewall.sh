iptables -A OUTPUT -p tcp --dport 3306 --jump DROP #1
iptables -A INPUT -p udp --dport 3305 --jump DROP #2
iptables -OUTPUT -s 4.8.1.2 --jump DROP #3
iptables -INPUT -s 4.8.1.2 --jump DROP #4
iptables -A INPUT -m length —length 1000: -m ttl —ttl-gt 10 -p ICMP -j DROP
