/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison implementation for Yacc-like parsers in C
   
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
#define YYBISON_VERSION "2.5"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 1

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 1

/* Substitute the variable and function names.  */
#define yyparse         igraph_dl_yyparse
#define yylex           igraph_dl_yylex
#define yyerror         igraph_dl_yyerror
#define yylval          igraph_dl_yylval
#define yychar          igraph_dl_yychar
#define yydebug         igraph_dl_yydebug
#define yynerrs         igraph_dl_yynerrs
#define yylloc          igraph_dl_yylloc

/* Copy the first part of user declarations.  */

/* Line 268 of yacc.c  */
#line 23 "src/foreign-dl-parser.y"


/* 
   IGraph library.
   Copyright (C) 2009-2012  Gabor Csardi <csardi.gabor@gmail.com>
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

#ifdef __clang__
#pragma clang diagnostic ignored "-Wconversion"
#pragma clang diagnostic ignored "-Wsign-conversion"
#endif

#include "config.h"
#include "igraph_hacks_internal.h"
#include "igraph_math.h"
#include "igraph_types_internal.h"
#include "foreign-dl-header.h"
#include "foreign-dl-parser.h"
#include <stdio.h>

#define yyscan_t void*

int igraph_dl_yylex(YYSTYPE* lvalp, YYLTYPE* llocp, void* scanner);
int igraph_dl_yyerror(YYLTYPE* locp, igraph_i_dl_parsedata_t* context, 
		      const char *s);
char *igraph_dl_yyget_text (yyscan_t yyscanner );
int igraph_dl_yyget_leng (yyscan_t yyscanner );

int igraph_i_dl_add_str(char *newstr, int length, 
			igraph_i_dl_parsedata_t *context);
int igraph_i_dl_add_edge(long int from, long int to,
			 igraph_i_dl_parsedata_t *context);
int igraph_i_dl_add_edge_w(long int from, long int to, 
			   igraph_real_t weight,
			   igraph_i_dl_parsedata_t *context);

extern igraph_real_t igraph_pajek_get_number(const char *str, long int len);

#define scanner context->scanner
 


/* Line 268 of yacc.c  */
#line 139 "y.tab.c"

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


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     NUM = 258,
     NEWLINE = 259,
     DL = 260,
     NEQ = 261,
     DATA = 262,
     LABELS = 263,
     LABELSEMBEDDED = 264,
     FORMATFULLMATRIX = 265,
     FORMATEDGELIST1 = 266,
     FORMATNODELIST1 = 267,
     DIGIT = 268,
     LABEL = 269,
     EOFF = 270
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 293 of yacc.c  */
#line 91 "src/foreign-dl-parser.y"

  long int integer;
  igraph_real_t real;



/* Line 293 of yacc.c  */
#line 197 "y.tab.c"
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


/* Copy the second part of user declarations.  */


/* Line 343 of yacc.c  */
#line 222 "y.tab.c"

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
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
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
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
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
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
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
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
  YYLTYPE yyls_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE) + sizeof (YYLTYPE)) \
      + 2 * YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
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
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  4
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   118

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  16
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  37
/* YYNRULES -- Number of rules.  */
#define YYNRULES  66
/* YYNRULES -- Number of states.  */
#define YYNSTATES  137

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   270

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
      15
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint8 yyprhs[] =
{
       0,     0,     3,    11,    12,    15,    16,    18,    20,    22,
      24,    28,    30,    31,    33,    37,    45,    51,    52,    56,
      57,    61,    62,    65,    67,    69,    73,    74,    78,    80,
      82,    85,    89,    93,    96,   104,   110,   120,   130,   131,
     134,   139,   143,   145,   146,   149,   154,   158,   160,   162,
     166,   169,   177,   183,   193,   203,   204,   207,   211,   213,
     214,   217,   218,   221,   225,   227,   228
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      17,     0,    -1,     5,     6,    38,     4,    20,    18,    19,
      -1,    -1,    18,    22,    -1,    -1,    15,    -1,    21,    -1,
      34,    -1,    43,    -1,    10,    22,    23,    -1,    23,    -1,
      -1,     4,    -1,     7,    22,    25,    -1,     8,    22,    24,
      22,     7,    22,    25,    -1,     9,    22,     7,    22,    28,
      -1,    -1,    24,    22,    14,    -1,    -1,    25,    26,     4,
      -1,    -1,    26,    27,    -1,    13,    -1,    29,    -1,    30,
       4,    32,    -1,    -1,    30,    22,    31,    -1,    14,    -1,
      33,    -1,    32,    33,    -1,    14,    26,     4,    -1,    11,
      22,    35,    -1,     7,    36,    -1,     8,    22,    24,    22,
       7,    22,    36,    -1,     9,    22,     7,    22,    39,    -1,
       8,    22,    24,    22,     9,    22,     7,    22,    39,    -1,
       9,    22,     8,    22,    24,    22,     7,    22,    39,    -1,
      -1,    36,    37,    -1,    38,    38,    41,     4,    -1,    38,
      38,     4,    -1,     3,    -1,    -1,    39,    40,    -1,    42,
      42,    41,     4,    -1,    42,    42,     4,    -1,     3,    -1,
      14,    -1,    12,    22,    44,    -1,     7,    45,    -1,     8,
      22,    24,    22,     7,    22,    45,    -1,     9,    22,     7,
      22,    49,    -1,     8,    22,    24,    22,     9,    22,     7,
      22,    49,    -1,     9,    22,     8,    22,    24,    22,     7,
      22,    49,    -1,    -1,    45,    46,    -1,    47,    48,     4,
      -1,     3,    -1,    -1,    48,    38,    -1,    -1,    49,    50,
      -1,    51,    52,     4,    -1,    42,    -1,    -1,    52,    42,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   115,   115,   117,   117,   119,   119,   121,   122,   123,
     126,   126,   128,   128,   130,   131,   132,   135,   136,   142,
     142,   147,   147,   149,   159,   161,   163,   163,   165,   169,
     173,   178,   182,   184,   185,   186,   187,   188,   191,   192,
     195,   197,   201,   204,   205,   208,   210,   214,   217,   233,
     235,   236,   237,   238,   239,   242,   243,   246,   248,   251,
     251,   257,   258,   261,   263,   267,   267
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "NUM", "NEWLINE", "DL", "NEQ", "DATA",
  "LABELS", "LABELSEMBEDDED", "FORMATFULLMATRIX", "FORMATEDGELIST1",
  "FORMATNODELIST1", "DIGIT", "LABEL", "EOFF", "$accept", "input", "trail",
  "eof", "rest", "formfullmatrix", "newline", "fullmatrix", "labels",
  "fullmatrixdata", "zerooneseq", "zeroone", "labeledfullmatrixdata",
  "reallabeledfullmatrixdata", "labelseq", "label", "labeledmatrixlines",
  "labeledmatrixline", "edgelist1", "edgelist1rest", "edgelist1data",
  "edgelist1dataline", "integer", "labelededgelist1data",
  "labelededgelist1dataline", "weight", "elabel", "nodelist1",
  "nodelist1rest", "nodelist1data", "nodelist1dataline", "from", "tolist",
  "labelednodelist1data", "labelednodelist1dataline", "fromelabel",
  "labeltolist", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    16,    17,    18,    18,    19,    19,    20,    20,    20,
      21,    21,    22,    22,    23,    23,    23,    24,    24,    25,
      25,    26,    26,    27,    28,    29,    30,    30,    31,    32,
      32,    33,    34,    35,    35,    35,    35,    35,    36,    36,
      37,    37,    38,    39,    39,    40,    40,    41,    42,    43,
      44,    44,    44,    44,    44,    45,    45,    46,    47,    48,
      48,    49,    49,    50,    51,    52,    52
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     7,     0,     2,     0,     1,     1,     1,     1,
       3,     1,     0,     1,     3,     7,     5,     0,     3,     0,
       3,     0,     2,     1,     1,     3,     0,     3,     1,     1,
       2,     3,     3,     2,     7,     5,     9,     9,     0,     2,
       4,     3,     1,     0,     2,     4,     3,     1,     1,     3,
       2,     7,     5,     9,     9,     0,     2,     3,     1,     0,
       2,     0,     2,     3,     1,     0,     2
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     0,     1,    42,     0,     0,    12,    12,
      12,    12,    12,    12,     3,     7,    11,     8,     9,    13,
      19,    17,     0,     0,     0,     0,     5,    14,    12,    12,
      10,    38,    12,    12,    32,    55,    12,    12,    49,     6,
       2,     4,     0,     0,    26,    33,    17,     0,    50,    17,
       0,    20,    23,    22,    12,    18,    16,    24,    12,    39,
       0,    12,    12,    12,    58,    56,    59,    12,    12,    12,
      19,     0,     0,     0,     0,    43,    17,     0,     0,    61,
      17,    15,    21,    25,    29,    28,    27,    47,    41,     0,
      12,    12,    35,    12,    57,    60,    12,    12,    52,    12,
       0,    30,    40,    38,     0,    48,    44,     0,     0,    55,
       0,    64,    62,    65,     0,    31,    34,    12,     0,    12,
      51,    12,     0,    12,    43,    46,     0,    43,    61,    63,
      66,    61,    36,    45,    37,    53,    54
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     2,    26,    40,    14,    15,    20,    16,    28,    27,
      42,    53,    56,    57,    58,    86,    83,    84,    17,    34,
      45,    59,    60,    92,   106,    89,   107,    18,    38,    48,
      65,    66,    77,    98,   112,   113,   122
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -93
static const yytype_int8 yypact[] =
{
      41,     3,    38,    47,   -93,   -93,    57,    56,    76,    76,
      76,    76,    76,    76,   -93,   -93,   -93,   -93,   -93,   -93,
     -93,   -93,    89,    48,    66,    69,     7,    70,    76,    76,
     -93,   -93,    76,    76,   -93,   -93,    76,    76,   -93,   -93,
     -93,   -93,     8,    19,   -93,    47,   -93,     6,    86,   -93,
      63,   -93,   -93,   -93,    76,   -93,   -93,   -93,    91,   -93,
      47,    76,    76,    76,   -93,   -93,   -93,    76,    76,    76,
     -93,    83,    84,    82,    22,   -93,   -93,    88,    25,   -93,
     -93,    70,   -93,    83,   -93,   -93,   -93,   -93,   -93,    95,
      76,    76,    87,    76,   -93,   -93,    76,    76,    87,    76,
      12,   -93,   -93,   -93,    93,   -93,   -93,    87,    28,   -93,
      96,   -93,   -93,   -93,    33,   -93,    47,    76,    90,    76,
      86,    76,     4,    76,   -93,   -93,    98,   -93,   -93,   -93,
     -93,   -93,    87,   -93,    87,    87,    87
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -93,   -93,   -93,   -93,   -93,   -93,    -9,    81,   -39,    35,
      24,   -93,   -93,   -93,   -93,   -93,   -93,    26,   -93,   -93,
      10,   -93,     2,   -76,   -93,   -11,   -92,   -93,   -93,     9,
     -93,   -93,   -93,   -59,   -93,   -93,   -93
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -22
static const yytype_int16 yytable[] =
{
      21,    22,    23,    24,    25,     6,   111,    61,   129,     3,
      67,    19,    51,    62,    63,   118,   115,    41,   105,    43,
      44,    52,    39,    46,    47,    52,    54,    49,    50,    90,
     130,    91,    96,    55,    97,   119,    55,    93,     4,    55,
     123,    99,    55,   111,   111,    70,     1,    55,   132,    72,
       5,   134,    74,    75,    76,     8,     9,    10,    78,    79,
      80,     7,    73,     8,     9,    10,    11,    12,    13,   135,
      68,    69,   136,    31,    32,    33,    35,    36,    37,    95,
      19,   103,   104,   -21,   108,    87,    88,   109,   110,    64,
     114,     5,    94,    87,   125,    71,    29,    82,    85,   102,
     117,   105,   133,   121,    30,    81,   100,   126,   124,   101,
     127,     0,   128,   116,   131,     0,     0,     0,   120
};

#define yypact_value_is_default(yystate) \
  ((yystate) == (-93))

#define yytable_value_is_error(yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
       9,    10,    11,    12,    13,     3,    98,    46,     4,     6,
      49,     4,     4,     7,     8,   107,     4,    26,    14,    28,
      29,    13,    15,    32,    33,    13,     7,    36,    37,     7,
     122,     9,     7,    14,     9,     7,    14,    76,     0,    14,
       7,    80,    14,   135,   136,    54,     5,    14,   124,    58,
       3,   127,    61,    62,    63,     7,     8,     9,    67,    68,
      69,     4,    60,     7,     8,     9,    10,    11,    12,   128,
       7,     8,   131,     7,     8,     9,     7,     8,     9,    77,
       4,    90,    91,    13,    93,     3,     4,    96,    97,     3,
      99,     3,     4,     3,     4,     4,     7,    14,    14,     4,
       7,    14,     4,     7,    23,    70,    82,   118,   117,    83,
     119,    -1,   121,   103,   123,    -1,    -1,    -1,   109
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     5,    17,     6,     0,     3,    38,     4,     7,     8,
       9,    10,    11,    12,    20,    21,    23,    34,    43,     4,
      22,    22,    22,    22,    22,    22,    18,    25,    24,     7,
      23,     7,     8,     9,    35,     7,     8,     9,    44,    15,
      19,    22,    26,    22,    22,    36,    22,    22,    45,    22,
      22,     4,    13,    27,     7,    14,    28,    29,    30,    37,
      38,    24,     7,     8,     3,    46,    47,    24,     7,     8,
      22,     4,    22,    38,    22,    22,    22,    48,    22,    22,
      22,    25,    14,    32,    33,    14,    31,     3,     4,    41,
       7,     9,    39,    24,     4,    38,     7,     9,    49,    24,
      26,    33,     4,    22,    22,    14,    40,    42,    22,    22,
      22,    42,    50,    51,    22,     4,    36,     7,    42,     7,
      45,     7,    52,     7,    22,     4,    41,    22,    22,     4,
      42,    22,    39,     4,    39,    49,    49
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
   Once GCC version 2 has supplanted version 1, this can go.  However,
   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
   discussed.  */

#define YYFAIL		goto yyerrlab
#if defined YYFAIL
  /* This is here to suppress warnings from the GCC cpp's
     -Wunused-macros.  Normally we don't worry about that warning, but
     some users do, and we want to make it easy for users to remove
     YYFAIL uses, which will produce warnings from Bison 2.5.  */
#endif

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
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
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp, igraph_i_dl_parsedata_t* context)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp, context)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    YYLTYPE const * const yylocationp;
    igraph_i_dl_parsedata_t* context;
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
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp, igraph_i_dl_parsedata_t* context)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, yylocationp, context)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    YYLTYPE const * const yylocationp;
    igraph_i_dl_parsedata_t* context;
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
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
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
yy_reduce_print (YYSTYPE *yyvsp, YYLTYPE *yylsp, int yyrule, igraph_i_dl_parsedata_t* context)
#else
static void
yy_reduce_print (yyvsp, yylsp, yyrule, context)
    YYSTYPE *yyvsp;
    YYLTYPE *yylsp;
    int yyrule;
    igraph_i_dl_parsedata_t* context;
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
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       , &(yylsp[(yyi + 1) - (yynrhs)])		       , context);
      YYFPRINTF (stderr, "\n");
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

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (0, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  YYSIZE_T yysize1;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = 0;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - Assume YYFAIL is not used.  It's too flawed to consider.  See
       <http://lists.gnu.org/archive/html/bison-patches/2009-12/msg00024.html>
       for details.  YYERROR is fine as it does not invoke this
       function.
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                yysize1 = yysize + yytnamerr (0, yytname[yyx]);
                if (! (yysize <= yysize1
                       && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                  return 2;
                yysize = yysize1;
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  yysize1 = yysize + yystrlen (yyformat);
  if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
    return 2;
  yysize = yysize1;

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, YYLTYPE *yylocationp, igraph_i_dl_parsedata_t* context)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, yylocationp, context)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    YYLTYPE *yylocationp;
    igraph_i_dl_parsedata_t* context;
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
int yyparse (igraph_i_dl_parsedata_t* context);
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
yyparse (igraph_i_dl_parsedata_t* context)
#else
int
yyparse (context)
    igraph_i_dl_parsedata_t* context;
#endif
#endif
{
/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Location data for the lookahead symbol.  */
YYLTYPE yylloc;

    /* Number of syntax errors so far.  */
    int yynerrs;

    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.
       `yyls': related to locations.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    /* The location stack.  */
    YYLTYPE yylsa[YYINITDEPTH];
    YYLTYPE *yyls;
    YYLTYPE *yylsp;

    /* The locations where the error started and ended.  */
    YYLTYPE yyerror_range[3];

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
  YYLTYPE yyloc;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N), yylsp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yyls = yylsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

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
  yylloc.first_column = yylloc.last_column = 1;
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
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
	YYSTACK_RELOCATE (yyls_alloc, yyls);
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

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
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
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
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

/* Line 1806 of yacc.c  */
#line 115 "src/foreign-dl-parser.y"
    { context->n=(yyvsp[(3) - (7)].integer); }
    break;

  case 7:

/* Line 1806 of yacc.c  */
#line 121 "src/foreign-dl-parser.y"
    { context->type=IGRAPH_DL_MATRIX; }
    break;

  case 8:

/* Line 1806 of yacc.c  */
#line 122 "src/foreign-dl-parser.y"
    { context->type=IGRAPH_DL_EDGELIST1; }
    break;

  case 9:

/* Line 1806 of yacc.c  */
#line 123 "src/foreign-dl-parser.y"
    { context->type=IGRAPH_DL_NODELIST1; }
    break;

  case 10:

/* Line 1806 of yacc.c  */
#line 126 "src/foreign-dl-parser.y"
    {}
    break;

  case 11:

/* Line 1806 of yacc.c  */
#line 126 "src/foreign-dl-parser.y"
    {}
    break;

  case 14:

/* Line 1806 of yacc.c  */
#line 130 "src/foreign-dl-parser.y"
    { }
    break;

  case 15:

/* Line 1806 of yacc.c  */
#line 131 "src/foreign-dl-parser.y"
    { }
    break;

  case 16:

/* Line 1806 of yacc.c  */
#line 132 "src/foreign-dl-parser.y"
    { }
    break;

  case 17:

/* Line 1806 of yacc.c  */
#line 135 "src/foreign-dl-parser.y"
    {}
    break;

  case 18:

/* Line 1806 of yacc.c  */
#line 136 "src/foreign-dl-parser.y"
    { 
	      igraph_i_dl_add_str(igraph_dl_yyget_text(scanner), 
                                  igraph_dl_yyget_leng(scanner), 
				  context); }
    break;

  case 19:

/* Line 1806 of yacc.c  */
#line 142 "src/foreign-dl-parser.y"
    {}
    break;

  case 20:

/* Line 1806 of yacc.c  */
#line 142 "src/foreign-dl-parser.y"
    {
  context->from += 1;
  context->to = 0;
 }
    break;

  case 22:

/* Line 1806 of yacc.c  */
#line 147 "src/foreign-dl-parser.y"
    { }
    break;

  case 23:

/* Line 1806 of yacc.c  */
#line 149 "src/foreign-dl-parser.y"
    {
  if (igraph_dl_yyget_text(scanner)[0]=='1') {
    IGRAPH_CHECK(igraph_vector_push_back(&context->edges, 
					 context->from));
    IGRAPH_CHECK(igraph_vector_push_back(&context->edges, 
					 context->to));
  }
  context->to += 1;
}
    break;

  case 24:

/* Line 1806 of yacc.c  */
#line 159 "src/foreign-dl-parser.y"
    {}
    break;

  case 25:

/* Line 1806 of yacc.c  */
#line 161 "src/foreign-dl-parser.y"
    {}
    break;

  case 28:

/* Line 1806 of yacc.c  */
#line 165 "src/foreign-dl-parser.y"
    { igraph_i_dl_add_str(igraph_dl_yyget_text(scanner), 
                                   igraph_dl_yyget_leng(scanner), 
				   context); }
    break;

  case 29:

/* Line 1806 of yacc.c  */
#line 169 "src/foreign-dl-parser.y"
    {
	         context->from += 1; 
		 context->to = 0;
               }
    break;

  case 30:

/* Line 1806 of yacc.c  */
#line 173 "src/foreign-dl-parser.y"
    { 
	         context->from += 1; 
		 context->to = 0;
               }
    break;

  case 31:

/* Line 1806 of yacc.c  */
#line 178 "src/foreign-dl-parser.y"
    { }
    break;

  case 32:

/* Line 1806 of yacc.c  */
#line 182 "src/foreign-dl-parser.y"
    {}
    break;

  case 33:

/* Line 1806 of yacc.c  */
#line 184 "src/foreign-dl-parser.y"
    {}
    break;

  case 34:

/* Line 1806 of yacc.c  */
#line 185 "src/foreign-dl-parser.y"
    {}
    break;

  case 35:

/* Line 1806 of yacc.c  */
#line 186 "src/foreign-dl-parser.y"
    {}
    break;

  case 36:

/* Line 1806 of yacc.c  */
#line 187 "src/foreign-dl-parser.y"
    {}
    break;

  case 37:

/* Line 1806 of yacc.c  */
#line 188 "src/foreign-dl-parser.y"
    {}
    break;

  case 38:

/* Line 1806 of yacc.c  */
#line 191 "src/foreign-dl-parser.y"
    {}
    break;

  case 39:

/* Line 1806 of yacc.c  */
#line 192 "src/foreign-dl-parser.y"
    {}
    break;

  case 40:

/* Line 1806 of yacc.c  */
#line 195 "src/foreign-dl-parser.y"
    {
                   igraph_i_dl_add_edge_w((yyvsp[(1) - (4)].integer)-1, (yyvsp[(2) - (4)].integer)-1, (yyvsp[(3) - (4)].real), context); }
    break;

  case 41:

/* Line 1806 of yacc.c  */
#line 197 "src/foreign-dl-parser.y"
    {
		   igraph_i_dl_add_edge((yyvsp[(1) - (3)].integer)-1, (yyvsp[(2) - (3)].integer)-1, context);
}
    break;

  case 42:

/* Line 1806 of yacc.c  */
#line 201 "src/foreign-dl-parser.y"
    { (yyval.integer)=igraph_pajek_get_number(igraph_dl_yyget_text(scanner), 
					  igraph_dl_yyget_leng(scanner)); }
    break;

  case 43:

/* Line 1806 of yacc.c  */
#line 204 "src/foreign-dl-parser.y"
    {}
    break;

  case 44:

/* Line 1806 of yacc.c  */
#line 205 "src/foreign-dl-parser.y"
    {}
    break;

  case 45:

/* Line 1806 of yacc.c  */
#line 208 "src/foreign-dl-parser.y"
    {
                          igraph_i_dl_add_edge_w((yyvsp[(1) - (4)].integer), (yyvsp[(2) - (4)].integer), (yyvsp[(3) - (4)].real), context); }
    break;

  case 46:

/* Line 1806 of yacc.c  */
#line 210 "src/foreign-dl-parser.y"
    {
			  igraph_i_dl_add_edge((yyvsp[(1) - (3)].integer), (yyvsp[(2) - (3)].integer), context);
 }
    break;

  case 47:

/* Line 1806 of yacc.c  */
#line 214 "src/foreign-dl-parser.y"
    { (yyval.real)=igraph_pajek_get_number(igraph_dl_yyget_text(scanner), 
					 igraph_dl_yyget_leng(scanner)); }
    break;

  case 48:

/* Line 1806 of yacc.c  */
#line 217 "src/foreign-dl-parser.y"
    {
  /* Copy label list to trie, if needed */
  if (igraph_strvector_size(&context->labels) != 0) {
    long int i, id, n=igraph_strvector_size(&context->labels);
    for (i=0; i<n; i++) {
      igraph_trie_get(&context->trie,
		      STR(context->labels, i), &id);
    }
    igraph_strvector_clear(&context->labels);
  }
  igraph_trie_get2(&context->trie, igraph_dl_yyget_text(scanner), 
		   igraph_dl_yyget_leng(scanner), &(yyval.integer));
 }
    break;

  case 49:

/* Line 1806 of yacc.c  */
#line 233 "src/foreign-dl-parser.y"
    {}
    break;

  case 50:

/* Line 1806 of yacc.c  */
#line 235 "src/foreign-dl-parser.y"
    {}
    break;

  case 51:

/* Line 1806 of yacc.c  */
#line 236 "src/foreign-dl-parser.y"
    {}
    break;

  case 52:

/* Line 1806 of yacc.c  */
#line 237 "src/foreign-dl-parser.y"
    {}
    break;

  case 53:

/* Line 1806 of yacc.c  */
#line 238 "src/foreign-dl-parser.y"
    {}
    break;

  case 54:

/* Line 1806 of yacc.c  */
#line 239 "src/foreign-dl-parser.y"
    {}
    break;

  case 55:

/* Line 1806 of yacc.c  */
#line 242 "src/foreign-dl-parser.y"
    {}
    break;

  case 56:

/* Line 1806 of yacc.c  */
#line 243 "src/foreign-dl-parser.y"
    {}
    break;

  case 57:

/* Line 1806 of yacc.c  */
#line 246 "src/foreign-dl-parser.y"
    {}
    break;

  case 58:

/* Line 1806 of yacc.c  */
#line 248 "src/foreign-dl-parser.y"
    { context->from=igraph_pajek_get_number(igraph_dl_yyget_text(scanner),
							  igraph_dl_yyget_leng(scanner)); }
    break;

  case 59:

/* Line 1806 of yacc.c  */
#line 251 "src/foreign-dl-parser.y"
    {}
    break;

  case 60:

/* Line 1806 of yacc.c  */
#line 251 "src/foreign-dl-parser.y"
    { 
  IGRAPH_CHECK(igraph_vector_push_back(&context->edges, 
				       context->from-1)); 
  IGRAPH_CHECK(igraph_vector_push_back(&context->edges, (yyvsp[(2) - (2)].integer)-1));
 }
    break;

  case 61:

/* Line 1806 of yacc.c  */
#line 257 "src/foreign-dl-parser.y"
    {}
    break;

  case 62:

/* Line 1806 of yacc.c  */
#line 258 "src/foreign-dl-parser.y"
    {}
    break;

  case 63:

/* Line 1806 of yacc.c  */
#line 261 "src/foreign-dl-parser.y"
    { }
    break;

  case 64:

/* Line 1806 of yacc.c  */
#line 263 "src/foreign-dl-parser.y"
    {
  context->from=(yyvsp[(1) - (1)].integer);
 }
    break;

  case 66:

/* Line 1806 of yacc.c  */
#line 267 "src/foreign-dl-parser.y"
    {
  IGRAPH_CHECK(igraph_vector_push_back(&context->edges, 
				       context->from));
  IGRAPH_CHECK(igraph_vector_push_back(&context->edges, (yyvsp[(2) - (2)].integer)));
 }
    break;



/* Line 1806 of yacc.c  */
#line 2047 "y.tab.c"
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
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
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (&yylloc, context, YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (&yylloc, context, yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }

  yyerror_range[1] = yylloc;

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
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

  /* Else will try to reuse lookahead token after shifting the error
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

  yyerror_range[1] = yylsp[1-yylen];
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
      if (!yypact_value_is_default (yyn))
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

      yyerror_range[1] = *yylsp;
      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp, yylsp, context);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;

  yyerror_range[2] = yylloc;
  /* Using YYLLOC is tempting, but would change the location of
     the lookahead.  YYLOC is available though.  */
  YYLLOC_DEFAULT (yyloc, yyerror_range, 2);
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

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (&yylloc, context, YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval, &yylloc, context);
    }
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



/* Line 2067 of yacc.c  */
#line 273 "src/foreign-dl-parser.y"


int igraph_dl_yyerror(YYLTYPE* locp, igraph_i_dl_parsedata_t* context, 
		      const char *s) {
  snprintf(context->errmsg, 
	   sizeof(context->errmsg)/sizeof(char)-1, 
	   "%s in line %i", s, locp->first_line);
  return 0;
}

int igraph_i_dl_add_str(char *newstr, int length, 
			igraph_i_dl_parsedata_t *context) {
  int tmp=newstr[length];
  newstr[length]='\0';
  IGRAPH_CHECK(igraph_strvector_add(&context->labels, newstr));
  newstr[length]=tmp;
  return 0;
}

int igraph_i_dl_add_edge(long int from, long int to, 
			 igraph_i_dl_parsedata_t *context) {
  IGRAPH_CHECK(igraph_vector_push_back(&context->edges, from));
  IGRAPH_CHECK(igraph_vector_push_back(&context->edges, to));
  return 0;
}

int igraph_i_dl_add_edge_w(long int from, long int to, 
			   igraph_real_t weight,
			   igraph_i_dl_parsedata_t *context) {
  long int n=igraph_vector_size(&context->weights);
  long int n2=igraph_vector_size(&context->edges)/2;
  if (n != n2) {
    igraph_vector_resize(&context->weights, n2);
    for (; n<n2; n++) {
      VECTOR(context->weights)[n]=IGRAPH_NAN;
    }
  }
  IGRAPH_CHECK(igraph_i_dl_add_edge(from, to, context));
  IGRAPH_CHECK(igraph_vector_push_back(&context->weights, weight));
  return 0;
}

