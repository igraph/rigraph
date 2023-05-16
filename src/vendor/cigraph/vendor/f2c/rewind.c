#include "f2c.h"
#include "fio.h"
#ifdef __cplusplus
extern "C" {
#endif
#ifdef KR_headers
integer f_rew(a) alist *a;
#else
integer f_rew(alist *a)
#endif
{
	unit *b;
	if(a->aunit>=MXUNIT || a->aunit<0)
		err(a->aerr,101,"rewind");
	b = &f__units[a->aunit];
	if(b->ufd == NULL || b->uwrt == 3)
		return(0);
	if(!b->useek)
		err(a->aerr,106,"rewind")
	if(b->uwrt) {
		(void) t_runc(a);
		b->uwrt = 3;
		}
	rewind(b->ufd);
	b->uend=0;
	return(0);
}
#ifdef __cplusplus
}
#endif
