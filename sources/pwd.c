#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

int main(int argc, char **argv)
{
	char cwd[100];
	
	if(argc != 1)
	{
		fprintf(stderr,"usage: %s\n", argv[0]);
		exit(-1);
	}
	
	if (getcwd(cwd, sizeof(cwd)) == NULL)
	{
		fprintf(stderr,"error= %i\n",errno);
		perror("Error msg");
	}
	else
	{
		printf("%s\n",cwd);
	}
	
	return 0;	
}
