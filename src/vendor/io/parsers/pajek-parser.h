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

#ifndef YY_IGRAPH_PAJEK_YY_SRC_VENDOR_IO_PAJEK_PARSER_H_INCLUDED
# define YY_IGRAPH_PAJEK_YY_SRC_VENDOR_IO_PAJEK_PARSER_H_INCLUDED
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
    NEWLINE = 258,                 /* "end of line"  */
    NUM = 259,                     /* "number"  */
    ALNUM = 260,                   /* "word"  */
    QSTR = 261,                    /* "quoted string"  */
    NETWORKLINE = 262,             /* "*Network line"  */
    VERTICESLINE = 263,            /* "*Vertices line"  */
    ARCSLINE = 264,                /* "*Arcs line"  */
    EDGESLINE = 265,               /* "*Edges line"  */
    ARCSLISTLINE = 266,            /* "*Arcslist line"  */
    EDGESLISTLINE = 267,           /* "*Edgeslist line"  */
    MATRIXLINE = 268,              /* "*Matrix line"  */
    ERROR = 269,                   /* ERROR  */
    VP_X_FACT = 270,               /* VP_X_FACT  */
    VP_Y_FACT = 271,               /* VP_Y_FACT  */
    VP_PHI = 272,                  /* VP_PHI  */
    VP_R = 273,                    /* VP_R  */
    VP_Q = 274,                    /* VP_Q  */
    VP_IC = 275,                   /* VP_IC  */
    VP_BC = 276,                   /* VP_BC  */
    VP_BW = 277,                   /* VP_BW  */
    VP_LC = 278,                   /* VP_LC  */
    VP_LA = 279,                   /* VP_LA  */
    VP_LR = 280,                   /* VP_LR  */
    VP_LPHI = 281,                 /* VP_LPHI  */
    VP_FOS = 282,                  /* VP_FOS  */
    VP_FONT = 283,                 /* VP_FONT  */
    VP_URL = 284,                  /* VP_URL  */
    EP_H1 = 285,                   /* EP_H1  */
    EP_H2 = 286,                   /* EP_H2  */
    EP_W = 287,                    /* EP_W  */
    EP_C = 288,                    /* EP_C  */
    EP_P = 289,                    /* EP_P  */
    EP_A = 290,                    /* EP_A  */
    EP_S = 291,                    /* EP_S  */
    EP_A1 = 292,                   /* EP_A1  */
    EP_K1 = 293,                   /* EP_K1  */
    EP_A2 = 294,                   /* EP_A2  */
    EP_K2 = 295,                   /* EP_K2  */
    EP_AP = 296,                   /* EP_AP  */
    EP_L = 297,                    /* EP_L  */
    EP_LP = 298,                   /* EP_LP  */
    EP_LR = 299,                   /* EP_LR  */
    EP_LPHI = 300,                 /* EP_LPHI  */
    EP_LC = 301,                   /* EP_LC  */
    EP_LA = 302,                   /* EP_LA  */
    EP_FOS = 303,                  /* EP_FOS  */
    EP_FONT = 304                  /* EP_FONT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 116 "src/vendor/cigraph/src/io/pajek-parser.y"

  igraph_integer_t intnum;
  igraph_real_t    realnum;
  struct {
    char *str;
    size_t len;
  } string;
  char *dynstr;

#line 123 "src/vendor/io/pajek-parser.h"

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


#endif /* !YY_IGRAPH_PAJEK_YY_SRC_VENDOR_IO_PAJEK_PARSER_H_INCLUDED  */
