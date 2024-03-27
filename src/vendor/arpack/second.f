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
*  This version gets the time from the system function ETIME.
*
*     .. Local Scalars ..
      REAL               T1
*     ..
*     .. Local Arrays ..
      REAL               TARRAY( 2 )
*     ..
*     .. External Functions ..
      REAL               ETIME
*     ..
*     .. Executable Statements ..
*
*     ======================================
*     This has been changed by the CRAN team.
*     Needs to be back-ported to igrapch/C
*     ======================================
*
      T = 0.0
      RETURN
*
*     ======================================
*     This has been changed by the CRAN team
*     Needs to be back-ported to igrapch/C
*     ======================================
*
*
*     End of SECOND
*
      END
