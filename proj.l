%{
    /* definitions */  
#include <stdio.h>
#include "node.h"
#include "symboltable.h"
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
false|true { printf("%s - boollit\n", yytext); col+=strlen(yytext); if (strcmp(yytext, "false") == 0) yylval.str = "false"; if (strcmp(yytext, "true") == 0) yylval.str = "true"; return (BOOLLIT); }
{ID} { printf("%s - ident\n", yytext); col+=strlen(yytext); yylval.str = yytext;  add_id(yytext, 0, 0); return (IDENT);}
    /* col+=strlen(yytext); strcpy(yylval.str, yytext); */


"(" { printf("%s - LP\n", yytext); col+=strlen(yytext); return (LP);}
")" { printf("%s - RP\n", yytext); col+=strlen(yytext); return (RP);}
":=" { printf("%s - ASGN\n", yytext); col+=strlen(yytext); return (ASGN);}
";" { printf("%s - SC\n", yytext); col+=strlen(yytext); return (SC);}
"*"|div|mod { printf("%s - OP2\n", yytext); col+=strlen(yytext); yylval.str = yytext;return (OP2);}
"+"|"-" { printf("%s - OP3\n", yytext);  col+=strlen(yytext); yylval.str = yytext;return (OP3);}
"="|"!="|"<"|">"|"<="|">=" { printf("%s - OP4\n", yytext); col+=strlen(yytext); yylval.str = yytext; return (OP4);}

writeInt { printf("%s - WRITEINT\n", yytext); col+=strlen(yytext); return (WRITEINT);}
readInt { printf("%s - READINT\n", yytext); col+=strlen(yytext); return (READINT);}

if { printf("%s - IF\n", yytext); col+=strlen(yytext); return (IF);}
then { printf("%s - THEN\n", yytext); col+=strlen(yytext); return (THEN);}
else { printf("%s - ELSE\n", yytext); col+=strlen(yytext); return (ELSE);}
begin { printf("%s - BEGIN\n", yytext); col+=strlen(yytext); return (BEG);}
end { printf("%s - END\n", yytext); col+=strlen(yytext); return (END);}
while { printf("%s - WHILE\n", yytext); col+=strlen(yytext); return (WHILE);}
do { printf("%s - DO\n", yytext); col+=strlen(yytext); return (DO);}
program { printf("%s - PROGRAM\n", yytext); col+=strlen(yytext); return (PROGRAM);}
var { printf("%s - VAR\n", yytext); col+=strlen(yytext); return (VAR);}
as { printf("%s - AS\n", yytext); col+=strlen(yytext); return (AS);}
int { printf("%s - INT\n", yytext); col+=strlen(yytext); return (INT);}
bool { printf("%s - BOOl\n", yytext); col+=strlen(yytext); return (BOOL);}

 /* eat up one-line comments */
{COMMENT}  {  col+=strlen(yytext);  }  

 /* Add to row for each newline and then reset col */
[\n] { row++; col=0; }

 /* eat up whitespace */
{WHITESPACE}   {  col+=strlen(yytext);  }  

 

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

