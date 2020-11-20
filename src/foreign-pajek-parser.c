/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 1

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1


/* Substitute the variable and function names.  */
#define yyparse         igraph_pajek_yyparse
#define yylex           igraph_pajek_yylex
#define yyerror         igraph_pajek_yyerror
#define yydebug         igraph_pajek_yydebug
#define yynerrs         igraph_pajek_yynerrs


/* Copy the first part of user declarations.  */
#line 23 "src/foreign-pajek-parser.y" /* yacc.c:339  */


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
#include "igraph_hacks_internal.h"
#include "igraph_types.h"
#include "igraph_types_internal.h"
#include "igraph_memory.h"
#include "igraph_error.h"
#include "igraph_attributes.h"
#include "config.h"
#include "igraph_math.h"
#include <math.h>
#include "foreign-pajek-header.h"
#include "foreign-pajek-parser.h"

#define yyscan_t void*

int igraph_pajek_yylex(YYSTYPE* lvalp, YYLTYPE* llocp, 
		       void* scanner);
int igraph_pajek_yyerror(YYLTYPE* locp, 
			 igraph_i_pajek_parsedata_t *context, 
			 const char *s);
char *igraph_pajek_yyget_text (yyscan_t yyscanner );
int igraph_pajek_yyget_leng (yyscan_t yyscanner );

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


#line 158 "y.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 1
#endif

/* In a future release of Bison, this section will be replaced
   by #include "y.tab.h".  */
#ifndef YY_IGRAPH_PAJEK_YY_Y_TAB_H_INCLUDED
# define YY_IGRAPH_PAJEK_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int igraph_pajek_yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
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

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 118 "src/foreign-pajek-parser.y" /* yacc.c:355  */

  long int intnum;
  double   realnum;  
  struct {
    char *str;
    int len;
  } string;  

#line 259 "y.tab.c" /* yacc.c:355  */
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

#endif /* !YY_IGRAPH_PAJEK_YY_Y_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 289 "y.tab.c" /* yacc.c:358  */

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
#else
typedef signed char yytype_int8;
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
# elif ! defined YYSIZE_T
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
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
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
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
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
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
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
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

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
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  207

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   306

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
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
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   192,   192,   196,   196,   198,   200,   204,   210,   210,
     212,   213,   214,   214,   217,   219,   224,   225,   229,   235,
     235,   239,   239,   242,   243,   246,   249,   254,   259,   264,
     267,   270,   273,   276,   279,   282,   285,   288,   293,   293,
     297,   297,   301,   301,   305,   305,   310,   310,   317,   319,
     319,   319,   319,   319,   319,   321,   322,   324,   324,   326,
     327,   327,   333,   335,   337,   338,   340,   340,   342,   343,
     343,   349,   351,   353,   353,   357,   357,   360,   361,   366,
     369,   372,   375,   378,   381,   384,   387,   390,   393,   396,
     399,   402,   405,   408,   413,   413,   417,   417,   421,   421,
     425,   425,   429,   429,   435,   437,   439,   439,   441,   441,
     443,   443,   445,   447,   452,   454,   454,   456,   456,   458,
     458,   460,   462,   469,   471,   476,   476,   478,   480,   480,
     482,   502,   505,   508,   508,   510,   512,   514
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 1
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "NEWLINE", "NUM", "ALNUM", "QSTR",
  "PSTR", "NETWORKLINE", "VERTICESLINE", "ARCSLINE", "EDGESLINE",
  "ARCSLISTLINE", "EDGESLISTLINE", "MATRIXLINE", "ERROR", "VP_X_FACT",
  "VP_Y_FACT", "VP_IC", "VP_BC", "VP_LC", "VP_LR", "VP_LPHI", "VP_BW",
  "VP_FOS", "VP_PHI", "VP_R", "VP_Q", "VP_LA", "VP_FONT", "VP_URL",
  "VP_SIZE", "EP_C", "EP_S", "EP_A", "EP_W", "EP_H1", "EP_H2", "EP_A1",
  "EP_A2", "EP_K1", "EP_K2", "EP_AP", "EP_P", "EP_L", "EP_LP", "EP_LR",
  "EP_LPHI", "EP_LC", "EP_LA", "EP_SIZE", "EP_FOS", "$accept", "input",
  "nethead", "vertices", "verticeshead", "vertdefs", "vertexline", "$@1",
  "vertex", "vertexid", "vertexcoords", "shape", "params", "param",
  "vpword", "$@2", "$@3", "$@4", "$@5", "$@6", "vpwordpar", "edgeblock",
  "arcs", "arcsdefs", "arcsline", "$@7", "arcfrom", "arcto", "edges",
  "edgesdefs", "edgesline", "$@8", "edgefrom", "edgeto", "weight",
  "edgeparams", "edgeparam", "epword", "$@9", "$@10", "$@11", "$@12",
  "$@13", "epwordpar", "arcslist", "arcslistlines", "arclistline",
  "arctolist", "arclistfrom", "arclistto", "edgeslist", "edgelistlines",
  "edgelistline", "edgetolist", "edgelistfrom", "edgelistto", "adjmatrix",
  "matrixline", "adjmatrixlines", "adjmatrixline", "adjmatrixnumbers",
  "adjmatrixentry", "longint", "number", "words", "word", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
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

#define YYPACT_NINF -167

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-167)))

#define YYTABLE_NINF -129

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
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

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
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

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
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

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
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


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (&yylloc, context, YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)                                \
    do                                                                  \
      if (N)                                                            \
        {                                                               \
          (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;        \
          (Current).first_column = YYRHSLOC (Rhs, 1).first_column;      \
          (Current).last_line    = YYRHSLOC (Rhs, N).last_line;         \
          (Current).last_column  = YYRHSLOC (Rhs, N).last_column;       \
        }                                                               \
      else                                                              \
        {                                                               \
          (Current).first_line   = (Current).last_line   =              \
            YYRHSLOC (Rhs, 0).last_line;                                \
          (Current).first_column = (Current).last_column =              \
            YYRHSLOC (Rhs, 0).last_column;                              \
        }                                                               \
    while (0)
#endif

#define YYRHSLOC(Rhs, K) ((Rhs)[K])


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL

/* Print *YYLOCP on YYO.  Private, do not rely on its existence. */

YY_ATTRIBUTE_UNUSED
static unsigned
yy_location_print_ (FILE *yyo, YYLTYPE const * const yylocp)
{
  unsigned res = 0;
  int end_col = 0 != yylocp->last_column ? yylocp->last_column - 1 : 0;
  if (0 <= yylocp->first_line)
    {
      res += YYFPRINTF (yyo, "%d", yylocp->first_line);
      if (0 <= yylocp->first_column)
        res += YYFPRINTF (yyo, ".%d", yylocp->first_column);
    }
  if (0 <= yylocp->last_line)
    {
      if (yylocp->first_line < yylocp->last_line)
        {
          res += YYFPRINTF (yyo, "-%d", yylocp->last_line);
          if (0 <= end_col)
            res += YYFPRINTF (yyo, ".%d", end_col);
        }
      else if (0 <= end_col && yylocp->first_column < end_col)
        res += YYFPRINTF (yyo, "-%d", end_col);
    }
  return res;
 }

#  define YY_LOCATION_PRINT(File, Loc)          \
  yy_location_print_ (File, &(Loc))

# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value, Location, context); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp, igraph_i_pajek_parsedata_t* context)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  YYUSE (yylocationp);
  YYUSE (context);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp, igraph_i_pajek_parsedata_t* context)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  YY_LOCATION_PRINT (yyoutput, *yylocationp);
  YYFPRINTF (yyoutput, ": ");
  yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp, context);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, YYLTYPE *yylsp, int yyrule, igraph_i_pajek_parsedata_t* context)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                       , &(yylsp[(yyi + 1) - (yynrhs)])                       , context);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, yylsp, Rule, context); \
} while (0)

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
#ifndef YYINITDEPTH
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
static YYSIZE_T
yystrlen (const char *yystr)
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
static char *
yystpcpy (char *yydest, const char *yysrc)
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
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
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
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
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

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

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

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, YYLTYPE *yylocationp, igraph_i_pajek_parsedata_t* context)
{
  YYUSE (yyvaluep);
  YYUSE (yylocationp);
  YYUSE (context);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/*----------.
| yyparse.  |
`----------*/

int
yyparse (igraph_i_pajek_parsedata_t* context)
{
/* The lookahead symbol.  */
int yychar;


/* The semantic value of the lookahead symbol.  */
/* Default value used for initialization, for pacifying older GCCs
   or non-GCC compilers.  */
YY_INITIAL_VALUE (static YYSTYPE yyval_default;)
YYSTYPE yylval YY_INITIAL_VALUE (= yyval_default);

/* Location data for the lookahead symbol.  */
static YYLTYPE yyloc_default
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
  = { 1, 1, 1, 1 }
# endif
;
YYLTYPE yylloc = yyloc_default;

    /* Number of syntax errors so far.  */
    int yynerrs;

    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.
       'yyls': related to locations.

       Refer to the stacks through separate pointers, to allow yyoverflow
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
  int yytoken = 0;
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

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yylsp = yyls = yylsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  yylsp[0] = yylloc;
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
      yychar = yylex (&yylval, &yylloc, scanner);
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
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END
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
     '$$ = $1'.

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
#line 192 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
  if (context->vcount2 > 0) { igraph_i_pajek_check_bipartite(context); }
 }
#line 1647 "y.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 200 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { 
  context->vcount=(yyvsp[0].intnum); 
  context->vcount2=0;
            }
#line 1656 "y.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 204 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { 
  context->vcount=(yyvsp[-1].intnum);
  context->vcount2=(yyvsp[0].intnum);
  igraph_i_pajek_add_bipartite_type(context);
}
#line 1666 "y.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 214 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->actvertex=(yyvsp[0].intnum); }
#line 1672 "y.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 214 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { }
#line 1678 "y.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 217 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { (yyval.intnum)=(yyvsp[0].intnum); context->mode=1; }
#line 1684 "y.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 219 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
  igraph_i_pajek_add_string_vertex_attribute("id", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
  igraph_i_pajek_add_string_vertex_attribute("name", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
}
#line 1693 "y.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 225 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { 
  igraph_i_pajek_add_numeric_vertex_attribute("x", (yyvsp[-1].realnum), context);
  igraph_i_pajek_add_numeric_vertex_attribute("y", (yyvsp[0].realnum), context);
	    }
#line 1702 "y.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 229 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { 
  igraph_i_pajek_add_numeric_vertex_attribute("x", (yyvsp[-2].realnum), context);
  igraph_i_pajek_add_numeric_vertex_attribute("y", (yyvsp[-1].realnum), context);
  igraph_i_pajek_add_numeric_vertex_attribute("z", (yyvsp[0].realnum), context);
	    }
#line 1712 "y.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 235 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { 
  igraph_i_pajek_add_string_vertex_attribute("shape", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
}
#line 1720 "y.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 243 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
	 igraph_i_pajek_add_numeric_vertex_attribute("xfact", (yyvsp[0].realnum), context);
       }
#line 1728 "y.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 246 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
         igraph_i_pajek_add_numeric_vertex_attribute("yfact", (yyvsp[0].realnum), context);
       }
#line 1736 "y.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 249 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { /* RGB color */
         igraph_i_pajek_add_numeric_vertex_attribute("color-red", (yyvsp[-2].realnum), context);
	 igraph_i_pajek_add_numeric_vertex_attribute("color-green", (yyvsp[-1].realnum), context);
	 igraph_i_pajek_add_numeric_vertex_attribute("color-blue", (yyvsp[0].realnum), context);
       }
#line 1746 "y.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 254 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
         igraph_i_pajek_add_numeric_vertex_attribute("framecolor-red", (yyvsp[-2].realnum), context);
	 igraph_i_pajek_add_numeric_vertex_attribute("framecolor-green", (yyvsp[-1].realnum), context);
	 igraph_i_pajek_add_numeric_vertex_attribute("framecolor-blue", (yyvsp[0].realnum), context);
       }
#line 1756 "y.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 259 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
         igraph_i_pajek_add_numeric_vertex_attribute("labelcolor-red", (yyvsp[-2].realnum), context);
	 igraph_i_pajek_add_numeric_vertex_attribute("labelcolor-green", (yyvsp[-1].realnum), context);
	 igraph_i_pajek_add_numeric_vertex_attribute("labelcolor-blue", (yyvsp[0].realnum), context);
       }
#line 1766 "y.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 264 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
         igraph_i_pajek_add_numeric_vertex_attribute("labeldist", (yyvsp[0].realnum), context);
     }
#line 1774 "y.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 267 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
         igraph_i_pajek_add_numeric_vertex_attribute("labeldegree2", (yyvsp[0].realnum), context);
     }
#line 1782 "y.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 270 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
         igraph_i_pajek_add_numeric_vertex_attribute("framewidth", (yyvsp[0].realnum), context);
     }
#line 1790 "y.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 273 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
         igraph_i_pajek_add_numeric_vertex_attribute("fontsize", (yyvsp[0].realnum), context);
     }
#line 1798 "y.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 276 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {       
         igraph_i_pajek_add_numeric_vertex_attribute("rotation", (yyvsp[0].realnum), context);
     }
#line 1806 "y.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 279 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
         igraph_i_pajek_add_numeric_vertex_attribute("radius", (yyvsp[0].realnum), context);
     }
#line 1814 "y.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 282 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
         igraph_i_pajek_add_numeric_vertex_attribute("diamondratio", (yyvsp[0].realnum), context);
     }
#line 1822 "y.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 285 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
         igraph_i_pajek_add_numeric_vertex_attribute("labeldegree", (yyvsp[0].realnum), context);
     }
#line 1830 "y.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 288 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
         igraph_i_pajek_add_numeric_vertex_attribute("vertexsize", (yyvsp[0].realnum), context);
     }
#line 1838 "y.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 293 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->mode=3; }
#line 1844 "y.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 293 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { 
         context->mode=1;
	 igraph_i_pajek_add_string_vertex_attribute("font", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
     }
#line 1853 "y.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 297 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->mode=3; }
#line 1859 "y.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 297 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
         context->mode=1;
	 igraph_i_pajek_add_string_vertex_attribute("url", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
     }
#line 1868 "y.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 301 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->mode=3; }
#line 1874 "y.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 301 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
         context->mode=1;
	 igraph_i_pajek_add_string_vertex_attribute("color", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
     }
#line 1883 "y.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 305 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->mode=3; }
#line 1889 "y.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 305 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
         context->mode=1;
	 igraph_i_pajek_add_string_vertex_attribute("framecolor", 
						    (yyvsp[0].string).str, (yyvsp[0].string).len, context);
     }
#line 1899 "y.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 310 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->mode=3; }
#line 1905 "y.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 310 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
         context->mode=1;
	 igraph_i_pajek_add_string_vertex_attribute("labelcolor", 
						    (yyvsp[0].string).str, (yyvsp[0].string).len, context);
     }
#line 1915 "y.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 317 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { (yyval.string)=(yyvsp[0].string); }
#line 1921 "y.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 321 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->directed=1; }
#line 1927 "y.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 322 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->directed=1; }
#line 1933 "y.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 327 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->actedge++;
	                  context->mode=2; }
#line 1940 "y.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 328 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { 
  igraph_vector_push_back(context->vector, (yyvsp[-5].intnum)-1);
  igraph_vector_push_back(context->vector, (yyvsp[-4].intnum)-1); }
#line 1948 "y.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 337 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->directed=0; }
#line 1954 "y.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 338 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->directed=0; }
#line 1960 "y.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 343 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->actedge++; 
	                    context->mode=2; }
#line 1967 "y.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 344 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { 
  igraph_vector_push_back(context->vector, (yyvsp[-5].intnum)-1);
  igraph_vector_push_back(context->vector, (yyvsp[-4].intnum)-1); }
#line 1975 "y.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 353 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
  igraph_i_pajek_add_numeric_edge_attribute("weight", (yyvsp[0].realnum), context);
}
#line 1983 "y.tab.c" /* yacc.c:1646  */
    break;

  case 78:
#line 361 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
       igraph_i_pajek_add_numeric_edge_attribute("color-red", (yyvsp[-2].realnum), context);
       igraph_i_pajek_add_numeric_edge_attribute("color-green", (yyvsp[-1].realnum), context);
       igraph_i_pajek_add_numeric_edge_attribute("color-blue", (yyvsp[0].realnum), context);
   }
#line 1993 "y.tab.c" /* yacc.c:1646  */
    break;

  case 79:
#line 366 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { 
       igraph_i_pajek_add_numeric_edge_attribute("arrowsize", (yyvsp[0].realnum), context);
   }
#line 2001 "y.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 369 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
       igraph_i_pajek_add_numeric_edge_attribute("edgewidth", (yyvsp[0].realnum), context);
   }
#line 2009 "y.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 372 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
       igraph_i_pajek_add_numeric_edge_attribute("hook1", (yyvsp[0].realnum), context);
   }
#line 2017 "y.tab.c" /* yacc.c:1646  */
    break;

  case 82:
#line 375 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
       igraph_i_pajek_add_numeric_edge_attribute("hook2", (yyvsp[0].realnum), context);
   }
#line 2025 "y.tab.c" /* yacc.c:1646  */
    break;

  case 83:
#line 378 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
       igraph_i_pajek_add_numeric_edge_attribute("angle1", (yyvsp[0].realnum), context);
   }
#line 2033 "y.tab.c" /* yacc.c:1646  */
    break;

  case 84:
#line 381 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
       igraph_i_pajek_add_numeric_edge_attribute("angle2", (yyvsp[0].realnum), context);
   }
#line 2041 "y.tab.c" /* yacc.c:1646  */
    break;

  case 85:
#line 384 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
       igraph_i_pajek_add_numeric_edge_attribute("velocity1", (yyvsp[0].realnum), context);
   }
#line 2049 "y.tab.c" /* yacc.c:1646  */
    break;

  case 86:
#line 387 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
       igraph_i_pajek_add_numeric_edge_attribute("velocity2", (yyvsp[0].realnum), context);
   }
#line 2057 "y.tab.c" /* yacc.c:1646  */
    break;

  case 87:
#line 390 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
       igraph_i_pajek_add_numeric_edge_attribute("arrowpos", (yyvsp[0].realnum), context);
   }
#line 2065 "y.tab.c" /* yacc.c:1646  */
    break;

  case 88:
#line 393 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
       igraph_i_pajek_add_numeric_edge_attribute("labelpos", (yyvsp[0].realnum), context);
   }
#line 2073 "y.tab.c" /* yacc.c:1646  */
    break;

  case 89:
#line 396 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
       igraph_i_pajek_add_numeric_edge_attribute("labelangle", (yyvsp[0].realnum), context);
   }
#line 2081 "y.tab.c" /* yacc.c:1646  */
    break;

  case 90:
#line 399 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
       igraph_i_pajek_add_numeric_edge_attribute("labelangle2", (yyvsp[0].realnum), context);
   }
#line 2089 "y.tab.c" /* yacc.c:1646  */
    break;

  case 91:
#line 402 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
       igraph_i_pajek_add_numeric_edge_attribute("labeldegree", (yyvsp[0].realnum), context);
   }
#line 2097 "y.tab.c" /* yacc.c:1646  */
    break;

  case 92:
#line 405 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {		/* what is this??? */
       igraph_i_pajek_add_numeric_edge_attribute("arrowsize", (yyvsp[0].realnum), context);
   }
#line 2105 "y.tab.c" /* yacc.c:1646  */
    break;

  case 93:
#line 408 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
       igraph_i_pajek_add_numeric_edge_attribute("fontsize", (yyvsp[0].realnum), context);
   }
#line 2113 "y.tab.c" /* yacc.c:1646  */
    break;

  case 94:
#line 413 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->mode=4; }
#line 2119 "y.tab.c" /* yacc.c:1646  */
    break;

  case 95:
#line 413 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
      context->mode=2;
      igraph_i_pajek_add_string_edge_attribute("arrowtype", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
    }
#line 2128 "y.tab.c" /* yacc.c:1646  */
    break;

  case 96:
#line 417 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->mode=4; }
#line 2134 "y.tab.c" /* yacc.c:1646  */
    break;

  case 97:
#line 417 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
      context->mode=2;
      igraph_i_pajek_add_string_edge_attribute("linepattern", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
    }
#line 2143 "y.tab.c" /* yacc.c:1646  */
    break;

  case 98:
#line 421 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->mode=4; }
#line 2149 "y.tab.c" /* yacc.c:1646  */
    break;

  case 99:
#line 421 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
      context->mode=2;
      igraph_i_pajek_add_string_edge_attribute("label", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
    }
#line 2158 "y.tab.c" /* yacc.c:1646  */
    break;

  case 100:
#line 425 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->mode=4; }
#line 2164 "y.tab.c" /* yacc.c:1646  */
    break;

  case 101:
#line 425 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
      context->mode=2;
      igraph_i_pajek_add_string_edge_attribute("labelcolor", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
    }
#line 2173 "y.tab.c" /* yacc.c:1646  */
    break;

  case 102:
#line 429 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->mode=4; }
#line 2179 "y.tab.c" /* yacc.c:1646  */
    break;

  case 103:
#line 429 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
      context->mode=2;
      igraph_i_pajek_add_string_edge_attribute("color", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
    }
#line 2188 "y.tab.c" /* yacc.c:1646  */
    break;

  case 104:
#line 435 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->mode=2; (yyval.string)=(yyvsp[0].string); }
#line 2194 "y.tab.c" /* yacc.c:1646  */
    break;

  case 105:
#line 437 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->directed=1; }
#line 2200 "y.tab.c" /* yacc.c:1646  */
    break;

  case 112:
#line 445 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->mode=0; context->actfrom=labs((yyvsp[0].intnum))-1; }
#line 2206 "y.tab.c" /* yacc.c:1646  */
    break;

  case 113:
#line 447 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { 
  igraph_vector_push_back(context->vector, context->actfrom); 
  igraph_vector_push_back(context->vector, labs((yyvsp[0].intnum))-1); 
}
#line 2215 "y.tab.c" /* yacc.c:1646  */
    break;

  case 114:
#line 452 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->directed=0; }
#line 2221 "y.tab.c" /* yacc.c:1646  */
    break;

  case 121:
#line 460 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->mode=0; context->actfrom=labs((yyvsp[0].intnum))-1; }
#line 2227 "y.tab.c" /* yacc.c:1646  */
    break;

  case 122:
#line 462 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { 
  igraph_vector_push_back(context->vector, context->actfrom); 
  igraph_vector_push_back(context->vector, labs((yyvsp[0].intnum))-1); 
}
#line 2236 "y.tab.c" /* yacc.c:1646  */
    break;

  case 124:
#line 471 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->actfrom=0; 
                         context->actto=0; 
                         context->directed=(context->vcount2==0);
                       }
#line 2245 "y.tab.c" /* yacc.c:1646  */
    break;

  case 127:
#line 478 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { context->actfrom++; context->actto=0; }
#line 2251 "y.tab.c" /* yacc.c:1646  */
    break;

  case 130:
#line 482 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    {
  if ((yyvsp[0].realnum) != 0) {
    if (context->vcount2==0) {
      context->actedge++;
      igraph_i_pajek_add_numeric_edge_attribute("weight", (yyvsp[0].realnum), context);    
      igraph_vector_push_back(context->vector, context->actfrom);
      igraph_vector_push_back(context->vector, context->actto);
    } else if (context->vcount2 + context->actto < context->vcount) {
      context->actedge++;
      igraph_i_pajek_add_numeric_edge_attribute("weight", (yyvsp[0].realnum), context);    
      igraph_vector_push_back(context->vector, context->actfrom);
      igraph_vector_push_back(context->vector, 
			      context->vcount2+context->actto);
    }
  }
  context->actto++;
}
#line 2273 "y.tab.c" /* yacc.c:1646  */
    break;

  case 131:
#line 502 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { (yyval.intnum)=igraph_pajek_get_number(igraph_pajek_yyget_text(scanner),
					  igraph_pajek_yyget_leng(scanner)); }
#line 2280 "y.tab.c" /* yacc.c:1646  */
    break;

  case 132:
#line 505 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { (yyval.realnum)=igraph_pajek_get_number(igraph_pajek_yyget_text(scanner),
					  igraph_pajek_yyget_leng(scanner)); }
#line 2287 "y.tab.c" /* yacc.c:1646  */
    break;

  case 135:
#line 510 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { (yyval.string).str=igraph_pajek_yyget_text(scanner); 
              (yyval.string).len=igraph_pajek_yyget_leng(scanner); }
#line 2294 "y.tab.c" /* yacc.c:1646  */
    break;

  case 136:
#line 512 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { (yyval.string).str=igraph_pajek_yyget_text(scanner); 
              (yyval.string).len=igraph_pajek_yyget_leng(scanner); }
#line 2301 "y.tab.c" /* yacc.c:1646  */
    break;

  case 137:
#line 514 "src/foreign-pajek-parser.y" /* yacc.c:1646  */
    { (yyval.string).str=igraph_pajek_yyget_text(scanner)+1; 
               (yyval.string).len=igraph_pajek_yyget_leng(scanner)-2; }
#line 2308 "y.tab.c" /* yacc.c:1646  */
    break;


#line 2312 "y.tab.c" /* yacc.c:1646  */
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

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
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
  /* Do not reclaim the symbols of the rule whose action triggered
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
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

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

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

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

#if !defined yyoverflow || YYERROR_VERBOSE
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
  /* Do not reclaim the symbols of the rule whose action triggered
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
  return yyresult;
}
#line 517 "src/foreign-pajek-parser.y" /* yacc.c:1906  */


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
  char *tmp=igraph_Calloc(length+1, char);
  
  strncpy(tmp, str, length);
  tmp[length]='\0';
  sscanf(tmp, "%lf", &num);
  igraph_Free(tmp);
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
    rec=igraph_Calloc(1, igraph_attribute_record_t);
    na=igraph_Calloc(1, igraph_vector_t);
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
    rec=igraph_Calloc(1, igraph_attribute_record_t);
    na=igraph_Calloc(1, igraph_strvector_t);
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

  tmp=igraph_Calloc(len+1, char);
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
  
  igraph_Free(tmp);
  IGRAPH_FINALLY_CLEAN(1);
  
  return ret;
}

int igraph_i_pajek_add_string_edge_attribute(const char *name, 
					     const char *value,
					     int len, 
					     igraph_i_pajek_parsedata_t *context) {
  char *tmp;
  int ret;

  tmp=igraph_Calloc(len+1, char);
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

  igraph_Free(tmp);
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
  rec=igraph_Calloc(1, igraph_attribute_record_t);
  na=igraph_Calloc(1, igraph_vector_t);
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
