/*  -- translated by f2c (version 20240504).
   You must link the resulting object file with libf2c:
	on Microsoft Windows system, link with libf2c.lib;
	on Linux or Unix systems, link with .../path/to/libf2c.a -lm
	or, if you install libf2c.a in a standard place, with -lf2c -lm
	-- in that order, at the end of the command line, as in
		cc *.o -lf2c -lm
	Source for libf2c is in /netlib/f2c/libf2c.zip, e.g.,

		http://www.netlib.org/f2c/libf2c.zip
*/

#include "f2c.h"

/* > \brief \b DCOPY   

    =========== DOCUMENTATION ===========   

   Online html documentation available at   
              http://www.netlib.org/lapack/explore-html/   

    Definition:   
    ===========   

         SUBROUTINE DCOPY(N,DX,INCX,DY,INCY)   

         INTEGER INCX,INCY,N   
         DOUBLE PRECISION DX(*),DY(*)   


   > \par Purpose:   
    =============   
   >   
   > \verbatim   
   >   
   >    DCOPY copies a vector, x, to a vector, y.   
   >    uses unrolled loops for increments equal to 1.   
   > \endverbatim   

    Arguments:   
    ==========   

   > \param[in] N   
   > \verbatim   
   >          N is INTEGER   
   >         number of elements in input vector(s)   
   > \endverbatim   
   >   
   > \param[in] DX   
   > \verbatim   
   >          DX is DOUBLE PRECISION array, dimension ( 1 + ( N - 1 )*abs( INCX ) )   
   > \endverbatim   
   >   
   > \param[in] INCX   
   > \verbatim   
   >          INCX is INTEGER   
   >         storage spacing between elements of DX   
   > \endverbatim   
   >   
   > \param[out] DY   
   > \verbatim   
   >          DY is DOUBLE PRECISION array, dimension ( 1 + ( N - 1 )*abs( INCY ) )   
   > \endverbatim   
   >   
   > \param[in] INCY   
   > \verbatim   
   >          INCY is INTEGER   
   >         storage spacing between elements of DY   
   > \endverbatim   

    Authors:   
    ========   

   > \author Univ. of Tennessee   
   > \author Univ. of California Berkeley   
   > \author Univ. of Colorado Denver   
   > \author NAG Ltd.   

   > \ingroup copy   

   > \par Further Details:   
    =====================   
   >   
   > \verbatim   
   >   
   >     jack dongarra, linpack, 3/11/78.   
   >     modified 12/3/93, array(1) declarations changed to array(*)   
   > \endverbatim   
   >   
    =====================================================================   
   Subroutine */ int igraphdcopy_(integer *n, doublereal *dx, integer *incx, 
	doublereal *dy, integer *incy)
{
    /* System generated locals */
    integer i__1;

    /* Local variables */
    integer i__, m, ix, iy, mp1;


/*  -- Reference BLAS level1 routine --   
    -- Reference BLAS is a software package provided by Univ. of Tennessee,    --   
    -- Univ. of California Berkeley, Univ. of Colorado Denver and NAG Ltd..--   


    =====================================================================   

       Parameter adjustments */
    --dy;
    --dx;

    /* Function Body */
    if (*n <= 0) {
	return 0;
    }
    if (*incx == 1 && *incy == 1) {

/*        code for both increments equal to 1   


          clean-up loop */

	m = *n % 7;
	if (m != 0) {
	    i__1 = m;
	    for (i__ = 1; i__ <= i__1; ++i__) {
		dy[i__] = dx[i__];
	    }
	    if (*n < 7) {
		return 0;
	    }
	}
	mp1 = m + 1;
	i__1 = *n;
	for (i__ = mp1; i__ <= i__1; i__ += 7) {
	    dy[i__] = dx[i__];
	    dy[i__ + 1] = dx[i__ + 1];
	    dy[i__ + 2] = dx[i__ + 2];
	    dy[i__ + 3] = dx[i__ + 3];
	    dy[i__ + 4] = dx[i__ + 4];
	    dy[i__ + 5] = dx[i__ + 5];
	    dy[i__ + 6] = dx[i__ + 6];
	}
    } else {

/*        code for unequal increments or equal increments   
            not equal to 1 */

	ix = 1;
	iy = 1;
	if (*incx < 0) {
	    ix = (-(*n) + 1) * *incx + 1;
	}
	if (*incy < 0) {
	    iy = (-(*n) + 1) * *incy + 1;
	}
	i__1 = *n;
	for (i__ = 1; i__ <= i__1; ++i__) {
	    dy[iy] = dx[ix];
	    ix += *incx;
	    iy += *incy;
	}
    }
    return 0;

/*     End of DCOPY */

} /* igraphdcopy_ */

