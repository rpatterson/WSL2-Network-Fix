#!/bin/bash
# 192.168.1.10 your WSL2 fixed address outside of DHCP / 192.168.1.1 your router address
sudo ip addr flush eth0 && sudo ip addr add 192.168.1.10/24 brd + dev eth0 && sudo ip route delete default; sudo ip route add default via 192.168.1.1
# Start `systemd`, for example via `systemd-genie`:
sudo genie -i
# ...or start specific services manually, such as the docker deamon to enjoy your hassle
# free containers:
# sudo service docker start
