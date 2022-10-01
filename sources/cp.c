#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>


int main(int argc, char **argv)
{
	
	if(argc != 3)
	{
		fprintf(stderr,"usage: %s <file1> <file2>\n", argv[0]);
		exit(-1);
	}
	
	char buffer[100];
	
	int dest_fd = open(argv[2], O_CREAT | O_WRONLY, 0644);
	if (dest_fd == -1)
	{
		printf("Error msg: Failed to create and open the file\n");
		fprintf(stderr,"error= %i\n",errno);
	}
	int src_fd = open(argv[1], O_RDONLY);
	if (src_fd == -1)
	{
		printf("Error msg: Failed to open the file\n");
		fprintf(stderr,"error= %i\n",errno);
	}
	
	int read_count;
	while ( (read_count = read(src_fd, buffer, 100)) > 0)
	{
		write(dest_fd, buffer, read_count);
	}
	
	close(dest_fd);
	close(src_fd);
	
	return 0;	
}

