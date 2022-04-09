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


({DIGIT})+  { printf("%s (%d) - num\n", yytext, atoi(yytext)); col+=strlen(yytext); yylval.num=atoi(yytext); return (NUM); }
false|true { printf("%s - boollit\n", yytext); col+=strlen(yytext); if (strcmp(yytext, "false") == 0) yylval.num = 0; if (strcmp(yytext, "true") == 0) yylval.num = 1; return (BOOLLIT); }
{ID} { printf("%s - ident\n", yytext); col+=strlen(yytext); strcpy(yylval.str, yytext); return (IDENT);}


"(" { printf("%s - LP\n", yytext); return (LP);}
")" { printf("%s - RP\n", yytext); return (RP);}
":=" { printf("%s - ASGN\n", yytext); return (ASGN);}
";" { printf("%s - SC\n", yytext); return (SC);}
"*"|div|mod { printf("%s - OP2\n", yytext); return (OP2);}
"+"|"-" { printf("%s - OP3\n", yytext); return (OP3);}
"="|"!="|"<"|">"|"<="|">=" { printf("%s - OP4\n", yytext); return (OP4);}

writeInt { printf("%s - WRITEINT\n", yytext); return (WRITEINT);}
readInt { printf("%s - READINT\n", yytext); return (READINT);}

if { printf("%s - IF\n", yytext); return (IF);}
then { printf("%s - THEN\n", yytext); return (THEN);}
else { printf("%s - ELSE\n", yytext); return (ELSE);}
begin { printf("%s - BEGIN\n", yytext); return (BEG);}
end { printf("%s - END\n", yytext); return (END);}
while { printf("%s - WHILE\n", yytext); return (WHILE);}
do { printf("%s - DO\n", yytext); return (DO);}
program { printf("%s - PROGRAM\n", yytext); return (PROGRAM);}
var { printf("%s - VAR\n", yytext); return (VAR);}
as { printf("%s - AS\n", yytext); return (AS);}
int { printf("%s - INT\n", yytext); return (INT);}
bool { printf("%s - BOOl\n", yytext); return (BOOL);}

 /* eat up one-line comments */
{COMMENT}  {    }  

 /* Add to row for each newline and then reset col */
[\n] { row++; col=0; }

 /* eat up whitespace */
{WHITESPACE}   {    }  

 

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
    return (1);
}

int main() {

    // Reading from file
    FILE *fp;
    fp = fopen("test_input.txt","r");
    yyin = fp;

    // Running rules
    yylex();

    return 0;
}