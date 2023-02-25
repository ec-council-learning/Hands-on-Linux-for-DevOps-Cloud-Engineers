#!/bin/bash
#
declare -a distros
distros[0]="Amazon Linux"
distros[1]="Ubuntu"
distros[2]="RedHat"
distros[3]="Debian"
distros[5]="Arch"


# print out each distro
for distro in "${distros[@]}"
do
	echo $distro
done

echo "----------------"

# print out each distro until you hit RedHat then stop
for distro in "${distros[@]}"
do
	if [ "$distro" = "RedHat" ]
	then
		break
	fi
	echo $distro
done

# while loop
echo "Count up"
count=0
while [ $count -lt 10 ]
do
	echo "$count"
	((count++))
done

echo "Count down"
# count backwards
count=10
while [ $count -gt 0 ]
do
	echo "$count"
	((count--))
	sleep 0.2
done

echo "blast off!"
