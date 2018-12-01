#!/bin/bash

inputfile="$1"
declare -A map
sum=0
finalsum="notset"

while true
do
  while read -r line
  do 
    sum=$(( sum+($line) ))
    
    #echo "map=${map[$sum]}"
    if [[ -z "${map[$sum]}" ]]
    then
      map[$sum]=1
    else
      break 2
    fi
    #echo $sum
  done <"$inputfile"
  [[ $finalsum == "notset" ]] && finalsum=$sum
done

[[ $finalsum == "notset" ]] && finalsum=$sum

echo "answer to first task: $finalsum"
echo "answer to second task: $sum"
