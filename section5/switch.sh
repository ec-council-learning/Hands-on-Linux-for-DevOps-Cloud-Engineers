#!/bin/bash
#
echo "Enter a persons name?"
read user

case $user in
	akira)
		echo "I do not know them well"
		;;
	leilani)
		echo "We go way back"
		;;
	*)
		echo "I have no idea who ${user} is"
		;;
esac
