# hrg_fit_impl basic

    Code
      hrg_fit_impl(graph = g1)
    Output
      $left
      [1] -2  0
      
      $right
      [1] 1 2
      
      $prob
      [1] 1 0
      
      $edges
      [1] 2 0
      
      $vertices
      [1] 3 2
      

# hrg_fit_impl errors

    Code
      hrg_fit_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# hrg_sample_impl basic

    Code
      hrg_sample_impl(hrg = hrg_model)
    Output
      IGRAPH U--- 10 45 -- 
      + edges:
       [1] 1-- 2 1-- 3 1-- 4 1-- 5 1-- 6 1-- 7 1-- 8 1-- 9 1--10 2-- 3 2-- 4 2-- 5
      [13] 2-- 6 2-- 7 2-- 8 2-- 9 2--10 3-- 4 3-- 5 3-- 6 3-- 7 3-- 8 3-- 9 3--10
      [25] 4-- 5 4-- 6 4-- 7 4-- 8 4-- 9 4--10 5-- 6 5-- 7 5-- 8 5-- 9 5--10 6-- 7
      [37] 6-- 8 6-- 9 6--10 7-- 8 7-- 9 7--10 8-- 9 8--10 9--10

# hrg_sample_impl errors

    Code
      hrg_sample_impl(hrg = NULL)
    Condition
      Error in `hrg_sample_impl()`:
      ! At <file>:<line>: Assertion failed: n >= 0. This is an unexpected igraph error; please report this as a bug, along with the steps to reproduce it.
      Please restart your R session to avoid crashes or other surprising behavior.

# hrg_sample_many_impl basic

    Code
      hrg_sample_many_impl(hrg = hrg_model, num_samples = 2)
    Output
      [[1]]
      IGRAPH U--- 10 45 -- 
      + edges:
       [1] 1-- 2 1-- 3 1-- 4 1-- 5 1-- 6 1-- 7 1-- 8 1-- 9 1--10 2-- 3 2-- 4 2-- 5
      [13] 2-- 6 2-- 7 2-- 8 2-- 9 2--10 3-- 4 3-- 5 3-- 6 3-- 7 3-- 8 3-- 9 3--10
      [25] 4-- 5 4-- 6 4-- 7 4-- 8 4-- 9 4--10 5-- 6 5-- 7 5-- 8 5-- 9 5--10 6-- 7
      [37] 6-- 8 6-- 9 6--10 7-- 8 7-- 9 7--10 8-- 9 8--10 9--10
      
      [[2]]
      IGRAPH U--- 10 45 -- 
      + edges:
       [1] 1-- 2 1-- 3 1-- 4 1-- 5 1-- 6 1-- 7 1-- 8 1-- 9 1--10 2-- 3 2-- 4 2-- 5
      [13] 2-- 6 2-- 7 2-- 8 2-- 9 2--10 3-- 4 3-- 5 3-- 6 3-- 7 3-- 8 3-- 9 3--10
      [25] 4-- 5 4-- 6 4-- 7 4-- 8 4-- 9 4--10 5-- 6 5-- 7 5-- 8 5-- 9 5--10 6-- 7
      [37] 6-- 8 6-- 9 6--10 7-- 8 7-- 9 7--10 8-- 9 8--10 9--10
      

# hrg_sample_many_impl errors

    Code
      hrg_sample_many_impl(hrg = NULL, num_samples = 2)
    Condition
      Error in `hrg_sample_many_impl()`:
      ! At <file>:<line>: Assertion failed: n >= 0. This is an unexpected igraph error; please report this as a bug, along with the steps to reproduce it.
      Please restart your R session to avoid crashes or other surprising behavior.

# hrg_game_impl basic

    Code
      hrg_game_impl(hrg = hrg_model)
    Output
      IGRAPH U--- 10 45 -- Hierarchical random graph model
      + attr: name (g/c)
      + edges:
       [1] 1-- 2 1-- 3 1-- 4 1-- 5 1-- 6 1-- 7 1-- 8 1-- 9 1--10 2-- 3 2-- 4 2-- 5
      [13] 2-- 6 2-- 7 2-- 8 2-- 9 2--10 3-- 4 3-- 5 3-- 6 3-- 7 3-- 8 3-- 9 3--10
      [25] 4-- 5 4-- 6 4-- 7 4-- 8 4-- 9 4--10 5-- 6 5-- 7 5-- 8 5-- 9 5--10 6-- 7
      [37] 6-- 8 6-- 9 6--10 7-- 8 7-- 9 7--10 8-- 9 8--10 9--10

# hrg_game_impl errors

    Code
      hrg_game_impl(hrg = NULL)
    Condition
      Error in `hrg_game_impl()`:
      ! At <file>:<line>: Assertion failed: n >= 0. This is an unexpected igraph error; please report this as a bug, along with the steps to reproduce it.
      Please restart your R session to avoid crashes or other surprising behavior.

# hrg_consensus_impl errors

    Code
      hrg_consensus_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# hrg_predict_impl errors

    Code
      hrg_predict_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# hrg_create_impl basic

    Code
      hrg_create_impl(graph = g, prob = rep(0.5, 2))
    Output
      Hierarchical random graph, at level 3:
      g1     p=0.5  1
      '- g2  p=0.5  2 3

# hrg_create_impl errors

    Code
      hrg_create_impl(graph = g, prob = 0.5)
    Condition
      Error in `hrg_create_impl()`:
      ! HRG probability vector size (1) should be equal to the number of internal nodes (2). Invalid value
      Source: <file>:<line>

# hrg_resize_impl basic

    Code
      hrg_resize_impl(hrg = hrg_model, newsize = 5)
    Output
      $left
      [1]  0 -9 -6 -2
      
      $right
      [1] -4  4  7 -8
      
      $prob
      [1] 1 1 1 1
      
      $edges
      [1]  9  6  3 14
      
      $vertices
      [1] 10  7  4  9
      

# hrg_resize_impl errors

    Code
      hrg_resize_impl(hrg = -1, newsize = 2)
    Condition
      Error in `hrg_resize_impl()`:
      ! The value nan is not representable as an integer. Invalid value
      Source: <file>:<line>

# hrg_size_impl basic

    Code
      hrg_size_impl(hrg = hrg_model)
    Output
      [1] 10

# hrg_size_impl errors

    Code
      hrg_size_impl(hrg = -1)
    Condition
      Error in `hrg_size_impl()`:
      ! The value nan is not representable as an integer. Invalid value
      Source: <file>:<line>

# from_hrg_dendrogram_impl basic

    Code
      from_hrg_dendrogram_impl(hrg = hrg_model)
    Output
      $graph
      IGRAPH D--- 19 18 -- 
      + edges:
       [1] 11-> 1 11->14 12->19 12-> 5 13->16 13-> 8 14->12 14->18 15-> 3 15-> 6
      [11] 16->15 16->10 17->13 17-> 4 18-> 7 18-> 9 19-> 2 19->17
      
      $prob
       [1] NaN NaN NaN NaN NaN NaN NaN NaN NaN NaN   1   1   1   1   1   1   1   1   1
      

# from_hrg_dendrogram_impl errors

    Code
      from_hrg_dendrogram_impl(hrg = -1)
    Condition
      Error in `from_hrg_dendrogram_impl()`:
      ! The value nan is not representable as an integer. Invalid value
      Source: <file>:<line>

