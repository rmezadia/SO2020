
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
//Programa muestre dos proceso hijos, que muestre
//cada uno su identificador de proceso y el de su padre.
//Entonces:
//Proceso hijo1: Recibira la señal SIGUSR1, 
//si la recibe ejecutara una funcion donde visualizara que ha recibido
//dicha señal
//Luego, envia a su padre la señal SIGUSR2 y finalizara.

q(){

	printf("Se a producido  la  señal SIGUSR1\n");
	exit(2);

}
 p(){

	printf("Se ha producido la señal SIGUSR2\n");
	exit(2);
}
//
//main(){

//	signal(SIGUSR1,q);
//	signal(SIGUSR2,p);
//	while(1); //Bucle infinito.
//}
//**/

int main(int argc ,char *argv[]){
	
	int p;
	int idHijo1;
	printf("Soy: %d y mi padre es: %d\n",getpid(),getppid());
	p=fork();

	//Proceso hijo1
	if(p==0){
		//Esto va antes del printf siempre
		signal(SIGUSR1,q);
		signal(SIGUSR2,p);
		printf("El valor de la variable del proceso hijo: %d\n ",getpid(),getppid());
		
		while(1){

			sleep(0.4);
			printf("Estoy esperando a recibir la señal.");
		}
		
		exit(0);
	}
	
	//Proceso padre
	else{
		
		idHijo1=fork(); //0 peoceso nuevo >0 proceso padre.
		//En este caso en la p de arriba se guarda el identificador del proceso 1.
		printf("El valor de la variable del proceso hijo: %d\n ",getpid(),getppid(),idHijo1);
		signal(SIGUSR2,p);
		//exit(0);

		//TERMINAR.
		wait(&status);
		wait(&status);



		//Proceso hijo 2
	    if(p==0){
	    	
	    	printf("Soy: %d\n y mi padre es: %d\n",getpid(),getppid());
	    	exit(0);
		}

	    exit(0);
	    
	}
}