/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 1

/* Using locations.  */
#define YYLSP_NEEDED 1

/* Substitute the variable and function names.  */
#define yyparse igraph_pajek_yyparse
#define yylex   igraph_pajek_yylex
#define yyerror igraph_pajek_yyerror
#define yylval  igraph_pajek_yylval
#define yychar  igraph_pajek_yychar
#define yydebug igraph_pajek_yydebug
#define yynerrs igraph_pajek_yynerrs
#define yylloc igraph_pajek_yylloc

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     END = 0,
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
     ERROR = 270,
     VP_X_FACT = 271,
     VP_Y_FACT = 272,
     VP_IC = 273,
     VP_BC = 274,
     VP_LC = 275,
     VP_LR = 276,
     VP_LPHI = 277,
     VP_BW = 278,
     VP_FOS = 279,
     VP_PHI = 280,
     VP_R = 281,
     VP_Q = 282,
     VP_LA = 283,
     VP_FONT = 284,
     VP_URL = 285,
     VP_SIZE = 286,
     EP_C = 287,
     EP_S = 288,
     EP_A = 289,
     EP_W = 290,
     EP_H1 = 291,
     EP_H2 = 292,
     EP_A1 = 293,
     EP_A2 = 294,
     EP_K1 = 295,
     EP_K2 = 296,
     EP_AP = 297,
     EP_P = 298,
     EP_L = 299,
     EP_LP = 300,
     EP_LR = 301,
     EP_LPHI = 302,
     EP_LC = 303,
     EP_LA = 304,
     EP_SIZE = 305,
     EP_FOS = 306
   };
#endif
/* Tokens.  */
#define END 0
#define NEWLINE 258
#define NUM 259
#define ALNUM 260
#define QSTR 261
#define PSTR 262
#define NETWORKLINE 263
#define VERTICESLINE 264
#define ARCSLINE 265
#define EDGESLINE 266
#define ARCSLISTLINE 267
#define EDGESLISTLINE 268
#define MATRIXLINE 269
#define ERROR 270
#define VP_X_FACT 271
#define VP_Y_FACT 272
#define VP_IC 273
#define VP_BC 274
#define VP_LC 275
#define VP_LR 276
#define VP_LPHI 277
#define VP_BW 278
#define VP_FOS 279
#define VP_PHI 280
#define VP_R 281
#define VP_Q 282
#define VP_LA 283
#define VP_FONT 284
#define VP_URL 285
#define VP_SIZE 286
#define EP_C 287
#define EP_S 288
#define EP_A 289
#define EP_W 290
#define EP_H1 291
#define EP_H2 292
#define EP_A1 293
#define EP_A2 294
#define EP_K1 295
#define EP_K2 296
#define EP_AP 297
#define EP_P 298
#define EP_L 299
#define EP_LP 300
#define EP_LR 301
#define EP_LPHI 302
#define EP_LC 303
#define EP_LA 304
#define EP_SIZE 305
#define EP_FOS 306




/* Copy the first part of user declarations.  */
#line 23 "src/core/io/pajek-parser.y"


/*
   IGraph library.
   Copyright (C) 2006-2012  Gabor Csardi <csardi.gabor@gmail.com>
   334 Harvard st, Cambridge, MA, 02138 USA

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
   02110-1301 USA

*/

#include <stdio.h>
#include <string.h>
#include <math.h>

#include "igraph_types.h"
#include "igraph_memory.h"
#include "igraph_error.h"
#include "igraph_attributes.h"
#include "config.h"

#include "core/math.h"
#include "io/pajek-header.h"
#include "io/pajek-parser.h" /* it must come first because of YYSTYPE */
#include "io/pajek-lexer.h"
#include "internal/hacks.h"

int igraph_pajek_yyerror(YYLTYPE* locp,
                         igraph_i_pajek_parsedata_t *context,
                         const char *s);

int igraph_i_pajek_add_string_vertex_attribute(const char *name,
                                               const char *value,
                                               int len,
                                               igraph_i_pajek_parsedata_t *context);
int igraph_i_pajek_add_string_edge_attribute(const char *name,
                                             const char *value,
                                             int len,
                                             igraph_i_pajek_parsedata_t *context);
int igraph_i_pajek_add_numeric_vertex_attribute(const char *name,
                                                igraph_real_t value,
                                                igraph_i_pajek_parsedata_t *context);
int igraph_i_pajek_add_numeric_edge_attribute(const char *name,
                                              igraph_real_t value,
                                              igraph_i_pajek_parsedata_t *context);
int igraph_i_pajek_add_numeric_attribute(igraph_trie_t *names,
                                         igraph_vector_ptr_t *attrs,
                                         long int count,
                                         const char *attrname,
                                         igraph_integer_t vid,
                                         igraph_real_t number);
int igraph_i_pajek_add_string_attribute(igraph_trie_t *names,
                                        igraph_vector_ptr_t *attrs,
                                        long int count,
                                        const char *attrname,
                                        igraph_integer_t vid,
                                        const char *str);

int igraph_i_pajek_add_bipartite_type(igraph_i_pajek_parsedata_t *context);
int igraph_i_pajek_check_bipartite(igraph_i_pajek_parsedata_t *context);

extern igraph_real_t igraph_pajek_get_number(const char *str, long int len);
extern long int igraph_i_pajek_actvertex;
extern long int igraph_i_pajek_actedge;

#define scanner context->scanner



/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 1
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 115 "src/core/io/pajek-parser.y"
{
  long int intnum;
  double   realnum;
  struct {
    char *str;
    int len;
  } string;
}
/* Line 193 of yacc.c.  */
#line 299 "yy.tab.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
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


/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 324 "yy.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL \
	     && defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
    YYLTYPE yyls;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE) + sizeof (YYLTYPE)) \
      + 2 * YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  5
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   250

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  52
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  66
/* YYNRULES -- Number of rules.  */
#define YYNRULES  137
/* YYNRULES -- Number of states.  */
#define YYNSTATES  207

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   306

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     7,     8,    12,    16,    19,    23,    24,
      27,    29,    32,    33,    41,    43,    45,    46,    49,    53,
      54,    56,    57,    60,    62,    65,    68,    73,    78,    83,
      86,    89,    92,    95,    98,   101,   104,   107,   110,   111,
     115,   116,   120,   121,   125,   126,   130,   131,   135,   137,
     138,   141,   144,   147,   150,   153,   157,   162,   163,   166,
     168,   169,   176,   178,   180,   184,   189,   190,   193,   195,
     196,   203,   205,   207,   208,   210,   211,   214,   216,   221,
     224,   227,   230,   233,   236,   239,   242,   245,   248,   251,
     254,   257,   260,   263,   266,   267,   271,   272,   276,   277,
     281,   282,   286,   287,   291,   293,   297,   298,   301,   303,
     307,   308,   311,   313,   315,   319,   320,   323,   325,   329,
     330,   333,   335,   337,   341,   343,   344,   347,   350,   351,
     354,   356,   358,   360,   361,   364,   366,   368
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      53,     0,    -1,    54,    55,    73,    -1,    -1,     8,   116,
       3,    -1,    56,     3,    57,    -1,     9,   114,    -1,     9,
     114,   114,    -1,    -1,    57,    58,    -1,     3,    -1,    60,
       3,    -1,    -1,    60,    59,    61,    62,    63,    64,     3,
      -1,   114,    -1,   117,    -1,    -1,   115,   115,    -1,   115,
     115,   115,    -1,    -1,   117,    -1,    -1,    64,    65,    -1,
      66,    -1,    16,   115,    -1,    17,   115,    -1,    18,   115,
     115,   115,    -1,    19,   115,   115,   115,    -1,    20,   115,
     115,   115,    -1,    21,   115,    -1,    22,   115,    -1,    23,
     115,    -1,    24,   115,    -1,    25,   115,    -1,    26,   115,
      -1,    27,   115,    -1,    28,   115,    -1,    31,   115,    -1,
      -1,    29,    67,    72,    -1,    -1,    30,    68,    72,    -1,
      -1,    18,    69,    72,    -1,    -1,    19,    70,    72,    -1,
      -1,    20,    71,    72,    -1,   117,    -1,    -1,    73,    74,
      -1,    73,    80,    -1,    73,    96,    -1,    73,   102,    -1,
      73,   108,    -1,    10,     3,    75,    -1,    10,   115,     3,
      75,    -1,    -1,    75,    76,    -1,     3,    -1,    -1,    78,
      79,    77,    86,    87,     3,    -1,   114,    -1,   114,    -1,
      11,     3,    81,    -1,    11,   115,     3,    81,    -1,    -1,
      81,    82,    -1,     3,    -1,    -1,    84,    85,    83,    86,
      87,     3,    -1,   114,    -1,   114,    -1,    -1,   115,    -1,
      -1,    87,    88,    -1,    89,    -1,    32,   115,   115,   115,
      -1,    33,   115,    -1,    35,   115,    -1,    36,   115,    -1,
      37,   115,    -1,    38,   115,    -1,    39,   115,    -1,    40,
     115,    -1,    41,   115,    -1,    42,   115,    -1,    45,   115,
      -1,    46,   115,    -1,    47,   115,    -1,    49,   115,    -1,
      50,   115,    -1,    51,   115,    -1,    -1,    34,    90,    95,
      -1,    -1,    43,    91,    95,    -1,    -1,    44,    92,    95,
      -1,    -1,    48,    93,    95,    -1,    -1,    32,    94,    95,
      -1,   117,    -1,    12,     3,    97,    -1,    -1,    97,    98,
      -1,     3,    -1,   100,    99,     3,    -1,    -1,    99,   101,
      -1,   114,    -1,   114,    -1,    13,     3,   103,    -1,    -1,
     103,   104,    -1,     3,    -1,   106,   105,     3,    -1,    -1,
     105,   107,    -1,   114,    -1,   114,    -1,   109,     3,   110,
      -1,    14,    -1,    -1,   110,   111,    -1,   112,     3,    -1,
      -1,   113,   112,    -1,   115,    -1,     4,    -1,     4,    -1,
      -1,   116,   117,    -1,     5,    -1,     4,    -1,     6,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   190,   190,   194,   194,   196,   198,   202,   208,   208,
     210,   211,   212,   212,   215,   217,   222,   223,   227,   233,
     233,   237,   237,   240,   241,   244,   247,   252,   257,   262,
     265,   268,   271,   274,   277,   280,   283,   286,   291,   291,
     295,   295,   299,   299,   303,   303,   308,   308,   315,   317,
     317,   317,   317,   317,   317,   319,   320,   322,   322,   324,
     325,   325,   331,   333,   335,   336,   338,   338,   340,   341,
     341,   347,   349,   351,   351,   355,   355,   358,   359,   364,
     367,   370,   373,   376,   379,   382,   385,   388,   391,   394,
     397,   400,   403,   406,   411,   411,   415,   415,   419,   419,
     423,   423,   427,   427,   433,   435,   437,   437,   439,   439,
     441,   441,   443,   445,   450,   452,   452,   454,   454,   456,
     456,   458,   460,   467,   469,   474,   474,   476,   478,   478,
     480,   500,   503,   506,   506,   508,   510,   512
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "$undefined", "NEWLINE", "NUM", "ALNUM",
  "QSTR", "PSTR", "NETWORKLINE", "VERTICESLINE", "ARCSLINE", "EDGESLINE",
  "ARCSLISTLINE", "EDGESLISTLINE", "MATRIXLINE", "ERROR", "VP_X_FACT",
  "VP_Y_FACT", "VP_IC", "VP_BC", "VP_LC", "VP_LR", "VP_LPHI", "VP_BW",
  "VP_FOS", "VP_PHI", "VP_R", "VP_Q", "VP_LA", "VP_FONT", "VP_URL",
  "VP_SIZE", "EP_C", "EP_S", "EP_A", "EP_W", "EP_H1", "EP_H2", "EP_A1",
  "EP_A2", "EP_K1", "EP_K2", "EP_AP", "EP_P", "EP_L", "EP_LP", "EP_LR",
  "EP_LPHI", "EP_LC", "EP_LA", "EP_SIZE", "EP_FOS", "$accept", "input",
  "nethead", "vertices", "verticeshead", "vertdefs", "vertexline", "@1",
  "vertex", "vertexid", "vertexcoords", "shape", "params", "param",
  "vpword", "@2", "@3", "@4", "@5", "@6", "vpwordpar", "edgeblock", "arcs",
  "arcsdefs", "arcsline", "@7", "arcfrom", "arcto", "edges", "edgesdefs",
  "edgesline", "@8", "edgefrom", "edgeto", "weight", "edgeparams",
  "edgeparam", "epword", "@9", "@10", "@11", "@12", "@13", "epwordpar",
  "arcslist", "arcslistlines", "arclistline", "arctolist", "arclistfrom",
  "arclistto", "edgeslist", "edgelistlines", "edgelistline", "edgetolist",
  "edgelistfrom", "edgelistto", "adjmatrix", "matrixline",
  "adjmatrixlines", "adjmatrixline", "adjmatrixnumbers", "adjmatrixentry",
  "longint", "number", "words", "word", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    52,    53,    54,    54,    55,    56,    56,    57,    57,
      58,    58,    59,    58,    60,    61,    62,    62,    62,    63,
      63,    64,    64,    65,    65,    65,    65,    65,    65,    65,
      65,    65,    65,    65,    65,    65,    65,    65,    67,    66,
      68,    66,    69,    66,    70,    66,    71,    66,    72,    73,
      73,    73,    73,    73,    73,    74,    74,    75,    75,    76,
      77,    76,    78,    79,    80,    80,    81,    81,    82,    83,
      82,    84,    85,    86,    86,    87,    87,    88,    88,    88,
      88,    88,    88,    88,    88,    88,    88,    88,    88,    88,
      88,    88,    88,    88,    90,    89,    91,    89,    92,    89,
      93,    89,    94,    89,    95,    96,    97,    97,    98,    98,
      99,    99,   100,   101,   102,   103,   103,   104,   104,   105,
     105,   106,   107,   108,   109,   110,   110,   111,   112,   112,
     113,   114,   115,   116,   116,   117,   117,   117
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     3,     3,     2,     3,     0,     2,
       1,     2,     0,     7,     1,     1,     0,     2,     3,     0,
       1,     0,     2,     1,     2,     2,     4,     4,     4,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     0,     3,
       0,     3,     0,     3,     0,     3,     0,     3,     1,     0,
       2,     2,     2,     2,     2,     3,     4,     0,     2,     1,
       0,     6,     1,     1,     3,     4,     0,     2,     1,     0,
       6,     1,     1,     0,     1,     0,     2,     1,     4,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     0,     3,     0,     3,     0,     3,
       0,     3,     0,     3,     1,     3,     0,     2,     1,     3,
       0,     2,     1,     1,     3,     0,     2,     1,     3,     0,
       2,     1,     1,     3,     1,     0,     2,     2,     0,     2,
       1,     1,     1,     0,     2,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       3,   133,     0,     0,     0,     1,     0,    49,     0,     4,
     136,   135,   137,   134,   131,     6,     2,     8,     7,     0,
       0,     0,     0,   124,    50,    51,    52,    53,    54,     0,
       5,    57,   132,     0,    66,     0,   106,   115,   125,    10,
       9,    12,    14,    55,    57,    64,    66,   105,   114,   123,
      11,     0,    59,    58,     0,    62,    56,    68,    67,     0,
      71,    65,   108,   107,   110,   112,   117,   116,   119,   121,
     126,     0,   128,   130,    16,    15,    60,    63,    69,    72,
       0,     0,   127,   129,    19,     0,    73,    73,   109,   111,
     113,   118,   120,   122,    21,    20,    17,    75,    74,    75,
       0,    18,     0,     0,    13,     0,     0,    42,    44,    46,
       0,     0,     0,     0,     0,     0,     0,     0,    38,    40,
       0,    22,    23,    61,   102,     0,    94,     0,     0,     0,
       0,     0,     0,     0,     0,    96,    98,     0,     0,     0,
     100,     0,     0,     0,    76,    77,    70,    24,    25,     0,
       0,     0,     0,     0,     0,    29,    30,    31,    32,    33,
      34,    35,    36,     0,     0,    37,     0,     0,    79,     0,
      80,    81,    82,    83,    84,    85,    86,    87,     0,     0,
      88,    89,    90,     0,    91,    92,    93,    43,    48,     0,
      45,     0,    47,     0,    39,    41,   103,   104,     0,    95,
      97,    99,   101,    26,    27,    28,    78
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,     7,     8,    30,    40,    51,    41,    74,
      84,    94,   100,   121,   122,   163,   164,   149,   151,   153,
     187,    16,    24,    43,    53,    86,    54,    76,    25,    45,
      58,    87,    59,    78,    97,   102,   144,   145,   169,   178,
     179,   183,   166,   196,    26,    47,    63,    80,    64,    89,
      27,    48,    67,    81,    68,    92,    28,    29,    49,    70,
      71,    72,    55,    73,     4,   188
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -167
static const yytype_int16 yypact[] =
{
      -4,  -167,     7,    36,    22,  -167,    44,  -167,    49,  -167,
    -167,  -167,  -167,  -167,  -167,    44,    10,  -167,  -167,    12,
      27,    51,    56,  -167,  -167,  -167,  -167,  -167,  -167,    58,
      29,  -167,  -167,    59,  -167,    60,  -167,  -167,  -167,  -167,
    -167,    61,  -167,    31,  -167,    33,  -167,    35,    37,    39,
    -167,     5,  -167,  -167,    44,  -167,    31,  -167,  -167,    44,
    -167,    33,  -167,  -167,  -167,  -167,  -167,  -167,  -167,  -167,
    -167,    62,    65,  -167,    65,  -167,  -167,  -167,  -167,  -167,
      47,    53,  -167,  -167,     5,    65,    65,    65,  -167,  -167,
    -167,  -167,  -167,  -167,  -167,  -167,    65,  -167,  -167,  -167,
     219,  -167,   150,   170,  -167,    65,    65,    65,    65,    65,
      65,    65,    65,    65,    65,    65,    65,    65,  -167,  -167,
      65,  -167,  -167,  -167,    65,    65,  -167,    65,    65,    65,
      65,    65,    65,    65,    65,  -167,  -167,    65,    65,    65,
    -167,    65,    65,    65,  -167,  -167,  -167,  -167,  -167,     5,
      65,     5,    65,     5,    65,  -167,  -167,  -167,  -167,  -167,
    -167,  -167,  -167,     5,     5,  -167,     5,    65,  -167,     5,
    -167,  -167,  -167,  -167,  -167,  -167,  -167,  -167,     5,     5,
    -167,  -167,  -167,     5,  -167,  -167,  -167,  -167,  -167,    65,
    -167,    65,  -167,    65,  -167,  -167,  -167,  -167,    65,  -167,
    -167,  -167,  -167,  -167,  -167,  -167,  -167
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -167,  -167,  -167,  -167,  -167,  -167,  -167,  -167,  -167,  -167,
    -167,  -167,  -167,  -167,  -167,  -167,  -167,  -167,  -167,  -167,
    -145,  -167,  -167,    26,  -167,  -167,  -167,  -167,  -167,    25,
    -167,  -167,  -167,  -167,   -15,   -26,  -167,  -167,  -167,  -167,
    -167,  -167,  -167,  -166,  -167,  -167,  -167,  -167,  -167,  -167,
    -167,  -167,  -167,  -167,  -167,  -167,  -167,  -167,  -167,  -167,
       2,  -167,    -1,   -19,  -167,    -2
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -129
static const yytype_int16 yytable[] =
{
      33,    35,    13,   199,     1,    15,   190,     5,   192,    10,
      11,    12,   200,   201,    18,    31,    32,   202,   194,   195,
      19,    20,    21,    22,    23,     9,    10,    11,    12,    42,
      34,    32,    39,    14,    52,    14,    57,    14,    62,    14,
      66,    14,  -128,    32,    60,     6,    65,    69,    14,    75,
      88,    14,    17,    77,    36,    85,    91,    14,    79,    37,
      60,    38,    44,    46,    50,    82,    96,    98,    98,    32,
      56,    61,    99,   103,    83,     0,     0,   101,     0,    90,
      93,     0,    95,     0,     0,     0,   147,   148,   150,   152,
     154,   155,   156,   157,   158,   159,   160,   161,   162,     0,
       0,   165,     0,     0,     0,   167,   168,     0,   170,   171,
     172,   173,   174,   175,   176,   177,     0,     0,   180,   181,
     182,     0,   184,   185,   186,     0,     0,     0,     0,     0,
       0,   189,     0,   191,     0,   193,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   198,     0,
       0,     0,     0,   123,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   197,     0,     0,   197,     0,     0,
     203,     0,   204,   146,   205,     0,   197,   197,     0,   206,
       0,   197,   124,   125,   126,   127,   128,   129,   130,   131,
     132,   133,   134,   135,   136,   137,   138,   139,   140,   141,
     142,   143,   124,   125,   126,   127,   128,   129,   130,   131,
     132,   133,   134,   135,   136,   137,   138,   139,   140,   141,
     142,   143,   104,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120
};

static const yytype_int16 yycheck[] =
{
      19,    20,     4,   169,     8,     6,   151,     0,   153,     4,
       5,     6,   178,   179,    15,     3,     4,   183,   163,   164,
      10,    11,    12,    13,    14,     3,     4,     5,     6,    30,
       3,     4,     3,     4,     3,     4,     3,     4,     3,     4,
       3,     4,     3,     4,    45,     9,    47,    48,     4,    51,
       3,     4,     3,    54,     3,    74,     3,     4,    59,     3,
      61,     3,     3,     3,     3,     3,    85,    86,    87,     4,
      44,    46,    87,    99,    72,    -1,    -1,    96,    -1,    80,
      81,    -1,    84,    -1,    -1,    -1,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,    -1,
      -1,   120,    -1,    -1,    -1,   124,   125,    -1,   127,   128,
     129,   130,   131,   132,   133,   134,    -1,    -1,   137,   138,
     139,    -1,   141,   142,   143,    -1,    -1,    -1,    -1,    -1,
      -1,   150,    -1,   152,    -1,   154,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   167,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   166,    -1,    -1,   169,    -1,    -1,
     189,    -1,   191,     3,   193,    -1,   178,   179,    -1,   198,
      -1,   183,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     8,    53,    54,   116,     0,     9,    55,    56,     3,
       4,     5,     6,   117,     4,   114,    73,     3,   114,    10,
      11,    12,    13,    14,    74,    80,    96,   102,   108,   109,
      57,     3,     4,   115,     3,   115,     3,     3,     3,     3,
      58,    60,   114,    75,     3,    81,     3,    97,   103,   110,
       3,    59,     3,    76,    78,   114,    75,     3,    82,    84,
     114,    81,     3,    98,   100,   114,     3,   104,   106,   114,
     111,   112,   113,   115,    61,   117,    79,   114,    85,   114,
      99,   105,     3,   112,    62,   115,    77,    83,     3,   101,
     114,     3,   107,   114,    63,   117,   115,    86,   115,    86,
      64,   115,    87,    87,     3,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    65,    66,     3,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    88,    89,     3,   115,   115,    69,
     115,    70,   115,    71,   115,   115,   115,   115,   115,   115,
     115,   115,   115,    67,    68,   115,    94,   115,   115,    90,
     115,   115,   115,   115,   115,   115,   115,   115,    91,    92,
     115,   115,   115,    93,   115,   115,   115,    72,   117,   115,
      72,   115,    72,   115,    72,    72,    95,   117,   115,    95,
      95,    95,    95,   115,   115,   115,   115
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (&yylloc, context, YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (&yylval, &yylloc, YYLEX_PARAM)
#else
# define YYLEX yylex (&yylval, &yylloc, scanner)
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value, Location, context); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp, igraph_i_pajek_parsedata_t* context)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp, context)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    YYLTYPE const * const yylocationp;
    igraph_i_pajek_parsedata_t* context;
#endif
{
  if (!yyvaluep)
    return;
  YYUSE (yylocationp);
  YYUSE (context);
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp, igraph_i_pajek_parsedata_t* context)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, yylocationp, context)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    YYLTYPE const * const yylocationp;
    igraph_i_pajek_parsedata_t* context;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  YY_LOCATION_PRINT (yyoutput, *yylocationp);
  YYFPRINTF (yyoutput, ": ");
  yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp, context);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, YYLTYPE *yylsp, int yyrule, igraph_i_pajek_parsedata_t* context)
#else
static void
yy_reduce_print (yyvsp, yylsp, yyrule, context)
    YYSTYPE *yyvsp;
    YYLTYPE *yylsp;
    int yyrule;
    igraph_i_pajek_parsedata_t* context;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       , &(yylsp[(yyi + 1) - (yynrhs)])		       , context);
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, yylsp, Rule, context); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, YYLTYPE *yylocationp, igraph_i_pajek_parsedata_t* context)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, yylocationp, context)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    YYLTYPE *yylocationp;
    igraph_i_pajek_parsedata_t* context;
#endif
{
  YYUSE (yyvaluep);
  YYUSE (yylocationp);
  YYUSE (context);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (igraph_i_pajek_parsedata_t* context);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */






/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (igraph_i_pajek_parsedata_t* context)
#else
int
yyparse (context)
    igraph_i_pajek_parsedata_t* context;
#endif
#endif
{
  /* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;
/* Location data for the look-ahead symbol.  */
YYLTYPE yylloc;

  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;

  /* The location stack.  */
  YYLTYPE yylsa[YYINITDEPTH];
  YYLTYPE *yyls = yylsa;
  YYLTYPE *yylsp;
  /* The locations where the error started and ended.  */
  YYLTYPE yyerror_range[2];

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N), yylsp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
  YYLTYPE yyloc;

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;
  yylsp = yyls;
#if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
  /* Initialize the default location before parsing starts.  */
  yylloc.first_line   = yylloc.last_line   = 1;
  yylloc.first_column = yylloc.last_column = 0;
#endif

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;
	YYLTYPE *yyls1 = yyls;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yyls1, yysize * sizeof (*yylsp),
		    &yystacksize);
	yyls = yyls1;
	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);
	YYSTACK_RELOCATE (yyls);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
      yylsp = yyls + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;
  *++yylsp = yylloc;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];

  /* Default location.  */
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 190 "src/core/io/pajek-parser.y"
    {
  if (context->vcount2 > 0) { igraph_i_pajek_check_bipartite(context); }
 ;}
    break;

  case 6:
#line 198 "src/core/io/pajek-parser.y"
    {
  context->vcount=(yyvsp[(2) - (2)].intnum);
  context->vcount2=0;
            ;}
    break;

  case 7:
#line 202 "src/core/io/pajek-parser.y"
    {
  context->vcount=(yyvsp[(2) - (3)].intnum);
  context->vcount2=(yyvsp[(3) - (3)].intnum);
  igraph_i_pajek_add_bipartite_type(context);
;}
    break;

  case 12:
#line 212 "src/core/io/pajek-parser.y"
    { context->actvertex=(yyvsp[(1) - (1)].intnum); ;}
    break;

  case 13:
#line 212 "src/core/io/pajek-parser.y"
    { ;}
    break;

  case 14:
#line 215 "src/core/io/pajek-parser.y"
    { (yyval.intnum)=(yyvsp[(1) - (1)].intnum); context->mode=1; ;}
    break;

  case 15:
#line 217 "src/core/io/pajek-parser.y"
    {
  igraph_i_pajek_add_string_vertex_attribute("id", (yyvsp[(1) - (1)].string).str, (yyvsp[(1) - (1)].string).len, context);
  igraph_i_pajek_add_string_vertex_attribute("name", (yyvsp[(1) - (1)].string).str, (yyvsp[(1) - (1)].string).len, context);
;}
    break;

  case 17:
#line 223 "src/core/io/pajek-parser.y"
    {
  igraph_i_pajek_add_numeric_vertex_attribute("x", (yyvsp[(1) - (2)].realnum), context);
  igraph_i_pajek_add_numeric_vertex_attribute("y", (yyvsp[(2) - (2)].realnum), context);
            ;}
    break;

  case 18:
#line 227 "src/core/io/pajek-parser.y"
    {
  igraph_i_pajek_add_numeric_vertex_attribute("x", (yyvsp[(1) - (3)].realnum), context);
  igraph_i_pajek_add_numeric_vertex_attribute("y", (yyvsp[(2) - (3)].realnum), context);
  igraph_i_pajek_add_numeric_vertex_attribute("z", (yyvsp[(3) - (3)].realnum), context);
            ;}
    break;

  case 20:
#line 233 "src/core/io/pajek-parser.y"
    {
  igraph_i_pajek_add_string_vertex_attribute("shape", (yyvsp[(1) - (1)].string).str, (yyvsp[(1) - (1)].string).len, context);
;}
    break;

  case 24:
#line 241 "src/core/io/pajek-parser.y"
    {
         igraph_i_pajek_add_numeric_vertex_attribute("xfact", (yyvsp[(2) - (2)].realnum), context);
       ;}
    break;

  case 25:
#line 244 "src/core/io/pajek-parser.y"
    {
         igraph_i_pajek_add_numeric_vertex_attribute("yfact", (yyvsp[(2) - (2)].realnum), context);
       ;}
    break;

  case 26:
#line 247 "src/core/io/pajek-parser.y"
    { /* RGB color */
         igraph_i_pajek_add_numeric_vertex_attribute("color-red", (yyvsp[(2) - (4)].realnum), context);
         igraph_i_pajek_add_numeric_vertex_attribute("color-green", (yyvsp[(3) - (4)].realnum), context);
         igraph_i_pajek_add_numeric_vertex_attribute("color-blue", (yyvsp[(4) - (4)].realnum), context);
       ;}
    break;

  case 27:
#line 252 "src/core/io/pajek-parser.y"
    {
         igraph_i_pajek_add_numeric_vertex_attribute("framecolor-red", (yyvsp[(2) - (4)].realnum), context);
         igraph_i_pajek_add_numeric_vertex_attribute("framecolor-green", (yyvsp[(3) - (4)].realnum), context);
         igraph_i_pajek_add_numeric_vertex_attribute("framecolor-blue", (yyvsp[(4) - (4)].realnum), context);
       ;}
    break;

  case 28:
#line 257 "src/core/io/pajek-parser.y"
    {
         igraph_i_pajek_add_numeric_vertex_attribute("labelcolor-red", (yyvsp[(2) - (4)].realnum), context);
         igraph_i_pajek_add_numeric_vertex_attribute("labelcolor-green", (yyvsp[(3) - (4)].realnum), context);
         igraph_i_pajek_add_numeric_vertex_attribute("labelcolor-blue", (yyvsp[(4) - (4)].realnum), context);
       ;}
    break;

  case 29:
#line 262 "src/core/io/pajek-parser.y"
    {
         igraph_i_pajek_add_numeric_vertex_attribute("labeldist", (yyvsp[(2) - (2)].realnum), context);
     ;}
    break;

  case 30:
#line 265 "src/core/io/pajek-parser.y"
    {
         igraph_i_pajek_add_numeric_vertex_attribute("labeldegree2", (yyvsp[(2) - (2)].realnum), context);
     ;}
    break;

  case 31:
#line 268 "src/core/io/pajek-parser.y"
    {
         igraph_i_pajek_add_numeric_vertex_attribute("framewidth", (yyvsp[(2) - (2)].realnum), context);
     ;}
    break;

  case 32:
#line 271 "src/core/io/pajek-parser.y"
    {
         igraph_i_pajek_add_numeric_vertex_attribute("fontsize", (yyvsp[(2) - (2)].realnum), context);
     ;}
    break;

  case 33:
#line 274 "src/core/io/pajek-parser.y"
    {
         igraph_i_pajek_add_numeric_vertex_attribute("rotation", (yyvsp[(2) - (2)].realnum), context);
     ;}
    break;

  case 34:
#line 277 "src/core/io/pajek-parser.y"
    {
         igraph_i_pajek_add_numeric_vertex_attribute("radius", (yyvsp[(2) - (2)].realnum), context);
     ;}
    break;

  case 35:
#line 280 "src/core/io/pajek-parser.y"
    {
         igraph_i_pajek_add_numeric_vertex_attribute("diamondratio", (yyvsp[(2) - (2)].realnum), context);
     ;}
    break;

  case 36:
#line 283 "src/core/io/pajek-parser.y"
    {
         igraph_i_pajek_add_numeric_vertex_attribute("labeldegree", (yyvsp[(2) - (2)].realnum), context);
     ;}
    break;

  case 37:
#line 286 "src/core/io/pajek-parser.y"
    {
         igraph_i_pajek_add_numeric_vertex_attribute("vertexsize", (yyvsp[(2) - (2)].realnum), context);
     ;}
    break;

  case 38:
#line 291 "src/core/io/pajek-parser.y"
    { context->mode=3; ;}
    break;

  case 39:
#line 291 "src/core/io/pajek-parser.y"
    {
         context->mode=1;
         igraph_i_pajek_add_string_vertex_attribute("font", (yyvsp[(3) - (3)].string).str, (yyvsp[(3) - (3)].string).len, context);
     ;}
    break;

  case 40:
#line 295 "src/core/io/pajek-parser.y"
    { context->mode=3; ;}
    break;

  case 41:
#line 295 "src/core/io/pajek-parser.y"
    {
         context->mode=1;
         igraph_i_pajek_add_string_vertex_attribute("url", (yyvsp[(3) - (3)].string).str, (yyvsp[(3) - (3)].string).len, context);
     ;}
    break;

  case 42:
#line 299 "src/core/io/pajek-parser.y"
    { context->mode=3; ;}
    break;

  case 43:
#line 299 "src/core/io/pajek-parser.y"
    {
         context->mode=1;
         igraph_i_pajek_add_string_vertex_attribute("color", (yyvsp[(3) - (3)].string).str, (yyvsp[(3) - (3)].string).len, context);
     ;}
    break;

  case 44:
#line 303 "src/core/io/pajek-parser.y"
    { context->mode=3; ;}
    break;

  case 45:
#line 303 "src/core/io/pajek-parser.y"
    {
         context->mode=1;
         igraph_i_pajek_add_string_vertex_attribute("framecolor",
                                                    (yyvsp[(3) - (3)].string).str, (yyvsp[(3) - (3)].string).len, context);
     ;}
    break;

  case 46:
#line 308 "src/core/io/pajek-parser.y"
    { context->mode=3; ;}
    break;

  case 47:
#line 308 "src/core/io/pajek-parser.y"
    {
         context->mode=1;
         igraph_i_pajek_add_string_vertex_attribute("labelcolor",
                                                    (yyvsp[(3) - (3)].string).str, (yyvsp[(3) - (3)].string).len, context);
     ;}
    break;

  case 48:
#line 315 "src/core/io/pajek-parser.y"
    { (yyval.string)=(yyvsp[(1) - (1)].string); ;}
    break;

  case 55:
#line 319 "src/core/io/pajek-parser.y"
    { context->directed=1; ;}
    break;

  case 56:
#line 320 "src/core/io/pajek-parser.y"
    { context->directed=1; ;}
    break;

  case 60:
#line 325 "src/core/io/pajek-parser.y"
    { context->actedge++;
                          context->mode=2; ;}
    break;

  case 61:
#line 326 "src/core/io/pajek-parser.y"
    {
  igraph_vector_push_back(context->vector, (yyvsp[(1) - (6)].intnum)-1);
  igraph_vector_push_back(context->vector, (yyvsp[(2) - (6)].intnum)-1); ;}
    break;

  case 64:
#line 335 "src/core/io/pajek-parser.y"
    { context->directed=0; ;}
    break;

  case 65:
#line 336 "src/core/io/pajek-parser.y"
    { context->directed=0; ;}
    break;

  case 69:
#line 341 "src/core/io/pajek-parser.y"
    { context->actedge++;
                            context->mode=2; ;}
    break;

  case 70:
#line 342 "src/core/io/pajek-parser.y"
    {
  igraph_vector_push_back(context->vector, (yyvsp[(1) - (6)].intnum)-1);
  igraph_vector_push_back(context->vector, (yyvsp[(2) - (6)].intnum)-1); ;}
    break;

  case 74:
#line 351 "src/core/io/pajek-parser.y"
    {
  igraph_i_pajek_add_numeric_edge_attribute("weight", (yyvsp[(1) - (1)].realnum), context);
;}
    break;

  case 78:
#line 359 "src/core/io/pajek-parser.y"
    {
       igraph_i_pajek_add_numeric_edge_attribute("color-red", (yyvsp[(2) - (4)].realnum), context);
       igraph_i_pajek_add_numeric_edge_attribute("color-green", (yyvsp[(3) - (4)].realnum), context);
       igraph_i_pajek_add_numeric_edge_attribute("color-blue", (yyvsp[(4) - (4)].realnum), context);
   ;}
    break;

  case 79:
#line 364 "src/core/io/pajek-parser.y"
    {
       igraph_i_pajek_add_numeric_edge_attribute("arrowsize", (yyvsp[(2) - (2)].realnum), context);
   ;}
    break;

  case 80:
#line 367 "src/core/io/pajek-parser.y"
    {
       igraph_i_pajek_add_numeric_edge_attribute("edgewidth", (yyvsp[(2) - (2)].realnum), context);
   ;}
    break;

  case 81:
#line 370 "src/core/io/pajek-parser.y"
    {
       igraph_i_pajek_add_numeric_edge_attribute("hook1", (yyvsp[(2) - (2)].realnum), context);
   ;}
    break;

  case 82:
#line 373 "src/core/io/pajek-parser.y"
    {
       igraph_i_pajek_add_numeric_edge_attribute("hook2", (yyvsp[(2) - (2)].realnum), context);
   ;}
    break;

  case 83:
#line 376 "src/core/io/pajek-parser.y"
    {
       igraph_i_pajek_add_numeric_edge_attribute("angle1", (yyvsp[(2) - (2)].realnum), context);
   ;}
    break;

  case 84:
#line 379 "src/core/io/pajek-parser.y"
    {
       igraph_i_pajek_add_numeric_edge_attribute("angle2", (yyvsp[(2) - (2)].realnum), context);
   ;}
    break;

  case 85:
#line 382 "src/core/io/pajek-parser.y"
    {
       igraph_i_pajek_add_numeric_edge_attribute("velocity1", (yyvsp[(2) - (2)].realnum), context);
   ;}
    break;

  case 86:
#line 385 "src/core/io/pajek-parser.y"
    {
       igraph_i_pajek_add_numeric_edge_attribute("velocity2", (yyvsp[(2) - (2)].realnum), context);
   ;}
    break;

  case 87:
#line 388 "src/core/io/pajek-parser.y"
    {
       igraph_i_pajek_add_numeric_edge_attribute("arrowpos", (yyvsp[(2) - (2)].realnum), context);
   ;}
    break;

  case 88:
#line 391 "src/core/io/pajek-parser.y"
    {
       igraph_i_pajek_add_numeric_edge_attribute("labelpos", (yyvsp[(2) - (2)].realnum), context);
   ;}
    break;

  case 89:
#line 394 "src/core/io/pajek-parser.y"
    {
       igraph_i_pajek_add_numeric_edge_attribute("labelangle", (yyvsp[(2) - (2)].realnum), context);
   ;}
    break;

  case 90:
#line 397 "src/core/io/pajek-parser.y"
    {
       igraph_i_pajek_add_numeric_edge_attribute("labelangle2", (yyvsp[(2) - (2)].realnum), context);
   ;}
    break;

  case 91:
#line 400 "src/core/io/pajek-parser.y"
    {
       igraph_i_pajek_add_numeric_edge_attribute("labeldegree", (yyvsp[(2) - (2)].realnum), context);
   ;}
    break;

  case 92:
#line 403 "src/core/io/pajek-parser.y"
    { /* what is this??? */
       igraph_i_pajek_add_numeric_edge_attribute("arrowsize", (yyvsp[(2) - (2)].realnum), context);
   ;}
    break;

  case 93:
#line 406 "src/core/io/pajek-parser.y"
    {
       igraph_i_pajek_add_numeric_edge_attribute("fontsize", (yyvsp[(2) - (2)].realnum), context);
   ;}
    break;

  case 94:
#line 411 "src/core/io/pajek-parser.y"
    { context->mode=4; ;}
    break;

  case 95:
#line 411 "src/core/io/pajek-parser.y"
    {
      context->mode=2;
      igraph_i_pajek_add_string_edge_attribute("arrowtype", (yyvsp[(3) - (3)].string).str, (yyvsp[(3) - (3)].string).len, context);
    ;}
    break;

  case 96:
#line 415 "src/core/io/pajek-parser.y"
    { context->mode=4; ;}
    break;

  case 97:
#line 415 "src/core/io/pajek-parser.y"
    {
      context->mode=2;
      igraph_i_pajek_add_string_edge_attribute("linepattern", (yyvsp[(3) - (3)].string).str, (yyvsp[(3) - (3)].string).len, context);
    ;}
    break;

  case 98:
#line 419 "src/core/io/pajek-parser.y"
    { context->mode=4; ;}
    break;

  case 99:
#line 419 "src/core/io/pajek-parser.y"
    {
      context->mode=2;
      igraph_i_pajek_add_string_edge_attribute("label", (yyvsp[(3) - (3)].string).str, (yyvsp[(3) - (3)].string).len, context);
    ;}
    break;

  case 100:
#line 423 "src/core/io/pajek-parser.y"
    { context->mode=4; ;}
    break;

  case 101:
#line 423 "src/core/io/pajek-parser.y"
    {
      context->mode=2;
      igraph_i_pajek_add_string_edge_attribute("labelcolor", (yyvsp[(3) - (3)].string).str, (yyvsp[(3) - (3)].string).len, context);
    ;}
    break;

  case 102:
#line 427 "src/core/io/pajek-parser.y"
    { context->mode=4; ;}
    break;

  case 103:
#line 427 "src/core/io/pajek-parser.y"
    {
      context->mode=2;
      igraph_i_pajek_add_string_edge_attribute("color", (yyvsp[(3) - (3)].string).str, (yyvsp[(3) - (3)].string).len, context);
    ;}
    break;

  case 104:
#line 433 "src/core/io/pajek-parser.y"
    { context->mode=2; (yyval.string)=(yyvsp[(1) - (1)].string); ;}
    break;

  case 105:
#line 435 "src/core/io/pajek-parser.y"
    { context->directed=1; ;}
    break;

  case 112:
#line 443 "src/core/io/pajek-parser.y"
    { context->mode=0; context->actfrom=labs((yyvsp[(1) - (1)].intnum))-1; ;}
    break;

  case 113:
#line 445 "src/core/io/pajek-parser.y"
    {
  igraph_vector_push_back(context->vector, context->actfrom);
  igraph_vector_push_back(context->vector, labs((yyvsp[(1) - (1)].intnum))-1);
;}
    break;

  case 114:
#line 450 "src/core/io/pajek-parser.y"
    { context->directed=0; ;}
    break;

  case 121:
#line 458 "src/core/io/pajek-parser.y"
    { context->mode=0; context->actfrom=labs((yyvsp[(1) - (1)].intnum))-1; ;}
    break;

  case 122:
#line 460 "src/core/io/pajek-parser.y"
    {
  igraph_vector_push_back(context->vector, context->actfrom);
  igraph_vector_push_back(context->vector, labs((yyvsp[(1) - (1)].intnum))-1);
;}
    break;

  case 124:
#line 469 "src/core/io/pajek-parser.y"
    { context->actfrom=0;
                         context->actto=0;
                         context->directed=(context->vcount2==0);
                       ;}
    break;

  case 127:
#line 476 "src/core/io/pajek-parser.y"
    { context->actfrom++; context->actto=0; ;}
    break;

  case 130:
#line 480 "src/core/io/pajek-parser.y"
    {
  if ((yyvsp[(1) - (1)].realnum) != 0) {
    if (context->vcount2==0) {
      context->actedge++;
      igraph_i_pajek_add_numeric_edge_attribute("weight", (yyvsp[(1) - (1)].realnum), context);
      igraph_vector_push_back(context->vector, context->actfrom);
      igraph_vector_push_back(context->vector, context->actto);
    } else if (context->vcount2 + context->actto < context->vcount) {
      context->actedge++;
      igraph_i_pajek_add_numeric_edge_attribute("weight", (yyvsp[(1) - (1)].realnum), context);
      igraph_vector_push_back(context->vector, context->actfrom);
      igraph_vector_push_back(context->vector,
                              context->vcount2+context->actto);
    }
  }
  context->actto++;
;}
    break;

  case 131:
#line 500 "src/core/io/pajek-parser.y"
    { (yyval.intnum)=igraph_pajek_get_number(igraph_pajek_yyget_text(scanner),
                                          igraph_pajek_yyget_leng(scanner)); ;}
    break;

  case 132:
#line 503 "src/core/io/pajek-parser.y"
    { (yyval.realnum)=igraph_pajek_get_number(igraph_pajek_yyget_text(scanner),
                                          igraph_pajek_yyget_leng(scanner)); ;}
    break;

  case 135:
#line 508 "src/core/io/pajek-parser.y"
    { (yyval.string).str=igraph_pajek_yyget_text(scanner);
              (yyval.string).len=igraph_pajek_yyget_leng(scanner); ;}
    break;

  case 136:
#line 510 "src/core/io/pajek-parser.y"
    { (yyval.string).str=igraph_pajek_yyget_text(scanner);
              (yyval.string).len=igraph_pajek_yyget_leng(scanner); ;}
    break;

  case 137:
#line 512 "src/core/io/pajek-parser.y"
    { (yyval.string).str=igraph_pajek_yyget_text(scanner)+1;
               (yyval.string).len=igraph_pajek_yyget_leng(scanner)-2; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 2354 "yy.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;
  *++yylsp = yyloc;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (&yylloc, context, YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (&yylloc, context, yymsg);
	  }
	else
	  {
	    yyerror (&yylloc, context, YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }

  yyerror_range[0] = yylloc;

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval, &yylloc, context);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  yyerror_range[0] = yylsp[1-yylen];
  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;

      yyerror_range[0] = *yylsp;
      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp, yylsp, context);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;

  yyerror_range[1] = yylloc;
  /* Using YYLLOC is tempting, but would change the location of
     the look-ahead.  YYLOC is available though.  */
  YYLLOC_DEFAULT (yyloc, (yyerror_range - 1), 2);
  *++yylsp = yyloc;

  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (&yylloc, context, YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval, &yylloc, context);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp, yylsp, context);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 515 "src/core/io/pajek-parser.y"


int igraph_pajek_yyerror(YYLTYPE* locp,
                         igraph_i_pajek_parsedata_t *context,
                         const char *s) {
  snprintf(context->errmsg, sizeof(context->errmsg)/sizeof(char)-1,
           "Parse error in Pajek file, line %i (%s)",
           locp->first_line, s);
  return 0;
}

igraph_real_t igraph_pajek_get_number(const char *str, long int length) {
  igraph_real_t num;
  char *tmp=IGRAPH_CALLOC(length+1, char);

  strncpy(tmp, str, length);
  tmp[length]='\0';
  sscanf(tmp, "%lf", &num);
  IGRAPH_FREE(tmp);
  return num;
}

/* TODO: NA's */

int igraph_i_pajek_add_numeric_attribute(igraph_trie_t *names,
                                         igraph_vector_ptr_t *attrs,
                                         long int count,
                                         const char *attrname,
                                         igraph_integer_t vid,
                                         igraph_real_t number) {
  long int attrsize=igraph_trie_size(names);
  long int id;
  igraph_vector_t *na;
  igraph_attribute_record_t *rec;

  igraph_trie_get(names, attrname, &id);
  if (id == attrsize) {
    /* add a new attribute */
    rec=IGRAPH_CALLOC(1, igraph_attribute_record_t);
    na=IGRAPH_CALLOC(1, igraph_vector_t);
    igraph_vector_init(na, count);
    rec->name=strdup(attrname);
    rec->type=IGRAPH_ATTRIBUTE_NUMERIC;
    rec->value=na;
    igraph_vector_ptr_push_back(attrs, rec);
  }
  rec=VECTOR(*attrs)[id];
  na=(igraph_vector_t*)rec->value;
  if (igraph_vector_size(na) == vid) {
    IGRAPH_CHECK(igraph_vector_push_back(na, number));
  } else if (igraph_vector_size(na) < vid) {
    long int origsize=igraph_vector_size(na);
    IGRAPH_CHECK(igraph_vector_resize(na, (long int)vid+1));
    for (;origsize<count; origsize++) {
      VECTOR(*na)[origsize] = IGRAPH_NAN;
    }
    VECTOR(*na)[(long int) vid] = number;
  } else {
    VECTOR(*na)[(long int) vid] = number;
  }

  return 0;
}

/* TODO: NA's */

int igraph_i_pajek_add_string_attribute(igraph_trie_t *names,
                                        igraph_vector_ptr_t *attrs,
                                        long int count,
                                        const char *attrname,
                                        igraph_integer_t vid,
                                        const char *str) {
  long int attrsize=igraph_trie_size(names);
  long int id;
  igraph_strvector_t *na;
  igraph_attribute_record_t *rec;
  long int i;

  igraph_trie_get(names, attrname, &id);
  if (id == attrsize) {
    /* add a new attribute */
    rec=IGRAPH_CALLOC(1, igraph_attribute_record_t);
    na=IGRAPH_CALLOC(1, igraph_strvector_t);
    igraph_strvector_init(na, count);
    for (i=0; i<count; i++) {
      igraph_strvector_set(na, i, "");
    }
    rec->name=strdup(attrname);
    rec->type=IGRAPH_ATTRIBUTE_STRING;
    rec->value=na;
    igraph_vector_ptr_push_back(attrs, rec);
  }
  rec=VECTOR(*attrs)[id];
  na=(igraph_strvector_t*)rec->value;
  if (igraph_strvector_size(na) <= vid) {
    long int origsize=igraph_strvector_size(na);
    IGRAPH_CHECK(igraph_strvector_resize(na, vid+1));
    for (;origsize<count; origsize++) {
      igraph_strvector_set(na, origsize, "");
    }
  }
  igraph_strvector_set(na, vid, str);

  return 0;
}

int igraph_i_pajek_add_string_vertex_attribute(const char *name,
                                               const char *value,
                                               int len,
                                               igraph_i_pajek_parsedata_t *context) {
  char *tmp;
  int ret;

  tmp=IGRAPH_CALLOC(len+1, char);
  if (tmp==0) {
    IGRAPH_ERROR("cannot add element to hash table", IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_free, tmp);
  strncpy(tmp, value, len);
  tmp[len]='\0';

  ret=igraph_i_pajek_add_string_attribute(context->vertex_attribute_names,
                                          context->vertex_attributes,
                                          context->vcount,
                                          name, context->actvertex-1,
                                          tmp);

  IGRAPH_FREE(tmp);
  IGRAPH_FINALLY_CLEAN(1);

  return ret;
}

int igraph_i_pajek_add_string_edge_attribute(const char *name,
                                             const char *value,
                                             int len,
                                             igraph_i_pajek_parsedata_t *context) {
  char *tmp;
  int ret;

  tmp=IGRAPH_CALLOC(len+1, char);
  if (tmp==0) {
    IGRAPH_ERROR("cannot add element to hash table", IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_free, tmp);
  strncpy(tmp, value, len);
  tmp[len]='\0';

  ret=igraph_i_pajek_add_string_attribute(context->edge_attribute_names,
                                          context->edge_attributes,
                                          context->actedge,
                                          name, context->actedge-1,
                                          tmp);

  IGRAPH_FREE(tmp);
  IGRAPH_FINALLY_CLEAN(1);

  return ret;
}

int igraph_i_pajek_add_numeric_vertex_attribute(const char *name,
                                                igraph_real_t value,
                                                igraph_i_pajek_parsedata_t *context) {

  return
    igraph_i_pajek_add_numeric_attribute(context->vertex_attribute_names,
                                         context->vertex_attributes,
                                         context->vcount,
                                         name, context->actvertex-1,
                                         value);
}

int igraph_i_pajek_add_numeric_edge_attribute(const char *name,
                                              igraph_real_t value,
                                              igraph_i_pajek_parsedata_t *context) {

  return
    igraph_i_pajek_add_numeric_attribute(context->edge_attribute_names,
                                         context->edge_attributes,
                                         context->actedge,
                                         name, context->actedge-1,
                                         value);
}

int igraph_i_pajek_add_bipartite_type(igraph_i_pajek_parsedata_t *context) {

  const char *attrname="type";
  igraph_trie_t *names=context->vertex_attribute_names;
  igraph_vector_ptr_t *attrs=context->vertex_attributes;
  int i, n=context->vcount, n1=context->vcount2;
  long int attrid, attrsize=igraph_trie_size(names);
  igraph_attribute_record_t *rec;
  igraph_vector_t *na;

  if (n1 > n) {
    IGRAPH_ERROR("Invalid number of vertices in bipartite Pajek file",
                 IGRAPH_PARSEERROR);
  }

  igraph_trie_get(names, attrname, &attrid);
  if (attrid != attrsize) {
    IGRAPH_ERROR("Duplicate 'type' attribute in Pajek file, "
                 "this should not happen", IGRAPH_EINTERNAL);
  }

  /* add a new attribute */
  rec=IGRAPH_CALLOC(1, igraph_attribute_record_t);
  na=IGRAPH_CALLOC(1, igraph_vector_t);
  igraph_vector_init(na, n);
  rec->name=strdup(attrname);
  rec->type=IGRAPH_ATTRIBUTE_NUMERIC;
  rec->value=na;
  igraph_vector_ptr_push_back(attrs, rec);

  for (i=0; i<n1; i++) {
    VECTOR(*na)[i] = 0;
  }
  for (i=n1; i<n; i++) {
    VECTOR(*na)[i] = 1;
  }

  return 0;
}

int igraph_i_pajek_check_bipartite(igraph_i_pajek_parsedata_t *context) {
  const igraph_vector_t *edges=context->vector;
  int i, n1=context->vcount2;
  int ne=igraph_vector_size(edges);

  for (i=0; i<ne; i+=2) {
    int v1=VECTOR(*edges)[i];
    int v2=VECTOR(*edges)[i+1];
    if ( (v1 < n1 && v2 < n1) || (v1 > n1 && v2 > n1) ) {
      IGRAPH_WARNING("Invalid edge in bipartite graph");
    }
  }

  return 0;
}

