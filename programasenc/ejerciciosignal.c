#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <signal.h>

//Arma la señal y la ejecuta en el proceso que se esta armando.
void q(){
	printf("Se a producido  la  señal SIGQUIT\n");
	exit(2);
		
}
void p(){
	printf("Se ha producido la señal SIGINT\n");
	//exit(2);
}
void m(){
	//El barra n ayuda a que se muestre enseguida y no al final del programa.
	printf("Se ha producido la señal SIGALRM\n");
	alarm(2);
}
int main(int argc ,char *argv[]){
	
	signal(SIGQUIT,q);
	signal(SIGINT,p);
	signal(SIGALRM,m);
	alarm(2);
	while(1){
		//printf("Hola");
		//sleep(1);
		alarm(2);
	} 

}




