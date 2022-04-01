AC_INIT(igraph, 1.3.0, ntamas@gmail.com)
AC_CONFIG_SRCDIR(src/rinterface.c)
AC_CONFIG_HEADERS(src/config.h)

: ${R_HOME=`R RHOME`}
if test -z "${R_HOME}"; then
   echo "could not determine R_HOME"
   exit 1
fi
CC=`"${R_HOME}/bin/R" CMD config CC`
CXX=`"${R_HOME}/bin/R" CMD config CXX11`
if test -z "$CXX"; then
  AC_MSG_ERROR([No C++11 compiler is available])
fi
CXX11STD=`"${R_HOME}/bin/R" CMD config CXX11STD`
CXX="${CXX} ${CXX11STD}"
FC=`"${R_HOME}/bin/R" CMD config FC`
CFLAGS=`"${R_HOME}/bin/R" CMD config CFLAGS`
CXXFLAGS=`"${R_HOME}/bin/R" CMD config CXX11FLAGS`
CPPFLAGS=`"${R_HOME}/bin/R" CMD config CPPFLAGS`
FCFLAGS=`"${R_HOME}/bin/R" CMD config FCFLAGS`
FLIBS=`"${R_HOME}/bin/R" CMD config FLIBS`
LDFLAGS=`"${R_HOME}/bin/R" CMD config LDFLAGS`

AC_LANG(C)
AC_PROG_CC

AC_LANG(C++)
AC_PROG_CXX

# Fortran compiler, we need to check if it is the GNU compiler
AC_PROG_FC
if test "x$ac_cv_fc_compiler_gnu" = xyes; then
  AC_DEFINE([HAVE_GFORTRAN], [1], [Define to 1 if using the GNU Fortran compiler])
fi

LIBS_SAVE=$LIBS
LIBS="$LIBS -lm"
AC_CHECK_FUNCS([expm1 fmin finite log2 log1p rint rintf round stpcpy strcasecmp _stricmp strdup])
AC_CHECK_FUNCS(isfinite,
  [AC_DEFINE(HAVE_ISFINITE, 1)],
  [AC_LINK_IFELSE(
    [AC_LANG_PROGRAM(
	  [[#include <math.h>]],
	  [[double f = 0.0; isfinite(f)]])],
	[AC_DEFINE(HAVE_ISFINITE, 1)],
	[AC_MSG_FAILURE([isfinite() not available])]
  )]
)
LIBS=$LIBS_SAVE

AC_CHECK_HEADER([sys/times.h],
      [AC_DEFINE([HAVE_TIMES_H], [1], [Define to 1 if you have the sys/times.h header])])

AC_CHECK_HEADERS([ \
		   net/if.h \
		   netinet/in.h \
		   net/if_dl.h \
		   sys/sockio.h \
		   sys/un.h \
		   sys/socket.h \
		   sys/ioctl.h \
		   sys/time.h \
		   sys/file.h \
		])

AC_CHECK_MEMBER([struct sockaddr.sa_len],
		AC_DEFINE_UNQUOTED([HAVE_SA_LEN], [1], [Define if struct sockaddr contains sa_len]), [],
	[#include <sys/types.h>
	 #include <sys/socket.h>])

graphml_support=yes
AC_ARG_ENABLE(graphml,
              AS_HELP_STRING([--disable-graphml], [Disable support for GraphML format]),
              [graphml_support=$enableval], [graphml_support=yes])

HAVE_LIBXML=0
if test $graphml_support = yes; then
  AC_PATH_PROG([XML2CONFIG], [xml2-config], [none])
  if test "$XML2CONFIG" = "none"; then
    graphml_support=no
  else
    # xml2-config puts only preprocessor flags in --cflags (i.e. -D and -I) so
    # we can put them in XML2_CPPFLAGS. This might not be true for other
    # libraries, though.
    XML2_CPPFLAGS=`$XML2CONFIG --cflags`
    XML2_LIBS=`$XML2CONFIG --libs`
    OLDLIBS=${LIBS}
    LIBS=${XML2_LIBS}
    AC_CHECK_LIB([xml2], [xmlSAXUserParseFile], [
      OLDCPPFLAGS=${CPPFLAGS}
      CPPFLAGS=${XML2_CPPFLAGS}
      AC_CHECK_HEADER([libxml/parser.h], [
        HAVE_LIBXML=1
        AC_DEFINE([HAVE_LIBXML], [1], [Define to 1 if you have the libxml2 libraries installed])
      ], [
        graphml_support=no
      ])
      CPPFLAGS=${OLDCPPFLAGS}
    ], [
      graphml_support=no
    ])
    LIBS=${OLDLIBS}
  fi
fi
AC_SUBST(HAVE_LIBXML)
AC_SUBST(XML2_LIBS)
AC_SUBST(XML2_CPPFLAGS)

AC_DEFINE([INTERNAL_GMP], [1], [Define to 1 if you use the vendored mini-GMP library])

AC_LANG_PUSH([C++])
HAVE_GMP=0
INTERNAL_GMP=1
GMP_LIBS=""
gmp_support=no
AC_CHECK_LIB([gmp], [__gmpz_add], [
  AC_CHECK_HEADER([gmp.h], [
    HAVE_GMP=1
    INTERNAL_GMP=0
    AC_DEFINE([HAVE_GMP], [1], [Define to 1 if you have the GMP library])
    gmp_support=yes
    GMP_LIBS="-lgmp"
  ])
])
AC_SUBST(HAVE_GMP)
AC_SUBST(INTERNAL_GMP)
AC_SUBST(GMP_LIBS)
AC_LANG_POP([C++])

HAVE_GLPK=0
GLPK_LIBS=""
glpk_support=no
AC_ARG_ENABLE(glpk, AS_HELP_STRING([--disable-glpk], [Compile without the GLPK library]))
if test "x$enable_gmp" != "xno"; then
  AC_CHECK_LIB([glpk], [glp_read_mps], [
    AC_CHECK_HEADER([glpk.h], [
      AC_EGREP_CPP(yes, [
        #include <glpk.h>
        #if GLP_MAJOR_VERSION > 4 || (GLP_MAJOR_VERSION == 4 && GLP_MINOR_VERSION >= 57)
          yes
        #endif
      ], [
        HAVE_GLPK=1
        AC_DEFINE([HAVE_GLPK], [1], [Define to 1 if you have the GLPK library])
        glpk_support=yes
        GLPK_LIBS="-lglpk"
      ])
    ])
  ])
fi
AC_SUBST(HAVE_GLPK)
AC_SUBST(GLPK_LIBS)

AC_DEFINE(IGRAPH_THREAD_LOCAL, [], [We don't care about thread-local storage in R])

AC_CONFIG_FILES([src/Makevars.tmp:src/Makevars.in], [
    if test -f src/Makevars && cmp -s src/Makevars.tmp src/Makevars; then
      AC_MSG_NOTICE([creating src/Makevars])
      AC_MSG_NOTICE([src/Makevars is unchanged])
      rm src/Makevars.tmp
    else
      AC_MSG_NOTICE([creating src/Makevars])
      mv src/Makevars.tmp src/Makevars
    fi
  ]
)

AC_OUTPUT

echo ""
echo "*** Compiler settings used:"
echo "    CC=${CC}"
echo "    LD=${LD}"
echo "    CFLAGS=${CFLAGS}"
echo "    CPPFLAGS=${CPPFLAGS}"
echo "    CXX=${CXX}"
echo "    CXXFLAGS=${CXXFLAGS}"
echo "    LDFLAGS=${LDFLAGS}"
echo "    LIBS=${LIBS}"

