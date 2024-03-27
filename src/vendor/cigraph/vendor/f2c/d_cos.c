#include "f2c.h"

#ifdef KR_headers
double cos();
double d_cos(x) doublereal *x;
#else
#undef abs
#include "math.h"
#ifdef __cplusplus
extern "C" {
#endif
double d_cos(doublereal *x)
#endif
{
return( cos(*x) );
}
#ifdef __cplusplus
}
#endif
