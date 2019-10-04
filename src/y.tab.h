
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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
     UPDATE = 258,
     SET = 259,
     WHERE = 260,
     ORDER = 261,
     BY = 262,
     ASC = 263,
     DESC = 264,
     LIMIT = 265,
     AND = 266,
     OR = 267,
     DEFAULT = 268,
     KEYWORD = 269,
     IDENTIFIER = 270,
     STRING_LITERAL = 271,
     NEGATIVE_DIGIT = 272,
     POSITIVE_DIGIT = 273,
     FLOAT = 274,
     DATE = 275,
     COMPARISION_OPERATOR = 276,
     UMINUS = 277
   };
#endif
/* Tokens.  */
#define UPDATE 258
#define SET 259
#define WHERE 260
#define ORDER 261
#define BY 262
#define ASC 263
#define DESC 264
#define LIMIT 265
#define AND 266
#define OR 267
#define DEFAULT 268
#define KEYWORD 269
#define IDENTIFIER 270
#define STRING_LITERAL 271
#define NEGATIVE_DIGIT 272
#define POSITIVE_DIGIT 273
#define FLOAT 274
#define DATE 275
#define COMPARISION_OPERATOR 276
#define UMINUS 277




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


