#ifndef IGRAPH_PRIVATE_CONFIG_H
#define IGRAPH_PRIVATE_CONFIG_H

#include "igraph_config.h"

#define HAVE_STRCASECMP 1
#define HAVE_STRNCASECMP 1
/* #undef HAVE__STRICMP */
/* #undef HAVE__STRNICMP */
/* #undef HAVE_STRDUP */
/* #undef HAVE_STRNDUP */
// #define HAVE_USELOCALE 1
/* #undef HAVE_XLOCALE */
/* #undef HAVE__CONFIGTHREADLOCALE */

#define HAVE_BUILTIN_OVERFLOW 1

/* #undef HAVE__UMUL128 */
/* #undef HAVE___UMULH */
#if defined(__GNUC__) && defined(__SIZEOF_INT128__)
#  define HAVE___UINT128_T 1
#endif

#define HAVE_GLPK 1
#define HAVE_LIBXML 1

/* #undef INTERNAL_BLAS */
/* #undef INTERNAL_LAPACK */
/* #undef INTERNAL_ARPACK */

#define INTERNAL_GMP 1

#define IGRAPH_F77_SAVE
#define IGRAPH_THREAD_LOCAL

#endif
