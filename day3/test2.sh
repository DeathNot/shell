#!/bin/bash
testuser=NoSuchUser
if grep $testuser /etc/passwd
then
  echo "Hello world!"
else
  echo "Failed!"
fi
