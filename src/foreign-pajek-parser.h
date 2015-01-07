/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
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
     NEWLINE = 258,
     NUM = 259,
     ALNUM = 260,
     QSTR = 261,
     PSTR = 262,
     NETWORKLINE = 263,
     VERTICESLINE = 264,
     ARCSLINE = 265,
     EDGESLINE = 266,
     ARCSLISTLINE = 267,
     EDGESLISTLINE = 268,
     MATRIXLINE = 269,
     VP_X_FACT = 270,
     VP_Y_FACT = 271,
     VP_IC = 272,
     VP_BC = 273,
     VP_LC = 274,
     VP_LR = 275,
     VP_LPHI = 276,
     VP_BW = 277,
     VP_FOS = 278,
     VP_PHI = 279,
     VP_R = 280,
     VP_Q = 281,
     VP_LA = 282,
     VP_FONT = 283,
     VP_URL = 284,
     VP_SIZE = 285,
     EP_C = 286,
     EP_S = 287,
     EP_A = 288,
     EP_W = 289,
     EP_H1 = 290,
     EP_H2 = 291,
     EP_A1 = 292,
     EP_A2 = 293,
     EP_K1 = 294,
     EP_K2 = 295,
     EP_AP = 296,
     EP_P = 297,
     EP_L = 298,
     EP_LP = 299,
     EP_LR = 300,
     EP_LPHI = 301,
     EP_LC = 302,
     EP_LA = 303,
     EP_SIZE = 304,
     EP_FOS = 305
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 2068 of yacc.c  */
#line 123 "src/foreign-pajek-parser.y"

  long int intnum;
  double   realnum;  
  struct {
    char *str;
    int len;
  } string;  



/* Line 2068 of yacc.c  */
#line 111 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif



#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
} YYLTYPE;
# define yyltype YYLTYPE /* obsolescent; will be withdrawn */
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif



