CC = gcc -g
LIBS = -lfl
LEX = flex -I 
CFLAGS = -DYYDEBUG=1

all:  spustitelny  

spustitelny: lex.yy.c 
	${CC} -o spustitelny lex.yy.c ${LIBS}

lex.yy.c: lex.l
	${LEX} -s -o lex.yy.c lex.l

comment: comment.yy.c 
	${CC} -o comment comment.yy.c ${LIBS}

comment.yy.c: comment.l
	${LEX} -s -o comment.yy.c comment.l

clean: 
	rm lex.yy.c
	rm spustitelny
	rm comment
	rm comment.yy.c
	