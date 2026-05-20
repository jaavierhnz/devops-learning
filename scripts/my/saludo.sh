#!/bin/bash

#Greetings program

if [ -z "$1" ]; then
  echo "Error: no argument."
  echo "Try: ./saludo.sh yourname"
  echo ""
  exit 1 #remember for errors
else
  echo "Hello $1, nice to meet you."
fi
