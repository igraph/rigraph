# even_tarjan_reduction_impl basic

    Code
      even_tarjan_reduction_impl(graph = g)
    Output
      $graphbar
      IGRAPH D--- 6 7 -- 
      + edges:
      [1] 1->4 2->5 3->6 5->1 4->2 6->2 5->3
      
      $capacity
      [1] 1 1 1 3 3 3 3
      

# even_tarjan_reduction_impl errors

    Code
      even_tarjan_reduction_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_separator_impl basic

    Code
      is_separator_impl(graph = g, candidate = 1:2)
    Output
      [1] FALSE

# is_separator_impl errors

    Code
      is_separator_impl(graph = NULL, candidate = 1:2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_minimal_separator_impl basic

    Code
      is_minimal_separator_impl(graph = g, candidate = 1:2)
    Output
      [1] FALSE

# is_minimal_separator_impl errors

    Code
      is_minimal_separator_impl(graph = NULL, candidate = 1:2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# all_minimal_st_separators_impl basic

    Code
      all_minimal_st_separators_impl(graph = g)
    Output
      [[1]]
      + 1/3 vertex:
      [1] 2
      

# all_minimal_st_separators_impl errors

    Code
      all_minimal_st_separators_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# minimum_size_separators_impl basic

    Code
      minimum_size_separators_impl(graph = g)
    Output
      [[1]]
      + 1/3 vertex:
      [1] 2
      

# minimum_size_separators_impl errors

    Code
      minimum_size_separators_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

