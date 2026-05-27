#!/bin/bash

#funcion

aprobar(){
  if [[ -z "$1" || "$1" -gt 100 || "$1" -lt 0 ]]; then
    echo "Error: introduce a score"
    exit 1
  else
    if [ "$1" -ge 90 ]; then
      echo "Excellent, score: $1 "
    elif [ "$1" -ge 70 ]; then
      echo "Approved, score: $1 "
    else
      echo "Reproved, score: $1 "
    fi
  fi
}
aprobar "$1"