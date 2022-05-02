a.out: exd
		lex proj.l
		yacc proj.y
		gcc y.tab.c lex.yy.c node.c -o a.out

exd:	proj.l proj.y
		lex -d proj.l
		yacc -d proj.y
		gcc y.tab.c lex.yy.c node.c -o exd
	
clean:
		rm -f y.tab.c y.tab.h lex.yy.c exd a.out
