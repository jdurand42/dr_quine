#include <stdio.h>
#include <unistd.h>

#define S "#include <stdio.h>%1$c#include <unistd.h>%1$c%1$c#define S %2$c%3$s%2$c%1$c#define F()%4$c%1$c%5$cint main()%4$c%1$c%5$c{%4$c%1$c%5$c%5$cFILE *file;%4$c%1$c%5$c%5$cfile = fopen(%2$cGrace_kid.c%2$c, %2$cw%2$c);%4$c%1$c%5$c%5$cif (!file)%4$c%1$c%5$c%5$c%5$creturn (1);%4$c%1$c%5$c%5$cfprintf(file, S, 10, 34, S, 92, 9);%4$c%1$c%5$c%5$cfclose(file);%4$c%1$c%5$c%5$creturn (0);%4$c%1$c%5$c}%1$c%1$cF();%1$c/*%1$c%5$cOn rigole beaucoup%1$c*/%1$c"
#define F()\
	int main()\
	{\
		FILE *file;\
		file = fopen("Grace_kid.c", "w");\
		if (!file)\
			return (1);\
		fprintf(file, S, 10, 34, S, 92, 9);\
		fclose(file);\
		return (0);\
	}

F();
/*
	On rigole beaucoup
*/
