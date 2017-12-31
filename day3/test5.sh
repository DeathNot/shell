#!/bin/bash

testuser=li
if [  $USER = $testuser ]
then
  echo Welcome $testuser
fi

if [ $testuser != $HOME ]
then
  echo Success!
fi

var=Li
if [ $testuser \> $var ]
then
  echo $testuser \> $var
else
  echo $testuser \< $var
fi

var2=''
if [ -z $var2 ]
then
  echo Empty!
fi

if [ -n $var ]
then
  echo $var is not empty!
fi

if [ -z $var3 ]
then
  echo "'$var3' is empty!"
fi
