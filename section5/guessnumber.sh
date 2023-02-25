#!/bin/bash

number=$(( $RANDOM % 100 + 1 ))

echo "Guess a number between 1 and 100"

guess=0

while [ "$guess" -ne $number ] ; do
	read guess
	[ "$guess" -lt $number ] && echo "Too low"
	[ "$guess" -gt $number ] && echo "Too high"
done

echo "That's right!"
exit 0
