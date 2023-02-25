#!/bin/bash
#


get_hostname() {
	echo $HOSTNAME
}

get_home() {
	echo $HOME
}

echo "Hello, I am $(get_hostname). I live in the $(get_home) directory."

echo

list_files() {
        echo "There are $# arguments"
	echo "Argument 1 is $1"
	ls -al $1
}

list_files $(get_home)
