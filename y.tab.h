/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     NUM = 258,
     INT = 259,
     BOOL = 260,
     BOOLLIT = 261,
     IDENT = 262,
     LP = 263,
     RP = 264,
     ASGN = 265,
     SC = 266,
     OP2 = 267,
     OP3 = 268,
     OP4 = 269,
     WRITEINT = 270,
     READINT = 271,
     IF = 272,
     THEN = 273,
     ELSE = 274,
     BEG = 275,
     END = 276,
     WHILE = 277,
     DO = 278,
     PROGRAM = 279,
     VAR = 280,
     AS = 281
   };
#endif
/* Tokens.  */
#define NUM 258
#define INT 259
#define BOOL 260
#define BOOLLIT 261
#define IDENT 262
#define LP 263
#define RP 264
#define ASGN 265
#define SC 266
#define OP2 267
#define OP3 268
#define OP4 269
#define WRITEINT 270
#define READINT 271
#define IF 272
#define THEN 273
#define ELSE 274
#define BEG 275
#define END 276
#define WHILE 277
#define DO 278
#define PROGRAM 279
#define VAR 280
#define AS 281




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 16 "proj.yacc"
{ int num; char* str; }
/* Line 1529 of yacc.c.  */
#line 103 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

