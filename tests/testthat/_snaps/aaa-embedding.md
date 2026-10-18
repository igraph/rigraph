# adjacency_spectral_embedding_impl basic

    Code
      adjacency_spectral_embedding_impl(graph = g, no = 2)
    Output
      $X
                [,1]       [,2]
      [1,] 0.6718598 -0.4487712
      [2,] 1.1328501  0.5323058
      [3,] 0.6718598 -0.4487712
      
      $Y
                [,1]       [,2]
      [1,] 0.6718598 -0.4487712
      [2,] 1.1328501  0.5323058
      [3,] 0.6718598 -0.4487712
      
      $D
      [1]  2.1861407 -0.6861407
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LM"
      
      $options$nev
      [1] 2
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 3
      
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
      [1] 2
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 2
      
      

---

    Code
      adjacency_spectral_embedding_impl(graph = g, no = 2, weights = c(1, 2), which = "la",
      scaled = FALSE, cvec = c(1, 2, 3), options = list(maxiter = 10))
    Output
      $X
                [,1]       [,2]
      [1,] 0.1720265 -0.7864357
      [2,] 0.6311790 -0.3743620
      [3,] 0.7563200  0.4912963
      
      $Y
                [,1]       [,2]
      [1,] 0.1720265 -0.7864357
      [2,] 0.6311790 -0.3743620
      [3,] 0.7563200  0.4912963
      
      $D
      [1] 4.669079 1.476024
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 2
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 3
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 10
      
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
      [1] 2
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 2
      
      

# adjacency_spectral_embedding_impl errors

    Code
      adjacency_spectral_embedding_impl(graph = NULL, no = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# laplacian_spectral_embedding_impl basic

    Code
      laplacian_spectral_embedding_impl(graph = g, no = 2)
    Output
      $X
                 [,1]       [,2]
      [1,] -0.7071068 -0.7071068
      [2,]  1.4142136  0.0000000
      [3,] -0.7071068  0.7071068
      
      $Y
                 [,1]       [,2]
      [1,] -0.7071068 -0.7071068
      [2,]  1.4142136  0.0000000
      [3,] -0.7071068  0.7071068
      
      $D
      [1] 3 1
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LM"
      
      $options$nev
      [1] 2
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 3
      
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
      [1] 2
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 3
      
      

# laplacian_spectral_embedding_impl errors

    Code
      laplacian_spectral_embedding_impl(graph = NULL, no = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# dim_select_impl basic

    Code
      dim_select_impl(sv = c(1, 2, 3))
    Output
      [1] 1

# dim_select_impl errors

    Code
      dim_select_impl(sv = NULL)
    Condition
      Error in `dim_select_impl()`:
      ! Need at least one singular value for dimensionality selection. Invalid value
      Source: <file>:<line>

