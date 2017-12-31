#!/bin/bash

var1=10
var2=12

if [ $var1 -gt 5 ]
then
  echo $var1 \> 5
fi

if [ $var1 -ne $var2 ]
then
  echo $var1 is not equal $var2
fi

var3=5.5
if [ $var3 -gt 5 ]
then
  echo Success!
else
  echo Failed!
fi
