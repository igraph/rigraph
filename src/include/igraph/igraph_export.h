
#ifndef IGRAPH_EXPORT_H
#define IGRAPH_EXPORT_H

#ifdef IGRAPH_STATIC
#  define IGRAPH_EXPORT
#  define IGRAPH_NO_EXPORT
#else
#  ifndef IGRAPH_EXPORT
#    ifdef igraph_EXPORTS
        /* We are building this library */
#      define IGRAPH_EXPORT 
#    else
        /* We are using this library */
#      define IGRAPH_EXPORT 
#    endif
#  endif

#  ifndef IGRAPH_NO_EXPORT
#    define IGRAPH_NO_EXPORT 
#  endif
#endif

#ifndef IGRAPH_DEPRECATED
#  define IGRAPH_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef IGRAPH_DEPRECATED_EXPORT
#  define IGRAPH_DEPRECATED_EXPORT IGRAPH_EXPORT IGRAPH_DEPRECATED
#endif

#ifndef IGRAPH_DEPRECATED_NO_EXPORT
#  define IGRAPH_DEPRECATED_NO_EXPORT IGRAPH_NO_EXPORT IGRAPH_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef IGRAPH_NO_DEPRECATED
#    define IGRAPH_NO_DEPRECATED
#  endif
#endif

#endif /* IGRAPH_EXPORT_H */
