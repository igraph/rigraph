# full_bipartite_impl basic

    Code
      full_bipartite_impl(n1 = 2, n2 = 3)
    Output
      $graph
      IGRAPH U--- 5 6 -- 
      + edges:
      [1] 1--3 1--4 1--5 2--3 2--4 2--5
      
      $types
      [1] FALSE FALSE  TRUE  TRUE  TRUE
      

---

    Code
      full_bipartite_impl(n1 = 2, n2 = 3, directed = TRUE, mode = "in")
    Output
      $graph
      IGRAPH D--- 5 6 -- 
      + edges:
      [1] 3->1 4->1 5->1 3->2 4->2 5->2
      
      $types
      [1] FALSE FALSE  TRUE  TRUE  TRUE
      

# full_bipartite_impl errors

    Code
      full_bipartite_impl(n1 = -1, n2 = 3)
    Condition
      Error in `full_bipartite_impl()`:
      ! Invalid number of vertices for bipartite graph. Invalid value
      Source: <file>:<line>

# bipartite_projection_size_impl basic

    Code
      bipartite_projection_size_impl(graph = g)
    Output
      $vcount1
      [1] 2
      
      $ecount1
      [1] 1
      
      $vcount2
      [1] 2
      
      $ecount2
      [1] 1
      

# bipartite_projection_size_impl errors

    Code
      bipartite_projection_size_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# biadjacency_impl basic

    Code
      biadjacency_impl(incidence = m)
    Output
      $graph
      IGRAPH U--- 5 4 -- 
      + edges:
      [1] 1--3 1--4 1--5 2--5
      
      $types
      [1] FALSE FALSE  TRUE  TRUE  TRUE
      

---

    Code
      biadjacency_impl(incidence = m, directed = TRUE, mode = "in", multiple = TRUE)
    Output
      $graph
      IGRAPH D--- 5 4 -- 
      + edges:
      [1] 3->1 4->1 5->1 5->2
      
      $types
      [1] FALSE FALSE  TRUE  TRUE  TRUE
      

# biadjacency_impl errors

    Code
      biadjacency_impl(incidence = "a")
    Condition
      Warning in `biadjacency_impl()`:
      NAs introduced by coercion
      Error in `biadjacency_impl()`:
      ! REAL() can only be applied to a 'numeric', not a 'character'

# get_biadjacency_impl basic

    Code
      get_biadjacency_impl(graph = g, types = c(TRUE, FALSE, TRUE))
    Output
      $res
           [,1] [,2]
      [1,]    1    1
      
      $row_ids
      [1] 2
      
      $col_ids
      [1] 1 3
      

# get_biadjacency_impl errors

    Code
      get_biadjacency_impl(graph = NULL, types = c(TRUE, FALSE, TRUE))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_bipartite_impl basic

    Code
      is_bipartite_impl(graph = g)
    Output
      $res
      [1] TRUE
      
      $type
      [1] FALSE  TRUE FALSE
      

# is_bipartite_impl errors

    Code
      is_bipartite_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# bipartite_game_gnp_impl basic

    Code
      bipartite_game_gnp_impl(n1 = 2, n2 = 2, p = 0.5)
    Output
      $graph
      IGRAPH U--- 4 4 -- 
      + edges:
      [1] 1--3 2--3 1--4 2--4
      
      $types
      [1] FALSE FALSE  TRUE  TRUE
      

---

    Code
      bipartite_game_gnp_impl(n1 = 2, n2 = 2, p = 0.5, directed = TRUE, mode = "in")
    Output
      $graph
      IGRAPH D--- 4 1 -- 
      + edge:
      [1] 3->2
      
      $types
      [1] FALSE FALSE  TRUE  TRUE
      

# bipartite_game_gnp_impl errors

    Code
      bipartite_game_gnp_impl(n1 = -1, n2 = 2, p = 0.5)
    Condition
      Error in `bipartite_game_gnp_impl()`:
      ! Invalid number of vertices for bipartite graph. Invalid value
      Source: <file>:<line>

# bipartite_game_gnm_impl basic

    Code
      bipartite_game_gnm_impl(n1 = 2, n2 = 2, m = 1)
    Output
      $graph
      IGRAPH U--- 4 1 -- 
      + edge:
      [1] 2--4
      
      $types
      [1] FALSE FALSE  TRUE  TRUE
      

---

    Code
      bipartite_game_gnm_impl(n1 = 2, n2 = 2, m = 1, directed = TRUE, mode = "in")
    Output
      $graph
      IGRAPH D--- 4 1 -- 
      + edge:
      [1] 3->1
      
      $types
      [1] FALSE FALSE  TRUE  TRUE
      

# bipartite_game_gnm_impl errors

    Code
      bipartite_game_gnm_impl(n1 = -1, n2 = 2, m = 1)
    Condition
      Error in `bipartite_game_gnm_impl()`:
      ! Invalid number of vertices for bipartite graph. Invalid value
      Source: <file>:<line>

# create_bipartite_impl basic

    Code
      create_bipartite_impl(types = c(FALSE, FALSE, TRUE, TRUE), edges = c(0, 2, 0, 3,
        1, 2, 1, 3), directed = FALSE)
    Output
      IGRAPH U--- 4 4 -- 
      + edges:
      [1] 1--3 1--4 2--3 2--4

# bipartite_game_impl basic

    Code
      bipartite_game_impl(type = "gnp", n1 = 5, n2 = 5, p = 0.3, directed = FALSE)
    Output
      $graph
      IGRAPH U--- 10 10 -- 
      + edges:
       [1] 1-- 6 2-- 6 4-- 6 5-- 6 1-- 7 4-- 7 4-- 8 3-- 9 3--10 4--10
      
      $types
       [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
      

---

    Code
      bipartite_game_impl(type = "gnm", n1 = 5, n2 = 5, m = 10, directed = FALSE)
    Output
      $graph
      IGRAPH U--- 10 10 -- 
      + edges:
       [1] 1-- 6 3-- 7 5-- 7 1-- 8 3-- 8 4-- 8 2-- 9 5-- 9 2--10 3--10
      
      $types
       [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
      

