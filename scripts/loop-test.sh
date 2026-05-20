#!/bin/bash

for item in ~/*; do
  if [ -d "$item" ]; then
    echo "Folder: $item"
  elif [ -f "$item" ]; then
    echo "File: $item"
  fi

  done