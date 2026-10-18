# head args go through base R partial matching, not our recovery

    Code
      migration_fixture(gr = "G", n = 5)
    Condition
      Warning in `migration_fixture()`:
      partial argument match of 'gr' to 'graph'
    Output
      $graph
      [1] "G"
      
      $n
      [1] 5
      
      $weights
      NULL
      
      $type
      [1] "out"
      
      $directed
      [1] FALSE
      

---

    Code
      migration_fixture(g = "G", 5, kind = "in")
    Condition
      Warning in `migration_fixture()`:
      partial argument match of 'g' to 'graph'
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, kind)
      i Use instead: migration_fixture(graph, n, type = )
    Output
      $graph
      [1] "G"
      
      $n
      [1] 5
      
      $weights
      NULL
      
      $type
      [1] "in"
      
      $directed
      [1] FALSE
      

# empty argument slot messages

    Code
      migration_fixture("g", 5, )
    Output
      $graph
      [1] "g"
      
      $n
      [1] 5
      
      $weights
      NULL
      
      $type
      [1] "out"
      
      $directed
      [1] FALSE
      

---

    Code
      migration_fixture("g", 5, , "in", TRUE)
    Condition
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, kind, directed)
      i Use instead: migration_fixture(graph, n, type = , directed = )
    Output
      $graph
      [1] "g"
      
      $n
      [1] 5
      
      $weights
      NULL
      
      $type
      [1] "in"
      
      $directed
      [1] TRUE
      

---

    Code
      migration_fixture("g", 5, , , TRUE)
    Condition
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, directed)
      i Use instead: migration_fixture(graph, n, directed = )
    Output
      $graph
      [1] "g"
      
      $n
      [1] 5
      
      $weights
      NULL
      
      $type
      [1] "out"
      
      $directed
      [1] TRUE
      

---

    Code
      migration_fixture("g", 5, kind = , 1:3)
    Condition
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, weight)
      i Use instead: migration_fixture(graph, n, weights = )
    Output
      $graph
      [1] "g"
      
      $n
      [1] 5
      
      $weights
      [1] 1 2 3
      
      $type
      [1] "out"
      
      $directed
      [1] FALSE
      

# a slot past the last recoverable one is surplus, empty or not

    Code
      migration_fixture("g", 5, 1, 2, 3, )
    Condition
      Error in `migration_fixture()`:
      ! Too many arguments passed to `migration_fixture()`.

# forbidden prefixes error only when legacy arguments engage recovery

    Code
      migration_fixture_prefix(c(2, 2), 0.5, di = 2)
    Condition
      Error in `migration_fixture_prefix()`:
      ! Argument `di` matches multiple formal arguments of `migration_fixture_prefix()`.
      i Spell out the full argument name.

# recovery deprecation messages

    Code
      migration_fixture("g", 5, 1:3, "in", TRUE)
    Condition
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, weight, kind, directed)
      i Use instead: migration_fixture(graph, n, weights = , type = , directed = )
    Output
      $graph
      [1] "g"
      
      $n
      [1] 5
      
      $weights
      [1] 1 2 3
      
      $type
      [1] "in"
      
      $directed
      [1] TRUE
      

---

    Code
      migration_fixture("g", 5, 1:3)
    Condition
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, weight)
      i Use instead: migration_fixture(graph, n, weights = )
    Output
      $graph
      [1] "g"
      
      $n
      [1] 5
      
      $weights
      [1] 1 2 3
      
      $type
      [1] "out"
      
      $directed
      [1] FALSE
      

---

    Code
      migration_fixture("g", 5, weight = 1:3)
    Condition
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, weight)
      i Use instead: migration_fixture(graph, n, weights = )
    Output
      $graph
      [1] "g"
      
      $n
      [1] 5
      
      $weights
      [1] 1 2 3
      
      $type
      [1] "out"
      
      $directed
      [1] FALSE
      

---

    Code
      migration_fixture("g", 5, kind = "in")
    Condition
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, kind)
      i Use instead: migration_fixture(graph, n, type = )
    Output
      $graph
      [1] "g"
      
      $n
      [1] 5
      
      $weights
      NULL
      
      $type
      [1] "in"
      
      $directed
      [1] FALSE
      

---

    Code
      migration_fixture("g", 5, kin = "in")
    Condition
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, kind)
      i Use instead: migration_fixture(graph, n, type = )
    Output
      $graph
      [1] "g"
      
      $n
      [1] 5
      
      $weights
      NULL
      
      $type
      [1] "in"
      
      $directed
      [1] FALSE
      

---

    Code
      migration_fixture("g", 5, dir = TRUE)
    Condition
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, directed)
      i Use instead: migration_fixture(graph, n, directed = )
    Output
      $graph
      [1] "g"
      
      $n
      [1] 5
      
      $weights
      NULL
      
      $type
      [1] "out"
      
      $directed
      [1] TRUE
      

---

    Code
      migration_fixture("g", 5, weig = 1)
    Condition
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, weight)
      i Use instead: migration_fixture(graph, n, weights = )
    Output
      $graph
      [1] "g"
      
      $n
      [1] 5
      
      $weights
      [1] 1
      
      $type
      [1] "out"
      
      $directed
      [1] FALSE
      

---

    Code
      migration_fixture("g", 5, 1:3, dir = TRUE)
    Condition
      Warning:
      Calling `migration_fixture()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture(graph, n, weight, directed)
      i Use instead: migration_fixture(graph, n, weights = , directed = )
    Output
      $graph
      [1] "g"
      
      $n
      [1] 5
      
      $weights
      [1] 1 2 3
      
      $type
      [1] "out"
      
      $directed
      [1] TRUE
      

# error message snapshots

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

# an argument passed at its own default still counts as supplied

    Code
      migration_fixture("g", 5, weights = NULL, 1:3)
    Condition
      Error in `migration_fixture()`:
      ! Argument `weights` of `migration_fixture()` was supplied more than once.
      i Pass it exactly once, by its new name `weights`.

# shadow fixture messages

    Code
      migration_fixture_shadow("g", 1:3)
    Condition
      Warning:
      Calling `migration_fixture_shadow()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture_shadow(graph, attr)
      i Use instead: migration_fixture_shadow(graph, weights = )
    Output
      $graph
      [1] "g"
      
      $weights
      [1] 1 2 3
      
      $names
      [1] TRUE
      
      $c
      NULL
      
      $attr
      
      

---

    Code
      migration_fixture_shadow("g", nam = FALSE)
    Condition
      Warning:
      Calling `migration_fixture_shadow()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture_shadow(graph, names)
      i Use instead: migration_fixture_shadow(graph, names = )
    Output
      $graph
      [1] "g"
      
      $weights
      NULL
      
      $names
      [1] FALSE
      
      $c
      NULL
      
      $attr
      
      

---

    Code
      migration_fixture_shadow("g", 1, 2, 3)
    Condition
      Warning:
      Calling `migration_fixture_shadow()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: migration_fixture_shadow(graph, attr, names, c)
      i Use instead: migration_fixture_shadow(graph, weights = , names = , c = )
    Output
      $graph
      [1] "g"
      
      $weights
      [1] 1
      
      $names
      [1] 2
      
      $c
      [1] 3
      
      $attr
      
      

---

    Code
      migration_fixture_shadow("g", at = "w")
    Condition
      Error in `migration_fixture_shadow()`:
      ! Argument `at` matches multiple arguments of `migration_fixture_shadow()`.

---

    Code
      migration_fixture_shadow("g", foo = 1)
    Condition
      Error in `migration_fixture_shadow()`:
      ! Unexpected argument passed to `migration_fixture_shadow()`: `foo`.
      i Arguments after `...` must be spelled out in full.

---

    Code
      migration_fixture_shadow("g", 1, 2, 3, 4)
    Condition
      Error in `migration_fixture_shadow()`:
      ! Too many arguments passed to `migration_fixture_shadow()`.

---

    Code
      migration_fixture_shadow("g", 1:3, names = FALSE, 9)
    Condition
      Error in `migration_fixture_shadow()`:
      ! Argument `names` of `migration_fixture_shadow()` was supplied more than once.
      i Pass it exactly once, by its new name `names`.

