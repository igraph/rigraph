# recovery deprecation messages

    Code
      x <- migration_fixture("g", 5, 1:3, "in", TRUE)
    Condition
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, weight, type, directed)
      i Use instead: migration_fixture(graph, n, weights = , type = , directed = )

---

    Code
      x <- migration_fixture("g", 5, 1:3)
    Condition
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, weight)
      i Use instead: migration_fixture(graph, n, weights = )

---

    Code
      x <- migration_fixture("g", 5, weight = 1:3)
    Condition
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, weight)
      i Use instead: migration_fixture(graph, n, weights = )

---

    Code
      x <- migration_fixture("g", 5, ty = "in")
    Condition
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, type)
      i Use instead: migration_fixture(graph, n, type = )

---

    Code
      x <- migration_fixture("g", 5, dir = TRUE)
    Condition
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, directed)
      i Use instead: migration_fixture(graph, n, directed = )

# error message snapshots

    Code
      migration_fixture("g", 5, weig = 1)
    Condition
      Error in `migration_fixture()`:
      ! Argument `weig` matches multiple arguments of `migration_fixture()`.

---

    Code
      migration_fixture("g", 5, foo = 1)
    Condition
      Error in `migration_fixture()`:
      ! Unexpected argument passed to `migration_fixture()`: `foo`.
      i Arguments after `...` must be spelled out in full.

---

    Code
      migration_fixture("g", 5, 1:3, weights = 9)
    Condition
      Error in `migration_fixture()`:
      ! Argument `weights` of `migration_fixture()` was supplied more than once.
      i Pass it exactly once, by its new name `weights`.

---

    Code
      migration_fixture("g", 5, 1, 2, 3, 4)
    Condition
      Error in `migration_fixture()`:
      ! Too many arguments passed to `migration_fixture()`.

