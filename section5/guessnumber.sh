#!/bin/bash

number=$(( $RANDOM % 10 + 1 ))

echo "Guess a number between 1 and 10"

guess=0

while [ "$guess" -ne $number ] ; do
	read guess
	if [ "$guess" -lt $number ]
		then
			echo "Too low"
	fi

	if [ "$guess" -gt $number ]
	then
		echo "Too high"
	fi
done

echo "You win!!"
exit 0
