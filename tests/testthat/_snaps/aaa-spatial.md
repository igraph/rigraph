# convex_hull_2d_impl basic

    Code
      convex_hull_2d_impl(data = matrix(1:6, ncol = 2))
    Output
      $resverts
      [1] 1 3
      
      $rescoords
           [,1] [,2]
      [1,]    1    4
      [2,]    3    6
      

# convex_hull_2d_impl errors

    Code
      convex_hull_2d_impl(data = "a")
    Condition
      Warning in `convex_hull_2d_impl()`:
      NAs introduced by coercion
      Error in `convex_hull_2d_impl()`:
      ! REAL() can only be applied to a 'numeric', not a 'character'

