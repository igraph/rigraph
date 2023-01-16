#include "cs.h"
/* 1-norm of a sparse matrix = max (sum (abs (A))), largest column sum */
double cs_norm (const cs *A)
{
    CS_INT p, j, n, *Ap ;
    CS_ENTRY *Ax ;
    double norm = 0, s ;
    if (!CS_CSC (A) || !A->x) return (-1) ;             /* check inputs */
    n = A->n ; Ap = A->p ; Ax = A->x ;
    for (j = 0 ; j < n ; j++)
    {
        for (s = 0, p = Ap [j] ; p < Ap [j+1] ; p++) s += CS_ABS (Ax [p]) ;
        norm = CS_MAX (norm, s) ;
    }
    return (norm) ;
}
