      SUBROUTINE IGRAPHSECOND( T )
*
      REAL       T
*
*  -- LAPACK auxiliary routine (preliminary version) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     July 26, 1991
*
*  Purpose
*  =======
*
*  SECOND returns the user time for a process in igraphseconds.
*  This version was changed in igraph to always return zero, since
*  we do not need the timings. The original version used the
*  non-standard ETIME, which is unsupported by flang.
*
      T  = 0.0e+0

      RETURN
*
*     End of SECOND
*
      END
