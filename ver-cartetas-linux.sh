#!/bin/bash

# Establecer una lista de las carpetas más importantes en Linux Mint
carpetas_importantes=(
  "/bin"
  "/boot"
  "/dev"
  "/etc"
  "/home"
  "/lib"
  "/media"
  "/mnt"
  "/opt"
  "/proc"
  "/root"
  "/run"
  "/sbin"
  "/srv"
  "/sys"
  "/tmp"
  "/usr"
  "/var"
)

# Mostrar las carpetas importantes
echo "Carpetas importantes en Linux Mint:"
for carpeta in "${carpetas_importantes[@]}"; do
  echo "  $carpeta"
done

# Preguntar al usuario por la carpeta que desea ver
echo -n "Ingrese el nombre de la carpeta que desea ver: "
read carpeta_elegida

# Verificar si la carpeta existe
if [ ! -d "$carpeta_elegida" ]; then
  echo "La carpeta $carpeta_elegida no existe."
  exit 1
fi

# Mostrar los archivos de la carpeta elegida
echo "Archivos en la carpeta $carpeta_elegida:"
ls "$carpeta_elegida"

# Preguntar al usuario si desea entrar a la carpeta
echo -n "¿Desea entrar a la carpeta $carpeta_elegida? (s/n) "
read respuesta

# Entrar a la carpeta si la respuesta es "s"
if [ "$respuesta" == "s" ]; then
  cd "$carpeta_elegida"
  echo "Está en la carpeta $(pwd)"
  # Preguntar al usuario si desea leer algún archivo
  echo -n "¿Desea leer algún archivo de esta carpeta? (s/n) "
  read respuesta_leer
  # Leer el archivo si la respuesta es "s"
  if [ "$respuesta_leer" == "s" ]; then
    echo -n "Ingrese el nombre del archivo que desea leer: "
    read archivo_elegido
    if [ -f "$archivo_elegido" ]; then
      cat "$archivo_elegido"
    else
      echo "El archivo $archivo_elegido no existe."
    fi
  else
    echo "No se ha leído ningún archivo."
  fi
else
  echo "No se ha entrado a la carpeta."
fi
