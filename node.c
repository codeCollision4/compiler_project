#include "node.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

Tree make_node(char* str, int val, int type_id, Tree p1, Tree p2, Tree p3)
{
    Tree t;
    t = (Tree)malloc(sizeof(node));
    t->data = val;
    strcpy(t->str,str);
    t->nodeType = type_id;
    t->first = p1;
    t->second = p2;
    t->third = p3;
    return(t);
}

char *nodeNames[] = {"prog", "declare", "type", "stateSeq", "state", "asgn", "rInt", "ifstmt", "elsestmt", "whilestmt", "expr", "OP4expr", "OP3sexpr", "sexpr", "OP2term", "term", "ifact", "nfact", "fact", "wInt"};

void print_tree(Tree t, int indent)
{
    if (t == NULL) return;
    for (int i=indent; i; i--) printf(" ");
    if(t->nodeType == nfact)
        printf("Num: %d", t->data);
    else if (t->nodeType == ifact)
        printf("Identifier: %s ", t->str);
    if (t->data != -1) printf("More Data: %d ", t->data);
    if (t->nodeType < 0 || t->nodeType > 19){
        printf(" Unknown NodeType: %d\n", t->nodeType);
    }
    else{
        printf("%s\n", nodeNames[t->nodeType]);
    }
    
    print_tree(t->first, indent+3);
    print_tree(t->second, indent+3);
    print_tree(t->third, indent+3);

}