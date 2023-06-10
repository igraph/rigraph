# reading of old igraph formats

    Code
      s[["0.2"]]
    Message <simpleMessage>
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
    Output
      IGRAPH NA U--- 3 3 -- 
      + attr: bar (v/c), foo (e/c)
    Message <simpleMessage>
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
    Warning <simpleWarning>
      'length(x) = 9 > 1' in coercion to 'logical(1)'
    Output
      + edges from 3:
       + edges from FALSE:
       + edges from c(0, 1,:
       + edges from c(1, 2,:
       + edges from c(0, 1,:
       + edges from c(2, 0,:
       + edges from c(0, 1,:
       + edges from c(0, 1,:
       + edges from list(c(:
    Message <simpleMessage>
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
    Output
      [1] 2--1 3--2 1--3

---

    Code
      s[["0.4"]]
    Message <simpleMessage>
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
    Output
      IGRAPH NA U--- 3 3 -- 
      + attr: bar (v/c), foo (e/c)
    Message <simpleMessage>
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
    Warning <simpleWarning>
      'length(x) = 9 > 1' in coercion to 'logical(1)'
    Output
      + edges from 3:
       + edges from FALSE:
       + edges from c(1, 2,:
       + edges from c(0, 1,:
       + edges from c(0, 2,:
       + edges from c(0, 2,:
       + edges from c(0, 0,:
       + edges from c(0, 2,:
       + edges from list(c(:
    Message <simpleMessage>
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
    Output
      [1] 1--2 2--3 1--3

---

    Code
      s[["0.5"]]
    Message <simpleMessage>
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
    Output
      IGRAPH NA U--- 3 3 -- 
      + attr: bar (v/c), foo (e/c)
    Message <simpleMessage>
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
    Warning <simpleWarning>
      'length(x) = 9 > 1' in coercion to 'logical(1)'
    Output
      + edges from 3:
       + edges from FALSE:
       + edges from c(1, 2,:
       + edges from c(0, 1,:
       + edges from c(0, 2,:
       + edges from c(0, 2,:
       + edges from c(0, 0,:
       + edges from c(0, 2,:
       + edges from list(c(:
    Message <simpleMessage>
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
    Output
      [1] 1--2 2--3 1--3

---

    Code
      s[["0.6"]]
    Message <simpleMessage>
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
    Output
      IGRAPH NA U--- 3 3 -- Ring graph
      + attr: name (g/c), mutual (g/l), circular (g/l), bar (v/c), foo (e/c)
    Message <simpleMessage>
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
    Warning <simpleWarning>
      'length(x) = 9 > 1' in coercion to 'logical(1)'
    Output
      + edges from 3:
       + edges from FALSE:
       + edges from c(1, 2,:
       + edges from c(0, 1,:
       + edges from c(0, 2,:
       + edges from c(0, 2,:
       + edges from c(0, 0,:
       + edges from c(0, 2,:
       + edges from list(c(:
    Message <simpleMessage>
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
    Output
      [1] 1--2 2--3 1--3

---

    Code
      s[["1.0.0"]]
    Output
      IGRAPH <myid> U--- 3 3 -- Ring graph
      + attr: name (g/c), mutual (g/l), circular (g/l), bar (v/c), foo (e/c)
      + edges from <myid>:
      [1] 1--2 2--3 1--3

---

    Code
      s[["1.5.0"]]
    Message <simpleMessage>
      This graph was created by an old(er) igraph version.
        Call upgrade_graph() on it to use with the current igraph version
        For now we convert it on the fly...
    Error <simpleError>
      REAL() can only be applied to a 'numeric', not a 'NULL'

