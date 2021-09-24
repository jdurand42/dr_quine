#include <stdio.h>

/*
	commentaire hors du main
*/

void f(char *s)
{
	printf(s, 10, s, 34);
}

int main()
{
	/*
		commentaire dans le main
	*/
	char *s = "#include <stdio.h>%1$c%1$c/*%1$c	commentaire hors du main%1$c*/%1$c%1$cvoid f(char *s)%1$c{%1$c	printf(s, 10, s, 34);%1$c}%1$c%1$cint main()%1$c{%1$c	/*%1$c		commentaire dans le main%1$c	*/%1$c	char *s = %3$c%2$s%3$c;%1$c	f(s);%1$c}%1$c";
	f(s);
}
