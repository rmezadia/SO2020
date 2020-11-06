
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <signal.h>

int q(){
	printf("Se a producido  la  señal SIGQUIT\n");
	//exit(2);
	//Ahora comentaremos la funcion ecit
	//Ahora 

}
int p(){
	printf("Se ha producido la señal SIGINT\n");
	exit(2);
}
int main(int argc ,char  *argv[]){
	signal(SIGQUIT,q);
	signal(SIGINT,p);
	//Ahora quitamos 
	while(1){
		printf("Hola");
		sleep(1);
	} 

}