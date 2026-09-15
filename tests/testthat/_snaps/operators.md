# vertices() works

    Can't recycle `name` (size 2) to match `foo` (size 3).

---

    Cannot add named vertices to a non-empty unnamed graph. Existing vertices will have `NA` names.

---

    Code
      make_empty_graph(1) + vertices("a", "b", foo = 5:7)
    Condition
      Error:
      ! Cannot add named vertices to a non-empty unnamed graph. Existing vertices will have `NA` names.

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

# adding named vertices to non-empty unnamed graphs errors

    Cannot add named vertices to a non-empty unnamed graph. Existing vertices will have `NA` names.

---

    Cannot add named vertices to a non-empty unnamed graph. Existing vertices will have `NA` names.

---

    Cannot add named vertices to a non-empty unnamed graph. Existing vertices will have `NA` names.

---

    Cannot add named vertices to a non-empty unnamed graph. Existing vertices will have `NA` names.

---

    Cannot add named vertices to a non-empty unnamed graph. Existing vertices will have `NA` names.

---

    Cannot add named vertices to a non-empty unnamed graph. Existing vertices will have `NA` names.

