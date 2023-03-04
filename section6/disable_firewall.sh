#!/bin/bash
# This disables the firewall and resets the chain policies

sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD DROP
sudo iptables -F
