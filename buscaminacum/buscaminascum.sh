#Buscaminascum 2020. 
#Autor Ricardo Meza Díaz



#Funcion menu del sistema.
#----------------------------------FUNCIONES-------------------------------

function menuPrincipal(){
	echo "_________________________________________________________________"
	echo "|-------------BIENVENIDO AL BUSCAMINACUM 2020-------------------|"
	echo "|---------------------------------------------------------------|"
	echo "|-------------------------Menú----------------------------------|"
	echo "|.......................1.JUGAR.................................|"
	echo "|.......................2.Ayuda.................................|"
	echo "|.......................3.Salir.................................|"
	echo "|_______________________________________________________________|"
	echo  "\n"

	echo "Pulse 1,2 o 3:"
}

#Menu elegir nivel.

function menuNivel(){
	echo "_________________________________________________________________"
	echo "|-------------BIENVENIDO AL BUSCAMINACUM 2020-------------------|"
	echo "|---------------------------------------------------------------|"
	echo "|-------------------------NIVEL---------------------------------|"
	echo "|..................1. 10X10 Casillas 20 Minas ..................|"
	echo "|..................2. Volver....................................|"
	echo "|..................3. Salir.....................................|"
	echo "|_______________________________________________________________|"
	echo  "\n"

	echo "Pulse 1:"
}
function volverAtras(){
	menuNivel
	read var 

	until [ $var -eq 4 ]
	do 
 		case $var in
     		1)
       			echo "opcion 1"
     			;;
     		2)
      			echo "opcion 2"
      			menuUntil
     			;;
    		3)
        		exit 0 
        		;;
    		*)
       			echo "Ha introducido un numero incorrecto."
     			;;
  		esac
  		read var 
  	done
}
function Salir(){
	echo "Se ha cerrado el juego."
	exit 0
}

#Menu until. Menu principal del programa.
function menuUntil(){
	menuPrincipal
	read var
	
	until [ $var -eq 4 ]
	do 
 		case $var in
     		1)
       			echo "\n"
        		volverAtras
     			;;
     		2)
      			echo "\n"
            cat Readme.txt
            echo "\n"
            menuUntil
     			;;
    		3)
        		exit 0
        		;;
    		*)  
            echo "\n"
       			echo "Ha introducido un numero incorrecto."
     			;;
  		esac
  		read var 
  	done
  	
}


#------------------------------------MAIN----------------------------------

#creaMatriz
#menu
menuUntil
#menuSwitch
# menu1
