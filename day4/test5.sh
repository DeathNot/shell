#!/bin/bash
for (( i = 0; i < 5; i++ ))
do
  echo The number is $i
done

for (( a = 1, b = 5; a < b; a++, b-- ))
do
  echo "$b - $a"
done
