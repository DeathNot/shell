#!/bin/bash
var=5
until [ $var -le 0 ]
do
  echo -n "$var "
  var=$[ $var - 1 ]
done
echo
var=5
until echo $var
      [ $var -le 0 ]
do
  echo Hello
  var=$[ $var - 1 ]
done
