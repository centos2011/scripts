#!/bin/bash

while :
do
	read -p "Enter two numbers ( - 1 to quit) : " a b
	if [ $a -eq -1 ]
	then
		break
	fi
	ans=$(( a + b ))
	echo $ans
done
