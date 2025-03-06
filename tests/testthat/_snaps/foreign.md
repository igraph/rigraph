# reading graph in NCOL format

    Code
      read_graph(ncol_path, "ncol")
    Output
      IGRAPH UN-- 3 2 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] 0--1 1--2

# reading graph in LGL format

    Code
      read_graph(lgl_path, "lgl")
    Output
      IGRAPH UN-- 3 2 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] 0--1 1--2

# graph_from_graphdb works

    Code
      g <- graph_from_graphdb(nodes = 1000)

---

    Code
      g <- graph_from_graphdb()
    Condition
      Error in `graph_from_graphdb()`:
      ! Either `nodes`' or ``url`' must be non-null.

---

    Code
      g <- graph_from_graphdb(nodes = 10, prefix = "not_existing")
    Condition
      Error in `graph_from_graphdb()`:
      ! not_existing is not a valid prefix.
      i Must be one of iso, si6, mcs10, mcs30, mcs50, mcs70, and mcs90.

---

    Code
      g <- graph_from_graphdb(nodes = 10, type = "not_existing")
    Condition
      Error in `graph_from_graphdb()`:
      ! not_existing is not a valid graph type.
      i Must be one of r001, r005, r01, r02, m2D, m2Dr2, m2Dr4, m2Dr6, m3D, m3Dr2, m3Dr4, m3Dr6, m4D, m4Dr2, m4Dr4, m4Dr6, b03, b03m, ..., b09, and b09m.

