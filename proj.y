%{
    /* definitions */  
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "node.h"
#include "symboltable.h"
#include <math.h>
#include "y.tab.h"
#define none -1
#define nostr ""
#define IDLENGTH 50
int yylex(void);
int yywrap();
int yyerror(char* str);
%}

 /* Processing top most level ie program */
%start program

 /* Union of all data types used by yylval */
%union { int num; char* str; Tree nodePtr;}

 /* tokens here */
%token<num> NUM 
%token<str> IDENT BOOLLIT OP2 OP3 OP4
%token LP RP ASGN SC INT BOOL 
%token WRITEINT READINT
%token IF THEN ELSE BEG END WHILE DO PROGRAM VAR AS

 /* Non terminals */
%type<nodePtr> program declarations statementSequence type
%type<nodePtr> statement assignment ifStatement whileStatement
%type<nodePtr> writeInt expression elseClause simpleExpression
%type<nodePtr> term factor 

%%

 /* parser rules */
program: PROGRAM declarations BEG statementSequence END
        {   Tree parseTree;
            parseTree = make_node(nostr, none, prog, $2, $4, NULL);
            print_tree(parseTree, 0);
        };
declarations: 
 /* empty */ {;}
| VAR IDENT AS type SC declarations
        {
            $$ = make_node(nostr, none, declare, $4, $6, NULL);

        };
type: INT
        {
            $$ = make_node(nostr, none, type, NULL, NULL, NULL);

        } 
        | BOOL
        {
            $$ = make_node(nostr, none, type, NULL, NULL, NULL);

        };
statementSequence: 
 /* empty */{;}
| statement SC statementSequence
        {
            $$ = make_node(nostr, none, stateSeq, $1, $3, NULL);

        };
statement: assignment 
        {
            $$ = make_node(nostr, none, state, $1, NULL, NULL);

        }| ifStatement 
        {
            $$ = make_node(nostr, none, state, $1, NULL, NULL);

        }| whileStatement
        {
            $$ = make_node(nostr, none, state, $1, NULL, NULL);

        } | writeInt
        {
            $$ = make_node(nostr, none, state, $1, NULL, NULL);

        };
assignment: IDENT ASGN expression 
        {
            $$ = make_node(nostr, none, asgn, $3, NULL, NULL);

        }| IDENT ASGN READINT
        {
            $$ = make_node(nostr, none, rInt, NULL, NULL, NULL);

        };
ifStatement: IF expression THEN statementSequence elseClause END
        {
            $$ = make_node(nostr, none, ifstmt, $2, $4, $5);

        };
elseClause: 
 /* empty */{;}
| ELSE statementSequence
        {
            $$ = make_node(nostr, none, elsestmt, $2, NULL, NULL);

        };
whileStatement: WHILE expression DO statementSequence END
        {
            $$ = make_node(nostr, none, whilestmt, $2, $4, NULL);

        };
writeInt: WRITEINT expression
        {
            $$ = make_node(nostr, none, wInt, $2, NULL, NULL);

        };
expression: simpleExpression 
        {
            $$ = make_node(nostr, none, expr, $1, NULL, NULL);

        }| simpleExpression OP4 simpleExpression
        {
            $$ = make_node(nostr, none, OP4expr, $1, $3, NULL);

        };
simpleExpression: term OP3 term 
        {
            $$ = make_node(nostr, none, OP3sexpr, $1, $3, NULL);

        }| term
        {
            $$ = make_node(nostr, none, sexpr, $1, NULL, NULL);

        };
term: factor OP2 factor 
        {
            $$ = make_node(nostr, none, OP2term, $1, $3, NULL);

        }| factor
        {
            $$ = make_node(nostr, none, term, $1, NULL, NULL);

        };
factor: IDENT 
        {
            $$ = make_node($1, none, ifact, NULL, NULL, NULL);

        }| NUM 
        {
            $$ = make_node(nostr,none, nfact, NULL, NULL, NULL);

        }| BOOLLIT 
        {
            $$ = make_node($1, none, ifact, NULL, NULL, NULL);

        }| LP expression RP
        {
            $$ = make_node(nostr, none, fact, $2, NULL, NULL);

        };


%%


int main()
{
    printf("Compilation Started: \n\n");
    int res = yyparse();
    printf("Compilation Ended...");
    return res;
    
}
