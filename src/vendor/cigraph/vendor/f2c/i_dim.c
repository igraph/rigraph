#include "f2c.h"
#ifdef __cplusplus
extern "C" {
#endif

#ifdef KR_headers
integer i_dim(a,b) integer *a, *b;
#else
integer i_dim(integer *a, integer *b)
#endif
{
return( *a > *b ? *a - *b : 0);
}
#ifdef __cplusplus
}
#endif
