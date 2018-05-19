#! /bin/bash

echo 1 | tee /proc/sys/net/ipv6/conf/*/forwarding > /dev/null
echo 0 | tee /proc/sys/net/ipv6/conf/*/accept* > /dev/null
sysctl -p

ip -6 addr add  1::FFFF:0408:081F  dev lo

ip -6 r add  1::FFFF:0408:0815  table 2 nexthop via  1::FFFF:0408:0828  weight 1 nexthop via  1::FFFF:0408:0832  weight 2 nexthop via  1::FFFF:0408:0814  weight 3
ip -6 rule add prio 100 from  1::FFFF:0408:0832  table 2
ip -6 rule add prio 100 from  1::FFFF:0408:081E  table 2
ip -6 rule add prio 100 from  1::FFFF:0408:0828  table 2

ip -6 r add  1::FFFF:0408:0829  table 4 nexthop via  1::FFFF:0408:0832  weight 1 nexthop via  1::FFFF:0408:0814  weight 2 nexthop via  1::FFFF:0408:0828  weight 3
ip -6 rule add prio 100 from  1::FFFF:0408:0814  table 4
ip -6 rule add prio 100 from  1::FFFF:0408:081E  table 4
ip -6 rule add prio 100 from  1::FFFF:0408:0832  table 4

ip -6 r add  1::FFFF:0408:0833  table 5 nexthop via  1::FFFF:0408:0814  weight 1 nexthop via  1::FFFF:0408:0828  weight 2 nexthop via  1::FFFF:0408:0832  weight 3
ip -6 rule add prio 100 from  1::FFFF:0408:0814  table 5
ip -6 rule add prio 100 from  1::FFFF:0408:081E  table 5
ip -6 rule add prio 100 from  1::FFFF:0408:0828  table 5

bash
