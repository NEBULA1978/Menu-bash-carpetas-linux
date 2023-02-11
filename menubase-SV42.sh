#!/bin/bash

#Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

while :; do
  clear
  echo -e "\n${greenColour} MENU SCRIPT V.2${endColour}\n"
  echo -e "${yellowColour}[1]${endColour} Mostrar directorio"
  echo -e "${yellowColour}[2]${endColour} Mostrar calendario"
  echo -e "${yellowColour}[3]${endColour} Mostrar fecha y hora"
  echo -e "${yellowColour}[4]${endColour} Ver archivos ocultos"
  echo -e "${yellowColour}[5]${endColour} Ejecutando script para entrar en carpetas y leer archivos"
  echo -e "${yellowColour}[6]${endColour} Salir\n"

  echo -n "Escoger opción: "
  read opcion

  case $opcion in
    1)
      echo -e "\n${blueColour}Mostrando directorio${endColour}\n"
      ls
      read foo
      ;;
    2)
      echo -e "\n${blueColour}Mostrando calendario${endColour}\n"
      cal
      read foo
      ;;
    3)
      echo -e "\n${blueColour}Mostrando fecha y hora${endColour}\n"
      date
      read foo
      ;;
    4)
      echo -e "\n${blueColour}Mostrando archivos ocultos${endColour}\n"
      ls -a
      read foo
      ;;
    5)
      echo -e "\n${blueColour}Ejecutando script para entrar en carpetas y leer archivos...${endColour}\n"
      # Aquí es donde se ejecutaría el script
      # Por ejemplo:
      ./ver-cartetas-linux1-mejorado3.sh
      read foo
      ;;
    6) 
      echo -e "\n${redColour}[!] Saliendo...${endColour}\n"
      exit 0
      ;;
    *)
      echo -e "\n${redColour}[ERROR] Opción inválida...${endColour}"
      sleep 1
      ;;
  esac
done
