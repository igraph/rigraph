# erdos_renyi_game_gnp_impl basic

    Code
      erdos_renyi_game_gnp_impl(n = 5, p = 0.5)
    Output
      IGRAPH U--- 5 7 -- 
      + edges:
      [1] 1--2 1--3 2--3 1--4 2--4 1--5 4--5

---

    Code
      erdos_renyi_game_gnp_impl(n = 5, p = 0.5, directed = TRUE, loops = TRUE)
    Output
      IGRAPH D--- 5 12 -- 
      + edges:
       [1] 2->1 3->1 4->1 2->2 1->3 2->3 4->3 1->4 2->4 5->4 3->5 4->5

# erdos_renyi_game_gnp_impl errors

    Code
      erdos_renyi_game_gnp_impl(n = -1, p = 0.5)
    Condition
      Error in `erdos_renyi_game_gnp_impl()`:
      ! Invalid number of vertices. Invalid value
      Source: <file>:<line>

# erdos_renyi_game_gnm_impl basic

    Code
      erdos_renyi_game_gnm_impl(n = 5, m = 3)
    Output
      IGRAPH U--- 5 3 -- 
      + edges:
      [1] 3--4 2--5 4--5

---

    Code
      erdos_renyi_game_gnm_impl(n = 5, m = 3, directed = TRUE, loops = TRUE)
    Output
      IGRAPH D--- 5 3 -- 
      + edges:
      [1] 4->3 5->3 3->5

# erdos_renyi_game_gnm_impl errors

    Code
      erdos_renyi_game_gnm_impl(n = -1, m = 3)
    Condition
      Error in `erdos_renyi_game_gnm_impl()`:
      ! Invalid number of vertices. Invalid value
      Source: <file>:<line>

# growing_random_game_impl basic

    Code
      growing_random_game_impl(n = 5, m = 2)
    Output
      IGRAPH D--- 5 8 -- Growing random graph
      + attr: name (g/c), m (g/n), citation (g/l)
      + edges:
      [1] 2->2 1->2 3->3 3->3 3->3 1->2 2->2 5->4

---

    Code
      growing_random_game_impl(n = 5, m = 2, directed = FALSE, citation = TRUE)
    Output
      IGRAPH U--- 5 8 -- Growing random graph
      + attr: name (g/c), m (g/n), citation (g/l)
      + edges:
      [1] 1--2 1--2 2--3 1--3 1--4 2--4 1--5 4--5

---

    Code
      growing_random_game_impl(n = 10, m = 1, directed = TRUE, citation = FALSE)
    Output
      IGRAPH D--- 10 9 -- Growing random graph
      + attr: name (g/c), m (g/n), citation (g/l)
      + edges:
      [1] 2->2 2->3 4->4 4->4 3->2 1->3 1->8 5->6 5->4

# growing_random_game_impl errors

    Code
      growing_random_game_impl(n = -1, m = 2)
    Condition
      Error in `growing_random_game_impl()`:
      ! Invalid number of vertices. Invalid value
      Source: <file>:<line>

# preference_game_impl basic

    Code
      preference_game_impl(nodes = 5, types = 2, type_dist = c(0.5, 0.5),
      fixed_sizes = FALSE, pref_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2))
    Output
      $graph
      IGRAPH U--- 5 4 -- 
      + edges:
      [1] 1--3 3--4 1--4 1--5
      
      $node_type_vec
      [1] 1 0 0 1 1
      

# preference_game_impl errors

    Code
      preference_game_impl(nodes = -1, types = 2, type_dist = c(0.5, 0.5),
      fixed_sizes = FALSE, pref_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2))
    Condition
      Error in `preference_game_impl()`:
      ! The number of vertices must be non-negative. Invalid value
      Source: <file>:<line>

# asymmetric_preference_game_impl basic

    Code
      asymmetric_preference_game_impl(nodes = 5, out_types = 2, in_types = 2,
        type_dist_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2), pref_matrix = matrix(
          c(0.5, 0.5, 0.5, 0.5), 2, 2))
    Output
      $graph
      IGRAPH D--- 5 9 -- 
      + edges:
      [1] 2->4 4->2 5->2 1->3 4->3 4->5 3->1 1->4 1->5
      
      $node_type_out_vec
      [1] 1 0 1 1 1
      
      $node_type_in_vec
      [1] 1 0 0 1 1
      

# asymmetric_preference_game_impl errors

    Code
      asymmetric_preference_game_impl(nodes = -1, out_types = 2, in_types = 2,
        type_dist_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2), pref_matrix = matrix(
          c(0.5, 0.5, 0.5, 0.5), 2, 2))
    Condition
      Error in `asymmetric_preference_game_impl()`:
      ! The number of vertices must not be negative. Invalid value
      Source: <file>:<line>

# rewire_edges_impl basic

    Code
      rewire_edges_impl(graph = g, prob = 0.5)
    Output
      IGRAPH U--- 5 4 -- 
      + edges:
      [1] 2--4 3--4 1--3 2--5

# rewire_edges_impl errors

    Code
      rewire_edges_impl(graph = NULL, prob = 0.5)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# rewire_directed_edges_impl basic

    Code
      rewire_directed_edges_impl(graph = g, prob = 0.5)
    Output
      IGRAPH D--- 5 4 -- 
      + edges:
      [1] 1->4 2->3 3->2 4->5

# rewire_directed_edges_impl errors

    Code
      rewire_directed_edges_impl(graph = NULL, prob = 0.5)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# forest_fire_game_impl basic

    Code
      forest_fire_game_impl(nodes = 5, fw_prob = 0.5)
    Output
      IGRAPH D--- 5 9 -- Forest fire model
      + attr: name (g/c), fw_prob (g/n), bw_factor (g/n), ambs (g/n)
      + edges:
      [1] 2->1 3->2 4->2 4->1 4->3 5->1 5->2 5->4 5->3

---

    Code
      forest_fire_game_impl(nodes = 5, fw_prob = 0.5, bw_factor = 0.2, ambs = 2,
        directed = FALSE)
    Output
      IGRAPH U--- 5 4 -- Forest fire model
      + attr: name (g/c), fw_prob (g/n), bw_factor (g/n), ambs (g/n)
      + edges:
      [1] 1--2 1--3 1--4 4--5

# forest_fire_game_impl errors

    Code
      forest_fire_game_impl(nodes = -1, fw_prob = 0.5)
    Condition
      Error in `forest_fire_game_impl()`:
      ! Insufficient memory for forest fire model. Out of memory
      Source: <file>:<line>

# simple_interconnected_islands_game_impl basic

    Code
      simple_interconnected_islands_game_impl(islands_n = 2, islands_size = 3,
        islands_pin = 0.5, n_inter = 1)
    Output
      IGRAPH U--- 6 5 -- Interconnected islands model
      + attr: name (g/c), islands_n (g/n), islands_size (g/n), islands_pin
      | (g/n), n_inter (g/n)
      + edges:
      [1] 1--2 1--3 2--3 3--6 5--6

# simple_interconnected_islands_game_impl errors

    Code
      simple_interconnected_islands_game_impl(islands_n = -1, islands_size = 3,
        islands_pin = 0.5, n_inter = 1)
    Condition
      Error in `simple_interconnected_islands_game_impl()`:
      ! Number of islands cannot be negative, got -1. Invalid value
      Source: <file>:<line>

# chung_lu_game_impl basic

    Code
      chung_lu_game_impl(out_weights = c(2, 2, 2))
    Output
      IGRAPH U--- 3 5 -- Chung-Lu model
      + attr: name (g/c), variant (g/n)
      + edges:
      [1] 1--2 1--3 2--2 2--3 3--3

---

    Code
      chung_lu_game_impl(out_weights = c(1, 2, 3), in_weights = c(1, 2, 3), loops = FALSE,
      variant = "maxent")
    Output
      IGRAPH D--- 3 1 -- Chung-Lu model
      + attr: name (g/c), variant (g/n)
      + edge:
      [1] 3->1

# chung_lu_game_impl errors

    Code
      chung_lu_game_impl(out_weights = -1)
    Condition
      Error in `chung_lu_game_impl()`:
      ! Vertex weights must not be negative in Chung-Lu model, got -1. Invalid value
      Source: <file>:<line>

# static_fitness_game_impl basic

    Code
      static_fitness_game_impl(no_of_edges = 3, fitness_out = c(1, 2, 3))
    Output
      IGRAPH U--- 3 3 -- Static fitness model
      + attr: name (g/c), loops (g/l), multiple (g/l)
      + edges:
      [1] 1--2 1--3 2--3

---

    Code
      static_fitness_game_impl(no_of_edges = 3, fitness_out = c(1, 2, 3), fitness_in = c(
        1, 2, 3), loops = TRUE, multiple = TRUE)
    Output
      IGRAPH D--- 3 3 -- Static fitness model
      + attr: name (g/c), loops (g/l), multiple (g/l)
      + edges:
      [1] 1->2 2->3 1->3

# static_fitness_game_impl errors

    Code
      static_fitness_game_impl(no_of_edges = -1, fitness_out = c(1, 2, 3))
    Condition
      Error in `static_fitness_game_impl()`:
      ! Number of edges cannot be negative, got -1. Invalid value
      Source: <file>:<line>

# static_power_law_game_impl basic

    Code
      static_power_law_game_impl(no_of_nodes = 5, no_of_edges = 4, exponent_out = 2.5)
    Output
      IGRAPH U--- 5 4 -- Static power law model
      + attr: name (g/c), exponent_out (g/n), exponent_in (g/n), loops (g/l),
      | multiple (g/l), finite_size_correction (g/l)
      + edges:
      [1] 1--5 2--4 3--5 4--5

---

    Code
      static_power_law_game_impl(no_of_nodes = 5, no_of_edges = 4, exponent_out = 2.5,
        exponent_in = 2, loops = TRUE, multiple = TRUE, finite_size_correction = FALSE)
    Output
      IGRAPH D--- 5 4 -- Static power law model
      + attr: name (g/c), exponent_out (g/n), exponent_in (g/n), loops (g/l),
      | multiple (g/l), finite_size_correction (g/l)
      + edges:
      [1] 1->1 3->5 1->4 5->1

# static_power_law_game_impl errors

    Code
      static_power_law_game_impl(no_of_nodes = -1, no_of_edges = 4, exponent_out = 2.5)
    Condition
      Error in `static_power_law_game_impl()`:
      ! Number of nodes cannot be negative, got -1. Invalid value
      Source: <file>:<line>

# k_regular_game_impl basic

    Code
      k_regular_game_impl(no_of_nodes = 5, k = 2)
    Output
      IGRAPH U--- 5 5 -- k-regular graph
      + attr: name (g/c), k (g/n)
      + edges:
      [1] 1--3 1--5 2--3 2--4 4--5

---

    Code
      k_regular_game_impl(no_of_nodes = 5, k = 2, directed = TRUE, multiple = TRUE)
    Output
      IGRAPH D--- 5 10 -- k-regular graph
      + attr: name (g/c), k (g/n)
      + edges:
       [1] 3->4 3->3 2->1 5->5 1->5 4->3 5->2 4->1 1->2 2->4

# k_regular_game_impl errors

    Code
      k_regular_game_impl(no_of_nodes = -1, k = 2)
    Condition
      Error in `k_regular_game_impl()`:
      ! Number of nodes must be non-negative. Invalid value
      Source: <file>:<line>

# sbm_game_impl basic

    Code
      sbm_game_impl(n = 5, pref_matrix = matrix(0.5, 2, 2), block_sizes = c(2, 3))
    Output
      IGRAPH U--- 5 6 -- Stochastic block model
      + attr: name (g/c), loops (g/l)
      + edges:
      [1] 1--2 1--3 2--3 1--4 1--5 3--5

---

    Code
      sbm_game_impl(n = 5, pref_matrix = matrix(0.5, 2, 2), block_sizes = c(2, 3),
      directed = TRUE, loops = TRUE)
    Output
      IGRAPH D--- 5 14 -- Stochastic block model
      + attr: name (g/c), loops (g/l)
      + edges:
       [1] 1->1 2->1 2->4 1->5 4->1 5->1 5->2 3->3 5->3 3->4 4->4 5->4 3->5 5->5

# sbm_game_impl errors

    Code
      sbm_game_impl(n = -1, pref_matrix = matrix(0.5, 2, 2), block_sizes = c(2, 3))
    Condition
      Error in `sbm_game_impl()`:
      ! Sum of the block sizes (5) must equal the number of vertices (-1). Invalid value
      Source: <file>:<line>

# hsbm_game_impl basic

    Code
      hsbm_game_impl(n = 6, m = 2, rho = c(0.5, 0.5), C = matrix(1, 2, 2), p = 0.5)
    Output
      IGRAPH U--- 6 9 -- Hierarchical stochastic block model
      + attr: name (g/c), m (g/n), rho (g/n), C (g/n), p (g/n)
      + edges:
      [1] 1--2 3--4 5--6 1--4 1--5 2--5 1--6 4--5 3--6

# hsbm_game_impl errors

    Code
      hsbm_game_impl(n = -1, m = 2, rho = 0.5, C = matrix(1, 2, 2), p = 0.5)
    Condition
      Error in `hsbm_game_impl()`:
      ! `n' must be positive for HSBM. Invalid value
      Source: <file>:<line>

# hsbm_list_game_impl basic

    Code
      hsbm_list_game_impl(n = 100, mlist = list(50, 50), rholist = list(c(3, 3, 4) /
        10), Clist = list(C), p = 1 / 20)
    Output
      IGRAPH U--- 100 783 -- Hierarchical stochastic block model
      + attr: name (g/c), p (g/n)
      + edges:
       [1]  1-- 2  1-- 3  2-- 3  1-- 4  2-- 4  3-- 4  1-- 5  2-- 5  3-- 5  4-- 5
      [11]  1-- 6  2-- 6  3-- 6  4-- 6  5-- 6  1-- 7  2-- 7  3-- 7  4-- 7  5-- 7
      [21]  6-- 7  1-- 8  2-- 8  3-- 8  4-- 8  5-- 8  6-- 8  7-- 8  1-- 9  2-- 9
      [31]  3-- 9  4-- 9  5-- 9  6-- 9  7-- 9  8-- 9  1--10  2--10  3--10  4--10
      [41]  5--10  6--10  7--10  8--10  9--10  1--11  2--11  3--11  4--11  5--11
      [51]  6--11  7--11  8--11  9--11 10--11  1--12  2--12  3--12  4--12  5--12
      [61]  6--12  7--12  8--12  9--12 10--12 11--12  1--13  2--13  3--13  4--13
      [71]  5--13  6--13  7--13  8--13  9--13 10--13 11--13 12--13  1--14  2--14
      + ... omitted several edges

# hsbm_list_game_impl errors

    Code
      hsbm_list_game_impl(n = -1, mlist = c(2, 3), rholist = list(0.5, 0.5), Clist = list(
        matrix(1, 2, 2), matrix(1, 2, 2)), p = 0.5)
    Condition
      Error in `hsbm_list_game_impl()`:
      ! `n' must be positive for HSBM. Invalid value
      Source: <file>:<line>

# correlated_game_impl basic

    Code
      correlated_game_impl(old_graph = g, corr = 0.5)
    Output
      IGRAPH U--- 5 3 -- Correlated random graph
      + attr: name (g/c), corr (g/n), p (g/n)
      + edges:
      [1] 1--3 3--4 2--5

# correlated_game_impl errors

    Code
      correlated_game_impl(old_graph = NULL, corr = 0.5)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# correlated_pair_game_impl basic

    Code
      correlated_pair_game_impl(n = 5, corr = 0.5, p = 0.5)
    Output
      $graph1
      IGRAPH U--- 5 7 -- 
      + edges:
      [1] 1--2 1--3 2--3 1--4 2--4 1--5 4--5
      
      $graph2
      IGRAPH U--- 5 7 -- 
      + edges:
      [1] 1--2 1--3 2--3 1--4 2--4 1--5 3--5
      

---

    Code
      correlated_pair_game_impl(n = 5, corr = 0.5, p = 0.5, directed = TRUE)
    Output
      $graph1
      IGRAPH D--- 5 10 -- 
      + edges:
       [1] 4->1 5->1 2->5 4->2 5->2 3->5 1->4 2->4 4->5 5->4
      
      $graph2
      IGRAPH D--- 5 9 -- 
      + edges:
      [1] 1->5 2->1 2->5 4->2 4->3 1->4 2->4 4->5 5->4
      

# correlated_pair_game_impl errors

    Code
      correlated_pair_game_impl(n = -1, corr = 0.5, p = 0.5)
    Condition
      Error in `correlated_pair_game_impl()`:
      ! Invalid number of vertices. Invalid value
      Source: <file>:<line>

# dot_product_game_impl basic

    Code
      dot_product_game_impl(vecs = matrix(0.5, 5, 2))
    Condition
      Warning in `dot_product_game_impl()`:
      Greater than 1 connection probability in dot-product graph.
      Source: games/dotproduct.c:90
    Output
      IGRAPH U--- 2 1 -- 
      + edge:
      [1] 1--2

---

    Code
      dot_product_game_impl(vecs = matrix(0.5, 5, 2), directed = TRUE)
    Condition
      Warning in `dot_product_game_impl()`:
      Greater than 1 connection probability in dot-product graph.
      Source: games/dotproduct.c:90
    Output
      IGRAPH D--- 2 2 -- 
      + edges:
      [1] 1->2 2->1

# dot_product_game_impl errors

    Code
      dot_product_game_impl(vecs = NULL)
    Condition
      Error in `dot_product_game_impl()`:
      ! REAL() can only be applied to a 'numeric', not a 'NULL'

# sample_sphere_surface_impl basic

    Code
      sample_sphere_surface_impl(dim = 3, n = 5)
    Output
                 [,1]      [,2]      [,3]      [,4]       [,5]
      [1,] 0.87877523 0.8206548 0.1430028 0.6349227 0.99933629
      [2,] 0.05165973 0.5261159 0.1145481 0.2979741 0.02649327
      [3,] 0.47443162 0.2229974 0.9830712 0.7128005 0.02500179

---

    Code
      sample_sphere_surface_impl(dim = 3, n = 5, radius = 2, positive = FALSE)
    Output
                 [,1]       [,2]       [,3]        [,4]     [,5]
      [1,] -0.4904253 -1.4825368 -0.5141332  1.95644246 0.369407
      [2,] -1.6787252  1.1329528 -0.7872709 -0.41498660 1.953509
      [3,] -0.9702395  0.7200713  1.7651832 -0.01090904 0.217584

# sample_sphere_surface_impl errors

    Code
      sample_sphere_surface_impl(dim = -1, n = 5)
    Condition
      Error in `sample_sphere_surface_impl()`:
      ! Sphere must be at least two dimensional to sample from surface. Invalid value
      Source: <file>:<line>

# sample_sphere_volume_impl basic

    Code
      sample_sphere_volume_impl(dim = 3, n = 5)
    Output
                 [,1]      [,2]       [,3]      [,4]       [,5]
      [1,] 0.67165090 0.6105364 0.09806950 0.4132698 0.73325518
      [2,] 0.03948371 0.3914105 0.07855561 0.1939507 0.01943923
      [3,] 0.36260970 0.1659017 0.67417787 0.4639603 0.01834487

---

    Code
      sample_sphere_volume_impl(dim = 3, n = 5, radius = 2, positive = FALSE)
    Output
                   [,1]       [,2]       [,3]      [,4]       [,5]
      [1,]  1.903629152 -1.3795904 -1.2061886 0.9035986 -1.1692436
      [2,] -0.159619927  0.2402815 -0.1258477 0.1842403 -1.4940836
      [3,]  0.003829883  1.2440192  0.6204597 1.5776103  0.4096058

# sample_sphere_volume_impl errors

    Code
      sample_sphere_volume_impl(dim = -1, n = 5)
    Condition
      Error in `sample_sphere_volume_impl()`:
      ! Sphere must be at least two dimensional to sample from surface. Invalid value
      Source: <file>:<line>

# sample_dirichlet_impl basic

    Code
      sample_dirichlet_impl(n = 5, alpha = c(1, 1, 1))
    Output
                [,1]      [,2]       [,3]      [,4]      [,5]
      [1,] 0.6298008 0.4168413 0.29594281 0.2432340 0.1516815
      [2,] 0.1093984 0.3461600 0.08924333 0.4251328 0.3561426
      [3,] 0.2608008 0.2369988 0.61481386 0.3316331 0.4921759

# sample_dirichlet_impl errors

    Code
      sample_dirichlet_impl(n = -1, alpha = c(1, 1, 1))
    Condition
      Error in `sample_dirichlet_impl()`:
      ! Number of samples should be non-negative, got -1. Invalid value
      Source: <file>:<line>

# tree_game_impl basic

    Code
      tree_game_impl(n = 3)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 2--3 1--2

---

    Code
      tree_game_impl(n = 3, directed = TRUE, method = "lerw")
    Output
      IGRAPH D--- 3 2 -- 
      + edges:
      [1] 3->1 1->2

# tree_game_impl errors

    Code
      tree_game_impl(n = "a")
    Condition
      Warning in `tree_game_impl()`:
      NAs introduced by coercion
      Error in `tree_game_impl()`:
      ! The value nan is not representable as an integer. Invalid value
      Source: <file>:<line>

# barabasi_game_impl basic

    Code
      barabasi_game_impl(n = 10, power = 1, m = 2, directed = FALSE, algo = "bag")
    Output
      IGRAPH U--- 10 18 -- 
      + edges:
       [1] 1-- 2 1-- 2 2-- 3 1-- 3 2-- 4 2-- 4 2-- 5 2-- 5 4-- 6 2-- 6 2-- 7 1-- 7
      [13] 3-- 8 2-- 8 8-- 9 5-- 9 6--10 5--10

---

    Code
      barabasi_game_impl(n = 10, power = 1, m = 2, directed = FALSE, algo = "psumtree")
    Output
      IGRAPH U--- 10 17 -- 
      + edges:
       [1] 1-- 2 1-- 3 2-- 3 1-- 4 2-- 4 2-- 5 4-- 5 1-- 6 3-- 6 6-- 7 3-- 7 6-- 8
      [13] 2-- 8 3-- 9 5-- 9 2--10 6--10

# grg_game_impl basic

    Code
      grg_game_impl(nodes = 10, radius = 0.3, torus = FALSE)
    Output
      $graph
      IGRAPH U--- 10 12 -- 
      + edges:
       [1] 3-- 5 3-- 6 5-- 6 5-- 7 5-- 8 6-- 8 7-- 8 7-- 9 7--10 8-- 9 8--10 9--10
      
      $x
       [1] 0.08565451 0.15145413 0.45222514 0.45939554 0.55956278 0.61872370
       [7] 0.76201957 0.82545284 0.86690370 0.95857358
      
      $y
       [1] 0.07820721 0.85018913 0.08700766 0.73223568 0.33212277 0.14562638
       [7] 0.53326474 0.32235478 0.49679861 0.31410636
      

# watts_strogatz_game_impl basic

    Code
      watts_strogatz_game_impl(dim = 1, size = 10, nei = 2, p = 0.1)
    Output
      IGRAPH U--- 10 20 -- 
      + edges:
       [1] 1-- 2 2-- 6 2-- 3 4-- 5 5-- 6 6-- 7 7-- 8 8-- 9 9--10 1--10 1-- 8 1-- 9
      [13] 2--10 2-- 4 3-- 5 4-- 6 5-- 7 6-- 8 7-- 9 8--10

# degree_sequence_game_impl basic

    Code
      degree_sequence_game_impl(out_deg = c(2, 2, 2, 2), method = "configuration")
    Output
      IGRAPH U--- 4 4 -- 
      + edges:
      [1] 2--4 3--3 1--4 1--2

---

    Code
      degree_sequence_game_impl(out_deg = c(2, 2, 2, 2), method = "vl")
    Output
      IGRAPH U--- 4 4 -- 
      + edges:
      [1] 1--2 1--4 2--3 3--4

