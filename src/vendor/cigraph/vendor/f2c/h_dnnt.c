#include "f2c.h"

#ifdef KR_headers
double floor();
shortint h_dnnt(x) doublereal *x;
#else
#undef abs
#include "math.h"
#ifdef __cplusplus
extern "C" {
#endif
shortint h_dnnt(doublereal *x)
#endif
{
return (shortint)(*x >= 0. ? floor(*x + .5) : -floor(.5 - *x));
}
#ifdef __cplusplus
}
#endif
