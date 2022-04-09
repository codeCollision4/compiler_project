%{
    /* definitions */  
#include <stdio.h>
#include <string.h>
#include <math.h>
#include "y.tab.h"
int yylex();
int yywrap();
int yyerror(char* str);
%}

 /* Processing top most level ie program */
%start program

 /* Union of all data types used by yylval */
%union { int num; char* str; }

 /* tokens here */
%token<num> NUM INT BOOL BOOLLIT
%token<str> IDENT
%token LP RP ASGN SC OP2 OP3 OP4
%token WRITEINT READINT
%token IF THEN ELSE BEG END WHILE DO PROGRAM VAR AS

 /* Non terminals */
 /* %type program declarations statementSequence type
 %type statement assignment ifStatement whileStatement
 %type writeInt expression elseClause simpleExpression
 %type term factor */

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

 /* C Function bodies/main runs yyparse */

int main()
{
    printf("Compilation Started: \n\n");
    int res = yyparse();
    printf("Compilation Ended...");
    return res;

}