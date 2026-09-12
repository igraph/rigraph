      SUBROUTINE IGRAPHARSCND( T )
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
*  IGRAPHARSCND returns the user time for a process in seconds.
*  This version was modified by the igraph team to always return 0,
*  since igraph does not require ARPACK's timing functionality.
*
      T = 0.0
      RETURN
*
*
*     End of IGRAPHARSCND
*
      END
