%{
    /* definitions */  
#include <stdio.h>
#include <string.h>
#include <math.h>
#include "y.tab.h"
int yylex(void);
int yywrap();
int yyerror(char* str);
%}

 /* Processing top most level ie program */
%start program

 /* Union of all data types used by yylval */
%union { int num; bool boollit; char* str; }

 /* tokens here */
%token<num> 
%token<boollit>
%token<str>

 /* Non terminals */
%type

%%

 /* parser rules */

%%

 /* C Function bodies/main runs yyparse */

int main()
{
    printf("Compilation Started: \n\n")
    int res = yyparse();
    printf("Compilation Ended...")
    return res;

}