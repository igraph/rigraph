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

# mycielskian() errors

    Code
      mycielskian(make_ring(3), k = -1)
    Condition
      Error in `mycielskian_impl()`:
      ! The number of Mycielski iterations must not be negative. Invalid value
      Source: <file>:<line>

---

    Code
      mycielskian(make_ring(3), 2, TRUE)
    Condition
      Error in `mycielskian()`:
      ! `...` must be empty.
      x Problematic argument:
      * ..1 = TRUE
      i Did you forget to name an argument?

