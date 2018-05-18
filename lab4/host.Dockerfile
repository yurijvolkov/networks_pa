from ubuntu

RUN apt-get update
RUN apt-get install -y netcat
RUN apt-get install -y traceroute
RUN apt-get install -y tshark
RUN apt-get install -y iptables
RUN apt-get install -y tcpdump
RUN apt-get install -y netcat-openbsd
RUN apt-get install -y iproute2

ADD modules /lib/modules
