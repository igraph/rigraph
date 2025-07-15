# error messages work

    Code
      set_vertex_attr(g, "test", value = c(1, 2))
    Condition
      Error in `i_set_vertex_attr()`:
      ! Length of new attribute value must be 1 or 5, the number of target vertices, not 2.

---

    Code
      set_edge_attr(g, "test", value = c(1, 2))
    Condition
      Error in `i_set_edge_attr()`:
      ! Length of new attribute value must be 1 or 10, the number of target edges, not 2.

---

    Code
      delete_graph_attr(g, "a")
    Condition
      Error in `delete_graph_attr()`:
      ! No graph attribute `a` found.

---

    Code
      delete_vertex_attr(g, "a")
    Condition
      Error in `delete_vertex_attr()`:
      ! No vertex attribute `a` found.

---

    Code
      delete_edge_attr(g, "a")
    Condition
      Error in `delete_edge_attr()`:
      ! No edge attribute `a` found.

---

    Code
      assert_named_list("a")
    Condition
      Error in `assert_named_list()`:
      ! `value` must be a named list with unique names

---

    Code
      assert_named_list(list("a", "b"))
    Condition
      Error in `assert_named_list()`:
      ! `value` must be a named list with unique names

# good error message when not using character

    Code
      set_graph_attr(ring, 1, 1)
    Condition
      Error in `set_graph_attr()`:
      ! `name` must be a single string, not the number 1.

# duplicated vertex names are handled correctly

    Code
      add_vertices(g, nv = 2, attr = list(name = c("A", "B")))
    Condition
      Error in `i_set_vertex_attr()`:
      ! Vertex names already exist: A, B
# set_vertex_attrs() works

    Code
      set_vertex_attrs(g)
    Condition
      Error in `set_vertex_attrs()`:
      ! All arguments in `...` must be named.

