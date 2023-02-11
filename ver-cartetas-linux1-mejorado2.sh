#!/bin/bash

echo "Carpetas importantes:"
echo "1. Home"
echo "2. Sistema"
echo "3. Descargas"
echo "4. Documentos"
echo "5. Carpeta Actual"

read -p "¿Quieres ver los archivos de alguna carpeta? (s/n) " eleccion

if [ "$eleccion" == "s" ]; then
  read -p "Introduce el número de la carpeta que quieres ver: " numero

  case $numero in
    1) cd ~ ;;
    2) cd / ;;
    3) cd ~/Downloads ;;
    4) cd ~/Documents ;;
    5) cd . ;;
    *) echo "Opción inválida"
  esac

  archivos=$(ls -1)
  echo "$archivos"

  read -p "¿Quieres entrar a algún archivo o carpeta? (s/n) " eleccion2

  if [ "$eleccion2" == "s" ]; then
    read -p "Introduce el nombre del archivo o carpeta: " nombre

    if [ -d "$nombre" ]; then
      cd "$nombre"
      archivos=$(ls -1)
      echo "$archivos"
    elif [ -f "$nombre" ]; then
      cat "$nombre"
    else
      echo "No se pudo entrar a $nombre"
    fi
  fi
else
  echo "No se mostraron los archivos."
fi
