#!/bin/bash
var=5
while [ $var -gt 0 ]
do
  echo -n "$var "
  var=$[ $var - 1 ]
done
echo
var=5
while echo $var
      [ $var -ge 0 ]
do
  echo Hello
  var=$[ $var - 1 ]
done
