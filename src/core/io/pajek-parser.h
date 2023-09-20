/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_IGRAPH_PAJEK_YY_YY_TAB_H_INCLUDED
# define YY_IGRAPH_PAJEK_YY_YY_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int igraph_pajek_yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    END = 0,                       /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    NEWLINE = 258,                 /* NEWLINE  */
    NUM = 259,                     /* NUM  */
    ALNUM = 260,                   /* ALNUM  */
    QSTR = 261,                    /* QSTR  */
    PSTR = 262,                    /* PSTR  */
    NETWORKLINE = 263,             /* NETWORKLINE  */
    VERTICESLINE = 264,            /* VERTICESLINE  */
    ARCSLINE = 265,                /* ARCSLINE  */
    EDGESLINE = 266,               /* EDGESLINE  */
    ARCSLISTLINE = 267,            /* ARCSLISTLINE  */
    EDGESLISTLINE = 268,           /* EDGESLISTLINE  */
    MATRIXLINE = 269,              /* MATRIXLINE  */
    ERROR = 270,                   /* ERROR  */
    VP_X_FACT = 271,               /* VP_X_FACT  */
    VP_Y_FACT = 272,               /* VP_Y_FACT  */
    VP_IC = 273,                   /* VP_IC  */
    VP_BC = 274,                   /* VP_BC  */
    VP_LC = 275,                   /* VP_LC  */
    VP_LR = 276,                   /* VP_LR  */
    VP_LPHI = 277,                 /* VP_LPHI  */
    VP_BW = 278,                   /* VP_BW  */
    VP_FOS = 279,                  /* VP_FOS  */
    VP_PHI = 280,                  /* VP_PHI  */
    VP_R = 281,                    /* VP_R  */
    VP_Q = 282,                    /* VP_Q  */
    VP_LA = 283,                   /* VP_LA  */
    VP_FONT = 284,                 /* VP_FONT  */
    VP_URL = 285,                  /* VP_URL  */
    VP_SIZE = 286,                 /* VP_SIZE  */
    EP_C = 287,                    /* EP_C  */
    EP_S = 288,                    /* EP_S  */
    EP_A = 289,                    /* EP_A  */
    EP_W = 290,                    /* EP_W  */
    EP_H1 = 291,                   /* EP_H1  */
    EP_H2 = 292,                   /* EP_H2  */
    EP_A1 = 293,                   /* EP_A1  */
    EP_A2 = 294,                   /* EP_A2  */
    EP_K1 = 295,                   /* EP_K1  */
    EP_K2 = 296,                   /* EP_K2  */
    EP_AP = 297,                   /* EP_AP  */
    EP_P = 298,                    /* EP_P  */
    EP_L = 299,                    /* EP_L  */
    EP_LP = 300,                   /* EP_LP  */
    EP_LR = 301,                   /* EP_LR  */
    EP_LPHI = 302,                 /* EP_LPHI  */
    EP_LC = 303,                   /* EP_LC  */
    EP_LA = 304,                   /* EP_LA  */
    EP_SIZE = 305,                 /* EP_SIZE  */
    EP_FOS = 306                   /* EP_FOS  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 115 "src/core/io/pajek-parser.y"

  long int intnum;
  double   realnum;
  struct {
    char *str;
    int len;
  } string;

#line 124 "yy.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif




int igraph_pajek_yyparse (igraph_i_pajek_parsedata_t* context);


#endif /* !YY_IGRAPH_PAJEK_YY_YY_TAB_H_INCLUDED  */
