#!/bin/bash

# Clear the IP, routes, etc set up by WSL2
wsl --user root ifdown -v --force "eth0"
# Cleanup the nameservers set up by WSL2 which ignores the `generateResolvConf` setting
# in `%USERPROFILE%\.wslconfig`
sudo ln -v -f -b -s --relative "/run/resolvconf/resolv.conf" "/etc/resolv.conf"
# Bring the network up inside WSL2 as appropriate for your distribution:
sudo ifup -v --force "eth0"

# Start `systemd`, for example via `systemd-genie`:
sudo genie -i
# ...or start specific services manually, such as the docker deamon to enjoy your hassle
# free containers:
# sudo service docker start
