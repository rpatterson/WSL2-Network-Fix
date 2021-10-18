#!/bin/bash

# Clear the IP, routes, etc set up by WSL2
wsl --user root ifdown -v --force "eth0"
# Bring the network up inside WSL2 as appropriate for your distribution:
sudo ifup -v --force "eth0"

# Start `systemd`, for example via `systemd-genie`:
sudo genie -i
# ...or start specific services manually, such as the docker deamon to enjoy your hassle
# free containers:
# sudo service docker start
