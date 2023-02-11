#!/bin/bash

# Mostrar las carpetas importantes
echo "Carpetas importantes:"
echo "1. Home"
echo "2. Sistema"
echo "3. Descargas"
echo "4. Documentos"

# Preguntar al usuario si quiere ver los archivos de una carpeta específica
read -p "¿Quieres ver los archivos de alguna carpeta? (s/n) " respuesta

# Si el usuario responde sí, mostrar los archivos de la carpeta específica
if [ "$respuesta" == "s" ]; then
  read -p "Introduce el número de la carpeta que quieres ver: " numCarpeta

  if [ "$numCarpeta" == "1" ]; then
    # Carpeta Home
    carpeta="$HOME"
  elif [ "$numCarpeta" == "2" ]; then
    # Carpeta Sistema
    carpeta="/"
  elif [ "$numCarpeta" == "3" ]; then
    # Carpeta Descargas
    carpeta="$HOME/Descargas"
  elif [ "$numCarpeta" == "4" ]; then
    # Carpeta Documentos
    carpeta="$HOME/Documentos"
  else
    echo "No existe esa carpeta"
    exit 1
  fi

  cd "$carpeta"
  archivos=$(ls -1)

  # Preguntar al usuario si quiere entrar a algún archivo o carpeta
  read -p "¿Quieres entrar a algún archivo o carpeta? (s/n) " respuesta2

  if [ "$respuesta2" == "s" ]; then
    read -p "Introduce el nombre del archivo o carpeta: " nombreArchivo

    if [ -d "$nombreArchivo" ]; then
      # Si es una carpeta, entrar a la carpeta
      cd "$nombreArchivo"
      archivos=$(ls -1)

      read -p "¿Quieres ver los archivos de esta carpeta? (s/n) " respuesta3

      if [ "$respuesta3" == "s" ]; then
        # Mostrar los archivos de la carpeta
        ls -1
      fi
    elif [ -f "$nombreArchivo" ]; then
      # Si es un archivo, mostrar su contenido
      cat "$nombreArchivo"
    else
      echo "No existe ese archivo o carpeta"
    fi
  fi
fi
