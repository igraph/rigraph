# st_cuts errors work

    Code
      st_cuts(g_path, source = "a", target = NULL)
    Condition
      Error in `st_cuts()`:
      ! No vertex was specified

---

    Code
      st_cuts(g_path, source = NULL, target = "a")
    Condition
      Error in `st_cuts()`:
      ! No vertex was specified

---

    Code
      st_min_cuts(g_path, source = "a", target = NULL)
    Condition
      Error in `st_min_cuts()`:
      ! No vertex was specified

---

    Code
      st_min_cuts(g_path, source = NULL, target = "a")
    Condition
      Error in `st_min_cuts()`:
      ! No vertex was specified

# vertex_connectivity error works

    Code
      vertex_connectivity(g_path, source = 1)
    Condition
      Error in `vertex_connectivity()`:
      ! `source` and `target` must not be specified at the same time.
      i Specify either `source` or `target` or neither.

# edge_connectivity error works

    Code
      edge_connectivity(g_path, source = 1)
    Condition
      Error in `edge_connectivity()`:
      ! `source` and `target` must not be specified at the same time.
      i Specify either `source` or `target` or neither.

# edge_disjoint_paths error works

    Code
      edge_disjoint_paths(g_path, source = 1, target = NULL)
    Condition
      Error in `edge_disjoint_paths()`:
      ! Both source and target must be given

---

    Code
      edge_disjoint_paths(g_path, source = NULL, target = 1)
    Condition
      Error in `edge_disjoint_paths()`:
      ! Both source and target must be given

# vertex_disjoint_paths error works

    Code
      vertex_disjoint_paths(g_path, source = 1)
    Condition
      Error in `vertex_disjoint_paths()`:
      ! Both source and target must be given

---

    Code
      vertex_disjoint_paths(g_path, source = 1)
    Condition
      Error in `vertex_disjoint_paths()`:
      ! Both source and target must be given

# dominator_tree errors work

    Code
      dominator_tree(g_tree)
    Condition
      Error in `dominator_tree()`:
      ! `root` must be specified.

---

    Code
      dominator_tree(g_tree, root = NULL)
    Condition
      Error in `dominator_tree()`:
      ! `root` must be specified.

# min_st_separators() works for the note case

    Code
      min_st_separators(g_note)
    Output
      [[1]]
      + 1/5 vertex, named, from something
      [1] 1
      
      [[2]]
      + 2/5 vertices, named, from something
      [1] 2 4
      
      [[3]]
      + 2/5 vertices, named, from something
      [1] 1 3
      

