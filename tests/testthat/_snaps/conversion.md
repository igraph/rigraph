# as.directed() deprecation

    Code
      is_directed(as.directed(g, mode = "mutual"))
    Condition
      Warning:
      `as.directed()` was deprecated in igraph 2.1.0.
      i Please use `as_directed()` instead.
    Output
      [1] TRUE

# as.undirected() deprecation

    Code
      is_directed(as.undirected(g, mode = "collapse"))
    Condition
      Warning:
      `as.undirected()` was deprecated in igraph 2.1.0.
      i Please use `as_undirected()` instead.
    Output
      [1] FALSE

# as_adjacency_matrix() errors well -- sparse

    Code
      as_adjacency_matrix(g, attr = "bla")
    Condition
      Error in `as_adjacency_matrix()`:
      ! No such edge attribute

---

    Code
      as_adjacency_matrix(g, attr = "bla")
    Condition
      Error in `as_adjacency_matrix()`:
      ! Matrices must be either numeric or logical, and the edge attribute is not

# as_adjacency_matrix() errors well -- dense

    Code
      as_adjacency_matrix(g, attr = "bla", sparse = FALSE)
    Condition
      Error in `as_adjacency_matrix()`:
      ! No such edge attribute

---

    Code
      as_adjacency_matrix(g, attr = "bla", sparse = FALSE)
    Condition
      Error in `as_adjacency_matrix()`:
      ! Matrices must be either numeric or logical, and the edge attribute is not

# as_long_data_frame() works correctly with and without names

    Code
      ring <- make_ring(3)
      as_long_data_frame(ring)
    Output
        from to
      1    1  2
      2    2  3
      3    1  3
    Code
      V(ring)$name <- letters[1:3]
      as_long_data_frame(ring)
    Output
        from to from_name to_name
      1    1  2         a       b
      2    2  3         b       c
      3    1  3         a       c
    Code
      V(ring)$score <- LETTERS[1:3]
      as_long_data_frame(ring)
    Output
        from to from_name from_score to_name to_score
      1    1  2         a          A       b        B
      2    2  3         b          B       c        C
      3    1  3         a          A       c        C
    Code
      E(ring)$info <- 3:1
      as_long_data_frame(ring)
    Output
        from to info from_name from_score to_name to_score
      1    1  2    3         a          A       b        B
      2    2  3    2         b          B       c        C
      3    1  3    1         a          A       c        C

# graph_from_edgelist errors for NAs

    Code
      graph_from_edgelist(A)
    Condition
      Error in `graph_from_edgelist()`:
      ! Cannot create a graph object because the edgelist contains NAs.

# as_adjacency_matrix() comprehensive snapshot tests

    Code
      as_adjacency_matrix(g_dir_unwt, sparse = TRUE)
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
                
      [1,] . 1 .
      [2,] . 1 1
      [3,] 1 . .

---

    Code
      as_adjacency_matrix(g_dir_unwt, type = "upper", sparse = TRUE)
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
                
      [1,] . 1 .
      [2,] . 1 1
      [3,] 1 . .

---

    Code
      as_adjacency_matrix(g_dir_unwt, type = "lower", sparse = TRUE)
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
                
      [1,] . 1 .
      [2,] . 1 1
      [3,] 1 . .

---

    Code
      as_adjacency_matrix(g_dir_unwt, sparse = FALSE)
    Output
           [,1] [,2] [,3]
      [1,]    0    1    0
      [2,]    0    1    1
      [3,]    1    0    0

---

    Code
      as_adjacency_matrix(g_dir_unwt, type = "upper", sparse = FALSE)
    Output
           [,1] [,2] [,3]
      [1,]    0    1    0
      [2,]    0    1    1
      [3,]    1    0    0

---

    Code
      as_adjacency_matrix(g_dir_unwt, type = "lower", sparse = FALSE)
    Output
           [,1] [,2] [,3]
      [1,]    0    1    0
      [2,]    0    1    1
      [3,]    1    0    0

---

    Code
      as_adjacency_matrix(g_dir_wt, attr = "weight", sparse = TRUE)
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
                      
      [1,] .   1.5 .  
      [2,] .   0.5 2.3
      [3,] 3.7 .   .  

---

    Code
      as_adjacency_matrix(g_dir_wt, attr = "weight", type = "upper", sparse = TRUE)
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
                      
      [1,] .   1.5 .  
      [2,] .   0.5 2.3
      [3,] 3.7 .   .  

---

    Code
      as_adjacency_matrix(g_dir_wt, attr = "weight", type = "lower", sparse = TRUE)
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
                      
      [1,] .   1.5 .  
      [2,] .   0.5 2.3
      [3,] 3.7 .   .  

---

    Code
      as_adjacency_matrix(g_dir_wt, attr = "weight", sparse = FALSE)
    Output
           [,1] [,2] [,3]
      [1,]  0.0  1.5  0.0
      [2,]  0.0  0.5  2.3
      [3,]  3.7  0.0  0.0

---

    Code
      as_adjacency_matrix(g_dir_wt, attr = "weight", type = "upper", sparse = FALSE)
    Output
           [,1] [,2] [,3]
      [1,]  0.0  1.5  0.0
      [2,]  0.0  0.5  2.3
      [3,]  3.7  0.0  0.0

---

    Code
      as_adjacency_matrix(g_dir_wt, attr = "weight", type = "lower", sparse = FALSE)
    Output
           [,1] [,2] [,3]
      [1,]  0.0  1.5  0.0
      [2,]  0.0  0.5  2.3
      [3,]  3.7  0.0  0.0

---

    Code
      as_adjacency_matrix(g_undir_unwt, sparse = TRUE)
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
                
      [1,] . 1 1
      [2,] 1 . 1
      [3,] 1 1 .

---

    Code
      as_adjacency_matrix(g_undir_unwt, type = "upper", sparse = TRUE)
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
                
      [1,] . 1 1
      [2,] . . 1
      [3,] . . .

---

    Code
      as_adjacency_matrix(g_undir_unwt, type = "lower", sparse = TRUE)
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
                
      [1,] . . .
      [2,] 1 . .
      [3,] 1 1 .

---

    Code
      as_adjacency_matrix(g_undir_unwt, type = "both", sparse = TRUE)
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
                
      [1,] . 1 1
      [2,] 1 . 1
      [3,] 1 1 .

---

    Code
      as_adjacency_matrix(g_undir_unwt, sparse = FALSE)
    Output
           [,1] [,2] [,3]
      [1,]    0    1    1
      [2,]    1    0    1
      [3,]    1    1    0

---

    Code
      as_adjacency_matrix(g_undir_unwt, type = "upper", sparse = FALSE)
    Output
           [,1] [,2] [,3]
      [1,]    0    1    1
      [2,]    0    0    1
      [3,]    0    0    0

---

    Code
      as_adjacency_matrix(g_undir_unwt, type = "lower", sparse = FALSE)
    Output
           [,1] [,2] [,3]
      [1,]    0    0    0
      [2,]    1    0    0
      [3,]    1    1    0

---

    Code
      as_adjacency_matrix(g_undir_unwt, type = "both", sparse = FALSE)
    Output
           [,1] [,2] [,3]
      [1,]    0    1    1
      [2,]    1    0    1
      [3,]    1    1    0

---

    Code
      as_adjacency_matrix(g_undir_wt, attr = "weight", sparse = TRUE)
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
                      
      [1,] .   2.1 3.2
      [2,] 2.1 .   4.3
      [3,] 3.2 4.3 .  

---

    Code
      as_adjacency_matrix(g_undir_wt, attr = "weight", type = "upper", sparse = TRUE)
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
                    
      [1,] . 2.1 3.2
      [2,] . .   4.3
      [3,] . .   .  

---

    Code
      as_adjacency_matrix(g_undir_wt, attr = "weight", type = "lower", sparse = TRUE)
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
                    
      [1,] .   .   .
      [2,] 2.1 .   .
      [3,] 3.2 4.3 .

---

    Code
      as_adjacency_matrix(g_undir_wt, attr = "weight", type = "both", sparse = TRUE)
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
                      
      [1,] .   2.1 3.2
      [2,] 2.1 .   4.3
      [3,] 3.2 4.3 .  

---

    Code
      as_adjacency_matrix(g_undir_wt, attr = "weight", sparse = FALSE)
    Output
           [,1] [,2] [,3]
      [1,]  0.0  2.1  3.2
      [2,]  2.1  0.0  4.3
      [3,]  3.2  4.3  0.0

---

    Code
      as_adjacency_matrix(g_undir_wt, attr = "weight", type = "upper", sparse = FALSE)
    Output
           [,1] [,2] [,3]
      [1,]    0  2.1  3.2
      [2,]    0  0.0  4.3
      [3,]    0  0.0  0.0

---

    Code
      as_adjacency_matrix(g_undir_wt, attr = "weight", type = "lower", sparse = FALSE)
    Output
           [,1] [,2] [,3]
      [1,]  0.0  0.0    0
      [2,]  2.1  0.0    0
      [3,]  3.2  4.3    0

---

    Code
      as_adjacency_matrix(g_undir_wt, attr = "weight", type = "both", sparse = FALSE)
    Output
           [,1] [,2] [,3]
      [1,]  0.0  2.1  3.2
      [2,]  2.1  0.0  4.3
      [3,]  3.2  4.3  0.0

---

    Code
      as_adjacency_matrix(g_named, sparse = TRUE)
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
        A B C
      A . 1 .
      B . 1 1
      C 1 . .

---

    Code
      as_adjacency_matrix(g_named, sparse = FALSE)
    Output
        A B C
      A 0 1 0
      B 0 1 1
      C 1 0 0

