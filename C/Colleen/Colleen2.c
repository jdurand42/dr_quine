#include <stdio.h>

/*
commentaire hors du main
*/

void f()
{
	return ;
}

int main()
{
	/*
	commentaire dans le main
	*/
	char *s = "#include <stdio.h>%1$c%1$c/*%1$ccommentaire hors du main%1$c*/%1$c%1$cvoid f()%1$c{%1$c	return ;%1$c}%1$c%1$cint main()%1$c{%1$c	/*%1$c	commentaire dans le main%1$c	*/%1$c	char *s = %3$c%2$s%3$c;%1$c	printf(s, 10, s, 34);%1$c	f();%1$c}%1$c";
	printf(s, 10, s, 34);
	f();
}
