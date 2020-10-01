#Uso de variables especiales de shell script

echo "*= " $*
echo "$=" $$
echo "#=" $#
echo "0=" $0
echo "1=" $1
#Desplaza una casilla a la derecha.
shift 		
echo $1

