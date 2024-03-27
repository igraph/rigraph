# graph_from_adjacency_matrix() snapshot

    Code
      igraph_opt("print.id")
    Output
      [1] FALSE
    Code
      m <- matrix(c(0, 2.5, 0, 0), ncol = 2)
      m
    Output
           [,1] [,2]
      [1,]  0.0    0
      [2,]  2.5    0
    Code
      graph_from_adjacency_matrix(m)
    Output
      IGRAPH D--- 2 2 -- 
      + edges:
      [1] 2->1 2->1
    Code
      graph_from_adjacency_matrix(m, mode = "undirected")
    Condition
      Warning:
      The `adjmatrix` argument of `graph_from_adjacency_matrix()` must be symmetric with mode = "undirected" as of igraph 1.6.0.
      i Use mode = "max" to achieve the original behavior.
    Output
      IGRAPH U--- 2 2 -- 
      + edges:
      [1] 1--2 1--2
    Code
      graph_from_adjacency_matrix(m, mode = "max")
    Output
      IGRAPH U--- 2 2 -- 
      + edges:
      [1] 1--2 1--2
    Code
      graph_from_adjacency_matrix(m, weighted = TRUE)
    Output
      IGRAPH D-W- 2 1 -- 
      + attr: weight (e/n)
      + edge:
      [1] 2->1
    Code
      graph_from_adjacency_matrix(m, weighted = "w")
    Output
      IGRAPH D--- 2 1 -- 
      + attr: w (e/n)
      + edge:
      [1] 2->1
    Code
      m2 <- structure(c(0, 0.00211360121966095, 0.00211360121966098, 0), dim = c(2L,
        2L))
      graph_from_adjacency_matrix(m2, mode = "undirected")
    Condition
      Warning:
      The `adjmatrix` argument of `graph_from_adjacency_matrix()` must be symmetric with mode = "undirected" as of igraph 1.6.0.
      i Use mode = "max" to achieve the original behavior.
    Output
      IGRAPH U--- 2 0 -- 
      + edges:
    Code
      graph_from_adjacency_matrix(1)
    Condition
      Warning:
      The `adjmatrix` argument of `graph_from_adjacency_matrix()` must be a matrix as of igraph 1.6.0.
    Output
      IGRAPH D--- 1 1 -- 
      + edge:
      [1] 1->1
    Code
      graph_from_adjacency_matrix(1, mode = "undirected")
    Condition
      Warning:
      The `adjmatrix` argument of `graph_from_adjacency_matrix()` must be a matrix as of igraph 1.6.0.
    Output
      IGRAPH U--- 1 1 -- 
      + edge:
      [1] 1--1

# graph_from_adjacency_matrix() snapshot for sparse matrices

    Code
      igraph_opt("print.id")
    Output
      [1] FALSE
    Code
      m <- Matrix::sparseMatrix(2, 1, x = 2.5, dims = c(2, 2))
      m
    Output
      2 x 2 sparse Matrix of class "dgCMatrix"
                
      [1,] .   .
      [2,] 2.5 .
    Code
      graph_from_adjacency_matrix(m)
    Output
      IGRAPH D--- 2 2 -- 
      + edges:
      [1] 2->1 2->1
    Code
      graph_from_adjacency_matrix(m, mode = "undirected")
    Condition
      Warning:
      The `adjmatrix` argument of `graph_from_adjacency_matrix()` must be symmetric with mode = "undirected" as of igraph 1.6.0.
      i Use mode = "max" to achieve the original behavior.
    Output
      IGRAPH U--- 2 2 -- 
      + edges:
      [1] 1--2 1--2
    Code
      graph_from_adjacency_matrix(m, mode = "max")
    Output
      IGRAPH U--- 2 2 -- 
      + edges:
      [1] 1--2 1--2
    Code
      graph_from_adjacency_matrix(m, weighted = TRUE)
    Output
      IGRAPH D-W- 2 1 -- 
      + attr: weight (e/n)
      + edge:
      [1] 2->1
    Code
      graph_from_adjacency_matrix(m, weighted = "w")
    Output
      IGRAPH D--- 2 1 -- 
      + attr: w (e/n)
      + edge:
      [1] 2->1
    Code
      m2 <- Matrix::sparseMatrix(2:1, 1:2, x = c(0.00211360121966095,
        0.00211360121966098))
      graph_from_adjacency_matrix(m2, mode = "undirected")
    Condition
      Warning:
      The `adjmatrix` argument of `graph_from_adjacency_matrix()` must be symmetric with mode = "undirected" as of igraph 1.6.0.
      i Use mode = "max" to achieve the original behavior.
    Output
      IGRAPH U--- 2 0 -- 
      + edges:

