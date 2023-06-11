# we can't upgrade from 0.1.1 to 1.5.0

    Code
      upgrade_graph(g)
    Error <simpleError>
      Don't know how to upgrade graph from 0.1.1 to 1.5.0

# reading of old igraph formats

    Code
      s[["0.1.1"]]
    Error <simpleError>
      This graph was created by a now unsupported old igraph version.
        Call upgrade_version() before using igraph functions on that object.

---

    Code
      s[["0.2"]]
    Error <simpleError>
      This graph was created by a now unsupported old igraph version.
        Call upgrade_version() before using igraph functions on that object.

---

    Code
      s[["0.5"]]
    Error <simpleError>
      This graph was created by a now unsupported old igraph version.
        Call upgrade_version() before using igraph functions on that object.

---

    Code
      s[["0.6"]]
    Error <simpleError>
      This graph was created by a now unsupported old igraph version.
        Call upgrade_version() before using igraph functions on that object.

---

    Code
      s[["1.0.0"]]
    Message <simpleMessage>
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

