#!/bin/bash
for (( a=0; a < 2; a++ )); do
  echo "loop1: $a"
  for (( b=0; b < 2; b++ )); do
    echo "  loop2: $b"
  done
done

var=5
while [ $var -gt 0 ]; do
  echo "loop1: $var"
  for (( var2=1; var2<3; var2++ )); do
    var3=$[ $var * $var2 ]
    echo "  $var * $var2 = $var3"
  done
  var=$[ $var - 1 ]
done

var1=3
until [ $var1 -le 0 ]; do
  echo -n "$var1: "
  var2=1
  while [ $var2 -lt 4 ]; do
    var3=$(echo "scale=4; $var1 / $var2" | bc)
    echo -n "$var3 "
    var2=$[ $var2 + 1 ]
  done
  var1=$[ $var1 - 1 ]
  echo
done
