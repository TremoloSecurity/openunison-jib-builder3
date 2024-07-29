#!/bin/bash

URL=$1
CHECK_FOR=$2

RES=$(curl --insecure "$URL" 2>&1 | grep "$CHECK_FOR")


if [ $? -eq 0 ]
then
  exit 0
else

  if [ $3 ]
  then
    URL=$3
    CHECK_FOR=$4

    RES=$(curl --insecure "$URL" 2>&1 | grep "$CHECK_FOR")

    if [ $? -eq 0 ]
    then
        exit 0
    else
      echo "Error for $URL"
      exit 1
    fi
  else
    echo "Error for $URL"
    exit 1
  fi

  
fi