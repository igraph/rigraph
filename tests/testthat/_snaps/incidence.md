# graph_from_biadjacency_matrix() works -- dense

    Code
      (g <- graph_from_biadjacency_matrix(inc))
    Output
      -- <igraph> --------------------------------------------------------------------
      i undirected * named * bipartite
      i 8 vertices * 7 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: type <lgl>, name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
      [1] A -- c  A -- d  B -- b  B -- c  B -- e  C -- b  C -- d 

---

    Code
      (weighted_g <- graph_from_biadjacency_matrix(inc, weighted = TRUE))
    Output
      -- <igraph> --------------------------------------------------------------------
      i undirected * named * weighted * bipartite
      i 8 vertices * 7 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: type <lgl>, name <chr>
      -> edge:   weight <dbl>
      
      -- Edges (vertex names) --------------------------------------------------------
      [1] B -- b  C -- b  A -- c  B -- c  A -- d  C -- d  B -- e 

# graph_from_biadjacency_matrix() works -- dense + multiple

    Code
      (g <- graph_from_biadjacency_matrix(inc, multiple = TRUE))
    Output
      -- <igraph> --------------------------------------------------------------------
      i undirected * named * bipartite
      i 8 vertices * 10 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: type <lgl>, name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
       [1] A -- c  A -- d  A -- d  A -- e  B -- b  B -- e  C -- b  C -- c  C -- c 
      [10] C -- e 

# graph_from_biadjacency_matrix() works -- sparse

    Code
      (g <- graph_from_biadjacency_matrix(inc))
    Output
      -- <igraph> --------------------------------------------------------------------
      i undirected * named * bipartite
      i 8 vertices * 7 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: type <lgl>, name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
      [1] B -- b  C -- b  A -- c  B -- c  A -- d  C -- d  B -- e 

---

    Code
      (weighted_g <- graph_from_biadjacency_matrix(inc, weighted = TRUE))
    Output
      -- <igraph> --------------------------------------------------------------------
      i undirected * named * weighted * bipartite
      i 8 vertices * 7 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: type <lgl>, name <chr>
      -> edge:   weight <dbl>
      
      -- Edges (vertex names) --------------------------------------------------------
      [1] B -- b  C -- b  A -- c  B -- c  A -- d  C -- d  B -- e 

# graph_from_biadjacency_matrix() works -- sparse + multiple

    Code
      (g <- graph_from_biadjacency_matrix(inc, multiple = TRUE))
    Output
      -- <igraph> --------------------------------------------------------------------
      i undirected * named * bipartite
      i 8 vertices * 10 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: type <lgl>, name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
       [1] B -- b  C -- b  A -- c  C -- c  C -- c  A -- d  A -- d  A -- e  B -- e 
      [10] C -- e 

# graph_from_biadjacency_matrix() errors well

    Code
      (g <- graph_from_biadjacency_matrix(inc, weight = FALSE))
    Condition
      Error in `graph_from_biadjacency_matrix()`:
      ! `weighted` can't be `FALSE`.
      i See `?graph_from_biadjacency_matrix()`'s manual page.

---

    Code
      (g <- graph_from_biadjacency_matrix(inc, weight = 42))
    Condition
      Error in `graph_from_biadjacency_matrix()`:
      ! `weighted` can't be a number.
      i See `?graph_from_biadjacency_matrix()`'s manual page.

---

    Code
      (g <- graph_from_biadjacency_matrix(inc, multiple = TRUE, weighted = TRUE))
    Condition
      Error in `graph_from_biadjacency_matrix()`:
      ! `multiple` and `weighted` cannot be both `TRUE`.
      igraph either interprets numbers larger than 1 as weights or as multiplicities, but it cannot be both.

# graph_from_biadjacency_matrix errors for NAs

    Code
      graph_from_biadjacency_matrix(A)
    Condition
      Error in `graph_from_biadjacency_matrix()`:
      ! Cannot create a graph object because the biadjacency matrix contains NAs.

