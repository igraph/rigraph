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
      s[["0.4"]]
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
    Output
      IGRAPH <myid> U--- 3 3 -- Ring graph
      + attr: name (g/c), mutual (g/l), circular (g/l), bar (v/c), foo (e/c)
      + edges from <myid>:
      [1] 1--2 2--3 1--3

---

    Code
      s[["1.5.0"]]
    Error <simpleError>
      This graph was created by a new(er) igraph version. Please install the latest version of igraph and try again.

