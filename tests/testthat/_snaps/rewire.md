# keeping_degseq(niter = ) is deprecated but still works

    Code
      res <- keeping_degseq(niter = 20)
    Condition
      Warning:
      The `niter` argument of `keeping_degseq()` is deprecated as of igraph 3.0.0.
      i Please use the `n_iter` argument instead.

---

    Code
      keeping_degseq(n_iter = 20, niter = 10)
    Condition
      Error in `keeping_degseq()`:
      ! Argument `n_iter` of `keeping_degseq()` was supplied more than once.
      i It was also supplied via its legacy name `niter`.

