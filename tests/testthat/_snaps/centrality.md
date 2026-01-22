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

# eigen_centrality() deprecated scale argument

    Code
      invisible(eigen_centrality(g, scale = TRUE))
    Condition
      Warning:
      The `scale` argument of `eigen_centrality()` is deprecated as of igraph 2.1.1.
      i eigen_centrality() will always behave as if scale=TRUE were used.

---

    Code
      invisible(eigen_centrality(g, scale = FALSE))
    Condition
      Warning:
      The `scale` argument of `eigen_centrality()` always as if TRUE as of igraph 2.1.1.
      i Normalization is always performed

# arpack() errors well

    Code
      arpack(f, options = list(nev = 2, ncv = 4), sym = TRUE)
    Condition
      Error in `arpack()`:
      ! ARPACK error. N must be positive
      Source: linalg/arpack.c:xx

---

    Code
      arpack(f, options = list(unknown_thing1 = 2, unknown_thing2 = 4), sym = TRUE)
    Condition
      Error in `arpack()`:
      ! Can't use unkown ARPACK options: unknown_thing1, unknown_thing2

