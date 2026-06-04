# printing connected vs/es works

    Code
      vs
    Output
      -- <vertex sequence> 10/10 -----------------------------------------------------
       [1]  1  2  3  4  5  6  7  8  9 10
    Code
      es
    Output
      -- <edge sequence> 10/10 -------------------------------------------------------
       [1] 1 -- 2   2 -- 3   3 -- 4   4 -- 5   5 -- 6   6 -- 7   7 -- 8   8 -- 9  
       [9] 9 -- 10  1 -- 10 
    Code
      vs[1:5]
    Output
      -- <vertex sequence> 5/10 ------------------------------------------------------
      [1] 1 2 3 4 5
    Code
      es[1:5]
    Output
      -- <edge sequence> 5/10 --------------------------------------------------------
      [1] 1 -- 2  2 -- 3  3 -- 4  4 -- 5  5 -- 6 
    Code
      vs[numeric()]
    Output
      -- <vertex sequence> 0/10 ------------------------------------------------------

---

    Code
      es[numeric()]
    Output
      -- <edge sequence> 0/10 --------------------------------------------------------

# printing named connected vs/es works

    Code
      vs
    Output
      -- <vertex sequence> 10/10 * named ---------------------------------------------
       [1] a b c d e f g h i j
    Code
      es
    Output
      -- <edge sequence> 10/10 * vertex names ----------------------------------------
       [1] a -- b  b -- c  c -- d  d -- e  e -- f  f -- g  g -- h  h -- i  i -- j 
      [10] a -- j 
    Code
      vs[1:5]
    Output
      -- <vertex sequence> 5/10 * named ----------------------------------------------
      [1] a b c d e
    Code
      es[1:5]
    Output
      -- <edge sequence> 5/10 * vertex names -----------------------------------------
      [1] a -- b  b -- c  c -- d  d -- e  e -- f 
    Code
      vs[numeric()]
    Output
      -- <vertex sequence> 0/10 * named ----------------------------------------------

---

    Code
      es[numeric()]
    Output
      -- <edge sequence> 0/10 * vertex names -----------------------------------------

# printing unconnected vs/es works

    Code
      vs
    Output
      -- <vertex sequence> 10/? * deleted --------------------------------------------
       [1]  1  2  3  4  5  6  7  8  9 10
    Code
      es
    Output
      -- <edge sequence> 10/? * deleted ----------------------------------------------
       [1]  1  2  3  4  5  6  7  8  9 10

---

    Code
      vs
    Output
      -- <vertex sequence> 10/? * deleted --------------------------------------------
       [1]  1  2  3  4  5  6  7  8  9 10
    Code
      es
    Output
      -- <edge sequence> 10/? * vertex names * deleted -------------------------------
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

