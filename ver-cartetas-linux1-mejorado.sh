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

  # Seleccionar la carpeta a partir del número elegido por el usuario
  if [ "$numCarpeta" == "1" ]; then
    carpeta="$HOME"
  elif [ "$numCarpeta" == "2" ]; then
    carpeta="/"
  elif [ "$numCarpeta" == "3" ]; then
    carpeta="$HOME/Descargas"
  elif [ "$numCarpeta" == "4" ]; then
    carpeta="$HOME/Documentos"
  else
    echo "No existe esa carpeta"
    exit 1
  fi

  # Cambiar al directorio seleccionado
  cd "$carpeta"
  archivos=$(ls -1)

  # Mostrar los archivos de la carpeta
  echo "$archivos"

  # Preguntar al usuario si quiere entrar a algún archivo o carpeta
  read -p "¿Quieres entrar a algún archivo o carpeta? (s/n) " respuesta2

  # Si el usuario responde sí, entrar al archivo o carpeta especificado
  if [ "$respuesta2" == "s" ]; then
    read -p "Introduce el nombre del archivo o carpeta: " nombreArchivo

    # Verificar si el archivo o carpeta existe
    if [ -d "$nombreArchivo" ]; then
      cd "$nombreArchivo"
      archivos=$(ls -1)

      # Mostrar los archivos de la carpeta
      echo "$archivos"
    elif [ -f "$nombreArchivo" ]; then
      # Mostrar el contenido del archivo
      cat "$nombreArchivo"
    else
      echo "No existe ese archivo o carpeta"
    fi
  fi
fi
