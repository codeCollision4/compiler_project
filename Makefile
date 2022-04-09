ex: exd
		lex proj.lex
		yacc proj.yacc
		gcc y.tab.c lex.yy.c -o ex -v

exd:	proj.lex proj.yacc
		lex -d proj.lex
		yacc -d proj.yacc
		gcc y.tab.c lex.yy.c -o exd -v
	
clean:
		rm -f y.tab.c y.tab.h lex.yy.c exd ex