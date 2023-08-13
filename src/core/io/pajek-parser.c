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


#line 158 "yy.tab.c"

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

#include "io/pajek-parser.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_NEWLINE = 3,                    /* NEWLINE  */
  YYSYMBOL_NUM = 4,                        /* NUM  */
  YYSYMBOL_ALNUM = 5,                      /* ALNUM  */
  YYSYMBOL_QSTR = 6,                       /* QSTR  */
  YYSYMBOL_PSTR = 7,                       /* PSTR  */
  YYSYMBOL_NETWORKLINE = 8,                /* NETWORKLINE  */
  YYSYMBOL_VERTICESLINE = 9,               /* VERTICESLINE  */
  YYSYMBOL_ARCSLINE = 10,                  /* ARCSLINE  */
  YYSYMBOL_EDGESLINE = 11,                 /* EDGESLINE  */
  YYSYMBOL_ARCSLISTLINE = 12,              /* ARCSLISTLINE  */
  YYSYMBOL_EDGESLISTLINE = 13,             /* EDGESLISTLINE  */
  YYSYMBOL_MATRIXLINE = 14,                /* MATRIXLINE  */
  YYSYMBOL_ERROR = 15,                     /* ERROR  */
  YYSYMBOL_VP_X_FACT = 16,                 /* VP_X_FACT  */
  YYSYMBOL_VP_Y_FACT = 17,                 /* VP_Y_FACT  */
  YYSYMBOL_VP_IC = 18,                     /* VP_IC  */
  YYSYMBOL_VP_BC = 19,                     /* VP_BC  */
  YYSYMBOL_VP_LC = 20,                     /* VP_LC  */
  YYSYMBOL_VP_LR = 21,                     /* VP_LR  */
  YYSYMBOL_VP_LPHI = 22,                   /* VP_LPHI  */
  YYSYMBOL_VP_BW = 23,                     /* VP_BW  */
  YYSYMBOL_VP_FOS = 24,                    /* VP_FOS  */
  YYSYMBOL_VP_PHI = 25,                    /* VP_PHI  */
  YYSYMBOL_VP_R = 26,                      /* VP_R  */
  YYSYMBOL_VP_Q = 27,                      /* VP_Q  */
  YYSYMBOL_VP_LA = 28,                     /* VP_LA  */
  YYSYMBOL_VP_FONT = 29,                   /* VP_FONT  */
  YYSYMBOL_VP_URL = 30,                    /* VP_URL  */
  YYSYMBOL_VP_SIZE = 31,                   /* VP_SIZE  */
  YYSYMBOL_EP_C = 32,                      /* EP_C  */
  YYSYMBOL_EP_S = 33,                      /* EP_S  */
  YYSYMBOL_EP_A = 34,                      /* EP_A  */
  YYSYMBOL_EP_W = 35,                      /* EP_W  */
  YYSYMBOL_EP_H1 = 36,                     /* EP_H1  */
  YYSYMBOL_EP_H2 = 37,                     /* EP_H2  */
  YYSYMBOL_EP_A1 = 38,                     /* EP_A1  */
  YYSYMBOL_EP_A2 = 39,                     /* EP_A2  */
  YYSYMBOL_EP_K1 = 40,                     /* EP_K1  */
  YYSYMBOL_EP_K2 = 41,                     /* EP_K2  */
  YYSYMBOL_EP_AP = 42,                     /* EP_AP  */
  YYSYMBOL_EP_P = 43,                      /* EP_P  */
  YYSYMBOL_EP_L = 44,                      /* EP_L  */
  YYSYMBOL_EP_LP = 45,                     /* EP_LP  */
  YYSYMBOL_EP_LR = 46,                     /* EP_LR  */
  YYSYMBOL_EP_LPHI = 47,                   /* EP_LPHI  */
  YYSYMBOL_EP_LC = 48,                     /* EP_LC  */
  YYSYMBOL_EP_LA = 49,                     /* EP_LA  */
  YYSYMBOL_EP_SIZE = 50,                   /* EP_SIZE  */
  YYSYMBOL_EP_FOS = 51,                    /* EP_FOS  */
  YYSYMBOL_YYACCEPT = 52,                  /* $accept  */
  YYSYMBOL_input = 53,                     /* input  */
  YYSYMBOL_nethead = 54,                   /* nethead  */
  YYSYMBOL_vertices = 55,                  /* vertices  */
  YYSYMBOL_verticeshead = 56,              /* verticeshead  */
  YYSYMBOL_vertdefs = 57,                  /* vertdefs  */
  YYSYMBOL_vertexline = 58,                /* vertexline  */
  YYSYMBOL_59_1 = 59,                      /* $@1  */
  YYSYMBOL_vertex = 60,                    /* vertex  */
  YYSYMBOL_vertexid = 61,                  /* vertexid  */
  YYSYMBOL_vertexcoords = 62,              /* vertexcoords  */
  YYSYMBOL_shape = 63,                     /* shape  */
  YYSYMBOL_params = 64,                    /* params  */
  YYSYMBOL_param = 65,                     /* param  */
  YYSYMBOL_vpword = 66,                    /* vpword  */
  YYSYMBOL_67_2 = 67,                      /* $@2  */
  YYSYMBOL_68_3 = 68,                      /* $@3  */
  YYSYMBOL_69_4 = 69,                      /* $@4  */
  YYSYMBOL_70_5 = 70,                      /* $@5  */
  YYSYMBOL_71_6 = 71,                      /* $@6  */
  YYSYMBOL_vpwordpar = 72,                 /* vpwordpar  */
  YYSYMBOL_edgeblock = 73,                 /* edgeblock  */
  YYSYMBOL_arcs = 74,                      /* arcs  */
  YYSYMBOL_arcsdefs = 75,                  /* arcsdefs  */
  YYSYMBOL_arcsline = 76,                  /* arcsline  */
  YYSYMBOL_77_7 = 77,                      /* $@7  */
  YYSYMBOL_arcfrom = 78,                   /* arcfrom  */
  YYSYMBOL_arcto = 79,                     /* arcto  */
  YYSYMBOL_edges = 80,                     /* edges  */
  YYSYMBOL_edgesdefs = 81,                 /* edgesdefs  */
  YYSYMBOL_edgesline = 82,                 /* edgesline  */
  YYSYMBOL_83_8 = 83,                      /* $@8  */
  YYSYMBOL_edgefrom = 84,                  /* edgefrom  */
  YYSYMBOL_edgeto = 85,                    /* edgeto  */
  YYSYMBOL_weight = 86,                    /* weight  */
  YYSYMBOL_edgeparams = 87,                /* edgeparams  */
  YYSYMBOL_edgeparam = 88,                 /* edgeparam  */
  YYSYMBOL_epword = 89,                    /* epword  */
  YYSYMBOL_90_9 = 90,                      /* $@9  */
  YYSYMBOL_91_10 = 91,                     /* $@10  */
  YYSYMBOL_92_11 = 92,                     /* $@11  */
  YYSYMBOL_93_12 = 93,                     /* $@12  */
  YYSYMBOL_94_13 = 94,                     /* $@13  */
  YYSYMBOL_epwordpar = 95,                 /* epwordpar  */
  YYSYMBOL_arcslist = 96,                  /* arcslist  */
  YYSYMBOL_arcslistlines = 97,             /* arcslistlines  */
  YYSYMBOL_arclistline = 98,               /* arclistline  */
  YYSYMBOL_arctolist = 99,                 /* arctolist  */
  YYSYMBOL_arclistfrom = 100,              /* arclistfrom  */
  YYSYMBOL_arclistto = 101,                /* arclistto  */
  YYSYMBOL_edgeslist = 102,                /* edgeslist  */
  YYSYMBOL_edgelistlines = 103,            /* edgelistlines  */
  YYSYMBOL_edgelistline = 104,             /* edgelistline  */
  YYSYMBOL_edgetolist = 105,               /* edgetolist  */
  YYSYMBOL_edgelistfrom = 106,             /* edgelistfrom  */
  YYSYMBOL_edgelistto = 107,               /* edgelistto  */
  YYSYMBOL_adjmatrix = 108,                /* adjmatrix  */
  YYSYMBOL_matrixline = 109,               /* matrixline  */
  YYSYMBOL_adjmatrixlines = 110,           /* adjmatrixlines  */
  YYSYMBOL_adjmatrixline = 111,            /* adjmatrixline  */
  YYSYMBOL_adjmatrixnumbers = 112,         /* adjmatrixnumbers  */
  YYSYMBOL_adjmatrixentry = 113,           /* adjmatrixentry  */
  YYSYMBOL_longint = 114,                  /* longint  */
  YYSYMBOL_number = 115,                   /* number  */
  YYSYMBOL_words = 116,                    /* words  */
  YYSYMBOL_word = 117                      /* word  */
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

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   306


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
      45,    46,    47,    48,    49,    50,    51
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
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
  "\"end of file\"", "error", "\"invalid token\"", "NEWLINE", "NUM",
  "ALNUM", "QSTR", "PSTR", "NETWORKLINE", "VERTICESLINE", "ARCSLINE",
  "EDGESLINE", "ARCSLISTLINE", "EDGESLISTLINE", "MATRIXLINE", "ERROR",
  "VP_X_FACT", "VP_Y_FACT", "VP_IC", "VP_BC", "VP_LC", "VP_LR", "VP_LPHI",
  "VP_BW", "VP_FOS", "VP_PHI", "VP_R", "VP_Q", "VP_LA", "VP_FONT",
  "VP_URL", "VP_SIZE", "EP_C", "EP_S", "EP_A", "EP_W", "EP_H1", "EP_H2",
  "EP_A1", "EP_A2", "EP_K1", "EP_K2", "EP_AP", "EP_P", "EP_L", "EP_LP",
  "EP_LR", "EP_LPHI", "EP_LC", "EP_LA", "EP_SIZE", "EP_FOS", "$accept",
  "input", "nethead", "vertices", "verticeshead", "vertdefs", "vertexline",
  "$@1", "vertex", "vertexid", "vertexcoords", "shape", "params", "param",
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

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-167)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-129)

#define yytable_value_is_error(Yyn) \
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
static const yytype_uint8 yydefgoto[] =
{
       0,     2,     3,     7,     8,    30,    40,    51,    41,    74,
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

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
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

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
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

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
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
#line 190 "src/core/io/pajek-parser.y"
                                  {
  if (context->vcount2 > 0) { igraph_i_pajek_check_bipartite(context); }
 }
#line 1830 "yy.tab.c"
    break;

  case 6: /* verticeshead: VERTICESLINE longint  */
#line 198 "src/core/io/pajek-parser.y"
                                   {
  context->vcount=(yyvsp[0].intnum);
  context->vcount2=0;
            }
#line 1839 "yy.tab.c"
    break;

  case 7: /* verticeshead: VERTICESLINE longint longint  */
#line 202 "src/core/io/pajek-parser.y"
                                           {
  context->vcount=(yyvsp[-1].intnum);
  context->vcount2=(yyvsp[0].intnum);
  igraph_i_pajek_add_bipartite_type(context);
}
#line 1849 "yy.tab.c"
    break;

  case 12: /* $@1: %empty  */
#line 212 "src/core/io/pajek-parser.y"
                   { context->actvertex=(yyvsp[0].intnum); }
#line 1855 "yy.tab.c"
    break;

  case 13: /* vertexline: vertex $@1 vertexid vertexcoords shape params NEWLINE  */
#line 212 "src/core/io/pajek-parser.y"
                                                                                         { }
#line 1861 "yy.tab.c"
    break;

  case 14: /* vertex: longint  */
#line 215 "src/core/io/pajek-parser.y"
                { (yyval.intnum)=(yyvsp[0].intnum); context->mode=1; }
#line 1867 "yy.tab.c"
    break;

  case 15: /* vertexid: word  */
#line 217 "src/core/io/pajek-parser.y"
               {
  igraph_i_pajek_add_string_vertex_attribute("id", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
  igraph_i_pajek_add_string_vertex_attribute("name", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
}
#line 1876 "yy.tab.c"
    break;

  case 17: /* vertexcoords: number number  */
#line 223 "src/core/io/pajek-parser.y"
                            {
  igraph_i_pajek_add_numeric_vertex_attribute("x", (yyvsp[-1].realnum), context);
  igraph_i_pajek_add_numeric_vertex_attribute("y", (yyvsp[0].realnum), context);
            }
#line 1885 "yy.tab.c"
    break;

  case 18: /* vertexcoords: number number number  */
#line 227 "src/core/io/pajek-parser.y"
                                   {
  igraph_i_pajek_add_numeric_vertex_attribute("x", (yyvsp[-2].realnum), context);
  igraph_i_pajek_add_numeric_vertex_attribute("y", (yyvsp[-1].realnum), context);
  igraph_i_pajek_add_numeric_vertex_attribute("z", (yyvsp[0].realnum), context);
            }
#line 1895 "yy.tab.c"
    break;

  case 20: /* shape: word  */
#line 233 "src/core/io/pajek-parser.y"
                          {
  igraph_i_pajek_add_string_vertex_attribute("shape", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
}
#line 1903 "yy.tab.c"
    break;

  case 24: /* param: VP_X_FACT number  */
#line 241 "src/core/io/pajek-parser.y"
                        {
         igraph_i_pajek_add_numeric_vertex_attribute("xfact", (yyvsp[0].realnum), context);
       }
#line 1911 "yy.tab.c"
    break;

  case 25: /* param: VP_Y_FACT number  */
#line 244 "src/core/io/pajek-parser.y"
                        {
         igraph_i_pajek_add_numeric_vertex_attribute("yfact", (yyvsp[0].realnum), context);
       }
#line 1919 "yy.tab.c"
    break;

  case 26: /* param: VP_IC number number number  */
#line 247 "src/core/io/pajek-parser.y"
                                  { /* RGB color */
         igraph_i_pajek_add_numeric_vertex_attribute("color-red", (yyvsp[-2].realnum), context);
         igraph_i_pajek_add_numeric_vertex_attribute("color-green", (yyvsp[-1].realnum), context);
         igraph_i_pajek_add_numeric_vertex_attribute("color-blue", (yyvsp[0].realnum), context);
       }
#line 1929 "yy.tab.c"
    break;

  case 27: /* param: VP_BC number number number  */
#line 252 "src/core/io/pajek-parser.y"
                                  {
         igraph_i_pajek_add_numeric_vertex_attribute("framecolor-red", (yyvsp[-2].realnum), context);
         igraph_i_pajek_add_numeric_vertex_attribute("framecolor-green", (yyvsp[-1].realnum), context);
         igraph_i_pajek_add_numeric_vertex_attribute("framecolor-blue", (yyvsp[0].realnum), context);
       }
#line 1939 "yy.tab.c"
    break;

  case 28: /* param: VP_LC number number number  */
#line 257 "src/core/io/pajek-parser.y"
                                  {
         igraph_i_pajek_add_numeric_vertex_attribute("labelcolor-red", (yyvsp[-2].realnum), context);
         igraph_i_pajek_add_numeric_vertex_attribute("labelcolor-green", (yyvsp[-1].realnum), context);
         igraph_i_pajek_add_numeric_vertex_attribute("labelcolor-blue", (yyvsp[0].realnum), context);
       }
#line 1949 "yy.tab.c"
    break;

  case 29: /* param: VP_LR number  */
#line 262 "src/core/io/pajek-parser.y"
                    {
         igraph_i_pajek_add_numeric_vertex_attribute("labeldist", (yyvsp[0].realnum), context);
     }
#line 1957 "yy.tab.c"
    break;

  case 30: /* param: VP_LPHI number  */
#line 265 "src/core/io/pajek-parser.y"
                      {
         igraph_i_pajek_add_numeric_vertex_attribute("labeldegree2", (yyvsp[0].realnum), context);
     }
#line 1965 "yy.tab.c"
    break;

  case 31: /* param: VP_BW number  */
#line 268 "src/core/io/pajek-parser.y"
                    {
         igraph_i_pajek_add_numeric_vertex_attribute("framewidth", (yyvsp[0].realnum), context);
     }
#line 1973 "yy.tab.c"
    break;

  case 32: /* param: VP_FOS number  */
#line 271 "src/core/io/pajek-parser.y"
                     {
         igraph_i_pajek_add_numeric_vertex_attribute("fontsize", (yyvsp[0].realnum), context);
     }
#line 1981 "yy.tab.c"
    break;

  case 33: /* param: VP_PHI number  */
#line 274 "src/core/io/pajek-parser.y"
                     {
         igraph_i_pajek_add_numeric_vertex_attribute("rotation", (yyvsp[0].realnum), context);
     }
#line 1989 "yy.tab.c"
    break;

  case 34: /* param: VP_R number  */
#line 277 "src/core/io/pajek-parser.y"
                   {
         igraph_i_pajek_add_numeric_vertex_attribute("radius", (yyvsp[0].realnum), context);
     }
#line 1997 "yy.tab.c"
    break;

  case 35: /* param: VP_Q number  */
#line 280 "src/core/io/pajek-parser.y"
                   {
         igraph_i_pajek_add_numeric_vertex_attribute("diamondratio", (yyvsp[0].realnum), context);
     }
#line 2005 "yy.tab.c"
    break;

  case 36: /* param: VP_LA number  */
#line 283 "src/core/io/pajek-parser.y"
                    {
         igraph_i_pajek_add_numeric_vertex_attribute("labeldegree", (yyvsp[0].realnum), context);
     }
#line 2013 "yy.tab.c"
    break;

  case 37: /* param: VP_SIZE number  */
#line 286 "src/core/io/pajek-parser.y"
                      {
         igraph_i_pajek_add_numeric_vertex_attribute("vertexsize", (yyvsp[0].realnum), context);
     }
#line 2021 "yy.tab.c"
    break;

  case 38: /* $@2: %empty  */
#line 291 "src/core/io/pajek-parser.y"
                { context->mode=3; }
#line 2027 "yy.tab.c"
    break;

  case 39: /* vpword: VP_FONT $@2 vpwordpar  */
#line 291 "src/core/io/pajek-parser.y"
                                               {
         context->mode=1;
         igraph_i_pajek_add_string_vertex_attribute("font", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
     }
#line 2036 "yy.tab.c"
    break;

  case 40: /* $@3: %empty  */
#line 295 "src/core/io/pajek-parser.y"
              { context->mode=3; }
#line 2042 "yy.tab.c"
    break;

  case 41: /* vpword: VP_URL $@3 vpwordpar  */
#line 295 "src/core/io/pajek-parser.y"
                                             {
         context->mode=1;
         igraph_i_pajek_add_string_vertex_attribute("url", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
     }
#line 2051 "yy.tab.c"
    break;

  case 42: /* $@4: %empty  */
#line 299 "src/core/io/pajek-parser.y"
             { context->mode=3; }
#line 2057 "yy.tab.c"
    break;

  case 43: /* vpword: VP_IC $@4 vpwordpar  */
#line 299 "src/core/io/pajek-parser.y"
                                            {
         context->mode=1;
         igraph_i_pajek_add_string_vertex_attribute("color", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
     }
#line 2066 "yy.tab.c"
    break;

  case 44: /* $@5: %empty  */
#line 303 "src/core/io/pajek-parser.y"
             { context->mode=3; }
#line 2072 "yy.tab.c"
    break;

  case 45: /* vpword: VP_BC $@5 vpwordpar  */
#line 303 "src/core/io/pajek-parser.y"
                                            {
         context->mode=1;
         igraph_i_pajek_add_string_vertex_attribute("framecolor",
                                                    (yyvsp[0].string).str, (yyvsp[0].string).len, context);
     }
#line 2082 "yy.tab.c"
    break;

  case 46: /* $@6: %empty  */
#line 308 "src/core/io/pajek-parser.y"
             { context->mode=3; }
#line 2088 "yy.tab.c"
    break;

  case 47: /* vpword: VP_LC $@6 vpwordpar  */
#line 308 "src/core/io/pajek-parser.y"
                                            {
         context->mode=1;
         igraph_i_pajek_add_string_vertex_attribute("labelcolor",
                                                    (yyvsp[0].string).str, (yyvsp[0].string).len, context);
     }
#line 2098 "yy.tab.c"
    break;

  case 48: /* vpwordpar: word  */
#line 315 "src/core/io/pajek-parser.y"
                { (yyval.string)=(yyvsp[0].string); }
#line 2104 "yy.tab.c"
    break;

  case 55: /* arcs: ARCSLINE NEWLINE arcsdefs  */
#line 319 "src/core/io/pajek-parser.y"
                                         { context->directed=1; }
#line 2110 "yy.tab.c"
    break;

  case 56: /* arcs: ARCSLINE number NEWLINE arcsdefs  */
#line 320 "src/core/io/pajek-parser.y"
                                         { context->directed=1; }
#line 2116 "yy.tab.c"
    break;

  case 60: /* $@7: %empty  */
#line 325 "src/core/io/pajek-parser.y"
                        { context->actedge++;
                          context->mode=2; }
#line 2123 "yy.tab.c"
    break;

  case 61: /* arcsline: arcfrom arcto $@7 weight edgeparams NEWLINE  */
#line 326 "src/core/io/pajek-parser.y"
                                                                        {
  igraph_vector_push_back(context->vector, (yyvsp[-5].intnum)-1);
  igraph_vector_push_back(context->vector, (yyvsp[-4].intnum)-1); }
#line 2131 "yy.tab.c"
    break;

  case 64: /* edges: EDGESLINE NEWLINE edgesdefs  */
#line 335 "src/core/io/pajek-parser.y"
                                     { context->directed=0; }
#line 2137 "yy.tab.c"
    break;

  case 65: /* edges: EDGESLINE number NEWLINE edgesdefs  */
#line 336 "src/core/io/pajek-parser.y"
                                            { context->directed=0; }
#line 2143 "yy.tab.c"
    break;

  case 69: /* $@8: %empty  */
#line 341 "src/core/io/pajek-parser.y"
                          { context->actedge++;
                            context->mode=2; }
#line 2150 "yy.tab.c"
    break;

  case 70: /* edgesline: edgefrom edgeto $@8 weight edgeparams NEWLINE  */
#line 342 "src/core/io/pajek-parser.y"
                                                                         {
  igraph_vector_push_back(context->vector, (yyvsp[-5].intnum)-1);
  igraph_vector_push_back(context->vector, (yyvsp[-4].intnum)-1); }
#line 2158 "yy.tab.c"
    break;

  case 74: /* weight: number  */
#line 351 "src/core/io/pajek-parser.y"
                             {
  igraph_i_pajek_add_numeric_edge_attribute("weight", (yyvsp[0].realnum), context);
}
#line 2166 "yy.tab.c"
    break;

  case 78: /* edgeparam: EP_C number number number  */
#line 359 "src/core/io/pajek-parser.y"
                               {
       igraph_i_pajek_add_numeric_edge_attribute("color-red", (yyvsp[-2].realnum), context);
       igraph_i_pajek_add_numeric_edge_attribute("color-green", (yyvsp[-1].realnum), context);
       igraph_i_pajek_add_numeric_edge_attribute("color-blue", (yyvsp[0].realnum), context);
   }
#line 2176 "yy.tab.c"
    break;

  case 79: /* edgeparam: EP_S number  */
#line 364 "src/core/io/pajek-parser.y"
                 {
       igraph_i_pajek_add_numeric_edge_attribute("arrowsize", (yyvsp[0].realnum), context);
   }
#line 2184 "yy.tab.c"
    break;

  case 80: /* edgeparam: EP_W number  */
#line 367 "src/core/io/pajek-parser.y"
                 {
       igraph_i_pajek_add_numeric_edge_attribute("edgewidth", (yyvsp[0].realnum), context);
   }
#line 2192 "yy.tab.c"
    break;

  case 81: /* edgeparam: EP_H1 number  */
#line 370 "src/core/io/pajek-parser.y"
                  {
       igraph_i_pajek_add_numeric_edge_attribute("hook1", (yyvsp[0].realnum), context);
   }
#line 2200 "yy.tab.c"
    break;

  case 82: /* edgeparam: EP_H2 number  */
#line 373 "src/core/io/pajek-parser.y"
                  {
       igraph_i_pajek_add_numeric_edge_attribute("hook2", (yyvsp[0].realnum), context);
   }
#line 2208 "yy.tab.c"
    break;

  case 83: /* edgeparam: EP_A1 number  */
#line 376 "src/core/io/pajek-parser.y"
                  {
       igraph_i_pajek_add_numeric_edge_attribute("angle1", (yyvsp[0].realnum), context);
   }
#line 2216 "yy.tab.c"
    break;

  case 84: /* edgeparam: EP_A2 number  */
#line 379 "src/core/io/pajek-parser.y"
                  {
       igraph_i_pajek_add_numeric_edge_attribute("angle2", (yyvsp[0].realnum), context);
   }
#line 2224 "yy.tab.c"
    break;

  case 85: /* edgeparam: EP_K1 number  */
#line 382 "src/core/io/pajek-parser.y"
                  {
       igraph_i_pajek_add_numeric_edge_attribute("velocity1", (yyvsp[0].realnum), context);
   }
#line 2232 "yy.tab.c"
    break;

  case 86: /* edgeparam: EP_K2 number  */
#line 385 "src/core/io/pajek-parser.y"
                  {
       igraph_i_pajek_add_numeric_edge_attribute("velocity2", (yyvsp[0].realnum), context);
   }
#line 2240 "yy.tab.c"
    break;

  case 87: /* edgeparam: EP_AP number  */
#line 388 "src/core/io/pajek-parser.y"
                  {
       igraph_i_pajek_add_numeric_edge_attribute("arrowpos", (yyvsp[0].realnum), context);
   }
#line 2248 "yy.tab.c"
    break;

  case 88: /* edgeparam: EP_LP number  */
#line 391 "src/core/io/pajek-parser.y"
                  {
       igraph_i_pajek_add_numeric_edge_attribute("labelpos", (yyvsp[0].realnum), context);
   }
#line 2256 "yy.tab.c"
    break;

  case 89: /* edgeparam: EP_LR number  */
#line 394 "src/core/io/pajek-parser.y"
                  {
       igraph_i_pajek_add_numeric_edge_attribute("labelangle", (yyvsp[0].realnum), context);
   }
#line 2264 "yy.tab.c"
    break;

  case 90: /* edgeparam: EP_LPHI number  */
#line 397 "src/core/io/pajek-parser.y"
                    {
       igraph_i_pajek_add_numeric_edge_attribute("labelangle2", (yyvsp[0].realnum), context);
   }
#line 2272 "yy.tab.c"
    break;

  case 91: /* edgeparam: EP_LA number  */
#line 400 "src/core/io/pajek-parser.y"
                  {
       igraph_i_pajek_add_numeric_edge_attribute("labeldegree", (yyvsp[0].realnum), context);
   }
#line 2280 "yy.tab.c"
    break;

  case 92: /* edgeparam: EP_SIZE number  */
#line 403 "src/core/io/pajek-parser.y"
                    { /* what is this??? */
       igraph_i_pajek_add_numeric_edge_attribute("arrowsize", (yyvsp[0].realnum), context);
   }
#line 2288 "yy.tab.c"
    break;

  case 93: /* edgeparam: EP_FOS number  */
#line 406 "src/core/io/pajek-parser.y"
                   {
       igraph_i_pajek_add_numeric_edge_attribute("fontsize", (yyvsp[0].realnum), context);
   }
#line 2296 "yy.tab.c"
    break;

  case 94: /* $@9: %empty  */
#line 411 "src/core/io/pajek-parser.y"
             { context->mode=4; }
#line 2302 "yy.tab.c"
    break;

  case 95: /* epword: EP_A $@9 epwordpar  */
#line 411 "src/core/io/pajek-parser.y"
                                            {
      context->mode=2;
      igraph_i_pajek_add_string_edge_attribute("arrowtype", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
    }
#line 2311 "yy.tab.c"
    break;

  case 96: /* $@10: %empty  */
#line 415 "src/core/io/pajek-parser.y"
           { context->mode=4; }
#line 2317 "yy.tab.c"
    break;

  case 97: /* epword: EP_P $@10 epwordpar  */
#line 415 "src/core/io/pajek-parser.y"
                                          {
      context->mode=2;
      igraph_i_pajek_add_string_edge_attribute("linepattern", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
    }
#line 2326 "yy.tab.c"
    break;

  case 98: /* $@11: %empty  */
#line 419 "src/core/io/pajek-parser.y"
           { context->mode=4; }
#line 2332 "yy.tab.c"
    break;

  case 99: /* epword: EP_L $@11 epwordpar  */
#line 419 "src/core/io/pajek-parser.y"
                                          {
      context->mode=2;
      igraph_i_pajek_add_string_edge_attribute("label", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
    }
#line 2341 "yy.tab.c"
    break;

  case 100: /* $@12: %empty  */
#line 423 "src/core/io/pajek-parser.y"
            { context->mode=4; }
#line 2347 "yy.tab.c"
    break;

  case 101: /* epword: EP_LC $@12 epwordpar  */
#line 423 "src/core/io/pajek-parser.y"
                                           {
      context->mode=2;
      igraph_i_pajek_add_string_edge_attribute("labelcolor", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
    }
#line 2356 "yy.tab.c"
    break;

  case 102: /* $@13: %empty  */
#line 427 "src/core/io/pajek-parser.y"
           { context->mode=4; }
#line 2362 "yy.tab.c"
    break;

  case 103: /* epword: EP_C $@13 epwordpar  */
#line 427 "src/core/io/pajek-parser.y"
                                          {
      context->mode=2;
      igraph_i_pajek_add_string_edge_attribute("color", (yyvsp[0].string).str, (yyvsp[0].string).len, context);
    }
#line 2371 "yy.tab.c"
    break;

  case 104: /* epwordpar: word  */
#line 433 "src/core/io/pajek-parser.y"
                { context->mode=2; (yyval.string)=(yyvsp[0].string); }
#line 2377 "yy.tab.c"
    break;

  case 105: /* arcslist: ARCSLISTLINE NEWLINE arcslistlines  */
#line 435 "src/core/io/pajek-parser.y"
                                             { context->directed=1; }
#line 2383 "yy.tab.c"
    break;

  case 112: /* arclistfrom: longint  */
#line 443 "src/core/io/pajek-parser.y"
                     { context->mode=0; context->actfrom=labs((yyvsp[0].intnum))-1; }
#line 2389 "yy.tab.c"
    break;

  case 113: /* arclistto: longint  */
#line 445 "src/core/io/pajek-parser.y"
                   {
  igraph_vector_push_back(context->vector, context->actfrom);
  igraph_vector_push_back(context->vector, labs((yyvsp[0].intnum))-1);
}
#line 2398 "yy.tab.c"
    break;

  case 114: /* edgeslist: EDGESLISTLINE NEWLINE edgelistlines  */
#line 450 "src/core/io/pajek-parser.y"
                                               { context->directed=0; }
#line 2404 "yy.tab.c"
    break;

  case 121: /* edgelistfrom: longint  */
#line 458 "src/core/io/pajek-parser.y"
                      { context->mode=0; context->actfrom=labs((yyvsp[0].intnum))-1; }
#line 2410 "yy.tab.c"
    break;

  case 122: /* edgelistto: longint  */
#line 460 "src/core/io/pajek-parser.y"
                    {
  igraph_vector_push_back(context->vector, context->actfrom);
  igraph_vector_push_back(context->vector, labs((yyvsp[0].intnum))-1);
}
#line 2419 "yy.tab.c"
    break;

  case 124: /* matrixline: MATRIXLINE  */
#line 469 "src/core/io/pajek-parser.y"
                       { context->actfrom=0;
                         context->actto=0;
                         context->directed=(context->vcount2==0);
                       }
#line 2428 "yy.tab.c"
    break;

  case 127: /* adjmatrixline: adjmatrixnumbers NEWLINE  */
#line 476 "src/core/io/pajek-parser.y"
                                        { context->actfrom++; context->actto=0; }
#line 2434 "yy.tab.c"
    break;

  case 130: /* adjmatrixentry: number  */
#line 480 "src/core/io/pajek-parser.y"
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
#line 2456 "yy.tab.c"
    break;

  case 131: /* longint: NUM  */
#line 500 "src/core/io/pajek-parser.y"
             { (yyval.intnum)=igraph_pajek_get_number(igraph_pajek_yyget_text(scanner),
                                          igraph_pajek_yyget_leng(scanner)); }
#line 2463 "yy.tab.c"
    break;

  case 132: /* number: NUM  */
#line 503 "src/core/io/pajek-parser.y"
             { (yyval.realnum)=igraph_pajek_get_number(igraph_pajek_yyget_text(scanner),
                                          igraph_pajek_yyget_leng(scanner)); }
#line 2470 "yy.tab.c"
    break;

  case 135: /* word: ALNUM  */
#line 508 "src/core/io/pajek-parser.y"
            { (yyval.string).str=igraph_pajek_yyget_text(scanner);
              (yyval.string).len=igraph_pajek_yyget_leng(scanner); }
#line 2477 "yy.tab.c"
    break;

  case 136: /* word: NUM  */
#line 510 "src/core/io/pajek-parser.y"
            { (yyval.string).str=igraph_pajek_yyget_text(scanner);
              (yyval.string).len=igraph_pajek_yyget_leng(scanner); }
#line 2484 "yy.tab.c"
    break;

  case 137: /* word: QSTR  */
#line 512 "src/core/io/pajek-parser.y"
             { (yyval.string).str=igraph_pajek_yyget_text(scanner)+1;
               (yyval.string).len=igraph_pajek_yyget_leng(scanner)-2; }
#line 2491 "yy.tab.c"
    break;


#line 2495 "yy.tab.c"

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
