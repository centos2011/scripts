#!/bin/bash
##Print the name of the Bash script
#echo $0

#echo $1-$9

##Print all the argument submitted
#echo $@

##Prins how many arguments were passed to the Bash script
#echo $#

##Print argument in separate line
#for i; do
#  echo $i
#done

#for i in $*; do
#  echo $i
#done

#while (( "$#" )); do
#   echo $1
#   shift
#done

##Store argumets in a special array
#args=("$@")
##get number elements
#ELEMENTS=${#args[@]}

##echo each element in array
##for loop
#for (( i=0;i<$ELEMENTS;i++)); do
#   echo ${args[${i}]}
#done

echo ?
echo $RANDOM
echo $LINENO
