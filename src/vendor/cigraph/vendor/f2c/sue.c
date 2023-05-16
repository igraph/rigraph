#include "f2c.h"
#include "fio.h"
#ifdef __cplusplus
extern "C" {
#endif
extern uiolen f__reclen;
OFF_T f__recloc;

 int
#ifdef KR_headers
c_sue(a) cilist *a;
#else
c_sue(cilist *a)
#endif
{
	f__external=f__sequential=1;
	f__formatted=0;
	f__curunit = &f__units[a->ciunit];
	if(a->ciunit >= MXUNIT || a->ciunit < 0)
		err(a->cierr,101,"startio");
	f__elist=a;
	if(f__curunit->ufd==NULL && fk_open(SEQ,UNF,a->ciunit))
		err(a->cierr,114,"sue");
	f__cf=f__curunit->ufd;
	if(f__curunit->ufmt) err(a->cierr,103,"sue")
	if(!f__curunit->useek) err(a->cierr,103,"sue")
	return(0);
}
#ifdef KR_headers
integer s_rsue(a) cilist *a;
#else
integer s_rsue(cilist *a)
#endif
{
	int n;
	if(!f__init) f_init();
	f__reading=1;
	if(n=c_sue(a)) return(n);
	f__recpos=0;
	if(f__curunit->uwrt && f__nowreading(f__curunit))
		err(a->cierr, errno, "read start");
	if(fread((char *)&f__reclen,sizeof(uiolen),1,f__cf)
		!= 1)
	{	if(feof(f__cf))
		{	f__curunit->uend = 1;
			err(a->ciend, EOF, "start");
		}
		clearerr(f__cf);
		err(a->cierr, errno, "start");
	}
	return(0);
}
#ifdef KR_headers
integer s_wsue(a) cilist *a;
#else
integer s_wsue(cilist *a)
#endif
{
	int n;
	if(!f__init) f_init();
	if(n=c_sue(a)) return(n);
	f__reading=0;
	f__reclen=0;
	if(f__curunit->uwrt != 1 && f__nowwriting(f__curunit))
		err(a->cierr, errno, "write start");
	f__recloc=FTELL(f__cf);
	FSEEK(f__cf,(OFF_T)sizeof(uiolen),SEEK_CUR);
	return(0);
}
integer e_wsue(Void)
{	OFF_T loc;
	fwrite((char *)&f__reclen,sizeof(uiolen),1,f__cf);
#ifdef ALWAYS_FLUSH
	if (fflush(f__cf))
		err(f__elist->cierr, errno, "write end");
#endif
	loc=FTELL(f__cf);
	FSEEK(f__cf,f__recloc,SEEK_SET);
	fwrite((char *)&f__reclen,sizeof(uiolen),1,f__cf);
	FSEEK(f__cf,loc,SEEK_SET);
	return(0);
}
integer e_rsue(Void)
{
	FSEEK(f__cf,(OFF_T)(f__reclen-f__recpos+sizeof(uiolen)),SEEK_CUR);
	return(0);
}
#ifdef __cplusplus
}
#endif
