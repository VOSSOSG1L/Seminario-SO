#!/bin/bash

while true; do

    echo "----  MENU  ----"
    echo "A) Listar el contenido de un fichero"
    echo "B) Crear un archivo con cadena de texto"
    echo "C) Comparar dos archivos"
    echo "D) Uso de awk"
    echo "E) Uso de grep"
    echo "F) Salir"
    read -p  "Selecciona una opción: " opcion

    case $opcion in
        A)
            read -p "Ingresa la ruta completa del fichero: " directory
            ls "$directory"
            ;;
        B)
            read -p "Ingresa la cadena de texto: " text
            echo "$text" > TextCreated.txt
            ;;
        C) 
            read -p "Ingresa la dirección del primer archivo: " direct1 
            read -p "Ingresa la dirección del segundo archivo: " direct2
            diff "$direct1" "$direct2" 
            ;;
        D)   
            man awk
            ;;
        E)
            man grep
            ;;
        F) 
            exit 0
            ;;
        *)
            echo "Opción inválida"
            ;;

    esac

done