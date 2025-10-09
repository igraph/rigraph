# `authority_score()` works

    Code
      s3 <- authority_score(g2, options = arpack_defaults)$vector
    Condition
      Warning:
      `authority_score()` was deprecated in igraph 2.1.0.
      i Please use `hits_scores()` instead.
      Warning:
      arpack_defaults was deprecated in igraph 1.6.0.
      i Please use `arpack_defaults()` instead.
      i So the function arpack_defaults(), not an object called arpack_defaults.
      Warning:
      The `scale` argument of `hits_scores()` is deprecated as of igraph 2.1.5.
      i The function always behaves as if `scale = TRUE`. The argument will be removed in the future.

# `hub_score()` works

    Code
      s3 <- hub_score(g2, options = arpack_defaults)$vector
    Condition
      Warning:
      `hub_score()` was deprecated in igraph 2.0.3.
      i Please use `hits_scores()` instead.
      Warning:
      arpack_defaults was deprecated in igraph 1.6.0.
      i Please use `arpack_defaults()` instead.
      i So the function arpack_defaults(), not an object called arpack_defaults.
      Warning:
      The `scale` argument of `hits_scores()` is deprecated as of igraph 2.1.5.
      i The function always behaves as if `scale = TRUE`. The argument will be removed in the future.

# arpack() errors well

    Code
      arpack(f, options = list(nev = 2, ncv = 4), sym = TRUE)
    Condition
      Error in `arpack()`:
      ! At vendor/cigraph/src/linalg/arpack.c:1025 : N must be positive, ARPACK error

---

    Code
      arpack(f, options = list(unknown_thing1 = 2, unknown_thing2 = 4), sym = TRUE)
    Condition
      Error in `arpack()`:
      ! Can't use unkown ARPACK options: unknown_thing1, unknown_thing2

