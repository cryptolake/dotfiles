#!/bin/bash
sudo protonvpn d &&
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0 &&
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=0 &&
ip --color=auto a &&
protonvpn status

