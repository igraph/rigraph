/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

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

/* First part of user prologue.  */
#line 23 "src/vendor/cigraph/src/io/pajek-parser.y"


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

#include "igraph_attributes.h"
#include "igraph_error.h"
#include "igraph_memory.h"
#include "igraph_types.h"

#include "io/pajek-header.h"
#include "io/parsers/pajek-parser.h" /* it must come first because of YYSTYPE */
#include "io/parsers/pajek-lexer.h"
#include "io/parse_utils.h"
#include "internal/hacks.h" /* strdup */

#include <stdio.h>
#include <string.h>
#include <math.h>

int igraph_pajek_yyerror(YYLTYPE* locp,
                         igraph_i_pajek_parsedata_t *context,
                         const char *s);

static igraph_error_t igraph_i_pajek_add_string_vertex_attribute(const char *name,
                                               const char *value,
                                               size_t len,
                                               igraph_i_pajek_parsedata_t *context);
static igraph_error_t igraph_i_pajek_add_string_edge_attribute(const char *name,
                                             const char *value,
                                             size_t len,
                                             igraph_i_pajek_parsedata_t *context);
static igraph_error_t igraph_i_pajek_add_numeric_vertex_attribute(const char *name,
                                                igraph_real_t value,
                                                igraph_i_pajek_parsedata_t *context);
static igraph_error_t igraph_i_pajek_add_numeric_edge_attribute(const char *name,
                                              igraph_real_t value,
                                              igraph_i_pajek_parsedata_t *context);
static igraph_error_t igraph_i_pajek_add_numeric_attribute(igraph_trie_t *names,
                                         igraph_vector_ptr_t *attrs,
                                         igraph_integer_t count,
                                         const char *attrname,
                                         igraph_integer_t vid,
                                         igraph_real_t number);
static igraph_error_t igraph_i_pajek_add_string_attribute(igraph_trie_t *names,
                                        igraph_vector_ptr_t *attrs,
                                        igraph_integer_t count,
                                        const char *attrname,
                                        igraph_integer_t vid,
                                        const char *str,
                                        igraph_integer_t str_len);

static igraph_error_t igraph_i_pajek_add_bipartite_type(igraph_i_pajek_parsedata_t *context);
static igraph_error_t igraph_i_pajek_check_bipartite(igraph_i_pajek_parsedata_t *context);

#define scanner context->scanner


#line 154 "yy.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "io/parsers/pajek-parser.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_NEWLINE = 3,                    /* "end of line"  */
  YYSYMBOL_NUM = 4,                        /* "number"  */
  YYSYMBOL_ALNUM = 5,                      /* ALNUM  */
  YYSYMBOL_QSTR = 6,                       /* QSTR  */
  YYSYMBOL_PSTR = 7,                       /* PSTR  */
  YYSYMBOL_NETWORKLINE = 8,                /* "*network line"  */
  YYSYMBOL_NET_TITLE = 9,                  /* NET_TITLE  */
  YYSYMBOL_VERTICESLINE = 10,              /* "*vertices line"  */
  YYSYMBOL_ARCSLINE = 11,                  /* "*arcs line"  */
  YYSYMBOL_EDGESLINE = 12,                 /* "*edges line"  */
  YYSYMBOL_ARCSLISTLINE = 13,              /* "*arcslist line"  */
  YYSYMBOL_EDGESLISTLINE = 14,             /* "*edgeslist line"  */
  YYSYMBOL_MATRIXLINE = 15,                /* "*matrix line"  */
  YYSYMBOL_ERROR = 16,                     /* ERROR  */
  YYSYMBOL_VP_X_FACT = 17,                 /* VP_X_FACT  */
  YYSYMBOL_VP_Y_FACT = 18,                 /* VP_Y_FACT  */
  YYSYMBOL_VP_IC = 19,                     /* VP_IC  */
  YYSYMBOL_VP_BC = 20,                     /* VP_BC  */
  YYSYMBOL_VP_LC = 21,                     /* VP_LC  */
  YYSYMBOL_VP_LR = 22,                     /* VP_LR  */
  YYSYMBOL_VP_LPHI = 23,                   /* VP_LPHI  */
  YYSYMBOL_VP_BW = 24,                     /* VP_BW  */
  YYSYMBOL_VP_FOS = 25,                    /* VP_FOS  */
  YYSYMBOL_VP_PHI = 26,                    /* VP_PHI  */
  YYSYMBOL_VP_R = 27,                      /* VP_R  */
  YYSYMBOL_VP_Q = 28,                      /* VP_Q  */
  YYSYMBOL_VP_LA = 29,                     /* VP_LA  */
  YYSYMBOL_VP_FONT = 30,                   /* VP_FONT  */
  YYSYMBOL_VP_URL = 31,                    /* VP_URL  */
  YYSYMBOL_VP_SIZE = 32,                   /* VP_SIZE  */
  YYSYMBOL_EP_C = 33,                      /* EP_C  */
  YYSYMBOL_EP_S = 34,                      /* EP_S  */
  YYSYMBOL_EP_A = 35,                      /* EP_A  */
  YYSYMBOL_EP_W = 36,                      /* EP_W  */
  YYSYMBOL_EP_H1 = 37,                     /* EP_H1  */
  YYSYMBOL_EP_H2 = 38,                     /* EP_H2  */
  YYSYMBOL_EP_A1 = 39,                     /* EP_A1  */
  YYSYMBOL_EP_A2 = 40,                     /* EP_A2  */
  YYSYMBOL_EP_K1 = 41,                     /* EP_K1  */
  YYSYMBOL_EP_K2 = 42,                     /* EP_K2  */
  YYSYMBOL_EP_AP = 43,                     /* EP_AP  */
  YYSYMBOL_EP_P = 44,                      /* EP_P  */
  YYSYMBOL_EP_L = 45,                      /* EP_L  */
  YYSYMBOL_EP_LP = 46,                     /* EP_LP  */
  YYSYMBOL_EP_LR = 47,                     /* EP_LR  */
  YYSYMBOL_EP_LPHI = 48,                   /* EP_LPHI  */
  YYSYMBOL_EP_LC = 49,                     /* EP_LC  */
  YYSYMBOL_EP_LA = 50,                     /* EP_LA  */
  YYSYMBOL_EP_SIZE = 51,                   /* EP_SIZE  */
  YYSYMBOL_EP_FOS = 52,                    /* EP_FOS  */
  YYSYMBOL_YYACCEPT = 53,                  /* $accept  */
  YYSYMBOL_input = 54,                     /* input  */
  YYSYMBOL_nethead = 55,                   /* nethead  */
  YYSYMBOL_vertices = 56,                  /* vertices  */
  YYSYMBOL_verticeshead = 57,              /* verticeshead  */
  YYSYMBOL_vertdefs = 58,                  /* vertdefs  */
  YYSYMBOL_vertexline = 59,                /* vertexline  */
  YYSYMBOL_60_1 = 60,                      /* $@1  */
  YYSYMBOL_vertex = 61,                    /* vertex  */
  YYSYMBOL_vertexid = 62,                  /* vertexid  */
  YYSYMBOL_vertexcoords = 63,              /* vertexcoords  */
  YYSYMBOL_shape = 64,                     /* shape  */
  YYSYMBOL_params = 65,                    /* params  */
  YYSYMBOL_param = 66,                     /* param  */
  YYSYMBOL_vpword = 67,                    /* vpword  */
  YYSYMBOL_vpwordpar = 68,                 /* vpwordpar  */
  YYSYMBOL_edgeblock = 69,                 /* edgeblock  */
  YYSYMBOL_arcs = 70,                      /* arcs  */
  YYSYMBOL_arcsdefs = 71,                  /* arcsdefs  */
  YYSYMBOL_arcsline = 72,                  /* arcsline  */
  YYSYMBOL_73_2 = 73,                      /* $@2  */
  YYSYMBOL_arcfrom = 74,                   /* arcfrom  */
  YYSYMBOL_arcto = 75,                     /* arcto  */
  YYSYMBOL_edges = 76,                     /* edges  */
  YYSYMBOL_edgesdefs = 77,                 /* edgesdefs  */
  YYSYMBOL_edgesline = 78,                 /* edgesline  */
  YYSYMBOL_79_3 = 79,                      /* $@3  */
  YYSYMBOL_edgefrom = 80,                  /* edgefrom  */
  YYSYMBOL_edgeto = 81,                    /* edgeto  */
  YYSYMBOL_weight = 82,                    /* weight  */
  YYSYMBOL_edgeparams = 83,                /* edgeparams  */
  YYSYMBOL_edgeparam = 84,                 /* edgeparam  */
  YYSYMBOL_epword = 85,                    /* epword  */
  YYSYMBOL_epwordpar = 86,                 /* epwordpar  */
  YYSYMBOL_arcslist = 87,                  /* arcslist  */
  YYSYMBOL_arcslistlines = 88,             /* arcslistlines  */
  YYSYMBOL_arclistline = 89,               /* arclistline  */
  YYSYMBOL_arctolist = 90,                 /* arctolist  */
  YYSYMBOL_arclistfrom = 91,               /* arclistfrom  */
  YYSYMBOL_arclistto = 92,                 /* arclistto  */
  YYSYMBOL_edgeslist = 93,                 /* edgeslist  */
  YYSYMBOL_edgelistlines = 94,             /* edgelistlines  */
  YYSYMBOL_edgelistline = 95,              /* edgelistline  */
  YYSYMBOL_edgetolist = 96,                /* edgetolist  */
  YYSYMBOL_edgelistfrom = 97,              /* edgelistfrom  */
  YYSYMBOL_edgelistto = 98,                /* edgelistto  */
  YYSYMBOL_adjmatrix = 99,                 /* adjmatrix  */
  YYSYMBOL_matrixline = 100,               /* matrixline  */
  YYSYMBOL_adjmatrixlines = 101,           /* adjmatrixlines  */
  YYSYMBOL_adjmatrixline = 102,            /* adjmatrixline  */
  YYSYMBOL_adjmatrixnumbers = 103,         /* adjmatrixnumbers  */
  YYSYMBOL_adjmatrixentry = 104,           /* adjmatrixentry  */
  YYSYMBOL_longint = 105,                  /* longint  */
  YYSYMBOL_number = 106,                   /* number  */
  YYSYMBOL_word = 107                      /* word  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

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


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
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

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if 1

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
#endif /* 1 */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL \
             && defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
  YYLTYPE yyls_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE) \
             + YYSIZEOF (YYLTYPE)) \
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
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  6
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   247

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  53
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  55
/* YYNRULES -- Number of rules.  */
#define YYNRULES  126
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  198

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   307


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
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
      45,    46,    47,    48,    49,    50,    51,    52
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   187,   187,   191,   191,   191,   193,   195,   205,   223,
     223,   225,   226,   227,   227,   238,   240,   245,   246,   250,
     256,   256,   260,   260,   263,   264,   267,   270,   275,   280,
     285,   288,   291,   294,   297,   300,   303,   306,   309,   314,
     317,   320,   323,   327,   333,   335,   335,   335,   335,   335,
     335,   337,   338,   340,   340,   342,   343,   343,   354,   356,
     358,   359,   361,   361,   363,   364,   364,   375,   377,   379,
     379,   383,   383,   386,   387,   392,   395,   398,   401,   404,
     407,   410,   413,   416,   419,   422,   425,   428,   431,   434,
     439,   442,   445,   448,   451,   456,   458,   460,   460,   462,
     462,   464,   464,   466,   468,   473,   475,   475,   477,   477,
     479,   479,   481,   483,   490,   492,   497,   497,   499,   501,
     501,   503,   523,   531,   539,   541,   543
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if 1
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "\"end of line\"",
  "\"number\"", "ALNUM", "QSTR", "PSTR", "\"*network line\"", "NET_TITLE",
  "\"*vertices line\"", "\"*arcs line\"", "\"*edges line\"",
  "\"*arcslist line\"", "\"*edgeslist line\"", "\"*matrix line\"", "ERROR",
  "VP_X_FACT", "VP_Y_FACT", "VP_IC", "VP_BC", "VP_LC", "VP_LR", "VP_LPHI",
  "VP_BW", "VP_FOS", "VP_PHI", "VP_R", "VP_Q", "VP_LA", "VP_FONT",
  "VP_URL", "VP_SIZE", "EP_C", "EP_S", "EP_A", "EP_W", "EP_H1", "EP_H2",
  "EP_A1", "EP_A2", "EP_K1", "EP_K2", "EP_AP", "EP_P", "EP_L", "EP_LP",
  "EP_LR", "EP_LPHI", "EP_LC", "EP_LA", "EP_SIZE", "EP_FOS", "$accept",
  "input", "nethead", "vertices", "verticeshead", "vertdefs", "vertexline",
  "$@1", "vertex", "vertexid", "vertexcoords", "shape", "params", "param",
  "vpword", "vpwordpar", "edgeblock", "arcs", "arcsdefs", "arcsline",
  "$@2", "arcfrom", "arcto", "edges", "edgesdefs", "edgesline", "$@3",
  "edgefrom", "edgeto", "weight", "edgeparams", "edgeparam", "epword",
  "epwordpar", "arcslist", "arcslistlines", "arclistline", "arctolist",
  "arclistfrom", "arclistto", "edgeslist", "edgelistlines", "edgelistline",
  "edgetolist", "edgelistfrom", "edgelistto", "adjmatrix", "matrixline",
  "adjmatrixlines", "adjmatrixline", "adjmatrixnumbers", "adjmatrixentry",
  "longint", "number", "word", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-124)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-124)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      -2,     7,    11,    35,  -124,    18,  -124,    34,  -124,    49,
    -124,  -124,    34,    12,  -124,  -124,     5,    28,    56,    57,
    -124,  -124,  -124,  -124,  -124,  -124,    58,    30,  -124,  -124,
      59,  -124,    60,  -124,  -124,  -124,  -124,  -124,    61,  -124,
      32,  -124,    38,  -124,    40,    44,    46,  -124,    14,  -124,
    -124,    34,  -124,    32,  -124,  -124,    34,  -124,    38,  -124,
    -124,  -124,  -124,  -124,  -124,  -124,  -124,  -124,    62,    64,
    -124,  -124,  -124,  -124,    64,  -124,  -124,  -124,  -124,  -124,
      51,    53,  -124,  -124,    14,    64,    64,    64,  -124,  -124,
    -124,  -124,  -124,  -124,  -124,  -124,    64,  -124,  -124,  -124,
     215,  -124,   145,   165,  -124,    64,    64,    24,    24,    24,
      64,    64,    64,    64,    64,    64,    64,    64,    14,    14,
      64,  -124,  -124,  -124,    24,    64,    14,    64,    64,    64,
      64,    64,    64,    64,    64,    14,    14,    64,    64,    64,
      14,    64,    64,    64,  -124,  -124,  -124,  -124,  -124,    68,
    -124,    64,  -124,  -124,    64,  -124,    64,  -124,  -124,  -124,
    -124,  -124,  -124,  -124,  -124,  -124,  -124,  -124,  -124,    64,
    -124,  -124,  -124,  -124,  -124,  -124,  -124,  -124,  -124,  -124,
    -124,  -124,  -124,  -124,  -124,  -124,  -124,  -124,  -124,  -124,
      64,    64,    64,    64,  -124,  -124,  -124,  -124
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       3,     0,     0,     0,     4,     0,     1,     0,    45,     0,
       5,   122,     7,     2,     9,     8,     0,     0,     0,     0,
     115,    46,    47,    48,    49,    50,     0,     6,    53,   123,
       0,    62,     0,    97,   106,   116,    11,    10,    13,    15,
      51,    53,    60,    62,    96,   105,   114,    12,     0,    55,
      54,     0,    58,    52,    64,    63,     0,    67,    61,    99,
      98,   101,   103,   108,   107,   110,   112,   117,     0,   119,
     121,   125,   124,   126,    17,    16,    56,    59,    65,    68,
       0,     0,   118,   120,    20,     0,    69,    69,   100,   102,
     104,   109,   111,   113,    22,    21,    18,    71,    70,    71,
       0,    19,     0,     0,    14,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    23,    24,    57,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    72,    73,    66,    25,    26,   125,
      41,     0,    44,    42,     0,    43,     0,    30,    31,    32,
      33,    34,    35,    36,    37,    39,    40,    38,    94,     0,
      95,    75,    90,    76,    77,    78,    79,    80,    81,    82,
      83,    91,    92,    84,    85,    86,    93,    87,    88,    89,
       0,     0,     0,     0,    27,    28,    29,    74
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
    -124,  -124,  -124,  -124,  -124,  -124,  -124,  -124,  -124,  -124,
    -124,  -124,  -124,  -124,  -124,  -104,  -124,  -124,    25,  -124,
    -124,  -124,  -124,  -124,    31,  -124,  -124,  -124,  -124,   -14,
     -22,  -124,  -124,  -123,  -124,  -124,  -124,  -124,  -124,  -124,
    -124,  -124,  -124,  -124,  -124,  -124,  -124,  -124,  -124,  -124,
       9,  -124,    -5,   -16,    19
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,     2,     3,     8,     9,    27,    37,    48,    38,    74,
      84,    94,   100,   121,   122,   150,    13,    21,    40,    50,
      86,    51,    76,    22,    42,    55,    87,    56,    78,    97,
     102,   144,   145,   168,    23,    44,    60,    80,    61,    89,
      24,    45,    64,    81,    65,    92,    25,    26,    46,    67,
      68,    69,    52,    70,   152
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      30,    32,    12,   172,   153,   155,     1,    15,    28,    29,
       4,     6,   181,   182,   165,   166,     5,   186,    71,    72,
      73,    10,    39,    16,    17,    18,    19,    20,   149,    72,
      73,    31,    29,    36,    11,    49,    11,    57,    11,    62,
      66,    54,    11,    59,    11,     7,    77,    63,    11,  -119,
      29,    79,    14,    57,    88,    11,    91,    11,    85,    33,
      34,    35,    41,    43,    47,    82,    53,    75,    29,    96,
      98,    98,  -123,    99,    58,    90,    93,   103,    83,     0,
     101,     0,     0,     0,     0,     0,     0,     0,     0,   147,
     148,   151,   154,   156,   157,   158,   159,   160,   161,   162,
     163,   164,     0,    95,   167,     0,     0,     0,   169,   171,
       0,   173,   174,   175,   176,   177,   178,   179,   180,     0,
       0,   183,   184,   185,     0,   187,   188,   189,     0,     0,
       0,     0,     0,     0,     0,   190,     0,     0,   191,     0,
     192,     0,     0,   170,     0,   170,     0,     0,   123,     0,
       0,     0,     0,   193,   170,   170,     0,     0,     0,   170,
       0,     0,     0,     0,     0,     0,     0,     0,   146,     0,
       0,     0,     0,     0,   194,   195,   196,   197,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   104,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   119,   120
};

static const yytype_int16 yycheck[] =
{
      16,    17,     7,   126,   108,   109,     8,    12,     3,     4,
       3,     0,   135,   136,   118,   119,     9,   140,     4,     5,
       6,     3,    27,    11,    12,    13,    14,    15,     4,     5,
       6,     3,     4,     3,     4,     3,     4,    42,     4,    44,
      45,     3,     4,     3,     4,    10,    51,     3,     4,     3,
       4,    56,     3,    58,     3,     4,     3,     4,    74,     3,
       3,     3,     3,     3,     3,     3,    41,    48,     4,    85,
      86,    87,     4,    87,    43,    80,    81,    99,    69,    -1,
      96,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,    -1,    84,   120,    -1,    -1,    -1,   124,   125,
      -1,   127,   128,   129,   130,   131,   132,   133,   134,    -1,
      -1,   137,   138,   139,    -1,   141,   142,   143,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   151,    -1,    -1,   154,    -1,
     156,    -1,    -1,   124,    -1,   126,    -1,    -1,     3,    -1,
      -1,    -1,    -1,   169,   135,   136,    -1,    -1,    -1,   140,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,   190,   191,   192,   193,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     8,    54,    55,     3,     9,     0,    10,    56,    57,
       3,     4,   105,    69,     3,   105,    11,    12,    13,    14,
      15,    70,    76,    87,    93,    99,   100,    58,     3,     4,
     106,     3,   106,     3,     3,     3,     3,    59,    61,   105,
      71,     3,    77,     3,    88,    94,   101,     3,    60,     3,
      72,    74,   105,    71,     3,    78,    80,   105,    77,     3,
      89,    91,   105,     3,    95,    97,   105,   102,   103,   104,
     106,     4,     5,     6,    62,   107,    75,   105,    81,   105,
      90,    96,     3,   103,    63,   106,    73,    79,     3,    92,
     105,     3,    98,   105,    64,   107,   106,    82,   106,    82,
      65,   106,    83,    83,     3,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    66,    67,     3,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    84,    85,     3,   106,   106,     4,
      68,   106,   107,    68,   106,    68,   106,   106,   106,   106,
     106,   106,   106,   106,   106,    68,    68,   106,    86,   106,
     107,   106,    86,   106,   106,   106,   106,   106,   106,   106,
     106,    86,    86,   106,   106,   106,    86,   106,   106,   106,
     106,   106,   106,   106,   106,   106,   106,   106
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    53,    54,    55,    55,    55,    56,    57,    57,    58,
      58,    59,    59,    60,    59,    61,    62,    63,    63,    63,
      64,    64,    65,    65,    66,    66,    66,    66,    66,    66,
      66,    66,    66,    66,    66,    66,    66,    66,    66,    67,
      67,    67,    67,    67,    68,    69,    69,    69,    69,    69,
      69,    70,    70,    71,    71,    72,    73,    72,    74,    75,
      76,    76,    77,    77,    78,    79,    78,    80,    81,    82,
      82,    83,    83,    84,    84,    84,    84,    84,    84,    84,
      84,    84,    84,    84,    84,    84,    84,    84,    84,    84,
      85,    85,    85,    85,    85,    86,    87,    88,    88,    89,
      89,    90,    90,    91,    92,    93,    94,    94,    95,    95,
      96,    96,    97,    98,    99,   100,   101,   101,   102,   103,
     103,   104,   105,   106,   107,   107,   107
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     3,     0,     2,     3,     3,     2,     3,     0,
       2,     1,     2,     0,     7,     1,     1,     0,     2,     3,
       0,     1,     0,     2,     1,     2,     2,     4,     4,     4,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     1,     0,     2,     2,     2,     2,
       2,     3,     4,     0,     2,     1,     0,     6,     1,     1,
       3,     4,     0,     2,     1,     0,     6,     1,     1,     0,
       1,     0,     2,     1,     4,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     1,     3,     0,     2,     1,
       3,     0,     2,     1,     1,     3,     0,     2,     1,     3,
       0,     2,     1,     1,     3,     1,     0,     2,     2,     0,
       2,     1,     1,     1,     1,     1,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
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

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF

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


/* YYLOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

# ifndef YYLOCATION_PRINT

#  if defined YY_LOCATION_PRINT

   /* Temporary convenience wrapper in case some people defined the
      undocumented and private YY_LOCATION_PRINT macros.  */
#   define YYLOCATION_PRINT(File, Loc)  YY_LOCATION_PRINT(File, *(Loc))

#  elif defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL

/* Print *YYLOCP on YYO.  Private, do not rely on its existence. */

YY_ATTRIBUTE_UNUSED
static int
yy_location_print_ (FILE *yyo, YYLTYPE const * const yylocp)
{
  int res = 0;
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

#   define YYLOCATION_PRINT  yy_location_print_

    /* Temporary convenience wrapper in case some people defined the
       undocumented and private YY_LOCATION_PRINT macros.  */
#   define YY_LOCATION_PRINT(File, Loc)  YYLOCATION_PRINT(File, &(Loc))

#  else

#   define YYLOCATION_PRINT(File, Loc) ((void) 0)
    /* Temporary convenience wrapper in case some people defined the
       undocumented and private YY_LOCATION_PRINT macros.  */
#   define YY_LOCATION_PRINT  YYLOCATION_PRINT

#  endif
# endif /* !defined YYLOCATION_PRINT */


# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value, Location, context); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp, igraph_i_pajek_parsedata_t* context)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  YY_USE (yylocationp);
  YY_USE (context);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp, igraph_i_pajek_parsedata_t* context)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  YYLOCATION_PRINT (yyo, yylocationp);
  YYFPRINTF (yyo, ": ");
  yy_symbol_value_print (yyo, yykind, yyvaluep, yylocationp, context);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
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
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp, YYLTYPE *yylsp,
                 int yyrule, igraph_i_pajek_parsedata_t* context)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)],
                       &(yylsp[(yyi + 1) - (yynrhs)]), context);
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
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
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


/* Context of a parse error.  */
typedef struct
{
  yy_state_t *yyssp;
  yysymbol_kind_t yytoken;
  YYLTYPE *yylloc;
} yypcontext_t;

/* Put in YYARG at most YYARGN of the expected tokens given the
   current YYCTX, and return the number of tokens stored in YYARG.  If
   YYARG is null, return the number of expected tokens (guaranteed to
   be less than YYNTOKENS).  Return YYENOMEM on memory exhaustion.
   Return 0 if there are more than YYARGN expected tokens, yet fill
   YYARG up to YYARGN. */
static int
yypcontext_expected_tokens (const yypcontext_t *yyctx,
                            yysymbol_kind_t yyarg[], int yyargn)
{
  /* Actual size of YYARG. */
  int yycount = 0;
  int yyn = yypact[+*yyctx->yyssp];
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
        if (yycheck[yyx + yyn] == yyx && yyx != YYSYMBOL_YYerror
            && !yytable_value_is_error (yytable[yyx + yyn]))
          {
            if (!yyarg)
              ++yycount;
            else if (yycount == yyargn)
              return 0;
            else
              yyarg[yycount++] = YY_CAST (yysymbol_kind_t, yyx);
          }
    }
  if (yyarg && yycount == 0 && 0 < yyargn)
    yyarg[0] = YYSYMBOL_YYEMPTY;
  return yycount;
}




#ifndef yystrlen
# if defined __GLIBC__ && defined _STRING_H
#  define yystrlen(S) (YY_CAST (YYPTRDIFF_T, strlen (S)))
# else
/* Return the length of YYSTR.  */
static YYPTRDIFF_T
yystrlen (const char *yystr)
{
  YYPTRDIFF_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
# endif
#endif

#ifndef yystpcpy
# if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#  define yystpcpy stpcpy
# else
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
# endif
#endif

#ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYPTRDIFF_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYPTRDIFF_T yyn = 0;
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
            else
              goto append;

          append:
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

  if (yyres)
    return yystpcpy (yyres, yystr) - yyres;
  else
    return yystrlen (yystr);
}
#endif


static int
yy_syntax_error_arguments (const yypcontext_t *yyctx,
                           yysymbol_kind_t yyarg[], int yyargn)
{
  /* Actual size of YYARG. */
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
  if (yyctx->yytoken != YYSYMBOL_YYEMPTY)
    {
      int yyn;
      if (yyarg)
        yyarg[yycount] = yyctx->yytoken;
      ++yycount;
      yyn = yypcontext_expected_tokens (yyctx,
                                        yyarg ? yyarg + 1 : yyarg, yyargn - 1);
      if (yyn == YYENOMEM)
        return YYENOMEM;
      else
        yycount += yyn;
    }
  return yycount;
}

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return -1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return YYENOMEM if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYPTRDIFF_T *yymsg_alloc, char **yymsg,
                const yypcontext_t *yyctx)
{
  enum { YYARGS_MAX = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat: reported tokens (one for the "unexpected",
     one per "expected"). */
  yysymbol_kind_t yyarg[YYARGS_MAX];
  /* Cumulated lengths of YYARG.  */
  YYPTRDIFF_T yysize = 0;

  /* Actual size of YYARG. */
  int yycount = yy_syntax_error_arguments (yyctx, yyarg, YYARGS_MAX);
  if (yycount == YYENOMEM)
    return YYENOMEM;

  switch (yycount)
    {
#define YYCASE_(N, S)                       \
      case N:                               \
        yyformat = S;                       \
        break
    default: /* Avoid compiler warnings. */
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
#undef YYCASE_
    }

  /* Compute error message size.  Don't count the "%s"s, but reserve
     room for the terminator.  */
  yysize = yystrlen (yyformat) - 2 * yycount + 1;
  {
    int yyi;
    for (yyi = 0; yyi < yycount; ++yyi)
      {
        YYPTRDIFF_T yysize1
          = yysize + yytnamerr (YY_NULLPTR, yytname[yyarg[yyi]]);
        if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
          yysize = yysize1;
        else
          return YYENOMEM;
      }
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return -1;
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
          yyp += yytnamerr (yyp, yytname[yyarg[yyi++]]);
          yyformat += 2;
        }
      else
        {
          ++yyp;
          ++yyformat;
        }
  }
  return 0;
}


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep, YYLTYPE *yylocationp, igraph_i_pajek_parsedata_t* context)
{
  YY_USE (yyvaluep);
  YY_USE (yylocationp);
  YY_USE (context);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}






/*----------.
| yyparse.  |
`----------*/

int
yyparse (igraph_i_pajek_parsedata_t* context)
{
/* Lookahead token kind.  */
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
    int yynerrs = 0;

    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

    /* The location stack: array, bottom, top.  */
    YYLTYPE yylsa[YYINITDEPTH];
    YYLTYPE *yyls = yylsa;
    YYLTYPE *yylsp = yyls;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
  YYLTYPE yyloc;

  /* The locations where the error started and ended.  */
  YYLTYPE yyerror_range[3];

  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYPTRDIFF_T yymsg_alloc = sizeof yymsgbuf;

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N), yylsp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  yylsp[0] = yylloc;
  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;
        YYLTYPE *yyls1 = yyls;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yyls1, yysize * YYSIZEOF (*yylsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
        yyls = yyls1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
        YYSTACK_RELOCATE (yyls_alloc, yyls);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
      yylsp = yyls + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


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

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex (&yylval, &yylloc, scanner);
    }

  if (yychar <= END)
    {
      yychar = END;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      yyerror_range[1] = yylloc;
      goto yyerrlab1;
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
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END
  *++yylsp = yylloc;

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
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
| yyreduce -- do a reduction.  |
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

  /* Default location. */
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
  yyerror_range[1] = yyloc;
  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* input: nethead vertices edgeblock  */
#line 187 "src/vendor/cigraph/src/io/pajek-parser.y"
                                  {
  if (context->vcount2 > 0) { igraph_i_pajek_check_bipartite(context); }
 }
#line 1806 "yy.tab.c"
    break;

  case 7: /* verticeshead: "*vertices line" longint  */
#line 195 "src/vendor/cigraph/src/io/pajek-parser.y"
                                   {
  context->vcount=(yyvsp[0].intnum);
  context->vcount2=0;
  if (context->vcount < 0) {
    IGRAPH_YY_ERRORF("Invalid vertex count in Pajek file (%" IGRAPH_PRId ").", IGRAPH_EINVAL, context->vcount);
  }
  if (context->vcount > IGRAPH_PAJEK_MAX_VERTEX_COUNT) {
    IGRAPH_YY_ERRORF("Vertex count too large in Pajek file (%" IGRAPH_PRId ").", IGRAPH_EINVAL, context->vcount);
  }
            }
#line 1821 "yy.tab.c"
    break;

  case 8: /* verticeshead: "*vertices line" longint longint  */
#line 205 "src/vendor/cigraph/src/io/pajek-parser.y"
                                           {
  context->vcount=(yyvsp[-1].intnum);
  context->vcount2=(yyvsp[0].intnum);
  if (context->vcount < 0) {
    IGRAPH_YY_ERRORF("Invalid vertex count in Pajek file (%" IGRAPH_PRId ").", IGRAPH_EINVAL, context->vcount);
  }
  if (context->vcount > IGRAPH_PAJEK_MAX_VERTEX_COUNT) {
    IGRAPH_YY_ERRORF("Vertex count too large in Pajek file (%" IGRAPH_PRId ").", IGRAPH_EINVAL, context->vcount);
  }
  if (context->vcount2 < 0) {
    IGRAPH_YY_ERRORF("Invalid two-mode vertex count in Pajek file (%" IGRAPH_PRId ").", IGRAPH_EINVAL, context->vcount2);
  }
  if (context->vcount2 > IGRAPH_PAJEK_MAX_VERTEX_COUNT) {
    IGRAPH_YY_ERRORF("2-mode vertex count too large in Pajek file (%" IGRAPH_PRId ").", IGRAPH_EINVAL, context->vcount2);
  }
  IGRAPH_YY_CHECK(igraph_i_pajek_add_bipartite_type(context));
}
#line 1843 "yy.tab.c"
    break;

  case 13: /* $@1: %empty  */
#line 227 "src/vendor/cigraph/src/io/pajek-parser.y"
                   {
              context->actvertex=(yyvsp[0].intnum);
              if (context->actvertex < 1 || context->actvertex > context->vcount) {
                  IGRAPH_YY_ERRORF(
                              "Invalid vertex id (%" IGRAPH_PRId ") in Pajek file. "
                              "The number of vertices is %" IGRAPH_PRId ".",
                              IGRAPH_EINVAL, context->actvertex, context->vcount);
              }
            }
#line 1857 "yy.tab.c"
    break;

  case 14: /* vertexline: vertex $@1 vertexid vertexcoords shape params "end of line"  */
#line 235 "src/vendor/cigraph/src/io/pajek-parser.y"
                                                         { }
#line 1863 "yy.tab.c"
    break;

  case 15: /* vertex: longint  */
#line 238 "src/vendor/cigraph/src/io/pajek-parser.y"
                { (yyval.intnum)=(yyvsp[0].intnum); }
#line 1869 "yy.tab.c"
    break;

  case 16: /* vertexid: word  */
#line 240 "src/vendor/cigraph/src/io/pajek-parser.y"
               {
  IGRAPH_YY_CHECK(igraph_i_pajek_add_string_vertex_attribute("id", (yyvsp[0].string).str, (yyvsp[0].string).len, context));
  IGRAPH_YY_CHECK(igraph_i_pajek_add_string_vertex_attribute("name", (yyvsp[0].string).str, (yyvsp[0].string).len, context));
}
#line 1878 "yy.tab.c"
    break;

  case 18: /* vertexcoords: number number  */
#line 246 "src/vendor/cigraph/src/io/pajek-parser.y"
                            {
  IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("x", (yyvsp[-1].realnum), context));
  IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("y", (yyvsp[0].realnum), context));
            }
#line 1887 "yy.tab.c"
    break;

  case 19: /* vertexcoords: number number number  */
#line 250 "src/vendor/cigraph/src/io/pajek-parser.y"
                                   {
  IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("x", (yyvsp[-2].realnum), context));
  IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("y", (yyvsp[-1].realnum), context));
  IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("z", (yyvsp[0].realnum), context));
            }
#line 1897 "yy.tab.c"
    break;

  case 21: /* shape: word  */
#line 256 "src/vendor/cigraph/src/io/pajek-parser.y"
                          {
  IGRAPH_YY_CHECK(igraph_i_pajek_add_string_vertex_attribute("shape", (yyvsp[0].string).str, (yyvsp[0].string).len, context));
}
#line 1905 "yy.tab.c"
    break;

  case 25: /* param: VP_X_FACT number  */
#line 264 "src/vendor/cigraph/src/io/pajek-parser.y"
                        {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("xfact", (yyvsp[0].realnum), context));
       }
#line 1913 "yy.tab.c"
    break;

  case 26: /* param: VP_Y_FACT number  */
#line 267 "src/vendor/cigraph/src/io/pajek-parser.y"
                        {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("yfact", (yyvsp[0].realnum), context));
       }
#line 1921 "yy.tab.c"
    break;

  case 27: /* param: VP_IC number number number  */
#line 270 "src/vendor/cigraph/src/io/pajek-parser.y"
                                  { /* RGB color */
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("color-red", (yyvsp[-2].realnum), context));
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("color-green", (yyvsp[-1].realnum), context));
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("color-blue", (yyvsp[0].realnum), context));
       }
#line 1931 "yy.tab.c"
    break;

  case 28: /* param: VP_BC number number number  */
#line 275 "src/vendor/cigraph/src/io/pajek-parser.y"
                                  {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("framecolor-red", (yyvsp[-2].realnum), context));
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("framecolor-green", (yyvsp[-1].realnum), context));
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("framecolor-blue", (yyvsp[0].realnum), context));
       }
#line 1941 "yy.tab.c"
    break;

  case 29: /* param: VP_LC number number number  */
#line 280 "src/vendor/cigraph/src/io/pajek-parser.y"
                                  {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("labelcolor-red", (yyvsp[-2].realnum), context));
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("labelcolor-green", (yyvsp[-1].realnum), context));
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("labelcolor-blue", (yyvsp[0].realnum), context));
       }
#line 1951 "yy.tab.c"
    break;

  case 30: /* param: VP_LR number  */
#line 285 "src/vendor/cigraph/src/io/pajek-parser.y"
                    {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("labeldist", (yyvsp[0].realnum), context));
     }
#line 1959 "yy.tab.c"
    break;

  case 31: /* param: VP_LPHI number  */
#line 288 "src/vendor/cigraph/src/io/pajek-parser.y"
                      {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("labeldegree2", (yyvsp[0].realnum), context));
     }
#line 1967 "yy.tab.c"
    break;

  case 32: /* param: VP_BW number  */
#line 291 "src/vendor/cigraph/src/io/pajek-parser.y"
                    {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("framewidth", (yyvsp[0].realnum), context));
     }
#line 1975 "yy.tab.c"
    break;

  case 33: /* param: VP_FOS number  */
#line 294 "src/vendor/cigraph/src/io/pajek-parser.y"
                     {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("fontsize", (yyvsp[0].realnum), context));
     }
#line 1983 "yy.tab.c"
    break;

  case 34: /* param: VP_PHI number  */
#line 297 "src/vendor/cigraph/src/io/pajek-parser.y"
                     {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("rotation", (yyvsp[0].realnum), context));
     }
#line 1991 "yy.tab.c"
    break;

  case 35: /* param: VP_R number  */
#line 300 "src/vendor/cigraph/src/io/pajek-parser.y"
                   {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("radius", (yyvsp[0].realnum), context));
     }
#line 1999 "yy.tab.c"
    break;

  case 36: /* param: VP_Q number  */
#line 303 "src/vendor/cigraph/src/io/pajek-parser.y"
                   {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("diamondratio", (yyvsp[0].realnum), context));
     }
#line 2007 "yy.tab.c"
    break;

  case 37: /* param: VP_LA number  */
#line 306 "src/vendor/cigraph/src/io/pajek-parser.y"
                    {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("labeldegree", (yyvsp[0].realnum), context));
     }
#line 2015 "yy.tab.c"
    break;

  case 38: /* param: VP_SIZE number  */
#line 309 "src/vendor/cigraph/src/io/pajek-parser.y"
                      {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_vertex_attribute("vertexsize", (yyvsp[0].realnum), context));
     }
#line 2023 "yy.tab.c"
    break;

  case 39: /* vpword: VP_FONT vpwordpar  */
#line 314 "src/vendor/cigraph/src/io/pajek-parser.y"
                          {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_string_vertex_attribute("font", (yyvsp[0].string).str, (yyvsp[0].string).len, context));
     }
#line 2031 "yy.tab.c"
    break;

  case 40: /* vpword: VP_URL vpwordpar  */
#line 317 "src/vendor/cigraph/src/io/pajek-parser.y"
                        {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_string_vertex_attribute("url", (yyvsp[0].string).str, (yyvsp[0].string).len, context));
     }
#line 2039 "yy.tab.c"
    break;

  case 41: /* vpword: VP_IC vpwordpar  */
#line 320 "src/vendor/cigraph/src/io/pajek-parser.y"
                       {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_string_vertex_attribute("color", (yyvsp[0].string).str, (yyvsp[0].string).len, context));
     }
#line 2047 "yy.tab.c"
    break;

  case 42: /* vpword: VP_BC vpwordpar  */
#line 323 "src/vendor/cigraph/src/io/pajek-parser.y"
                       {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_string_vertex_attribute("framecolor",
                                                    (yyvsp[0].string).str, (yyvsp[0].string).len, context));
     }
#line 2056 "yy.tab.c"
    break;

  case 43: /* vpword: VP_LC vpwordpar  */
#line 327 "src/vendor/cigraph/src/io/pajek-parser.y"
                       {
         IGRAPH_YY_CHECK(igraph_i_pajek_add_string_vertex_attribute("labelcolor",
                                                    (yyvsp[0].string).str, (yyvsp[0].string).len, context));
     }
#line 2065 "yy.tab.c"
    break;

  case 44: /* vpwordpar: word  */
#line 333 "src/vendor/cigraph/src/io/pajek-parser.y"
                { (yyval.string)=(yyvsp[0].string); }
#line 2071 "yy.tab.c"
    break;

  case 51: /* arcs: "*arcs line" "end of line" arcsdefs  */
#line 337 "src/vendor/cigraph/src/io/pajek-parser.y"
                                         { context->directed=1; }
#line 2077 "yy.tab.c"
    break;

  case 52: /* arcs: "*arcs line" number "end of line" arcsdefs  */
#line 338 "src/vendor/cigraph/src/io/pajek-parser.y"
                                         { context->directed=1; }
#line 2083 "yy.tab.c"
    break;

  case 56: /* $@2: %empty  */
#line 343 "src/vendor/cigraph/src/io/pajek-parser.y"
                        { context->actedge++; }
#line 2089 "yy.tab.c"
    break;

  case 57: /* arcsline: arcfrom arcto $@2 weight edgeparams "end of line"  */
#line 343 "src/vendor/cigraph/src/io/pajek-parser.y"
                                                                           {
  if ((yyvsp[-5].intnum) < 1) {
      IGRAPH_YY_ERRORF("Non-positive vertex ID (%" IGRAPH_PRId ") while reading Pajek file.", IGRAPH_EINVAL, (yyvsp[-5].intnum));
  }
  if ((yyvsp[-4].intnum) < 1) {
      IGRAPH_YY_ERRORF("Non-positive vertex ID (%" IGRAPH_PRId ") while reading Pajek file.", IGRAPH_EINVAL, (yyvsp[-4].intnum));
  }
  IGRAPH_YY_CHECK(igraph_vector_int_push_back(context->vector, (yyvsp[-5].intnum)-1));
  IGRAPH_YY_CHECK(igraph_vector_int_push_back(context->vector, (yyvsp[-4].intnum)-1)); }
#line 2103 "yy.tab.c"
    break;

  case 60: /* edges: "*edges line" "end of line" edgesdefs  */
#line 358 "src/vendor/cigraph/src/io/pajek-parser.y"
                                     { context->directed=0; }
#line 2109 "yy.tab.c"
    break;

  case 61: /* edges: "*edges line" number "end of line" edgesdefs  */
#line 359 "src/vendor/cigraph/src/io/pajek-parser.y"
                                            { context->directed=0; }
#line 2115 "yy.tab.c"
    break;

  case 65: /* $@3: %empty  */
#line 364 "src/vendor/cigraph/src/io/pajek-parser.y"
                          { context->actedge++; }
#line 2121 "yy.tab.c"
    break;

  case 66: /* edgesline: edgefrom edgeto $@3 weight edgeparams "end of line"  */
#line 364 "src/vendor/cigraph/src/io/pajek-parser.y"
                                                                            {
  if ((yyvsp[-5].intnum) < 1) {
      IGRAPH_YY_ERRORF("Non-positive vertex ID (%" IGRAPH_PRId ") while reading Pajek file.", IGRAPH_EINVAL, (yyvsp[-5].intnum));
  }
  if ((yyvsp[-4].intnum) < 1) {
      IGRAPH_YY_ERRORF("Non-positive vertex ID (%" IGRAPH_PRId ") while reading Pajek file.", IGRAPH_EINVAL, (yyvsp[-4].intnum));
  }
  IGRAPH_YY_CHECK(igraph_vector_int_push_back(context->vector, (yyvsp[-5].intnum)-1));
  IGRAPH_YY_CHECK(igraph_vector_int_push_back(context->vector, (yyvsp[-4].intnum)-1)); }
#line 2135 "yy.tab.c"
    break;

  case 70: /* weight: number  */
#line 379 "src/vendor/cigraph/src/io/pajek-parser.y"
                             {
  IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("weight", (yyvsp[0].realnum), context));
}
#line 2143 "yy.tab.c"
    break;

  case 74: /* edgeparam: EP_C number number number  */
#line 387 "src/vendor/cigraph/src/io/pajek-parser.y"
                               {
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("color-red", (yyvsp[-2].realnum), context));
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("color-green", (yyvsp[-1].realnum), context));
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("color-blue", (yyvsp[0].realnum), context));
   }
#line 2153 "yy.tab.c"
    break;

  case 75: /* edgeparam: EP_S number  */
#line 392 "src/vendor/cigraph/src/io/pajek-parser.y"
                 {
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("arrowsize", (yyvsp[0].realnum), context));
   }
#line 2161 "yy.tab.c"
    break;

  case 76: /* edgeparam: EP_W number  */
#line 395 "src/vendor/cigraph/src/io/pajek-parser.y"
                 {
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("edgewidth", (yyvsp[0].realnum), context));
   }
#line 2169 "yy.tab.c"
    break;

  case 77: /* edgeparam: EP_H1 number  */
#line 398 "src/vendor/cigraph/src/io/pajek-parser.y"
                  {
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("hook1", (yyvsp[0].realnum), context));
   }
#line 2177 "yy.tab.c"
    break;

  case 78: /* edgeparam: EP_H2 number  */
#line 401 "src/vendor/cigraph/src/io/pajek-parser.y"
                  {
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("hook2", (yyvsp[0].realnum), context));
   }
#line 2185 "yy.tab.c"
    break;

  case 79: /* edgeparam: EP_A1 number  */
#line 404 "src/vendor/cigraph/src/io/pajek-parser.y"
                  {
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("angle1", (yyvsp[0].realnum), context));
   }
#line 2193 "yy.tab.c"
    break;

  case 80: /* edgeparam: EP_A2 number  */
#line 407 "src/vendor/cigraph/src/io/pajek-parser.y"
                  {
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("angle2", (yyvsp[0].realnum), context));
   }
#line 2201 "yy.tab.c"
    break;

  case 81: /* edgeparam: EP_K1 number  */
#line 410 "src/vendor/cigraph/src/io/pajek-parser.y"
                  {
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("velocity1", (yyvsp[0].realnum), context));
   }
#line 2209 "yy.tab.c"
    break;

  case 82: /* edgeparam: EP_K2 number  */
#line 413 "src/vendor/cigraph/src/io/pajek-parser.y"
                  {
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("velocity2", (yyvsp[0].realnum), context));
   }
#line 2217 "yy.tab.c"
    break;

  case 83: /* edgeparam: EP_AP number  */
#line 416 "src/vendor/cigraph/src/io/pajek-parser.y"
                  {
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("arrowpos", (yyvsp[0].realnum), context));
   }
#line 2225 "yy.tab.c"
    break;

  case 84: /* edgeparam: EP_LP number  */
#line 419 "src/vendor/cigraph/src/io/pajek-parser.y"
                  {
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("labelpos", (yyvsp[0].realnum), context));
   }
#line 2233 "yy.tab.c"
    break;

  case 85: /* edgeparam: EP_LR number  */
#line 422 "src/vendor/cigraph/src/io/pajek-parser.y"
                  {
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("labelangle", (yyvsp[0].realnum), context));
   }
#line 2241 "yy.tab.c"
    break;

  case 86: /* edgeparam: EP_LPHI number  */
#line 425 "src/vendor/cigraph/src/io/pajek-parser.y"
                    {
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("labelangle2", (yyvsp[0].realnum), context));
   }
#line 2249 "yy.tab.c"
    break;

  case 87: /* edgeparam: EP_LA number  */
#line 428 "src/vendor/cigraph/src/io/pajek-parser.y"
                  {
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("labeldegree", (yyvsp[0].realnum), context));
   }
#line 2257 "yy.tab.c"
    break;

  case 88: /* edgeparam: EP_SIZE number  */
#line 431 "src/vendor/cigraph/src/io/pajek-parser.y"
                    { /* what is this??? */
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("arrowsize", (yyvsp[0].realnum), context));
   }
#line 2265 "yy.tab.c"
    break;

  case 89: /* edgeparam: EP_FOS number  */
#line 434 "src/vendor/cigraph/src/io/pajek-parser.y"
                   {
       IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("fontsize", (yyvsp[0].realnum), context));
   }
#line 2273 "yy.tab.c"
    break;

  case 90: /* epword: EP_A epwordpar  */
#line 439 "src/vendor/cigraph/src/io/pajek-parser.y"
                       {
      IGRAPH_YY_CHECK(igraph_i_pajek_add_string_edge_attribute("arrowtype", (yyvsp[0].string).str, (yyvsp[0].string).len, context));
    }
#line 2281 "yy.tab.c"
    break;

  case 91: /* epword: EP_P epwordpar  */
#line 442 "src/vendor/cigraph/src/io/pajek-parser.y"
                     {
      IGRAPH_YY_CHECK(igraph_i_pajek_add_string_edge_attribute("linepattern", (yyvsp[0].string).str, (yyvsp[0].string).len, context));
    }
#line 2289 "yy.tab.c"
    break;

  case 92: /* epword: EP_L epwordpar  */
#line 445 "src/vendor/cigraph/src/io/pajek-parser.y"
                     {
      IGRAPH_YY_CHECK(igraph_i_pajek_add_string_edge_attribute("label", (yyvsp[0].string).str, (yyvsp[0].string).len, context));
    }
#line 2297 "yy.tab.c"
    break;

  case 93: /* epword: EP_LC epwordpar  */
#line 448 "src/vendor/cigraph/src/io/pajek-parser.y"
                      {
      IGRAPH_YY_CHECK(igraph_i_pajek_add_string_edge_attribute("labelcolor", (yyvsp[0].string).str, (yyvsp[0].string).len, context));
    }
#line 2305 "yy.tab.c"
    break;

  case 94: /* epword: EP_C epwordpar  */
#line 451 "src/vendor/cigraph/src/io/pajek-parser.y"
                     {
      IGRAPH_YY_CHECK(igraph_i_pajek_add_string_edge_attribute("color", (yyvsp[0].string).str, (yyvsp[0].string).len, context));
    }
#line 2313 "yy.tab.c"
    break;

  case 95: /* epwordpar: word  */
#line 456 "src/vendor/cigraph/src/io/pajek-parser.y"
                { (yyval.string)=(yyvsp[0].string); }
#line 2319 "yy.tab.c"
    break;

  case 96: /* arcslist: "*arcslist line" "end of line" arcslistlines  */
#line 458 "src/vendor/cigraph/src/io/pajek-parser.y"
                                             { context->directed=1; }
#line 2325 "yy.tab.c"
    break;

  case 103: /* arclistfrom: longint  */
#line 466 "src/vendor/cigraph/src/io/pajek-parser.y"
                     { context->actfrom=labs((yyvsp[0].intnum))-1; }
#line 2331 "yy.tab.c"
    break;

  case 104: /* arclistto: longint  */
#line 468 "src/vendor/cigraph/src/io/pajek-parser.y"
                   {
  IGRAPH_YY_CHECK(igraph_vector_int_push_back(context->vector, context->actfrom));
  IGRAPH_YY_CHECK(igraph_vector_int_push_back(context->vector, labs((yyvsp[0].intnum))-1));
}
#line 2340 "yy.tab.c"
    break;

  case 105: /* edgeslist: "*edgeslist line" "end of line" edgelistlines  */
#line 473 "src/vendor/cigraph/src/io/pajek-parser.y"
                                               { context->directed=0; }
#line 2346 "yy.tab.c"
    break;

  case 112: /* edgelistfrom: longint  */
#line 481 "src/vendor/cigraph/src/io/pajek-parser.y"
                      { context->actfrom=labs((yyvsp[0].intnum))-1; }
#line 2352 "yy.tab.c"
    break;

  case 113: /* edgelistto: longint  */
#line 483 "src/vendor/cigraph/src/io/pajek-parser.y"
                    {
  IGRAPH_YY_CHECK(igraph_vector_int_push_back(context->vector, context->actfrom));
  IGRAPH_YY_CHECK(igraph_vector_int_push_back(context->vector, labs((yyvsp[0].intnum))-1));
}
#line 2361 "yy.tab.c"
    break;

  case 115: /* matrixline: "*matrix line"  */
#line 492 "src/vendor/cigraph/src/io/pajek-parser.y"
                       { context->actfrom=0;
                         context->actto=0;
                         context->directed=(context->vcount2==0);
                       }
#line 2370 "yy.tab.c"
    break;

  case 118: /* adjmatrixline: adjmatrixnumbers "end of line"  */
#line 499 "src/vendor/cigraph/src/io/pajek-parser.y"
                                        { context->actfrom++; context->actto=0; }
#line 2376 "yy.tab.c"
    break;

  case 121: /* adjmatrixentry: number  */
#line 503 "src/vendor/cigraph/src/io/pajek-parser.y"
                       {
  if ((yyvsp[0].realnum) != 0) {
    if (context->vcount2==0) {
      context->actedge++;
      IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("weight", (yyvsp[0].realnum), context));
      IGRAPH_YY_CHECK(igraph_vector_int_push_back(context->vector, context->actfrom));
      IGRAPH_YY_CHECK(igraph_vector_int_push_back(context->vector, context->actto));
    } else if (context->vcount2 + context->actto < context->vcount) {
      context->actedge++;
      IGRAPH_YY_CHECK(igraph_i_pajek_add_numeric_edge_attribute("weight", (yyvsp[0].realnum), context));
      IGRAPH_YY_CHECK(igraph_vector_int_push_back(context->vector, context->actfrom));
      IGRAPH_YY_CHECK(igraph_vector_int_push_back(context->vector,
                              context->vcount2+context->actto));
    }
  }
  context->actto++;
}
#line 2398 "yy.tab.c"
    break;

  case 122: /* longint: "number"  */
#line 523 "src/vendor/cigraph/src/io/pajek-parser.y"
             {
  igraph_integer_t val;
  IGRAPH_YY_CHECK(igraph_i_parse_integer(igraph_pajek_yyget_text(scanner),
                                         igraph_pajek_yyget_leng(scanner),
                                         &val));
  (yyval.intnum)=val;
}
#line 2410 "yy.tab.c"
    break;

  case 123: /* number: "number"  */
#line 531 "src/vendor/cigraph/src/io/pajek-parser.y"
             {
  igraph_real_t val;
  IGRAPH_YY_CHECK(igraph_i_parse_real(igraph_pajek_yyget_text(scanner),
                                      igraph_pajek_yyget_leng(scanner),
                                      &val));
  (yyval.realnum)=val;
}
#line 2422 "yy.tab.c"
    break;

  case 124: /* word: ALNUM  */
#line 539 "src/vendor/cigraph/src/io/pajek-parser.y"
            { (yyval.string).str=igraph_pajek_yyget_text(scanner);
              (yyval.string).len=igraph_pajek_yyget_leng(scanner); }
#line 2429 "yy.tab.c"
    break;

  case 125: /* word: "number"  */
#line 541 "src/vendor/cigraph/src/io/pajek-parser.y"
            { (yyval.string).str=igraph_pajek_yyget_text(scanner);
              (yyval.string).len=igraph_pajek_yyget_leng(scanner); }
#line 2436 "yy.tab.c"
    break;

  case 126: /* word: QSTR  */
#line 543 "src/vendor/cigraph/src/io/pajek-parser.y"
             { (yyval.string).str=igraph_pajek_yyget_text(scanner)+1;
               (yyval.string).len=igraph_pajek_yyget_leng(scanner)-2; }
#line 2443 "yy.tab.c"
    break;


#line 2447 "yy.tab.c"

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
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;
  *++yylsp = yyloc;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      {
        yypcontext_t yyctx
          = {yyssp, yytoken, &yylloc};
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = yysyntax_error (&yymsg_alloc, &yymsg, &yyctx);
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == -1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = YY_CAST (char *,
                             YYSTACK_ALLOC (YY_CAST (YYSIZE_T, yymsg_alloc)));
            if (yymsg)
              {
                yysyntax_error_status
                  = yysyntax_error (&yymsg_alloc, &yymsg, &yyctx);
                yymsgp = yymsg;
              }
            else
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = YYENOMEM;
              }
          }
        yyerror (&yylloc, context, yymsgp);
        if (yysyntax_error_status == YYENOMEM)
          YYNOMEM;
      }
    }

  yyerror_range[1] = yylloc;
  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= END)
        {
          /* Return failure if at end of input.  */
          if (yychar == END)
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
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

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

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
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
                  YY_ACCESSING_SYMBOL (yystate), yyvsp, yylsp, context);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  yyerror_range[2] = yylloc;
  ++yylsp;
  YYLLOC_DEFAULT (*yylsp, yyerror_range, 2);

  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (&yylloc, context, YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
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
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp, yylsp, context);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
  return yyresult;
}

#line 546 "src/vendor/cigraph/src/io/pajek-parser.y"


int igraph_pajek_yyerror(YYLTYPE* locp,
                         igraph_i_pajek_parsedata_t *context,
                         const char *s) {
  snprintf(context->errmsg, sizeof(context->errmsg)/sizeof(char)-1,
           "Parse error in Pajek file, line %i (%s)",
           locp->first_line, s);
  return 0;
}

/* TODO: NA's */

static igraph_error_t igraph_i_pajek_add_numeric_attribute(igraph_trie_t *names,
                                         igraph_vector_ptr_t *attrs,
                                         igraph_integer_t count,
                                         const char *attrname,
                                         igraph_integer_t vid,
                                         igraph_real_t number) {
  igraph_integer_t attrsize = igraph_trie_size(names);
  igraph_integer_t id;
  igraph_vector_t *na;
  igraph_attribute_record_t *rec;

  IGRAPH_CHECK(igraph_trie_get(names, attrname, &id));
  if (id == attrsize) {
    /* add a new attribute */
    rec=IGRAPH_CALLOC(1, igraph_attribute_record_t);
    if (! rec) {
        IGRAPH_ERROR("Out of memory while parsing Pajek file.", IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_free, rec);
    na=IGRAPH_CALLOC(1, igraph_vector_t);
    if (! na) {
        IGRAPH_ERROR("Out of memory while parsing Pajek file.", IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_free, na);
    IGRAPH_VECTOR_INIT_FINALLY(na, count);
    rec->name=strdup(attrname);
    if (! rec->name) {
      IGRAPH_ERROR("Out of memory while parsing Pajek file.", IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_free, (void *) rec->name);
    rec->type=IGRAPH_ATTRIBUTE_NUMERIC;
    rec->value=na;
    IGRAPH_CHECK(igraph_vector_ptr_push_back(attrs, rec));
    IGRAPH_FINALLY_CLEAN(4); /* ownership of rec transferred to attrs */
  }
  rec=VECTOR(*attrs)[id];
  na=(igraph_vector_t*)rec->value;
  if (igraph_vector_size(na) == vid) {
    IGRAPH_CHECK(igraph_vector_push_back(na, number));
  } else if (igraph_vector_size(na) < vid) {
    igraph_integer_t origsize=igraph_vector_size(na);
    IGRAPH_CHECK(igraph_vector_resize(na, vid+1));
    for (;origsize<count; origsize++) {
      VECTOR(*na)[origsize] = IGRAPH_NAN;
    }
    VECTOR(*na)[vid] = number;
  } else {
    VECTOR(*na)[vid] = number;
  }

  return IGRAPH_SUCCESS;
}

/* TODO: NA's */

static igraph_error_t igraph_i_pajek_add_string_attribute(igraph_trie_t *names,
                                                   igraph_vector_ptr_t *attrs,
                                                   igraph_integer_t count,
                                                   const char *attrname,
                                                   igraph_integer_t vid,
                                                   const char *str,
                                                   igraph_integer_t str_len) {
  igraph_integer_t attrsize=igraph_trie_size(names);
  igraph_integer_t id;
  igraph_strvector_t *na;
  igraph_attribute_record_t *rec;

  IGRAPH_CHECK(igraph_trie_get(names, attrname, &id));
  if (id == attrsize) {
    /* add a new attribute */
    rec=IGRAPH_CALLOC(1, igraph_attribute_record_t);
    if (! rec) {
      IGRAPH_ERROR("Out of memory while parsing Pajek file.", IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_free, rec);
    na=IGRAPH_CALLOC(1, igraph_strvector_t);
    if (! na) {
      IGRAPH_ERROR("Out of memory while parsing Pajek file.", IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_free, na);
    IGRAPH_STRVECTOR_INIT_FINALLY(na, count);
    rec->name=strdup(attrname);
    if (! rec->name) {
      IGRAPH_ERROR("Out of memory while parsing Pajek file.", IGRAPH_ENOMEM);
    }
    IGRAPH_FINALLY(igraph_free, (char *) rec->name);
    rec->type=IGRAPH_ATTRIBUTE_STRING;
    rec->value=na;
    IGRAPH_CHECK(igraph_vector_ptr_push_back(attrs, rec));
    IGRAPH_FINALLY_CLEAN(4); /* ownership of rec transferred to attrs */
  }
  rec=VECTOR(*attrs)[id];
  na=(igraph_strvector_t*)rec->value;
  if (igraph_strvector_size(na) <= vid) {
    IGRAPH_CHECK(igraph_strvector_resize(na, vid+1));
  }
  IGRAPH_CHECK(igraph_strvector_set_len(na, vid, str, str_len));

  return IGRAPH_SUCCESS;
}

static igraph_error_t igraph_i_pajek_add_string_vertex_attribute(const char *name,
                                               const char *value,
                                               size_t len,
                                               igraph_i_pajek_parsedata_t *context) {


  return igraph_i_pajek_add_string_attribute(context->vertex_attribute_names,
                                             context->vertex_attributes,
                                             context->vcount,
                                             name, context->actvertex-1,
                                             value, len);
}

static igraph_error_t igraph_i_pajek_add_string_edge_attribute(const char *name,
                                             const char *value,
                                             size_t len,
                                             igraph_i_pajek_parsedata_t *context) {

  return igraph_i_pajek_add_string_attribute(context->edge_attribute_names,
                                             context->edge_attributes,
                                             context->actedge,
                                             name, context->actedge-1,
                                             value, len);
}

static igraph_error_t igraph_i_pajek_add_numeric_vertex_attribute(const char *name,
                                                igraph_real_t value,
                                                igraph_i_pajek_parsedata_t *context) {

  return     igraph_i_pajek_add_numeric_attribute(context->vertex_attribute_names,
                                                  context->vertex_attributes,
                                                  context->vcount,
                                                  name, context->actvertex-1,
                                                  value);
}

static igraph_error_t igraph_i_pajek_add_numeric_edge_attribute(const char *name,
                                              igraph_real_t value,
                                              igraph_i_pajek_parsedata_t *context) {

  return igraph_i_pajek_add_numeric_attribute(context->edge_attribute_names,
                                              context->edge_attributes,
                                              context->actedge,
                                              name, context->actedge-1,
                                              value);
}

static igraph_error_t igraph_i_pajek_add_bipartite_type(igraph_i_pajek_parsedata_t *context) {

  const char *attrname="type";
  igraph_trie_t *names=context->vertex_attribute_names;
  igraph_vector_ptr_t *attrs=context->vertex_attributes;
  igraph_integer_t i, n=context->vcount, n1=context->vcount2;
  igraph_integer_t attrid, attrsize = igraph_trie_size(names);
  igraph_attribute_record_t *rec;
  igraph_vector_bool_t *na;

  if (n1 > n) {
    IGRAPH_ERROR("Invalid number of vertices in bipartite Pajek file.",
                 IGRAPH_PARSEERROR);
  }

  IGRAPH_CHECK(igraph_trie_get(names, attrname, &attrid));
  /* It should not be possible for the "type" attribute to be already
   * present at this point. */
  IGRAPH_ASSERT(attrid == attrsize);

  /* add a new attribute */
  rec=IGRAPH_CALLOC(1, igraph_attribute_record_t);
  if (! rec) {
    IGRAPH_ERROR("Out of memory while parsing Pajek file.", IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_free, rec);
  na=IGRAPH_CALLOC(1, igraph_vector_bool_t);
  if (! na) {
    IGRAPH_ERROR("Out of memory while parsing Pajek file.", IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_free, na);
  IGRAPH_VECTOR_BOOL_INIT_FINALLY(na, n);
  rec->name=strdup(attrname);
  if (! rec->name) {
    IGRAPH_ERROR("Out of memory while parsing Pajek file.", IGRAPH_ENOMEM);
  }
  IGRAPH_FINALLY(igraph_free, (char *) rec->name);
  rec->type=IGRAPH_ATTRIBUTE_BOOLEAN;
  rec->value=na;
  IGRAPH_CHECK(igraph_vector_ptr_push_back(attrs, rec));
  IGRAPH_FINALLY_CLEAN(4); /* ownership of 'rec' transferred to 'attrs' */

  for (i=0; i<n1; i++) {
    VECTOR(*na)[i] = 0;
  }
  for (i=n1; i<n; i++) {
    VECTOR(*na)[i] = 1;
  }

  return IGRAPH_SUCCESS;
}

static igraph_error_t igraph_i_pajek_check_bipartite(igraph_i_pajek_parsedata_t *context) {
  const igraph_vector_int_t *edges=context->vector;
  igraph_integer_t i, n1=context->vcount2;
  igraph_integer_t ne=igraph_vector_int_size(edges);

  for (i=0; i<ne; i+=2) {
    igraph_integer_t v1 = VECTOR(*edges)[i];
    igraph_integer_t v2 = VECTOR(*edges)[i+1];
    if ( (v1 < n1 && v2 < n1) || (v1 > n1 && v2 > n1) ) {
      IGRAPH_WARNING("Invalid edge in bipartite graph.");
    }
  }

  return IGRAPH_SUCCESS;
}