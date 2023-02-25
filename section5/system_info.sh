#!/bin/bash

# host
user=$(whoami)
active_user_count=$(users | wc -w)
hostname=$(uname -n)
disk_used=$(df -Ph | grep xvda1 | awk '{print $4}' | tr -d '\n')
release=$(cat /etc/system-release)

# AWS IMDSv1
instance_id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
ami_id=$(curl -s http://169.254.169.254/latest/meta-data/ami-id)

# system metrics
memory1=$(cat /proc/meminfo | grep MemAvailable | awk '{print $2}')
memory2=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
swap_in_use=$(free | tail -n 1 | awk '{print $3}')
all_processes=$(ps -Afl | wc -l)

# time of day
hour=$(date +"%H")
if [ $hour -lt 12  -a $hour -ge 0 ]
then
	time="morning"
elif [ $hour -lt 17 -a $hour -ge 12 ]
then
	time="afternoon"
else
	time="evening"
fi

#System uptime
uptime=$(cat /proc/uptime | cut -f1 -d.)
up_days=$((uptime/60/60/24))
up_hours=$((uptime/60/60%24))
up_mins=$((uptime/60%60))
up_secs=$((uptime%60))

#System load
load1=$(cat /proc/loadavg | awk {'print $1'})
load5=$(cat /proc/loadavg | awk {'print $2'})
load15=$(cat /proc/loadavg | awk {'print $3'})

echo "

░█▀█░█░█░█▀▀░░░█░░░█▀█░█▀▄
░█▀█░█▄█░▀▀█░░░█░░░█▀█░█▀▄
░▀░▀░▀░▀░▀▀▀░░░▀▀▀░▀░▀░▀▀░

Good $time $user"

echo "
===========================================================================
- Hostname............: ${hostname}
- Instance ID.........: ${instance_id}
- AMI ID..............: ${ami_id}
- Release.............: ${release}
- Users...............: Currently ${active_user_count} User(s) logged on
===========================================================================
- Current user........: ${user}
- CPU usage...........: ${load1}, ${load5}, ${load15} (1, 5, 15 min)
- Memory used.........: ${memory1} KB / ${memory2} KB
- Swap in use.........: ${swap_in_use} KB
- Processes...........: ${all_processes} running
- System uptime.......: ${up_days} days ${up_hours} hours ${up_mins} minutes ${up_secs} seconds
- Disk space /........: ${disk_used} remaining
===========================================================================
"
