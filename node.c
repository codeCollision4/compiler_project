#include "node.h"
#include <stdlib.h>
#include <stdio.h>

Tree make_node(char* str, int val, int type_id, Tree p1, Tree p2, Tree p3)
{
    Tree t;
    t = (Tree)malloc(sizeof(node));
    t->data = val;
    t->nodeType = type_id;
    t->first = p1;
    t->second = p2;
    t->third = p3;
    return(t);
}

void print_tree(Tree t)
{
    if (t == NULL) return;
    printf("Data: %d", t->data);
    printf(" TypeID: %d\n", t->nodeType);
    print_tree(t->first);
    print_tree(t->second);
    print_tree(t->third);

}