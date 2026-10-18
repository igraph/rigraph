# graph_power_impl basic

    Code
      graph_power_impl(graph = g, order = 2)
    Output
      IGRAPH U--- 5 7 -- 
      + edges:
      [1] 1--2 2--3 3--4 4--5 1--3 2--4 3--5

---

    Code
      graph_power_impl(graph = g, order = 2, directed = TRUE)
    Output
      IGRAPH U--- 5 7 -- 
      + edges:
      [1] 1--2 2--3 3--4 4--5 1--3 2--4 3--5

# graph_power_impl errors

    Code
      graph_power_impl(graph = NULL, order = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# linegraph_impl basic

    Code
      linegraph_impl(graph = g)
    Output
      IGRAPH U--- 4 3 -- 
      + edges:
      [1] 1--2 2--3 3--4

# linegraph_impl errors

    Code
      linegraph_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# induced_subgraph_impl basic

    Code
      induced_subgraph_impl(graph = g, vids = 1:2)
    Output
      IGRAPH U--- 2 1 -- 
      + edge:
      [1] 1--2

# induced_subgraph_impl errors

    Code
      induced_subgraph_impl(graph = NULL, vids = 1:2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# subgraph_from_edges_impl basic

    Code
      subgraph_from_edges_impl(graph = g, eids = 1)
    Output
      IGRAPH U--- 2 1 -- 
      + edge:
      [1] 1--2

# subgraph_from_edges_impl errors

    Code
      subgraph_from_edges_impl(graph = NULL, eids = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# reverse_edges_impl basic

    Code
      reverse_edges_impl(graph = g)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

# reverse_edges_impl errors

    Code
      reverse_edges_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# simplify_impl basic

    Code
      simplify_impl(graph = g)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

---

    Code
      simplify_impl(graph = g, remove_multiple = FALSE, remove_loops = FALSE)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

# simplify_impl errors

    Code
      simplify_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# contract_vertices_impl basic

    Code
      contract_vertices_impl(graph = g, mapping = c(1, 1, 2))
    Output
      IGRAPH U--- 2 2 -- 
      + edges:
      [1] 1--1 1--2

# contract_vertices_impl errors

    Code
      contract_vertices_impl(graph = NULL, mapping = c(1, 1, 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitive_closure_dag_impl basic

    Code
      transitive_closure_dag_impl(graph = g)
    Output
      IGRAPH D--- 3 3 -- 
      + edges:
      [1] 1->3 1->2 2->3

# transitive_closure_dag_impl errors

    Code
      transitive_closure_dag_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitive_closure_impl basic

    Code
      transitive_closure_impl(graph = g)
    Output
      IGRAPH U--- 3 3 -- 
      + edges:
      [1] 1--2 1--3 2--3

# transitive_closure_impl errors

    Code
      transitive_closure_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# join_impl basic

    Code
      join_impl(left = g1, right = g2)
    Output
      IGRAPH U--- 6 13 -- 
      + edges:
       [1] 1--2 2--3 4--5 5--6 1--4 1--5 1--6 2--4 2--5 2--6 3--4 3--5 3--6

# join_impl errors

    Code
      join_impl(left = NULL, right = right)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# induced_subgraph_map_impl basic

    Code
      induced_subgraph_map_impl(graph = g, vids = 1:2, impl = "auto")
    Output
      $res
      IGRAPH U--- 2 1 -- 
      + edge:
      [1] 1--2
      
      $map
      [1] 2 3 1
      
      $invmap
      [1] 1 2
      

---

    Code
      induced_subgraph_map_impl(graph = g, vids = 1:2, impl = "copy_and_delete")
    Output
      $res
      IGRAPH U--- 2 1 -- 
      + edge:
      [1] 1--2
      
      $map
      [1] 2 3 1
      
      $invmap
      [1] 1 2
      

# induced_subgraph_map_impl errors

    Code
      induced_subgraph_map_impl(graph = NULL, vids = 1:2, impl = "auto")
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# mycielskian_impl basic

    Code
      mycielskian_impl(graph = g)
    Output
      IGRAPH U--- 7 9 -- 
      + edges:
      [1] 1--2 2--3 1--5 2--4 2--6 3--5 4--7 5--7 6--7

---

    Code
      mycielskian_impl(graph = g, k = 2)
    Output
      IGRAPH U--- 15 34 -- 
      + edges:
       [1]  1-- 2  2-- 3  1-- 5  2-- 4  2-- 6  3-- 5  4-- 7  5-- 7  6-- 7  1-- 9
      [11]  2-- 8  2--10  3-- 9  1--12  5-- 8  2--11  4-- 9  2--13  6-- 9  3--12
      [21]  5--10  4--14  7--11  5--14  7--12  6--14  7--13  8--15  9--15 10--15
      [31] 11--15 12--15 13--15 14--15

# mycielskian_impl errors

    Code
      mycielskian_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# product_impl basic

    Code
      product_impl(g1 = g1, g2 = g2)
    Output
      IGRAPH U--- 9 12 -- 
      + edges:
       [1] 1--4 2--5 3--6 4--7 5--8 6--9 1--2 4--5 7--8 2--3 5--6 8--9

---

    Code
      product_impl(g1 = g1, g2 = g2, type = "tensor")
    Output
      IGRAPH U--- 9 8 -- 
      + edges:
      [1] 1--5 2--4 2--6 3--5 4--8 5--7 5--9 6--8

# product_impl errors

    Code
      product_impl(g1 = NULL, g2 = g2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# rooted_product_impl basic

    Code
      rooted_product_impl(g1 = g1, g2 = g2, root = 1)
    Output
      IGRAPH U--- 9 8 -- 
      + edges:
      [1] 1--4 4--7 1--2 4--5 7--8 2--3 5--6 8--9

# rooted_product_impl errors

    Code
      rooted_product_impl(g1 = NULL, g2 = g2, root = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# union_impl basic

    Code
      union_impl(left = g1, right = g2)
    Output
      $res
      IGRAPH D--- 4 4 -- 
      + edges:
      [1] 1->2 1->3 2->3 3->4
      
      $edge_map_left
      [1] 1 3
      
      $edge_map_right
      [1] 2 4
      

# union_impl errors

    Code
      union_impl(left = NULL, right = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# intersection_impl basic

    Code
      intersection_impl(left = g1, right = g2)
    Output
      $res
      IGRAPH D--- 3 2 -- 
      + edges:
      [1] 1->2 2->3
      
      $edge_map_left
      [1] 1 2
      
      $edge_map_right
      [1] 1 2
      

# intersection_impl errors

    Code
      intersection_impl(left = NULL, right = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# connect_neighborhood_impl basic

    Code
      connect_neighborhood_impl(graph = g, order = 1, mode = c("all", "out", "in"))
    Condition
      Warning in `connect_neighborhood_impl()`:
      Order smaller than two, graph will be unchanged.
      Source: <file>:<line>
    Output
      IGRAPH U--- 5 5 -- Ring graph
      + attr: name (g/c), mutual (g/l), circular (g/l)
      + edges:
      [1] 1--2 2--3 3--4 4--5 1--5

# disjoint_union_many_impl basic

    Code
      disjoint_union_many_impl(graphs = list(g1, g2, g3))
    Output
      IGRAPH D--- 6 0 -- 
      + edges:

# union_many_impl basic

    Code
      union_many_impl(graphs = list(g1, g2, g3))
    Output
      $res
      IGRAPH D--- 3 3 -- 
      + edges:
      [1] 2->3 1->3 1->2
      
      $edgemaps
      $edgemaps[[1]]
      numeric(0)
      
      $edgemaps[[2]]
      [1] 2 0
      
      $edgemaps[[3]]
      [1] 1
      
      

# intersection_many_impl basic

    Code
      intersection_many_impl(graphs = list(g1, g2, g3))
    Output
      $res
      IGRAPH D--- 3 1 -- 
      + edge:
      [1] 1->2
      
      $edgemaps
      $edgemaps[[1]]
      [1]  0 -1 -1
      
      $edgemaps[[2]]
      [1]  0 -1
      
      $edgemaps[[3]]
      [1] 0
      
      

