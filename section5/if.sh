#!/bin/bash
#
cpu=6

# single branch
if [ $cpu -gt 4 ]
then
	echo "Suitable for virtualization"
fi

echo
# else
if [ $cpu -gt 4 ]
then
	echo "Suitable for virtualization"
else
	echo "Your milage may vary when using virtual machines"
fi

# built in test if file exists
if [ -f /usr/local/engineering/akira ]
then
	echo "file exists"
else
	echo "the file does not exist"
fi
