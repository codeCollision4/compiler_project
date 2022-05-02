#ifndef SYMBOL_H
#define SYMBOL_H
#include "uthash.h"


struct SymTableEntry {
    char identifier[50]; //Id string
    int init; // 0 for not, 1 for initialized
    int type; // uses enum above
    UT_hash_handle hh;
};

struct SymTableEntry *find_id(char* id);
void add_id(char *id, int init, int type);




#endif