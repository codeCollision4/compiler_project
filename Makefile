a.out:
		lex projlex.lex
		gcc lex.yy.c -o a.out