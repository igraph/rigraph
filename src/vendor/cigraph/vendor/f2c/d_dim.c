#include "f2c.h"
#ifdef __cplusplus
extern "C" {
#endif

#ifdef KR_headers
double d_dim(a,b) doublereal *a, *b;
#else
double d_dim(doublereal *a, doublereal *b)
#endif
{
return( *a > *b ? *a - *b : 0);
}
#ifdef __cplusplus
}
#endif
