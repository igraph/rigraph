# `authority_score()` works

    Code
      s3 <- authority_score(g2, options = arpack_defaults)$vector
    Condition
      Warning:
      `authority_score()` was deprecated in igraph 2.0.4.
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

