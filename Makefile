CC = gcc -g
LIBS = -lfl
LEX = flex -I 
CFLAGS = -DYYDEBUG=1

all:  spustitelny  

spustitelny: lex.yy.c 
	${CC} -o spustitelny lex.yy.c ${LIBS}

lex.yy.c: lex.l
	${LEX} -s -o lex.yy.c lex.l

clean: 
	rm lex.yy.c
	rm spustitelny