%{
#include <stdio.h>
int lineno=1;
%}

%%

program printf("tok_program\t\t%d\n", lineno);
[if]	printf("tok_if\t\t%d\n", lineno);
[then]	printf("tok_then\t\t%d\n", lineno);
[end]	printf("tok_end\t\t%d\n", lineno);
\+	printf("tok_add\t\t%d\n", lineno);
[and]	printf("tok_and\t\t%d\n", lineno);
[:=]	printf("tok_equal\t\t%d\n",lineno);

[a-zA-Z]+	printf("tok_id\t\t%s\t%d\n", yytext, lineno);
[0-9]+		printf("tok_number\t%s\t%d\n", yytext, lineno);

[ \t]+	;
\n 	lineno++;
.	{
	printf("Nerozpoznano\t%s\t%d\n",yytext,lineno);
	yyterminate();
}


%%

int main(void)
{
	printf("TOKEN\t\tATTRI\tLINE NO\n");
	yylex();
	printf("%d lines tokenized without problems. End of input reached.\n", lineno-1);
	return 0;
}