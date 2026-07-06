# ensure_igraph() works

    Code
      ensure_igraph(1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided wrong object type).

---

    Code
      ensure_igraph(NA)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided wrong object type).

---

    Code
      ensure_igraph(NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# igraph_match_arg() works

    Code
      cluster_leiden(make_graph("Zachary"), objective_function = "something")
    Condition
      Error in `cluster_leiden()`:
      ! `objective_function` must be one of "cpm" or "modularity", not "something".

