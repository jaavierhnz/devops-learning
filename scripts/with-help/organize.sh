#!/bin/bash

# organize files per type

fold() {
  if [ ! -d "$arg/$1" ]; then
    mkdir -p "$arg/$1"
  fi
}

arg="$1"

if [ -z "$arg" ]; then
  echo "Error: no argument."
  echo "Use: ./organize.sh /path/folder"
  exit 1
fi

if [ ! -d "$arg" ]; then
  echo "Error: '$arg' is not a valid folder."
  exit 1
fi

echo "Organizing: $arg"

fold "imagenes"
fold "documentos"
fold "otros"

img=0
doc=0
ot=0

for file in "$arg"/*; do
  if [ ! -f "$file" ]; then
    continue
  fi

  name=$(basename "$file")

  case "$name" in
    *.jpg|*.jpeg|*.png|*.gif|*.webp)
      mv "$file" "$arg/imagenes/"
      echo "$name -> imagenes/"
      img=$((img + 1))
      ;;
    *.pdf|*.doc|*.docx|*.txt|*.md)
      mv "$file" "$arg/documentos/"
      echo "$name -> documentos/"
      doc=$((doc + 1))
      ;;
    *)
      mv "$file" "$arg/otros/"
      echo "$name -> otros/"
      ot=$((ot + 1))
      ;;
  esac
done

echo ""
echo "=========================================="
echo "✅ Organización completa"
echo "  🖼️  Imágenes:    $img"
echo "  📄 Documentos:  $doc"
echo "  📦 Otros:       $ot"
echo "=========================================="


