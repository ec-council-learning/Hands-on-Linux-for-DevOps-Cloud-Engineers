# Iptable Basics

OK, so iptables filters packets by using tables, chains, rules, and targets.
* Tables - Tables are files that join similar actions. A table consists of several chains.
* Chains - A chain is a string of rules. When a packet is received, iptables finds the appropriate table, then runs it through the chain of rules until it finds a match.
* Rules - A rule is a statement that tells what to do with a packet. Rules can block a packet, or forward packet of different types. The matched rule tells where to send the packet. This is called a target.
* Targets - A target is a decision of what to do with a packet. This can be either accept, drop, or reject


