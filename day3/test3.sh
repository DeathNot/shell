#!/bin/bash
var1="Hello"
var2=""

if test $var1
then
  echo $var1 World!
else
  echo Nothing!
fi

if test $var2
then
  echo Hello World!
else
  echo Nothing!
fi

if test
then
  echo Success!
else
  echo Failed!
fi
