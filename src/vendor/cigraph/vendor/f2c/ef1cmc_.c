/* EFL support routine to compare two character strings */

#include "f2c.h"
#ifdef __cplusplus
extern "C" {
#endif

#ifdef KR_headers
extern integer s_cmp();
integer ef1cmc_(a, la, b, lb) ftnint *a, *b; ftnlen *la, *lb;
#else
extern integer s_cmp(char*,char*,ftnlen,ftnlen);
integer ef1cmc_(ftnint *a, ftnlen *la, ftnint *b, ftnlen *lb)
#endif
{
return( s_cmp( (char *)a, (char *)b, *la, *lb) );
}
#ifdef __cplusplus
}
#endif
