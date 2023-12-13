# we can't upgrade from 0.1.1 to 1.5.0, on the fly

    Code
      oldsample_0_1_1()
    Condition
      Error in `warn_version()`:
      ! This graph was created by igraph < 0.2.
        Upgrading this format is not supported, sorry.

# we can't upgrade from 0.1.1 to 1.5.0, explicitly

    Code
      upgrade_graph(g)
    Condition
      Error in `upgrade_graph()`:
      ! Don't know how to upgrade graph from version 0 to 4

# we can't upgrade from 0.2 to 1.5.0, on the fly

    Code
      oldsample_0_2()
    Condition
      Error in `warn_version()`:
      ! This graph was created by a now unsupported old igraph version.
        Call upgrade_version() before using igraph functions on that object.

# we can't upgrade from 0.5 to 1.5.0, on the fly

    Code
      oldsample_0_5()
    Condition
      Error in `warn_version()`:
      ! This graph was created by a now unsupported old igraph version.
        Call upgrade_version() before using igraph functions on that object.

# we can't upgrade from 0.6 to 1.5.0, on the fly

    Code
      oldsample_0_6()
    Condition
      Error in `warn_version()`:
      ! This graph was created by a now unsupported old igraph version.
        Call upgrade_version() before using igraph functions on that object.

# we can upgrade from 1.0.0 to 1.5.0, on the fly

    Code
      g <- oldsample_1_0_0()
      graph_version(g)
    Output
      [1] 3
    Code
      g
    Message
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
    Output
      IGRAPH D--- 3 3 -- Ring graph
      + attr: name (g/c), mutual (g/l), circular (g/l), bar (v/c), foo (e/c)
      + edges:
      [1] 1->2 2->3 3->1
    Code
      graph_version(g)
    Output
      [1] 4

# reading of old igraph formats

    Code
      s[["0.1.1"]]
    Condition
      Error in `warn_version()`:
      ! This graph was created by igraph < 0.2.
        Upgrading this format is not supported, sorry.

---

    Code
      s[["0.2"]]
    Condition
      Error in `warn_version()`:
      ! This graph was created by a now unsupported old igraph version.
        Call upgrade_version() before using igraph functions on that object.

---

    Code
      s[["0.5"]]
    Condition
      Error in `warn_version()`:
      ! This graph was created by a now unsupported old igraph version.
        Call upgrade_version() before using igraph functions on that object.

---

    Code
      s[["0.6"]]
    Condition
      Error in `warn_version()`:
      ! This graph was created by a now unsupported old igraph version.
        Call upgrade_version() before using igraph functions on that object.

---

    Code
      s[["1.0.0"]]
    Message
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
    Output
      IGRAPH D--- 3 3 -- Ring graph
      + attr: name (g/c), mutual (g/l), circular (g/l), bar (v/c), foo (e/c)
      + edges:
      [1] 1->2 2->3 3->1

---

    Code
      s[["1.5.0"]]
    Output
      IGRAPH D--- 3 3 -- Ring graph
      + attr: name (g/c), mutual (g/l), circular (g/l), bar (v/c), foo (e/c)
      + edges:
      [1] 1->2 2->3 3->1

