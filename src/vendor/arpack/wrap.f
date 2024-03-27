c-----------------------------------------------------------------------
c     Wrapper functions, so we don't need to pass logicals from
c     C to Fortran, because that generates LTO warnings, as the compiler
c     apparently cannot match a Fortran logical to a C type.
c-----------------------------------------------------------------------
c
      subroutine igraphxdsortr (which, apply, n, x1, x2)
c
      character*2 which
      integer    apply
      integer    n
      Double precision
     &           x1(0:n-1), x2(0:n-1)
c
      logical applyx
c
      if (apply .eq. 1) then
         applyx = .true.
      else
         applyx = .false.
      end if
c
      call igraphdsortr(which, applyx, n, x1, x2)
c
      return
c
      end
c
c-----------------------------------------------------------------------
c
      subroutine igraphxdsortc (which, apply, n, xreal, ximag, y)
c
      character*2 which
      integer    apply
      integer    n
c
      Double precision
     &           xreal(0:n-1), ximag(0:n-1), y(0:n-1)
c
      logical applyx
c
      if (apply .eq. 1) then
         applyx = .true.
      else
         applyx = .false.
      end if
c
      call igraphdsortc(which, applyx, n, xreal, ximag, y)
c
      return
c
      end
c
c-----------------------------------------------------------------------
c
      subroutine igraphxdneupd (rvec, howmny, select, dr, di, z, ldz,
     &     sigmar, sigmai, workev, bmat, n, which, nev, tol,
     &     resid, ncv, v, ldv, iparam, ipntr, workd,
     &     workl, lworkl, info)
c
      character  bmat, howmny, which*2
      integer    rvec
      integer    info, ldz, ldv, lworkl, n, ncv, nev
      Double precision
     &           sigmar, sigmai, tol
c
      integer    iparam(11), ipntr(14)
      integer    select(ncv)
      Double precision
     &           dr(nev+1), di(nev+1), resid(n), v(ldv,ncv), z(ldz,*),
     &           workd(3*n), workl(lworkl), workev(3*ncv)
c
      logical    rvecx
      integer    i
      logical    selectx(ncv)
c
      if (rvec .eq. 1) then
         rvecx = .true.
      else
         rvecx = .false.
      end if
c
      i = 1
 100  if (i .gt. ncv) then
         go to 110
      end if
      if (select(i) .eq. 1) then
         selectx(i) = .true.
      else
         selectx(i) = .false.
      end if
      i = i + 1
      go to 100
 110  continue
c
      call igraphdneupd(rvecx, howmny, selectx, dr, di, z, ldz,
     &     sigmar, sigmai, workev, bmat, n, which, nev, tol,
     &     resid, ncv, v, ldv, iparam, ipntr, workd,
     &     workl, lworkl, info)
c
      return
c
      end
c
c-----------------------------------------------------------------------
c
      subroutine igraphxdseupd (rvec, howmny, select, d, z, ldz,
     &     sigma, bmat, n, which, nev, tol, resid, ncv, v, ldv, iparam,
     &     ipntr, workd, workl, lworkl, info )
c
      character  bmat, howmny, which*2
      integer    rvec, select(ncv)
      integer    info, ldz, ldv, lworkl, n, ncv, nev
      Double precision
     &           sigma, tol
c
      integer    iparam(7), ipntr(11)
      Double precision
     &           d(nev), resid(n), v(ldv,ncv), z(ldz, nev),
     &           workd(2*n), workl(lworkl)
c
      logical    rvecx
      integer    i
      logical    selectx(ncv)
c
      if (rvec .eq. 1) then
         rvecx = .true.
      else
         rvecx = .false.
      end if
c
      i = 1
 100  if (i .gt. ncv) then
         go to 110
      end if
      if (select(i) .eq. 1) then
         selectx(i) = .true.
      else
         selectx(i) = .false.
      end if
      i = i + 1
      go to 100
 110  continue
c
      call igraphdseupd(rvecx, howmny, selectx, d, z, ldz,
     &     sigma, bmat, n, which, nev, tol, resid, ncv, v, ldv, iparam,
     &     ipntr, workd, workl, lworkl, info )
c
      return
c
      end
