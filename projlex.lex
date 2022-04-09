%{
    /* definitions */  
#include <stdio.h>
#include <math.h>
#include "y.tab.h"
extern YYSTYPE yylval;
int yywrap();
int yyerror(char* str);
int col=0;
int row=0;
int idents=0;
%}

DIGIT      [0-9]
ID	       [A-Z][A-Z0-9]*   
COMMENT    "{"[^}\n]*"}"
WHITESPACE [ \t\n]+

%%
    /* Rules */


({DIGIT})+  { printf("%s (%d) - num\n", yytext, atoi(yytext)); col+=strlen(yytext); yylval.num=atoi(yytext); return (num) }
false|true { printf("%s - boollit\n", yytext); col+=strlen(yytext); yylval.str=yytext; return (boollit) }
{ID} { printf("%s - ident\n", yytext); col+=strlen(yytext); strcpy(yylval, yytext); return (ident)}


"(" { printf("%s - LP\n", yytext); }
")" { printf("%s - RP\n", yytext); }
":=" { printf("%s - ASGN\n", yytext); }
";" { printf("%s - SC\n", yytext); }
"*"|div|mod { printf("%s - OP2\n", yytext); }
"+"|"-" { printf("%s - OP3\n", yytext); }
"="|"!="|"<"|">"|"<="|">=" { printf("%s - OP4\n", yytext); }

writeInt { printf("%s - WRITEINT\n", yytext); }
readInt { printf("%s - READINT\n", yytext); }

if { printf("%s - IF\n", yytext); }
then { printf("%s - THEN\n", yytext); }
else { printf("%s - ELSE\n", yytext); }
begin { printf("%s - BEGIN\n", yytext); }
end { printf("%s - END\n", yytext); }
while { printf("%s - WHILE\n", yytext); }
do { printf("%s - DO\n", yytext); }
program { printf("%s - PROGRAM\n", yytext); }
var { printf("%s - VAR\n", yytext); }
as { printf("%s - AS\n", yytext); }
int { printf("%s - INT\n", yytext); }
bool { printf("%s - BOOl\n", yytext); }

 /* eat up one-line comments */
{COMMENT}  {    }  

 /* eat up whitespace */
{WHITESPACE}   {    }  

 /* Add to row for each newline and then reset col */
([\n]) { row++; col=0; }

 /* Anything else is an error, return as a token for yacc to use */
.       { char errmsg[] = "Unrecognized character: x";
          errmsg[24] = yytext[0];
          yyerror(errmsg);
          return (yytext[0]); }

 
  /* printf( "Unrecognized character: %s\n", yytext ); */ 

%%

int yywrap(){ return(1); }

int yyerror(char* str){
    printf("***Error Detected: %s\n on/after row %d, col %d.", str, row, col);
};

int main() {

    // Reading from file
    FILE *fp;
    fp = fopen("test_input.txt","r");
    yyin = fp;

    // Running rules
    yylex();

    return 0;
}