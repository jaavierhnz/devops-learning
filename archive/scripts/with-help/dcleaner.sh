#!/bin/bash

# Dowload cleaner
#MOve files from ~/Dowloads to a new folder

DESCARGAS="$HOME/Downloads/"
ARCHIVO="$DESCARGAS/old_files"
DAYS=30


echo ""
echo "============================"
echo "Downloads Cleaner"
echo "============================"
echo ""


#verify
if [ ! -d "$DESCARGAS" ]; then
  echo "Error: $DESCARGAS not found"
  exit 1
fi

#create file folder
if [ ! -d "$ARCHIVO" ]; then
  echo "Creating folder $ARCHIVO"
  mkdir -p "$ARCHIVO"
fi

#counter
counter=0

#search old files
echo " Searching old files (30 days or more)"
echo""

for archivo in "$DESCARGAS"/*; do
  #skip if is not a file
  if [ ! -f "$archivo" ]; then
    continue
  fi
  #skip file folder
  if [[ "$archivo" == "$ARCHIVO"* ]]; then
    continue
  fi
  #verify old
if [ "$(find "$archivo" -mtime +$DAYS -print)" ]; then
  nombre=$(basename "$archivo")
  echo "Moving: $nombre"
  mv "$archivo" "$ARCHIVO/"
  counter=$((counter + 1))
  fi
done

echo ""
echo "============================"
echo "Done. Moved Files: $counter"
echo "Path: $ARCHIVO"
echo "============================"
echo ""
