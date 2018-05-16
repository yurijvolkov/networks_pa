from debian

RUN apt-get update
RUN apt-get install -y netcat
RUN apt-get install -y iptables
RUN apt-get install -y traceroute

