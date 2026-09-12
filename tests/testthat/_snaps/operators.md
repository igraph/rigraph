# graph_join() prints as expected

    Code
      print_all(graph_join(make_ring(3), make_ring(2)))
    Output
      IGRAPH U--- 5 11 -- 
      + edges:
      1 -- 2 3 4 5     2 -- 1 3 4 5     3 -- 1 2 4 5     4 -- 1 2 3 5 5
      5 -- 1 2 3 4 4

# graph_join() errors

    Code
      graph_join(g_undir, g_dir)
    Condition
      Error in `join_impl()`:
      ! Cannot create join of directed and undirected graphs. Invalid value
      Source: <file>:<line>

---

    Code
      graph_join(g_undir, g_undir, byname = TRUE)
    Condition
      Error in `graph_join()`:
      ! `...` must be empty.
      x Problematic argument:
      * byname = TRUE

# vertices() works

    Code
      make_empty_graph(1) + vertices("a", "b", foo = 5:7)
    Condition
      Error:
      ! Can't recycle `name` (size 2) to match `foo` (size 3).

# vertices() errors on duplicate attribute names

    Code
      vertices("a", name = "c", name = "d")
    Condition
      Error in `vertices()`:
      ! Duplicate attribute name in `vertices()`: "name".

---

    Code
      vertices("a", blop = "c", blop = 1)
    Condition
      Error in `vertices()`:
      ! Duplicate attribute name in `vertices()`: "blop".

---

    Code
      make_empty_graph(1) + vertices("a", "b", name = "c", name = "d")
    Condition
      Error in `vertices()`:
      ! Duplicate attribute name in `vertices()`: "name".

---

    Code
      vertices(foo = 1, foo = 2, bar = 3, bar = 4)
    Condition
      Error in `vertices()`:
      ! Duplicate attribute names in `vertices()`: "foo" and "bar".

