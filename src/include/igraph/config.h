#ifndef IGRAPH_PRIVATE_CONFIG_H
#define IGRAPH_PRIVATE_CONFIG_H

#include "igraph_config.h"

#define HAVE_STRCASECMP 1
#define HAVE_STRNCASECMP 1
/* #undef HAVE__STRICMP */
/* #undef HAVE__STRNICMP */
#define HAVE_STRDUP 1
#define HAVE_STRNDUP 1
#define HAVE_USELOCALE 1
/* #undef HAVE_XLOCALE */
/* #undef HAVE__CONFIGTHREADLOCALE */

#define HAVE_BUILTIN_OVERFLOW 1

/* #undef HAVE__UMUL128 */
/* #undef HAVE___UMULH */
#define HAVE___UINT128_T 1

#define HAVE_GLPK 1
#define HAVE_LIBXML 1

/* #undef INTERNAL_BLAS */
/* #undef INTERNAL_LAPACK */
/* #undef INTERNAL_ARPACK */
/* #undef INTERNAL_GMP */

#define IGRAPH_F77_SAVE static __thread
#define IGRAPH_THREAD_LOCAL __thread

#endif
