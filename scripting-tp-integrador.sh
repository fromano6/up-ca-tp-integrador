#!/bin/bash

clear

function mostrar_menu(){
	echo "MENU"
	echo "1. Pedir un numero entero y mostrar esa cantidad de elementos de la sucesion de Fibonacchi"
	echo "2. Pedir un numero y mostrar por pantalla ese numero en forma inveritda"
	echo "3. Pedir una cadena de caracteres y evaluar si es palíndromo o no"
	echo "4. Pedir el path a un archivo de texto y mostrar por pantalla la cantidad de lineas que tiene"
	echo "5. Pedir el ingreso de 5 numeros enteros y mostrarlos por pantalla en forma ordenada"
	echo "6. Pedir el path a un directorio y mostrar por pantalla cuantos archivos de cada tipo contiene"
	echo "7. SALIR"

}
function fibonacci(){
	a=0
	b=1
	read -p "Ingrese el numero hasta donde quiere ver la serie Fibonacci: " val
	echo "La serie es: "
	for ((i=0;i<$val;i++));
	do
	   echo $a
	   sec=$((a+b))
	   a=$b
	   b=$sec
	done
}

function reverso(){
	read -p "Ingrese el numero a invertir: " num
	echo $num | rev
}

function palindromo(){
	read -p "Ingrese una cadena de caracteres: " text
	len=${#text}
	for ((i=$len-1; i>=0; i--))
	do
	    reverse="$reverse${text:$i:1}"
	done

	echo $reverse
	echo $text

	if [ "$reverse" == "$text" ];then

		echo "Es palindromo"
	else
		echo "No es palindromo"
	fi
}

function lineas_archivo(){
	read -p "Ingrese la ruta al archivo: " file
	echo $(wc -l $file)
}

function ordenar_nums(){
	echo "Ordenar numeros"
	n=""
	for i in `seq 1 5`;
	do
	    read -p "Ingrese un numero: " num
	    n="${n} ${num}"
	done
	echo $n | tr " " "\n" | sort -g
}

function mostrar_archivos_directorio(){
	read -p "Ingrese un directorio: " path
	echo "ARCHIVOS NORMALES:"
	find $path -type f | wc -l
	echo "SUBDIRECTORIOS"
	find $path -type d | wc -l
	echo "ENLACES SIMBOLICOS"
	find $path -type l | wc -l
	echo "DISPOSITIVOS DE CARACTER"
	find $path -type c | wc -l
	echo "DISPOSITIVOS DE BLOQUE"
	find $path -type b | wc -l
}

function salir_menu(){
	echo "Hasta luego $USER"
}

#-------------------------------------PROGRAMA_PRINCIPAL----------------------------#

while true;do
	mostrar_menu

	read -p "Selecione una opcion: " num

	case $num in
	    1) fibonacci ;;

	    2) reverso ;;

	    3) palindromo ;;

	    4) lineas_archivo ;;

	    5) ordenar_nums ;;

	    6) mostrar_archivos_directorio ;;

	    7) salir_menu
	    break;;

	    *) echo "Opcion incorrecta"
	esac
done

