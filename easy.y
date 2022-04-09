%{
#include <stdio.h>
int yylex(void);
int yyerror(char *);
%}

// Symbols.
%union { int num; char* str; }

 /* tokens here */
%token<num> NUM INT BOOL BOOLLIT
%token<str> IDENT
%token LP RP ASGN SC OP2 OP3 OP4
%token WRITEINT READINT
%token IF THEN ELSE BEG END WHILE DO PROGRAM VAR AS

%start program
%%

 /* parser rules */
program: PROGRAM declarations BEG statementSequence END;
declarations: VAR IDENT AS type SC declarations | ;
type: INT | BOOL;
statementSequence: statement SC statementSequence | ;
statement: assignment | ifStatement | whileStatement | writeInt;
assignment: IDENT ASGN expression | IDENT ASGN READINT;
ifStatement: IF expression THEN statementSequence elseClause END;
elseClause: ELSE statementSequence | ;
whileStatement: WHILE expression DO statementSequence END;
writeInt: WRITEINT expression;
expression: simpleExpression | simpleExpression OP4 simpleExpression;
simpleExpression: term OP3 term | term;
term: factor OP2 factor | factor;
factor: IDENT | NUM | BOOLLIT | LP expression RP;


%%
int yyerror(char *s) {
  printf("yyerror : %s\n",s);
}
int main(void) {
  yyparse();
   printf("SUCCESS\n");
}
int yywrap() {
}