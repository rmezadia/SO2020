echo "Inicio practica 1 Sistemas Operativos"
echo "Introduzca un valor:"
read m
#Solo muestra el primer campo del fichero
echo "El valor introducido es: "$m
a=`wc -l holamundo.sh|cut -f1 -d" "`
echo $a
#Hacer if y else para ver si es mayor o menor que 5

#Case contenido de a
case $a in 
	1)
		echo $a 
		;;
	2)
		echo $a
		;;
	3)
		echo $a
		;;
	*)
		echo "El valor no es ni 1 ni 2 no 3."
	;;
	esac
	
	 


