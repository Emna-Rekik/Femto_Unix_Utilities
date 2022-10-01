#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	char cwd[100];
	
	if(argc < 2)
	{
		fprintf(stderr,"usage: %s <text>\n", argv[0]);
		exit(-1);
	}
	
	for  (int i=1; i < argc; i++)
	{
		printf("%s ", argv[i]);
	}
	printf("\n");
	
	return 0;	
}

