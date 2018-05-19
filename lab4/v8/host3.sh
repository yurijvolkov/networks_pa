#! /bin/bash

ip addr add 4.8.8.41 dev lo

# XXX: this was copy pasted since I lost this part of history, there could be
# errors
ip r add 4.8.8.31 table 1 nexthop via 4.8.8.50 weight 1 nexthop via 4.8.8.20 weight 2 nexthop via 4.8.8.30 weight 3
ip rule add prio 100 from 4.8.8.20 table 1
ip rule add prio 100 from 4.8.8.40 table 1
ip rule add prio 100 from 4.8.8.50 table 1

ip r add 4.8.8.21 table 1 nexthop via 4.8.8.50 weight 1 nexthop via 4.8.8.40 weight 2 nexthop via 4.8.8.20 weight 3
ip rule add prio 100 from 4.8.8.30 table 1
ip rule add prio 100 from 4.8.8.40 table 1
ip rule add prio 100 from 4.8.8.50 table 1

ip r add 4.8.8.51 table 5 nexthop via 4.8.8.30 weight 1 nexthop via 4.8.8.20 weight 2 nexthop via 4.8.8.50 weight 3
ip rule add prio 100 from 4.8.8.20 table 5
ip rule add prio 100 from 4.8.8.30 table 5
ip rule add prio 100 from 4.8.8.40 table 5

bash
