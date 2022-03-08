%{
    /* definitions */  
#include <stdio.h>
#include <math.h>  

%}

DIGIT   [0-9]
ID	    [A-Z][A-Z0-9]*

%%
    /* Rules */


{DIGIT}+  {printf("%s (%d) - num\n", yytext, atoi(yytext));}
false|true {printf("%s - boollit\n", yytext);}
{ID} {printf("%s - ident\n", yytext);}


"(" {printf("%s - LP\n", yytext);}
")" {printf("%s - RP\n", yytext);}
":=" {printf("%s - ASGN\n", yytext);}
";" {printf("%s - SC\n", yytext);}
"*"|div|mod {printf("%s - OP2\n", yytext);}
"+"|"-" {printf("%s - OP3\n", yytext);}
"="|"!="|"<"|">"|"<="|">=" {printf("%s - OP4\n", yytext);}

writeInt {printf("%s - WRITEINT\n", yytext);}
readInt {printf("%s - READINT\n", yytext);}

if {printf("%s - IF\n", yytext);}
then {printf("%s - THEN\n", yytext);}
else {printf("%s - ELSE\n", yytext);}
begin {printf("%s - BEGIN\n", yytext);}
end {printf("%s - END\n", yytext);}
while {printf("%s - WHILE\n", yytext);}
do {printf("%s - DO\n", yytext);}
program {printf("%s - PROGRAM\n", yytext);}
var {printf("%s - VAR\n", yytext);}
as {printf("%s - AS\n", yytext);}
int {printf("%s - INT\n", yytext);}
bool {printf("%s - BOOl\n", yytext);}


"{"[^}\n]*"}"     /* eat up one-line comments */
[ \t\n]+	     /* eat up whitespace */
. printf( "Unrecognized character: %s\n", yytext );

%%

int yywrap(){}

int main() {

    // Reading from file
    FILE *fp;
    fp = fopen("test_input.txt","r");
    yyin = fp;

    // Running rules
    yylex();

    return 0;
}