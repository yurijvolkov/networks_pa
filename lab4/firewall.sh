iptables -A OUTPUT -p tcp --dport 3306 --jump DROP #1
iptables -A INPUT -p udp --dport 3305 --jump DROP #2
