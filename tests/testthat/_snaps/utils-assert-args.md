# ensure_igraph() works

    Must provide a graph object (provided wrong object type).

---

    Must provide a graph object (provided wrong object type).

---

    Must provide a graph object (provided `NULL`).

# igraph.match.arg() works

    Code
      cluster_leiden(make_graph("Zachary"), objective_function = "something")
    Condition
      Error in `cluster_leiden()`:
      ! `arg` must be one of "cpm" or "modularity", not "something".

