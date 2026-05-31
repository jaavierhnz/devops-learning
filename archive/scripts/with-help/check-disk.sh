#!/bin/bash

# Script que verifica si un archivo o carpeta existe

# $1 = primer argumento que le pasamos al script

if [ -z "$1" ]; then
    echo "Error: You should use a path as argument"
    echo "Use method: ./check-disk.sh /ruta/a/verificar"
    exit 1
fi

RUTA="$1"

if [ -d "$RUTA" ]; then
    echo "'$RUTA' is a FILE"
elif [ -f "$RUTA" ]; then
    echo "'$RUTA' IS a FOLDER"
else
    echo "'$RUTA' doesnt exist"
    exit 1
fi