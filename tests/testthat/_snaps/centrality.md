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
      eigen_centrality(g, scale = TRUE)
    Condition
      Warning:
      The `scale` argument of `eigen_centrality()` is deprecated as of igraph 2.1.1.
      i eigen_centrality() will always behave as if scale=TRUE were used.
    Output
      $vector
       [1] 1 1 1 1 1 1 1 1 1 1
      
      $value
      [1] 2
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 10
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 8
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 6
      
      

---

    Code
      invisible(eigen_centrality(g, scale = FALSE))
    Condition
      Warning:
      The `scale` argument of `eigen_centrality()` always as if TRUE as of igraph 2.1.1.
      i Normalization is always performed

