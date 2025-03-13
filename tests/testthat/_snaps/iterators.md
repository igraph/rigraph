# printing connected vs/es works

    Code
      vs
    Output
      + 10/10 vertices:
       [1]  1  2  3  4  5  6  7  8  9 10
    Code
      es
    Output
      + 10/10 edges:
       [1] 1-- 2 2-- 3 3-- 4 4-- 5 5-- 6 6-- 7 7-- 8 8-- 9 9--10 1--10
    Code
      vs[1:5]
    Output
      + 5/10 vertices:
      [1] 1 2 3 4 5
    Code
      es[1:5]
    Output
      + 5/10 edges:
      [1] 1--2 2--3 3--4 4--5 5--6
    Code
      vs[numeric()]
    Output
      + 0/10 vertices:

---

    Code
      es[numeric()]
    Output
      + 0/10 edges:

# printing named connected vs/es works

    Code
      vs
    Output
      + 10/10 vertices, named:
       [1] a b c d e f g h i j
    Code
      es
    Output
      + 10/10 edges (vertex names):
       [1] a--b b--c c--d d--e e--f f--g g--h h--i i--j a--j
    Code
      vs[1:5]
    Output
      + 5/10 vertices, named:
      [1] a b c d e
    Code
      es[1:5]
    Output
      + 5/10 edges (vertex names):
      [1] a--b b--c c--d d--e e--f
    Code
      vs[numeric()]
    Output
      + 0/10 vertices, named:

---

    Code
      es[numeric()]
    Output
      + 0/10 edges (vertex names):

# printing unconnected vs/es works

    Code
      vs
    Output
      + 10/? vertices (deleted):
       [1]  1  2  3  4  5  6  7  8  9 10
    Code
      es
    Output
      + 10/? edges (deleted):
       [1]  1  2  3  4  5  6  7  8  9 10

---

    Code
      vs
    Output
      + 10/? vertices (deleted):
       [1]  1  2  3  4  5  6  7  8  9 10
    Code
      es
    Output
      + 10/? edges (deleted) (vertex names):
       [1] a|b b|c c|d d|e e|f f|g g|h h|i i|j a|j

# logical indices are not recycled

    Code
      V(g)[c(TRUE, FALSE)]
    Condition
      Error in `FUN()`:
      ! Error: Logical index length does not match the number of vertices. Recycling is not allowed.

---

    Code
      E(g)[c(TRUE, FALSE)]
    Condition
      Error in `FUN()`:
      ! Error: Logical index length does not match the number of edges. Recycling is not allowed.

