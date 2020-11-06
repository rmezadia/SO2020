#Buscaminascum 2020. 
#Autor Ricardo Meza Díaz

#---------------------------------VARIABLES GLOBALES-----------------------

#Contador de puntos
puntos=0
 #Celdas aleatorias 
a="1 10 -10 -1"
b="-1 0 1"
c="0 1"
d="-1 0 1 -2 -3"
e="1 2 20 21 10 0 -10 -20 -23 -2 -1"
f="1 2 3 35 30 20 22 10 0 -10 -20 -25 -30 -35 -3 -2 -1"
g="1 4 6 9 10 15 20 25 30 -30 -24 -11 -10 -9 -8 -7"

#Definicion de la matriz Variable celda almacena el valor de cada celda
declare -a matriz




function uso(){
  cat <<_EOF_
  This game is made for fun, it has simple rules.
  * Do not cheat.
  * You can re-select an element if only it's -
    empty.
  * if even, double digits are given, only the
    first will be considered.
  * When the game is over, it is over.
  Shown down here is a metrics 10x10 in size and
  to play you have to enter the coordinates.
  NOTE: To choose col- g, row- 5, give input - g5
_EOF_
}
function tiempoEspera(){

{
  printf '\n\n%s\n\n' "Mucho tiempo de espera!!"
  exit 1
}
}

#----------------------------------FUNCIONES-------------------------------


#----------------------------------MENUS-----------------------------------

#Primer esquema de menú que aparece al ejecutar el juego.

function menuPrincipal(){
	echo "_________________________________________________________________"
	echo "|-------------BIENVENIDO AL BUSCAMINACUM 2020-------------------|"
	echo "|---------------------------------------------------------------|"
	echo "|-------------------------Menú----------------------------------|"
	echo "|.......................1.JUGAR.................................|"
	echo "|.......................2.Ayuda.................................|"
	echo "|.......................3.Salir.................................|"
	echo "|_______________________________________________________________|"

	echo "Pulse 1,2 o 3:"
}

#Menu para elegir nivel despues de haber escogido opción 1. JUGAR.

function menuNivel(){
	
  echo "_________________________________________________________________"
	echo "|-------------BIENVENIDO AL BUSCAMINACUM 2020-------------------|"
	echo "|---------------------------------------------------------------|"
	echo "|-------------------------NIVEL---------------------------------|"
	echo "|..................1. 10X10 Casillas 20 Minas ..................|"
	echo "|..................2. Volver....................................|"
	echo "|..................3. Salir.....................................|"
	echo "|_______________________________________________________________|"
	echo -e '\n'

	echo "Pulse 1:"

}

#Menú que permite retroceder al menú anterior.

function volverAtras(){
	menuNivel
	read var 

	until [ $var -eq 4 ]
	do 
 		case $var in
     		1)
       			echo "opcion 1"
            
            trap tiempoEspera INT

            uso
            creaTablero

            #Controlador de introducción por de clado de coordenadas
            #Para introducir por teclado la fila y la columna del tablero, escriba por ejemplo:
            #en este orden, columna g fila 5: g5 , y puelse enter, y así sucesivamente 
            #hasta terminar el juego.
            while true; do 
              read -p "Introduzca una coordenada: " opcion
              obtenerCoordenadas
            done
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

#Funcionalidad que permite salir del juego, cuando se muestre la op en el menú.

function Salir(){
	echo "Se ha cerrado el juego."
	exit 0
}

#Menu until. Menu principal que le da funcionalidad al esquema del primer menu del juego.
#También, controla las opciones introducidas por teclado.

function menuUntil(){
	menuPrincipal
	read var
	
	until [ $var -eq 4 ]
	do 
 		case $var in
     		1)
       			echo -e "\n"
        		volverAtras
     			;;
     		2)
      			echo -e "\n"
            cat Readme.txt
            echo -e "\n"
            menuUntil
     			;;
    		3)
        		exit 0
        		;;
    		*)  
            echo -e  "\n"
       			echo "Ha introducido un numero incorrecto."
     			;;
  		esac
  		read var 
  	done
  	
}

#----------------------------------FIN MENUS--------------------------



#-------------------------------FUNCIONES TABLERO---------------------


#Pinta matriz 
function creaTablero(){


  contador=0 

  #Encabezado de columnas con espaciado
  printf '\n\n'
  printf '%s' "      a   b   c   d   e  f  g   h   i   j"
  printf '\n    %s\n' "----------------------------------------"

  

  #Imprime filas del 0 al 9 
  for fil in $(seq 0 9); do 
    printf '%d ' "$fil"

    #imprime columnas en base a filas
    for col in $(seq 0 9); do
      ((contador+=1))
      creaCeldaVacia $contador 
      printf '%s \e[33m%s\e[0m ' "|" "${matriz[$contador]}"
    done

    printf '%s\n' "|"
    printf '   %s\n' "----------------------------------------"
  done

  printf '\n\n' 
}
#Cuenta Celdas libres y dice cuantas están libres.
function obtenerCeldasLibres(){
  
  celdasLibres=0
  for n in $(seq 1 ${#matriz[@]}); do
    if [[ "${matriz[$n]}" = "." ]]; then
      ((celdasLibres+=1))
    fi
  done

}

#Verifica si la casilla está libre.
function esCasillaLibre(){
  
  local casilla=$1
  local valor=$2
  casillaDisponible=0
  
  if [[ "${matriz[$casilla]}" = "." ]]; then
    matriz[$casilla]=$valor
    puntos=$((puntos+valor))
  else
     casillaDisponible=1 

  fi

}

#Crea Celda vacia
function creaCeldaVacia(){

  local contador2=$1
    if [[ -z "${matriz[$contador2]}" ]]; then
      matriz[$contador]="."
    fi
}

#Obtiene mina de la partida que he pisado.
function obtenerMinas(){

  m=$(shuf -e a b c d e f g X -n 1)

  if [[ "$m" = "X" ]]; then
    for limite in ${!m}; do
      campo=$(shuf -i 0-5 -n 1)
      indice=$((i+limite))
      esCasillaLibre $indice $campo
    done
  elif [[ "$m" = "X" ]]; then
    g=0
    matriz[$i]=X
    for j in {42..49}; do
      salida="FIN DE JUEGO"
      k=${salida:$g:1}
      matriz[$j]=${k^^}
      ((g+=1))
    done
  fi
}




#Ayuda a obtener minas

#-----------------------FIN FUNCIONES TABLERO---------------------

#voy por metodo is_null_field() inclusive

#---------------------------LOGICA JUGADOR------------------------
function obtenerCoordenadas(){
  
  col=${opcion:0:1}
  fil=${opcion:1:1}
  
  case $col in
    a ) o=1;;
    b ) o=2;;
    c ) o=3;;
    d ) o=4;;
    e ) o=5;;
    f ) o=6;;
    g ) o=7;;
    h ) o=8;;
    i ) o=9;;
    j ) o=10;;
  esac

  #Mensajes de error o acierto en base a la coordenada que se elija
  i=$(((fil*10)+o))

  esCasillaLibre $i $(shuf -i 0-5 -n 1)

  if [[ $casillaDisponible -eq 1 ]] || [[ ! "$col" =~ [a-j] ]]; then
    printf '\n%s: %s\n' "Error:" "Casilla no permitida."
  else
    obtenerMinas
    creaTablero
    obtenerCeldasLibres
    if [[ "$m" = "X" ]]; then
      printf '\n\n\t%s: %s %d\n' "HAS PERDIDO" "Tu puntuación: " "$puntos"
      printf '\n\n\t%s\n\n' "Te quedaron solo $celdasLibres casillas del tablero sin destapar." 
      exit 0
    elif [[ $celdasLibres -eq 0 ]]; then
        printf '\n\n\t%s: %s %d\n' "HAS GANADO!" "Tu puntuación: " "$puntos"
        exit 0
    fi
  fi

}

#---------------------------LOGICA JUGADOR------------------------

#------------LOGICA CALCULO CAMPO MINADO DISPONIBLE---------------









#------------LOGICA CALCULO CAMPO MINADO DISPONIBLE---------------

#------------------------------------MAIN--------------------------


menuUntil

trap tiempoEspera INT

uso
creaTablero

while true; do
  read -p "Introduce una coordenada: " opcion
  obtenerCoordenadas
done
#menu




#menuSwitch
# menu1

#-----------------------------FREE MAIN---------------------------
