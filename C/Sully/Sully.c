#include <stdio.h>
#include <stdlib.h>

#define S "#include <stdio.h>%1$c#include <stdlib.h>%1$c%1$c#define S %2$c%4$s%2$c%1$c%1$cint main()%1$c{%1$c	int d = %5$d;%1$c%1$c	char path[126];%1$c	char name[126];%1$c	char executable[126];%1$c	char compile[126];%1$c%1$c	d -= 1;%1$c	sprintf(path, %2$cSully_%3$cd.c%2$c, d);%1$c	sprintf(name, %2$cSully_%3$cd%2$c, d);%1$c	sprintf(compile, %2$cgcc -Wall -Wextra -Werror -o %3$cs %3$cs%2$c, name, path);%1$c	sprintf(executable, %2$c./%3$cs%2$c, name);%1$c	FILE *file;%1$c	file = fopen(path, %2$cw%2$c);%1$c	if (!file)%1$c		return (1);%1$c	fprintf(file, S, 10, 34, 37, S, d);%1$c	fclose(file);%1$c	system(compile);%1$c	if (d)%1$c		system(executable);%1$c	return (0);%1$c}%1$c"

int main()
{
	int d = 5;

	char path[126];
	char name[126];
	char executable[126];
	char compile[126];

	d -= 1;
	sprintf(path, "Sully_%d.c", d);
	sprintf(name, "Sully_%d", d);
	sprintf(compile, "gcc -Wall -Wextra -Werror -o %s %s", name, path);
	sprintf(executable, "./%s", name);
	FILE *file;
	file = fopen(path, "w");
	if (!file)
		return (1);
	fprintf(file, S, 10, 34, 37, S, d);
	fclose(file);
	system(compile);
	if (d)
		system(executable);
	return (0);
}
