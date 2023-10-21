# graph_from_adjacency_matrix() snapshot

    Code
      m <- matrix(c(0, 2.5, 0, 0), ncol = 2)
      graph_from_adjacency_matrix(m)
    Output
      IGRAPH D--- 2 2 -- 
      + edges:
      [1] 2->1 2->1
    Code
      graph_from_adjacency_matrix(m, mode = "undirected")
    Condition
      Warning:
      The `adjmatrix` argument of `graph_from_adjacency_matrix()` must be symmetric with mode = "undirected" as of igraph 1.5.2.
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

