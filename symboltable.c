#include "symboltable.h"


struct SymTableEntry *symtable = NULL;

void add_id(char *id, int init, int type) {
    struct SymTableEntry *s;
    HASH_FIND_STR(symtable, id, s);  /* id already in the hash? */
    if (s == NULL) {
      s = (struct SymTableEntry *)malloc(sizeof *s);
      strcpy(s->identifier, id);
      HASH_ADD_STR(symtable, identifier, s);  /* id: name of key field */
    }
    s->init = init;
    s->type = type;
}

struct SymTableEntry *find_id(char* id){
    struct SymTableEntry *s;

    HASH_FIND_STR(symtable, id, s);
    return (s);
}