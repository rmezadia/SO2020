//Tema procesos 6 Nov 2020
//A partir pagina de señales

//rm fichero para remover 


//Señales, es un mecanismo que se puede usar
//para la comunicacion de procesos.Este mecanismo
//es para procesos pesados como los que vemos en esta asignatura.
//Las señales ayudan a que uno se entere de algo.

//kill -l  te muestra la lista de de señales que se 
//le puede enviar un proceso. Porjemplo kill 9, se va a la lista y el num 9 
//equivale a SIGKILL
//El numero deproceso es el pid
//Antes debemos saber que proceso queremos terminar

//con ps -ef 
//Se puede poner tambien: ps -ef|more para que el proceso quede ahí.  
//La sintaxis es: kill -9 numerodeproceso

//14)SIGALRM fucniones de tiuempo
//19)SIGSTOP para el proceso pero no lo acaba.
//3)SIGSQUIT para el proceso pero no lo acaba.
//19)SIGPIPE PARA 
//20) SIGUSR1 Y SIGUSR2 para que el usuario haga con ellas lo que quieras.


//La funcion signal indica una señal al sistema

//Sintaxis: signal(numerodeseñal,funcion)
//sig_ign ignora la señal
//No poner la señal signal dentro de un bucle.


//En cambio, los semaforos, no son un mecanismo
//porque se trabaja con hilos y no con procesos pesados.