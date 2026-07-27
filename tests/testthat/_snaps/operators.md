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

