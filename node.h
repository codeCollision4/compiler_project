#ifndef NODE_H
#define NODE_H


enum nodeTypes {prog, declare, type, stateSeq, state, asgn, rInt, ifstmt, elsestmt, whilestmt, expr, sexpr, term, fact, wInt};

typedef struct nodeTag {
    int data;
    int nodeType;
    struct nodeTag *first;
    struct nodeTag *second;
    struct nodeTag *third;
} node, *Tree;



Tree make_node(char* str, int val, int type_id, Tree p1, Tree p2, Tree p3);
void print_tree(Tree t);

#endif