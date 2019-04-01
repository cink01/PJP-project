%{
#include <stdio.h>

%}

%s COMMENT

%%

<INITIAL>"\;"	BEGIN COMMENT; 
<INITIAL>.	ECHO;
<INITIAL>"\n" 	ECHO;
<COMMENT>"\;"	BEGIN INITIAL;
<COMMENT>.	;
<COMMENT>"\n" 	;

%%

int main(void)
{
	yylex();
	return 0;
}