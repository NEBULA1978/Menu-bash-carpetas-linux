#!/bin/bash

OPCIONES=("Home" "Sistema" "Descargas" "Documentos" "Carpeta Actual" "Salir")

function imprimir_menu {
clear
echo "Carpetas importantes:"
for i in ${!OPCIONES[@]}; do
echo $((i+1))". "${OPCIONES[$i]}
done
echo -n "¿Quieres ver los archivos de alguna carpeta? (s/n) "
}

function seleccionar_carpeta {
read -r eleccion
if [[ $eleccion == "s" || $eleccion == "n" ]]; then
if [[ $eleccion == "s" ]]; then
imprimir_carpetas
elif [[ $eleccion == "n" ]]; then
echo "Saliendo del programa..."
exit 0
fi
else
echo -e "\033[1;31mOpción incorrecta\033[0m"
imprimir_menu
fi
}

function imprimir_carpetas {
for i in ${!OPCIONES[@]}; do
echo $((i+1))". "${OPCIONES[$i]}
done
echo -n "Introduce el número de la carpeta que quieres ver: "
read -r carpeta
if [[ $carpeta -ge 1 && $carpeta -le ${#OPCIONES[@]} ]]; then
carpeta_seleccionada=${OPCIONES[$carpeta-1]}
if [[ $carpeta_seleccionada == "Carpeta Actual" ]]; then
carpeta_seleccionada="."
fi
ver_archivos $carpeta_seleccionada
else
echo -e "\033[1;31mOpción incorrecta\033[0m"
imprimir_carpetas
fi
}

function ver_archivos {
carpeta=$1
archivos=$(ls -1 $carpeta)
echo "Archivos en la carpeta $carpeta:"
echo "$archivos"
echo -n "¿Quieres entrar a algún archivo o carpeta? (s/n) "
read -r eleccion
if [[ $eleccion == "s" ]]; then
echo -n "Introduce el nombre del archivo o carpeta: "
read -r nombre_archivo
if [[ -d $carpeta/$nombre_archivo ]]; then
cd $carpeta/$nombre_archivo
ver_archivos
elif [[ -f $carpeta/$nombre_archivo ]]; then
less $carpeta/$nombre_archivo
else
echo -e "\033[1;31mNo has introducido un nombre de archivo o carpeta\033[0m"
fi
fi
}

imprimir_menu
seleccionar_carpeta

