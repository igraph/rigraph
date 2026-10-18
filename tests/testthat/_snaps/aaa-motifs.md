# motifs_randesu_impl basic

    Code
      motifs_randesu_impl(graph = g)
    Output
      [1] NaN NaN   1   0

---

    Code
      motifs_randesu_impl(graph = g, size = 4, cut_prob = rep(0.1, 4))
    Output
       [1] NaN NaN NaN NaN   0 NaN   0   0   0   0   0

# motifs_randesu_impl errors

    Code
      motifs_randesu_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# motifs_randesu_estimate_impl basic

    Code
      motifs_randesu_estimate_impl(graph = g, size = 3, sample_size = 2)
    Output
      [1] 3

---

    Code
      motifs_randesu_estimate_impl(graph = g, size = 4, cut_prob = rep(0.1, 4),
      sample_size = 2, sample = 1:2)
    Output
      [1] 3

# motifs_randesu_estimate_impl errors

    Code
      motifs_randesu_estimate_impl(graph = NULL, size = 3, sample_size = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# motifs_randesu_no_impl basic

    Code
      motifs_randesu_no_impl(graph = g)
    Output
      [1] 1

---

    Code
      motifs_randesu_no_impl(graph = g, size = 4, cut_prob = c(0.1, 0.1, 0.1, 0.1))
    Output
      [1] 0

# motifs_randesu_no_impl errors

    Code
      motifs_randesu_no_impl(graph = g, size = 3, cut_prob = c(0.1))
    Condition
      Error in `motifs_randesu_no_impl()`:
      ! Cut probability vector size (1) must agree with motif size (3). Invalid value
      Source: <file>:<line>

# dyad_census_impl basic

    Code
      dyad_census_impl(graph = g)
    Output
      $mut
      [1] 2
      
      $asym
      [1] 0
      
      $null
      [1] 1
      

# dyad_census_impl errors

    Code
      dyad_census_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# triad_census_impl basic

    Code
      triad_census_impl(graph = g)
    Condition
      Warning in `triad_census_impl()`:
      Triad census called on an undirected graph. All connections will be treated as mutual.
      Source: misc/motifs.c:1157
    Output
       [1] 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0

# triad_census_impl errors

    Code
      triad_census_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_adjacent_triangles_impl basic

    Code
      count_adjacent_triangles_impl(graph = g)
    Output
      [1] 0 0 0

---

    Code
      count_adjacent_triangles_impl(graph = g, vids = 1:2)
    Output
      [1] 0 0

# count_adjacent_triangles_impl errors

    Code
      count_adjacent_triangles_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_triangles_impl basic

    Code
      count_triangles_impl(graph = g)
    Output
      [1] 0

# count_triangles_impl errors

    Code
      count_triangles_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# list_triangles_impl basic

    Code
      list_triangles_impl(graph = g)
    Output
      + 0/3 vertices:

# list_triangles_impl errors

    Code
      list_triangles_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# motifs_randesu_callback_closure_impl basic

    Code
      cat("Result:\n")
    Output
      Result:
    Code
      print(result)
    Output
      NULL
    Code
      cat("\nNumber of motifs found:", length(motif_data), "\n")
    Output
      
      Number of motifs found: 1 
    Code
      cat("First motif:\n")
    Output
      First motif:
    Code
      print(motif_data[[1]])
    Output
      $vids
      [1] 1 3 2
      
      $isoclass
      [1] 4
      

# motifs_randesu_callback_closure_impl errors

    Code
      motifs_randesu_callback_closure_impl(graph = g, size = 3, cut_prob = NULL,
        callback = "not a function")
    Condition
      Error in `motifs_randesu_callback_closure_impl()`:
      ! `callback` must be a function

