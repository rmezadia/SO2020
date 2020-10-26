//Como ejecutarlo gcc -o primerprograma primerprograma.c
// ./primerprograma1
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>

int main(int argc, char *argv[]){
	
	int p;
	int d = 6;
	printf("\n");
	printf("Soy el proceso padre con id %d y mi padre es %d \n" ,getpid(),getppid());
	printf("Voy a crear un proceso nuevo\n");
	printf("\n");
	
	p=fork(); //DOs procesos padee e hijo

	printf("Hola\n");
	
	//Proceso padre
	if(p<0){
		printf("Error");
		exit(0);
	}
	else{
		if(p==0){
			printf("\n");
			//Codigo que ejecuta unica y exclusivamente el proceso nuevo.
			printf("Soy el proceso padre con id %d y mi padre es %d \n" ,getpid(),getppid());
			printf("Estoy haciendo las tareas asignadas por mi padre\n");
			
			printf("Identificador de usuario real uid %d \n",getuid());
			printf("Identificador de grupo real %d \n",getgid());
			printf("Identificador de usuario efectivo propietario %d \n",geteuid());
			printf("Identificador de grupo efectivo %d \n",getegid());
			printf("Identificador del grupo del proceso %d \n",getpgrp());
			
			printf("\n");
			int i;
			for (int i = 0; i < 5; ++i)
			{
				printf("I = %d\n",i );
				printf("Variable d = %d \n",d );
				d=2;
				
			}
			printf("\n");
			exit(0);	

		}else{
			//int estado;
			//int pidHijoFin = wait(&estado);
			printf("\n");
			printf("%s\n", );
			//Codigo que tiene que ejecutar solo elproceso padre.
			printf("Identificador de usuario real uid %d \n",getuid());
			printf("Identificador de grupo real %d \n",getgid());
			printf("Identificador de usuario efectivo propietario %d \n",geteuid());
			printf("Identificador de grupoo efectivo %d \n",getegid());
			printf("Identificador del grupo del proceso %d \n",getpgrp());
			printf("\n");
			int i;
			double num;
			num=0.1;
			
			printf("%d\n",getuid());
			printf("%d\n",getgid());
			printf("%d\n",geteuid());
			printf("\n");
			for (int i = 0; i < 15; ++i)
			{
				printf("I_padre = %d\n",i );
				sleep(num);
			}
			printf("\n");
			printf("Padre variable d = %d \n",d );
			exit(0);
		}
	}
	
	
	
	exit(0);
}

