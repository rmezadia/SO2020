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
            creaTablero
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

#-------------------------------FUNCIONES TABLERO---------------------


#Pinta matriz 
function creaTablero(){

  #Contador de puntos
  puntos = 0

 #Celdas aleatorias 
  a = "1 10-10 -1 "
  b = "-1 0 1 "
  c = "0 1 "
  d = "-1 0 1-2-3 "
  e = "1 2 20 21 10 0-10-20 - 23-2-1 "
  f = "1 2 3 35 30 22 10 0-10-20-25-30-35-3-2-1 "
  g = "1 4 6 9 10 15 20 25 30-30 - 24-11-10-9-8-7 "

  #Variable celda almacena el valor de cada celda
  declare -a matriz

  contador = 0

  #Encabezado de columnas con espaciado
  printf '\n\n'
  printf '%s' "      a   b   c   d   e  f  g   h   i   j"
  printf '\n    %s\n' "----------------------------------------"

  

  #Imprime filas del 0 al 9 
  for fila in $(seq 0 9); do 
    printf '%d ' "$fila"

    #imprime columnas en base a filas
    for columna in $(seq 0 9); do
      ((contador+=1))
      creaCeldaVacia $contador 
      printf '%s \e[33m%s\e[0m ' "|" "${matriz[$contador]}"
    done

    printf '%s\n' "|"
    printf '   %s\n' "----------------------------------------"
  done

  printf '\n\n' 


}

#Celda vacia
function creaCeldaVacia(){

  local contador2=$1
    if [[ -z "${matriz[$contador2]}" ]]; then
      matriz[$contador]="."
    fi
}

#voy por metodo is_null_field() inclusive

#------------------------------------MAIN----------------------------------

#creaMatriz
#menu
menuUntil
#menuSwitch
# menu1
