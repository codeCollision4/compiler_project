ex: exd
		lex proj.l
		yacc proj.y
		gcc proj.tab.c lex.yy.c -o ex

exd:	proj.l proj.y
		lex -d proj.l
		yacc -d proj.y
		gcc proj.tab.c lex.yy.c -o exd
	
clean:
		rm -f y.tab.c y.tab.h lex.yy.c exd ex
