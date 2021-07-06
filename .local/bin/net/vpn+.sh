#!/bin/bash
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1 &&
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1 &&
ip --color=auto a &&
sleep 3 &&
sudo protonvpn c -f &&
protonvpn status
