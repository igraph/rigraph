# empty_impl basic

    Code
      empty_impl()
    Output
      IGRAPH D--- 0 0 -- 
      + edges:

---

    Code
      empty_impl(n = 5, directed = FALSE)
    Output
      IGRAPH U--- 5 0 -- 
      + edges:

# empty_impl errors

    Code
      empty_impl(n = -1)
    Condition
      Error in `empty_impl()`:
      ! At vendor/cigraph/src/graph/type_indexededgelist.c:xx : Number of vertices must not be negative. Invalid value

# add_edges_impl basic

    Code
      add_edges_impl(graph = g, edges = c(0, 1, 1, 2))
    Output
      IGRAPH D--- 3 2 -- 
      + edges:
      [1] 1->2 2->3

# add_edges_impl errors

    Code
      add_edges_impl(graph = NULL, edges = c(1, 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# copy_impl basic

    Code
      copy_impl(from = g)
    Output
      IGRAPH D--- 2 0 -- 
      + edges:

# copy_impl errors

    Code
      copy_impl(from = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# delete_vertices_idx_impl basic

    Code
      delete_vertices_idx_impl(graph = g, vertices = 1)
    Output
      $graph
      IGRAPH D--- 2 0 -- 
      + edges:
      
      $idx
      [1] 0 1 2
      
      $invidx
      [1] 1 2
      

# delete_vertices_idx_impl errors

    Code
      delete_vertices_idx_impl(graph = NULL, vertices = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# vcount_impl basic

    Code
      vcount_impl(graph = g)
    Output
      [1] 4

# vcount_impl errors

    Code
      vcount_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# degree_impl basic

    Code
      degree_impl(graph = g)
    Output
      [1] 0 0 0

---

    Code
      degree_impl(graph = g, mode = "in")
    Output
      [1] 0 0 0

# degree_impl errors

    Code
      degree_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_all_eids_between_impl basic

    Code
      get_all_eids_between_impl(graph = g, from = 1, to = 2)
    Output
      + 0/0 edges:

# get_all_eids_between_impl errors

    Code
      get_all_eids_between_impl(graph = NULL, from = 1, to = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# wheel_impl basic

    Code
      wheel_impl(n = 5)
    Output
      IGRAPH D--- 5 8 -- 
      + edges:
      [1] 1->2 1->3 1->4 1->5 2->3 3->4 4->5 5->2

---

    Code
      wheel_impl(n = 5, mode = "in", center = 2)
    Output
      IGRAPH D--- 5 8 -- 
      + edges:
      [1] 1->3 2->3 4->3 5->3 1->2 2->4 4->5 5->1

# wheel_impl errors

    Code
      wheel_impl(n = -1)
    Condition
      Error in `wheel_impl()`:
      ! At vendor/cigraph/src/constructors/regular.c:xx : Invalid number of vertices. Invalid vertex ID

# hypercube_impl basic

    Code
      hypercube_impl(n = 3)
    Output
      IGRAPH U--- 8 12 -- 
      + edges:
       [1] 1--2 1--3 1--5 2--4 2--6 3--4 3--7 4--8 5--6 5--7 6--8 7--8

---

    Code
      hypercube_impl(n = 3, directed = TRUE)
    Output
      IGRAPH D--- 8 12 -- 
      + edges:
       [1] 1->2 1->3 1->5 2->4 2->6 3->4 3->7 4->8 5->6 5->7 6->8 7->8

# hypercube_impl errors

    Code
      hypercube_impl(n = 10000)
    Condition
      Error in `hypercube_impl()`:
      ! At vendor/cigraph/src/constructors/regular.c:xx : The requested hypercube graph dimension (10000) is too high. It must be no greater than 57. Invalid value

# square_lattice_impl basic

    Code
      square_lattice_impl(dimvector = c(2, 2))
    Output
      IGRAPH U--- 4 4 -- 
      + edges:
      [1] 1--2 1--3 2--4 3--4

---

    Code
      square_lattice_impl(dimvector = c(2, 2), nei = 2, directed = TRUE, mutual = TRUE,
      periodic = c(TRUE, TRUE))
    Output
      IGRAPH D--- 4 10 -- 
      + edges:
       [1] 1->2 1->3 2->1 2->4 3->4 3->1 4->3 4->2 1->4 2->3

# square_lattice_impl errors

    Code
      square_lattice_impl(dimvector = -1)
    Condition
      Error in `square_lattice_impl()`:
      ! At vendor/cigraph/src/constructors/regular.c:xx : Invalid dimension vector. Invalid value

# triangular_lattice_impl basic

    Code
      triangular_lattice_impl(dimvector = c(2, 2))
    Output
      IGRAPH U--- 4 5 -- 
      + edges:
      [1] 1--2 1--4 1--3 2--4 3--4

---

    Code
      triangular_lattice_impl(dimvector = c(2, 2), directed = TRUE, mutual = TRUE)
    Output
      IGRAPH D--- 4 10 -- 
      + edges:
       [1] 1->2 2->1 1->4 4->1 1->3 3->1 2->4 4->2 3->4 4->3

# triangular_lattice_impl errors

    Code
      triangular_lattice_impl(dimvector = -1)
    Condition
      Error in `triangular_lattice_impl()`:
      ! At vendor/cigraph/src/constructors/lattices.c:xx : Invalid dimension vector. Invalid value

# path_graph_impl basic

    Code
      path_graph_impl(n = 5)
    Output
      IGRAPH U--- 5 4 -- 
      + edges:
      [1] 1--2 2--3 3--4 4--5

---

    Code
      path_graph_impl(n = 5, directed = TRUE, mutual = TRUE)
    Output
      IGRAPH D--- 5 8 -- 
      + edges:
      [1] 1->2 2->1 2->3 3->2 3->4 4->3 4->5 5->4

# path_graph_impl errors

    Code
      path_graph_impl(n = -1)
    Condition
      Error in `path_graph_impl()`:
      ! At vendor/cigraph/src/constructors/regular.c:xx : The number of vertices must be non-negative, got -1. Invalid value

# cycle_graph_impl basic

    Code
      cycle_graph_impl(n = 5)
    Output
      IGRAPH U--- 5 5 -- 
      + edges:
      [1] 1--2 2--3 3--4 4--5 1--5

---

    Code
      cycle_graph_impl(n = 5, directed = TRUE, mutual = TRUE)
    Output
      IGRAPH D--- 5 10 -- 
      + edges:
       [1] 1->2 2->1 2->3 3->2 3->4 4->3 4->5 5->4 5->1 1->5

# cycle_graph_impl errors

    Code
      cycle_graph_impl(n = -1)
    Condition
      Error in `cycle_graph_impl()`:
      ! At vendor/cigraph/src/constructors/regular.c:xx : The number of vertices must be non-negative, got -1. Invalid value

# symmetric_tree_impl basic

    Code
      symmetric_tree_impl(branches = 3)
    Output
      IGRAPH D--- 4 3 -- 
      + edges:
      [1] 1->2 1->3 1->4

---

    Code
      symmetric_tree_impl(branches = 3, type = "in")
    Output
      IGRAPH D--- 4 3 -- 
      + edges:
      [1] 2->1 3->1 4->1

# symmetric_tree_impl errors

    Code
      symmetric_tree_impl(branches = -1)
    Condition
      Error in `symmetric_tree_impl()`:
      ! At vendor/cigraph/src/constructors/regular.c:xx : The number of branches must be positive at each level. Invalid value

# regular_tree_impl basic

    Code
      regular_tree_impl(h = 2)
    Output
      IGRAPH U--- 10 9 -- 
      + edges:
      [1] 1-- 2 1-- 3 1-- 4 2-- 5 2-- 6 3-- 7 3-- 8 4-- 9 4--10

---

    Code
      regular_tree_impl(h = 2, k = 4, type = "in")
    Output
      IGRAPH D--- 17 16 -- 
      + edges:
       [1]  2->1  3->1  4->1  5->1  6->2  7->2  8->2  9->3 10->3 11->3 12->4 13->4
      [13] 14->4 15->5 16->5 17->5

# regular_tree_impl errors

    Code
      regular_tree_impl(h = -1)
    Condition
      Error in `regular_tree_impl()`:
      ! At vendor/cigraph/src/constructors/regular.c:xx : Height of regular tree must be positive, got -1. Invalid value

# full_citation_impl basic

    Code
      full_citation_impl(n = 5)
    Output
      IGRAPH D--- 5 10 -- 
      + edges:
       [1] 2->1 3->1 3->2 4->1 4->2 4->3 5->1 5->2 5->3 5->4

---

    Code
      full_citation_impl(n = 5, directed = FALSE)
    Output
      IGRAPH U--- 5 10 -- 
      + edges:
       [1] 1--2 1--3 2--3 1--4 2--4 3--4 1--5 2--5 3--5 4--5

# full_citation_impl errors

    Code
      full_citation_impl(n = -1)
    Condition
      Error in `full_citation_impl()`:
      ! At vendor/cigraph/src/constructors/full.c:xx : Invalid number of vertices. Invalid value

# atlas_impl basic

    Code
      atlas_impl(number = 0)
    Output
      IGRAPH U--- 0 0 -- 
      + edges:

---

    Code
      atlas_impl(number = 5)
    Output
      IGRAPH U--- 3 1 -- 
      + edge:
      [1] 2--3

# atlas_impl errors

    Code
      atlas_impl(number = -1)
    Condition
      Error in `atlas_impl()`:
      ! At vendor/cigraph/src/constructors/atlas.c:xx : No such graph in atlas. The graph index must be less than 1253. Invalid value

# extended_chordal_ring_impl basic

    Code
      extended_chordal_ring_impl(nodes = 5, W = matrix(c(1, 2)))
    Output
      IGRAPH U--- 5 15 -- 
      + edges:
       [1] 1--2 2--3 3--4 4--5 1--5 1--2 1--3 2--3 2--4 3--4 3--5 4--5 1--4 1--5 2--5

---

    Code
      extended_chordal_ring_impl(nodes = 5, W = matrix(c(1, 2)), directed = TRUE)
    Output
      IGRAPH D--- 5 15 -- 
      + edges:
       [1] 1->2 2->3 3->4 4->5 5->1 1->2 1->3 2->3 2->4 3->4 3->5 4->5 4->1 5->1 5->2

# extended_chordal_ring_impl errors

    Code
      extended_chordal_ring_impl(nodes = -1, W = matrix(c(1, 2)))
    Condition
      Error in `extended_chordal_ring_impl()`:
      ! At vendor/cigraph/src/constructors/regular.c:xx : An extended chordal ring has at least 3 nodes. Invalid value

# graph_power_impl basic

    Code
      graph_power_impl(graph = g, order = 2)
    Output
      IGRAPH U--- 5 7 -- 
      + edges:
      [1] 1--2 2--3 3--4 4--5 1--3 2--4 3--5

---

    Code
      graph_power_impl(graph = g, order = 2, directed = TRUE)
    Output
      IGRAPH U--- 5 7 -- 
      + edges:
      [1] 1--2 2--3 3--4 4--5 1--3 2--4 3--5

# graph_power_impl errors

    Code
      graph_power_impl(graph = NULL, order = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# linegraph_impl basic

    Code
      linegraph_impl(graph = g)
    Output
      IGRAPH U--- 4 3 -- 
      + edges:
      [1] 1--2 2--3 3--4

# linegraph_impl errors

    Code
      linegraph_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# de_bruijn_impl basic

    Code
      de_bruijn_impl(m = 2, n = 3)
    Output
      IGRAPH D--- 8 16 -- 
      + edges:
       [1] 1->1 1->2 2->3 2->4 3->5 3->6 4->7 4->8 5->1 5->2 6->3 6->4 7->5 7->6 8->7
      [16] 8->8

# de_bruijn_impl errors

    Code
      de_bruijn_impl(m = -1, n = 3)
    Condition
      Error in `de_bruijn_impl()`:
      ! At vendor/cigraph/src/constructors/de_bruijn.c:xx : `m' and `n' should be non-negative in a de Bruijn graph, Invalid value

# kautz_impl basic

    Code
      kautz_impl(m = 2, n = 3)
    Output
      IGRAPH D--- 24 48 -- 
      + edges:
       [1]  1-> 9  1->10  2->11  2->12  3->13  3->14  4->15  4->16  5->17  5->18
      [11]  6->19  6->20  7->21  7->22  8->23  8->24  9-> 1  9-> 2 10-> 3 10-> 4
      [21] 11-> 5 11-> 6 12-> 7 12-> 8 13->17 13->18 14->19 14->20 15->21 15->22
      [31] 16->23 16->24 17-> 1 17-> 2 18-> 3 18-> 4 19-> 5 19-> 6 20-> 7 20-> 8
      [41] 21-> 9 21->10 22->11 22->12 23->13 23->14 24->15 24->16

# kautz_impl errors

    Code
      kautz_impl(m = -1, n = 3)
    Condition
      Error in `kautz_impl()`:
      ! At vendor/cigraph/src/constructors/kautz.c:xx : `m' and `n' should be non-negative in a Kautz graph, Invalid value

# lcf_vector_impl basic

    Code
      lcf_vector_impl(n = 10, shifts = c(3, -3, 4), repeats = 2)
    Output
      IGRAPH U--- 10 16 -- LCF graph
      + attr: name (g/c)
      + edges:
       [1] 1-- 2 1-- 4 1--10 2-- 3 2-- 5 2-- 9 3-- 4 3-- 7 4-- 5 4-- 7 5-- 6 6-- 7
      [13] 6--10 7-- 8 8-- 9 9--10

# lcf_vector_impl errors

    Code
      lcf_vector_impl(n = -1, shifts = c(3, -3, 4), repeats = 2)
    Condition
      Error in `lcf_vector_impl()`:
      ! At vendor/cigraph/src/graph/type_indexededgelist.c:xx : Number of vertices must not be negative. Invalid value

# mycielski_graph_impl basic

    Code
      mycielski_graph_impl(k = 3)
    Output
      IGRAPH U--- 5 5 -- 
      + edges:
      [1] 1--2 1--4 2--3 3--5 4--5

# mycielski_graph_impl errors

    Code
      mycielski_graph_impl(k = -1)
    Condition
      Error in `mycielski_graph_impl()`:
      ! At vendor/cigraph/src/constructors/mycielskian.c:xx : The Mycielski graph order must not be negative. Invalid value

# adjlist_impl basic

    Code
      adjlist_impl(adjlist = list(c(2, 3), c(1), c(1)), mode = "out")
    Output
      IGRAPH D--- 3 4 -- 
      + edges:
      [1] 1->2 1->3 2->1 3->1

# adjlist_impl errors

    Code
      adjlist_impl(adjlist = -1, mode = "out")
    Condition
      Error in `adjlist_impl()`:
      ! At vendor/cigraph/src/constructors/basic_constructors.c:xx : Invalid (negative or too large) vertex ID. Invalid vertex ID

# full_bipartite_impl basic

    Code
      full_bipartite_impl(n1 = 2, n2 = 3)
    Output
      $graph
      IGRAPH U--- 5 6 -- 
      + edges:
      [1] 1--3 1--4 1--5 2--3 2--4 2--5
      
      $types
      [1] FALSE FALSE  TRUE  TRUE  TRUE
      

---

    Code
      full_bipartite_impl(n1 = 2, n2 = 3, directed = TRUE, mode = "in")
    Output
      $graph
      IGRAPH D--- 5 6 -- 
      + edges:
      [1] 3->1 4->1 5->1 3->2 4->2 5->2
      
      $types
      [1] FALSE FALSE  TRUE  TRUE  TRUE
      

# full_bipartite_impl errors

    Code
      full_bipartite_impl(n1 = -1, n2 = 3)
    Condition
      Error in `full_bipartite_impl()`:
      ! At vendor/cigraph/src/misc/bipartite.c:xx : Invalid number of vertices for bipartite graph. Invalid value

# full_multipartite_impl basic

    Code
      full_multipartite_impl(n = c(2, 3, 4))
    Output
      $graph
      IGRAPH U--- 9 26 -- 
      + edges:
       [1] 1--3 1--4 1--5 1--6 1--7 1--8 1--9 2--3 2--4 2--5 2--6 2--7 2--8 2--9 3--6
      [16] 3--7 3--8 3--9 4--6 4--7 4--8 4--9 5--6 5--7 5--8 5--9
      
      $types
      [1] 1 1 2 2 2 3 3 3 3
      
      $name
      [1] "Full multipartite graph"
      
      $n
      [1] 2 3 4
      
      $mode
      [1] 3
      

---

    Code
      full_multipartite_impl(n = c(2, 3, 4), directed = TRUE, mode = "in")
    Output
      $graph
      IGRAPH D--- 9 26 -- 
      + edges:
       [1] 3->1 4->1 5->1 6->1 7->1 8->1 9->1 3->2 4->2 5->2 6->2 7->2 8->2 9->2 6->3
      [16] 7->3 8->3 9->3 6->4 7->4 8->4 9->4 6->5 7->5 8->5 9->5
      
      $types
      [1] 1 1 2 2 2 3 3 3 3
      
      $name
      [1] "Full multipartite graph"
      
      $n
      [1] 2 3 4
      
      $mode
      [1] 2
      

# full_multipartite_impl errors

    Code
      full_multipartite_impl(n = -1)
    Condition
      Error in `full_multipartite_impl()`:
      ! At vendor/cigraph/src/constructors/full.c:xx : Number of vertices must not be negative in any partition. Invalid value

# realize_degree_sequence_impl basic

    Code
      realize_degree_sequence_impl(out_deg = c(2, 2, 2))
    Output
      IGRAPH U--- 3 3 -- Graph from degree sequence
      + attr: name (g/c), out_deg (g/n), in_deg (g/x), allowed_edge_types
      | (g/n), method (g/n)
      + edges:
      [1] 2--3 1--3 1--2

---

    Code
      realize_degree_sequence_impl(out_deg = c(2, 2, 2), in_deg = c(2, 2, 2),
      allowed_edge_types = "simple", method = "largest")
    Output
      IGRAPH D--- 3 6 -- Graph from degree sequence
      + attr: name (g/c), out_deg (g/n), in_deg (g/n), allowed_edge_types
      | (g/n), method (g/n)
      + edges:
      [1] 1->2 1->3 2->1 2->3 3->1 3->2

# realize_degree_sequence_impl errors

    Code
      realize_degree_sequence_impl(out_deg = -1)
    Condition
      Error in `realize_degree_sequence_impl()`:
      ! At vendor/cigraph/src/misc/degree_sequence.cpp:xx : The sum of degrees must be even for an undirected graph. Invalid value

# realize_bipartite_degree_sequence_impl basic

    Code
      realize_bipartite_degree_sequence_impl(degrees1 = c(2, 2), degrees2 = c(2, 2))
    Output
      IGRAPH U--- 4 4 -- Bipartite graph from degree sequence
      + attr: name (g/c), degrees1 (g/n), degrees2 (g/n), allowed_edge_types
      | (g/n), method (g/n)
      + edges:
      [1] 2--3 2--4 1--4 1--3

---

    Code
      realize_bipartite_degree_sequence_impl(degrees1 = c(2, 2), degrees2 = c(2, 2),
      allowed_edge_types = "loops", method = "largest")
    Output
      IGRAPH U--- 4 4 -- Bipartite graph from degree sequence
      + attr: name (g/c), degrees1 (g/n), degrees2 (g/n), allowed_edge_types
      | (g/n), method (g/n)
      + edges:
      [1] 1--3 1--4 2--3 2--4

# realize_bipartite_degree_sequence_impl errors

    Code
      realize_bipartite_degree_sequence_impl(degrees1 = -1, degrees2 = c(2, 2))
    Condition
      Error in `realize_bipartite_degree_sequence_impl()`:
      ! At vendor/cigraph/src/misc/degree_sequence.cpp:xx : The given bidegree sequence cannot be realized as a bipartite simple graph. Invalid value

# circulant_impl basic

    Code
      circulant_impl(n = 5, shifts = c(1, 2))
    Output
      IGRAPH U--- 5 10 -- Circulant graph
      + attr: name (g/c), shifts (g/n)
      + edges:
       [1] 1--2 2--3 3--4 4--5 1--5 1--3 2--4 3--5 1--4 2--5

---

    Code
      circulant_impl(n = 5, shifts = c(1, 2), directed = TRUE)
    Output
      IGRAPH D--- 5 10 -- Circulant graph
      + attr: name (g/c), shifts (g/n)
      + edges:
       [1] 1->2 2->3 3->4 4->5 5->1 1->3 2->4 3->5 4->1 5->2

# circulant_impl errors

    Code
      circulant_impl(n = -1, shifts = c(1, 2))
    Condition
      Error in `circulant_impl()`:
      ! At vendor/cigraph/src/constructors/circulant.c:xx : Number of nodes = -1 must be non-negative. Invalid value

# generalized_petersen_impl basic

    Code
      generalized_petersen_impl(n = 5, k = 2)
    Output
      IGRAPH U--- 10 15 -- 
      + edges:
       [1] 1-- 2 1-- 6 6-- 8 2-- 3 2-- 7 7-- 9 3-- 4 3-- 8 8--10 4-- 5 4-- 9 6-- 9
      [13] 1-- 5 5--10 7--10

# generalized_petersen_impl errors

    Code
      generalized_petersen_impl(n = -1, k = 2)
    Condition
      Error in `generalized_petersen_impl()`:
      ! At vendor/cigraph/src/constructors/generalized_petersen.c:xx : n = -1 must be at least 3. Invalid value

# turan_impl basic

    Code
      turan_impl(n = 5, r = 2)
    Output
      $graph
      IGRAPH U--- 5 6 -- 
      + edges:
      [1] 1--4 1--5 2--4 2--5 3--4 3--5
      
      $types
      [1] 1 1 1 2 2
      
      $name
      [1] "Turan graph"
      
      $n
      [1] 5
      
      $r
      [1] 2
      

# turan_impl errors

    Code
      turan_impl(n = -1, r = 2)
    Condition
      Error in `turan_impl()`:
      ! At vendor/cigraph/src/constructors/full.c:xx : Number of vertices must not be negative, got -1. Invalid value

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
      ! At vendor/cigraph/src/games/erdos_renyi.c:xx : Invalid number of vertices. Invalid value

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
      ! At vendor/cigraph/src/games/erdos_renyi.c:xx : Invalid number of vertices. Invalid value

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
      ! At vendor/cigraph/src/games/growing_random.c:xx : Invalid number of vertices. Invalid value

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
      ! At vendor/cigraph/src/games/preference.c:xx : The number of vertices must be non-negative. Invalid value

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
      ! At vendor/cigraph/src/games/preference.c:xx : The number of vertices must not be negative. Invalid value

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
      ! At vendor/cigraph/src/games/forestfire.c:xx : Insufficient memory for forest fire model. Out of memory

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
      ! At vendor/cigraph/src/games/islands.c:xx : Number of islands cannot be negative, got -1. Invalid value

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
      ! At vendor/cigraph/src/games/chung_lu.c:xx : Vertex weights must not be negative in Chung-Lu model, got -1. Invalid value

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
      ! At vendor/cigraph/src/games/static_fitness.c:xx : Number of edges cannot be negative, got -1. Invalid value

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
      ! At vendor/cigraph/src/games/static_fitness.c:xx : Number of nodes cannot be negative, got -1. Invalid value

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
      ! At vendor/cigraph/src/games/k_regular.c:xx : Number of nodes must be non-negative. Invalid value

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
      ! At vendor/cigraph/src/games/sbm.c:xx : Sum of the block sizes (5) must equal the number of vertices (-1). Invalid value

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
      ! At vendor/cigraph/src/games/sbm.c:xx : `n' must be positive for HSBM, Invalid value

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
      ! At vendor/cigraph/src/games/sbm.c:xx : `n' must be positive for HSBM. Invalid value

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
      ! At vendor/cigraph/src/games/erdos_renyi.c:xx : Invalid number of vertices. Invalid value

# dot_product_game_impl basic

    Code
      dot_product_game_impl(vecs = matrix(0.5, 5, 2))
    Condition
      Warning in `dot_product_game_impl()`:
      At vendor/cigraph/src/games/dotproduct.c:90 : Greater than 1 connection probability in dot-product graph.
    Output
      IGRAPH U--- 2 1 -- 
      + edge:
      [1] 1--2

---

    Code
      dot_product_game_impl(vecs = matrix(0.5, 5, 2), directed = TRUE)
    Condition
      Warning in `dot_product_game_impl()`:
      At vendor/cigraph/src/games/dotproduct.c:90 : Greater than 1 connection probability in dot-product graph.
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
      ! At vendor/cigraph/src/games/dotproduct.c:xx : Sphere must be at least two dimensional to sample from surface. Invalid value

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
      ! At vendor/cigraph/src/games/dotproduct.c:xx : Sphere must be at least two dimensional to sample from surface. Invalid value

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
      ! At vendor/cigraph/src/games/dotproduct.c:xx : Number of samples should be non-negative, got -1. Invalid value

# are_adjacent_impl basic

    Code
      are_adjacent_impl(graph = g, v1 = 1, v2 = 2)
    Output
      [1] TRUE

# are_adjacent_impl errors

    Code
      are_adjacent_impl(graph = NULL, v1 = 1, v2 = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# closeness_impl basic

    Code
      closeness_impl(graph = g)
    Output
      $res
      [1] 0.3333333 0.5000000 0.3333333
      
      $reachable_count
      [1] 2 2 2
      
      $all_reachable
      [1] TRUE
      

---

    Code
      closeness_impl(graph = g, mode = "in", normalized = TRUE)
    Output
      $res
      [1] 0.6666667 1.0000000 0.6666667
      
      $reachable_count
      [1] 2 2 2
      
      $all_reachable
      [1] TRUE
      

---

    Code
      closeness_impl(graph = g, vids = V(g), mode = c("out", "in", "all", "total"))
    Output
      $res
      [1] 0.1666667 0.1666667 0.1666667 0.1666667 0.1666667
      
      $reachable_count
      [1] 4 4 4 4 4
      
      $all_reachable
      [1] TRUE
      

# closeness_impl errors

    Code
      closeness_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# closeness_cutoff_impl basic

    Code
      closeness_cutoff_impl(graph = g, cutoff = 2)
    Output
      $res
      [1] 0.3333333 0.5000000 0.3333333
      
      $reachable_count
      [1] 2 2 2
      
      $all_reachable
      [1] TRUE
      

---

    Code
      closeness_cutoff_impl(graph = g, mode = "in", normalized = TRUE, cutoff = 1)
    Output
      $res
      [1] 1 1 1
      
      $reachable_count
      [1] 1 2 1
      
      $all_reachable
      [1] FALSE
      

# closeness_cutoff_impl errors

    Code
      closeness_cutoff_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_shortest_path_impl basic

    Code
      get_shortest_path_impl(graph = g, from = 1, to = 3)
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 3
      
      $edges
      + 2/2 edges:
      [1] 1--2 2--3
      

# get_shortest_path_impl errors

    Code
      get_shortest_path_impl(graph = NULL, from = 1, to = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_shortest_path_bellman_ford_impl basic

    Code
      get_shortest_path_bellman_ford_impl(graph = g, from = 1, to = 3)
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 3
      
      $edges
      + 2/2 edges:
      [1] 1--2 2--3
      

# get_shortest_path_bellman_ford_impl errors

    Code
      get_shortest_path_bellman_ford_impl(graph = NULL, from = 1, to = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_shortest_path_dijkstra_impl basic

    Code
      get_shortest_path_dijkstra_impl(graph = g, from = 1, to = 3)
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 3
      
      $edges
      + 2/2 edges:
      [1] 1--2 2--3
      

# get_shortest_path_dijkstra_impl errors

    Code
      get_shortest_path_dijkstra_impl(graph = NULL, from = 1, to = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_all_shortest_paths_impl basic

    Code
      get_all_shortest_paths_impl(graph = g, from = 1, to = 3)
    Output
      $vpaths
      $vpaths[[1]]
      + 3/3 vertices:
      [1] 1 2 3
      
      
      $epaths
      $epaths[[1]]
      + 2/2 edges:
      [1] 1--2 2--3
      
      
      $nrgeo
      [1] 1 1 1
      

# get_all_shortest_paths_impl errors

    Code
      get_all_shortest_paths_impl(graph = NULL, from = 1, to = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_all_shortest_paths_dijkstra_impl basic

    Code
      get_all_shortest_paths_dijkstra_impl(graph = g, from = 1, to = 3)
    Output
      $vpaths
      $vpaths[[1]]
      + 3/3 vertices:
      [1] 1 2 3
      
      
      $epaths
      $epaths[[1]]
      + 2/2 edges:
      [1] 1--2 2--3
      
      
      $nrgeo
      [1] 1 1 1
      

# get_all_shortest_paths_dijkstra_impl errors

    Code
      get_all_shortest_paths_dijkstra_impl(graph = NULL, from = 1, to = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# voronoi_impl basic

    Code
      voronoi_impl(graph = g, generators = 1)
    Output
      $membership
      [1] 0 0 0
      
      $distances
      [1] 0 1 2
      

---

    Code
      voronoi_impl(graph = g, generators = 1, mode = "in", tiebreaker = "first")
    Output
      $membership
      [1] 0 0 0
      
      $distances
      [1] 0 1 2
      

---

    Code
      voronoi_impl(graph = g, generators = c(1, 5), mode = c("out", "in", "all"))
    Output
      $membership
       [1] 0 0 0 1 1 1 1 1 0 0
      
      $distances
       [1] 0 1 2 1 0 1 2 3 2 1
      

# voronoi_impl errors

    Code
      voronoi_impl(graph = NULL, generators = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_all_simple_paths_impl basic

    Code
      get_all_simple_paths_impl(graph = g, from = 1, to = 3)
    Output
      + 3/3 vertices:
      [1] 1 2 3

# get_all_simple_paths_impl errors

    Code
      get_all_simple_paths_impl(graph = NULL, from = 1, to = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_k_shortest_paths_impl basic

    Code
      get_k_shortest_paths_impl(graph = g, from = 1, to = 3, k = 2)
    Output
      $vpaths
      $vpaths[[1]]
      + 3/3 vertices:
      [1] 1 2 3
      
      
      $epaths
      $epaths[[1]]
      + 2/2 edges:
      [1] 1--2 2--3
      
      

# get_k_shortest_paths_impl errors

    Code
      get_k_shortest_paths_impl(graph = NULL, from = 1, to = 3, k = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_widest_path_impl basic

    Code
      get_widest_path_impl(graph = g, from = 1, to = 3, weights = c(1, 2))
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 3
      
      $edges
      + 2/2 edges:
      [1] 1--2 2--3
      

# get_widest_path_impl errors

    Code
      get_widest_path_impl(graph = NULL, from = 1, to = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_widest_paths_impl basic

    Code
      get_widest_paths_impl(graph = g, from = 1, to = 3, weights = c(1, 2))
    Output
      $vertices
      $vertices[[1]]
      + 3/3 vertices:
      [1] 1 2 3
      
      
      $edges
      $edges[[1]]
      + 2/2 edges:
      [1] 1--2 2--3
      
      
      $parents
      [1] -1  0  1
      
      $inbound_edges
      [1] -1  0  1
      

# get_widest_paths_impl errors

    Code
      get_widest_paths_impl(graph = NULL, from = 1, to = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# spanner_impl basic

    Code
      spanner_impl(graph = g, stretch = 2)
    Output
      + 2/2 edges:
      [1] 1--2 2--3

---

    Code
      spanner_impl(graph = g, stretch = 2)
    Output
      + 5/5 edges:
      [1] 1--2 2--3 3--4 4--5 1--5

# spanner_impl errors

    Code
      spanner_impl(graph = NULL, stretch = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# betweenness_cutoff_impl basic

    Code
      betweenness_cutoff_impl(graph = g, cutoff = 2)
    Output
      [1] 0 1 0

# betweenness_cutoff_impl errors

    Code
      betweenness_cutoff_impl(graph = NULL, cutoff = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# betweenness_subset_impl basic

    Code
      betweenness_subset_impl(graph = g)
    Output
      [1] 0 1 0

# betweenness_subset_impl errors

    Code
      betweenness_subset_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# edge_betweenness_impl basic

    Code
      edge_betweenness_impl(graph = g)
    Output
      [1] 2 2

---

    Code
      edge_betweenness_impl(graph = g, directed = FALSE)
    Output
      [1] 4 4 4 4

# edge_betweenness_impl errors

    Code
      edge_betweenness_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# edge_betweenness_cutoff_impl basic

    Code
      edge_betweenness_cutoff_impl(graph = g, cutoff = 2)
    Output
      [1] 2 2

# edge_betweenness_cutoff_impl errors

    Code
      edge_betweenness_cutoff_impl(graph = NULL, cutoff = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# edge_betweenness_subset_impl basic

    Code
      edge_betweenness_subset_impl(graph = g)
    Output
      [1] 2 2

# edge_betweenness_subset_impl errors

    Code
      edge_betweenness_subset_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# harmonic_centrality_cutoff_impl basic

    Code
      harmonic_centrality_cutoff_impl(graph = g, cutoff = 2)
    Output
      [1] 1.5 2.0 1.5

# harmonic_centrality_cutoff_impl errors

    Code
      harmonic_centrality_cutoff_impl(graph = NULL, cutoff = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# personalized_pagerank_impl basic

    Code
      personalized_pagerank_impl(graph = g)
    Output
      $vector
      [1] 0.2567568 0.4864865 0.2567568
      
      $value
      [1] 1
      
      $options
      NULL
      

---

    Code
      personalized_pagerank_impl(graph = g, algo = "arpack", damping = 0.9)
    Output
      $vector
      [1] 0.2543860 0.4912281 0.2543860
      
      $value
      [1] 1
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LR"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 3
      
      

# personalized_pagerank_impl errors

    Code
      personalized_pagerank_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# personalized_pagerank_vs_impl basic

    Code
      personalized_pagerank_vs_impl(graph = g, reset_vids = 1)
    Output
      [1] 0.3452703 0.4594595 0.1952703

---

    Code
      personalized_pagerank_vs_impl(graph = g, algo = "arpack", reset_vids = 1,
        details = TRUE)
    Output
      $vector
      [1] 0.3452703 0.4594595 0.1952703
      
      $value
      [1] 1
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LR"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 3
      
      

# personalized_pagerank_vs_impl errors

    Code
      personalized_pagerank_vs_impl(graph = NULL, reset_vids = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# induced_subgraph_impl basic

    Code
      induced_subgraph_impl(graph = g, vids = 1:2)
    Output
      IGRAPH U--- 2 1 -- 
      + edge:
      [1] 1--2

# induced_subgraph_impl errors

    Code
      induced_subgraph_impl(graph = NULL, vids = 1:2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# subgraph_from_edges_impl basic

    Code
      subgraph_from_edges_impl(graph = g, eids = 1)
    Output
      IGRAPH U--- 2 1 -- 
      + edge:
      [1] 1--2

# subgraph_from_edges_impl errors

    Code
      subgraph_from_edges_impl(graph = NULL, eids = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# reverse_edges_impl basic

    Code
      reverse_edges_impl(graph = g)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

# reverse_edges_impl errors

    Code
      reverse_edges_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# path_length_hist_impl basic

    Code
      path_length_hist_impl(graph = g)
    Output
      $res
      [1] 2 1
      
      $unconnected
      [1] 0
      

---

    Code
      path_length_hist_impl(graph = g, directed = FALSE)
    Output
      $res
      [1] 2 1
      
      $unconnected
      [1] 0
      

# path_length_hist_impl errors

    Code
      path_length_hist_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# simplify_impl basic

    Code
      simplify_impl(graph = g)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

---

    Code
      simplify_impl(graph = g, remove_multiple = FALSE, remove_loops = FALSE)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

# simplify_impl errors

    Code
      simplify_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitivity_undirected_impl basic

    Code
      transitivity_undirected_impl(graph = g)
    Output
      [1] 0

---

    Code
      transitivity_undirected_impl(graph = g, mode = "zero")
    Output
      [1] 0

# transitivity_undirected_impl errors

    Code
      transitivity_undirected_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitivity_local_undirected_impl basic

    Code
      transitivity_local_undirected_impl(graph = g)
    Output
      [1] NaN   0 NaN

---

    Code
      transitivity_local_undirected_impl(graph = g, mode = "zero")
    Output
      [1] 0 0 0

# transitivity_local_undirected_impl errors

    Code
      transitivity_local_undirected_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitivity_avglocal_undirected_impl basic

    Code
      transitivity_avglocal_undirected_impl(graph = g)
    Output
      [1] 0

---

    Code
      transitivity_avglocal_undirected_impl(graph = g, mode = "zero")
    Output
      [1] 0

# transitivity_avglocal_undirected_impl errors

    Code
      transitivity_avglocal_undirected_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitivity_barrat_impl basic

    Code
      transitivity_barrat_impl(graph = g)
    Condition
      Warning in `transitivity_barrat_impl()`:
      At vendor/cigraph/src/properties/triangles.c:913 : No weights given for Barrat's transitivity, unweighted version is used.
    Output
      [1] NaN   0 NaN

---

    Code
      transitivity_barrat_impl(graph = g, mode = "zero")
    Condition
      Warning in `transitivity_barrat_impl()`:
      At vendor/cigraph/src/properties/triangles.c:913 : No weights given for Barrat's transitivity, unweighted version is used.
    Output
      [1] 0 0 0

# transitivity_barrat_impl errors

    Code
      transitivity_barrat_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# ecc_impl basic

    Code
      ecc_impl(graph = g)
    Output
      [1] NaN   0 NaN

---

    Code
      ecc_impl(graph = g, k = 3, offset = TRUE, normalize = FALSE)
    Output
      [1] 1 1 1

# ecc_impl errors

    Code
      ecc_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# reciprocity_impl basic

    Code
      reciprocity_impl(graph = g)
    Output
      [1] 1

---

    Code
      reciprocity_impl(graph = g, ignore_loops = FALSE, mode = "ratio")
    Output
      [1] 1

# reciprocity_impl errors

    Code
      reciprocity_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# maxdegree_impl basic

    Code
      maxdegree_impl(graph = g)
    Output
      [1] 2

---

    Code
      maxdegree_impl(graph = g, mode = "in", loops = FALSE)
    Output
      [1] 2

# maxdegree_impl errors

    Code
      maxdegree_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# density_impl basic

    Code
      density_impl(graph = g)
    Output
      [1] 0.6666667

---

    Code
      density_impl(graph = g, loops = TRUE)
    Output
      [1] 0.3333333

# density_impl errors

    Code
      density_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# mean_degree_impl basic

    Code
      mean_degree_impl(graph = g)
    Output
      [1] 1.333333

---

    Code
      mean_degree_impl(graph = g, loops = FALSE)
    Output
      [1] 1.333333

# mean_degree_impl errors

    Code
      mean_degree_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# feedback_arc_set_impl basic

    Code
      feedback_arc_set_impl(graph = g)
    Output
      + 0/2 edges:

---

    Code
      feedback_arc_set_impl(graph = g, algo = "exact_ip")
    Output
      + 0/2 edges:

# feedback_arc_set_impl errors

    Code
      feedback_arc_set_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# feedback_vertex_set_impl basic

    Code
      feedback_vertex_set_impl(graph = g)
    Output
      + 0/3 vertices:

# feedback_vertex_set_impl errors

    Code
      feedback_vertex_set_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_loop_impl basic

    Code
      is_loop_impl(graph = g)
    Output
      [1] FALSE FALSE

# is_loop_impl errors

    Code
      is_loop_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_dag_impl basic

    Code
      is_dag_impl(graph = g)
    Output
      [1] FALSE

# is_dag_impl errors

    Code
      is_dag_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_acyclic_impl basic

    Code
      is_acyclic_impl(graph = g)
    Output
      [1] TRUE

# is_acyclic_impl errors

    Code
      is_acyclic_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_simple_impl basic

    Code
      is_simple_impl(graph = g)
    Output
      [1] TRUE

# is_simple_impl errors

    Code
      is_simple_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_multiple_impl basic

    Code
      is_multiple_impl(graph = g)
    Output
      [1] FALSE FALSE

# is_multiple_impl errors

    Code
      is_multiple_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# has_loop_impl basic

    Code
      has_loop_impl(graph = g)
    Output
      [1] FALSE

# has_loop_impl errors

    Code
      has_loop_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# has_multiple_impl basic

    Code
      has_multiple_impl(graph = g)
    Output
      [1] FALSE

# has_multiple_impl errors

    Code
      has_multiple_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_loops_impl basic

    Code
      count_loops_impl(graph = g)
    Output
      [1] 0

# count_loops_impl errors

    Code
      count_loops_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_multiple_impl basic

    Code
      count_multiple_impl(graph = g)
    Output
      [1] 1 1

# count_multiple_impl errors

    Code
      count_multiple_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_perfect_impl basic

    Code
      is_perfect_impl(graph = g)
    Output
      [1] TRUE

# is_perfect_impl errors

    Code
      is_perfect_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# eigenvector_centrality_impl basic

    Code
      eigenvector_centrality_impl(graph = g)
    Output
      $vector
      [1] 0.7071068 1.0000000 0.7071068
      
      $value
      [1] 1.414214
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 3
      
      

---

    Code
      eigenvector_centrality_impl(graph = g, directed = TRUE, scale = FALSE)
    Output
      $vector
      [1] 0.5000000 0.7071068 0.5000000
      
      $value
      [1] 1.414214
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 3
      
      

# eigenvector_centrality_impl errors

    Code
      eigenvector_centrality_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# hub_and_authority_scores_impl basic

    Code
      hub_and_authority_scores_impl(graph = g)
    Output
      $hub
      [1] 1 1 1 1 1
      
      $authority
      [1] 1 1 1 1 1
      
      $value
      [1] 16
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 5
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 4
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 4
      
      

---

    Code
      hub_and_authority_scores_impl(graph = g, scale = FALSE)
    Output
      $hub
      [1] 0.4472136 0.4472136 0.4472136 0.4472136 0.4472136
      
      $authority
      [1] 0.4472136 0.4472136 0.4472136 0.4472136 0.4472136
      
      $value
      [1] 16
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 5
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 4
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 4
      
      

# hub_and_authority_scores_impl errors

    Code
      hub_and_authority_scores_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# unfold_tree_impl basic

    Code
      unfold_tree_impl(graph = g, roots = 1)
    Output
      $tree
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $vertex_index
      [1] 1 2 3
      

---

    Code
      unfold_tree_impl(graph = g, mode = "in", roots = 1)
    Output
      $tree
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $vertex_index
      [1] 1 2 3
      

# unfold_tree_impl errors

    Code
      unfold_tree_impl(graph = NULL, roots = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_mutual_impl basic

    Code
      is_mutual_impl(graph = g)
    Output
      [1] TRUE TRUE

---

    Code
      is_mutual_impl(graph = g, loops = FALSE)
    Output
      [1] TRUE TRUE

# is_mutual_impl errors

    Code
      is_mutual_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# has_mutual_impl basic

    Code
      has_mutual_impl(graph = g)
    Output
      [1] TRUE

---

    Code
      has_mutual_impl(graph = g, loops = FALSE)
    Output
      [1] TRUE

# has_mutual_impl errors

    Code
      has_mutual_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# maximum_cardinality_search_impl basic

    Code
      maximum_cardinality_search_impl(graph = g)
    Output
      $alpha
      [1] 3 2 1
      
      $alpham1
      + 3/3 vertices:
      [1] 3 2 1
      

# maximum_cardinality_search_impl errors

    Code
      maximum_cardinality_search_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# avg_nearest_neighbor_degree_impl basic

    Code
      avg_nearest_neighbor_degree_impl(graph = g)
    Output
      $knn
      [1] 2 1 2
      
      $knnk
      [1] 2 1
      

---

    Code
      avg_nearest_neighbor_degree_impl(graph = g, mode = "in", neighbor_degree_mode = "out")
    Output
      $knn
      [1] 2 1 2
      
      $knnk
      [1] 2 1
      

# avg_nearest_neighbor_degree_impl errors

    Code
      avg_nearest_neighbor_degree_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# degree_correlation_vector_impl basic

    Code
      degree_correlation_vector_impl(graph = g)
    Output
      [1] NaN   2   1

---

    Code
      degree_correlation_vector_impl(graph = g, from_mode = "in", to_mode = "out",
        directed_neighbors = FALSE)
    Output
      [1] NaN   2   1

# degree_correlation_vector_impl errors

    Code
      degree_correlation_vector_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# rich_club_sequence_impl basic

    Code
      rich_club_sequence_impl(graph = g, vertex_order = 1:3)
    Output
      [1] 0.6666667 1.0000000       NaN

---

    Code
      rich_club_sequence_impl(graph = g, vertex_order = 1:3, normalized = FALSE,
      loops = TRUE, directed = FALSE)
    Output
      [1] 2 1 0

# rich_club_sequence_impl errors

    Code
      rich_club_sequence_impl(graph = NULL, vertex_order = 1:3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# strength_impl basic

    Code
      strength_impl(graph = g)
    Output
      [1] 1 2 1

---

    Code
      strength_impl(graph = g, mode = "in", loops = FALSE)
    Output
      [1] 1 2 1

# strength_impl errors

    Code
      strength_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# centralization_impl basic

    Code
      centralization_impl(scores = c(1, 2, 3))
    Output
      [1] Inf

---

    Code
      centralization_impl(scores = c(1, 2, 3), theoretical_max = 2, normalized = FALSE)
    Output
      [1] 3

# centralization_impl errors

    Code
      centralization_impl(scores = package_version("1.2.3"))
    Condition
      Error in `centralization_impl()`:
      ! 'list' object cannot be coerced to type 'double'

# centralization_degree_impl basic

    Code
      centralization_degree_impl(graph = g)
    Output
      $res
      [1] 1 2 1
      
      $centralization
      [1] 0.3333333
      
      $theoretical_max
      [1] 6
      

---

    Code
      centralization_degree_impl(graph = g, mode = "in", loops = FALSE, normalized = FALSE)
    Output
      $res
      [1] 1 2 1
      
      $centralization
      [1] 2
      
      $theoretical_max
      [1] 2
      

# centralization_degree_impl errors

    Code
      centralization_degree_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# centralization_degree_tmax_impl basic

    Code
      centralization_degree_tmax_impl(nodes = 3, loops = TRUE)
    Output
      [1] 6

---

    Code
      centralization_degree_tmax_impl(nodes = 3, mode = "in", loops = FALSE)
    Output
      [1] 4

# centralization_degree_tmax_impl errors

    Code
      centralization_degree_tmax_impl(nodes = -1, loops = TRUE)
    Condition
      Error in `centralization_degree_tmax_impl()`:
      ! At vendor/cigraph/src/centrality/centralization.c:xx : Number of vertices must not be negative. Invalid value

# centralization_betweenness_impl basic

    Code
      centralization_betweenness_impl(graph = g)
    Output
      $res
      [1] 0 1 0
      
      $centralization
      [1] 1
      
      $theoretical_max
      [1] 2
      

---

    Code
      centralization_betweenness_impl(graph = g, directed = FALSE, normalized = FALSE)
    Output
      $res
      [1] 0 1 0
      
      $centralization
      [1] 2
      
      $theoretical_max
      [1] 2
      

# centralization_betweenness_impl errors

    Code
      centralization_betweenness_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# centralization_betweenness_tmax_impl basic

    Code
      centralization_betweenness_tmax_impl(nodes = 3, directed = TRUE)
    Output
      [1] 4

---

    Code
      centralization_betweenness_tmax_impl(nodes = 3, directed = FALSE)
    Output
      [1] 2

# centralization_betweenness_tmax_impl errors

    Code
      centralization_betweenness_tmax_impl(nodes = -1, directed = TRUE)
    Condition
      Error in `centralization_betweenness_tmax_impl()`:
      ! At vendor/cigraph/src/centrality/centralization.c:xx : Number of vertices must not be negative. Invalid value

# centralization_closeness_impl basic

    Code
      centralization_closeness_impl(graph = g)
    Output
      $res
      [1] 0.6666667 1.0000000 0.6666667
      
      $centralization
      [1] 1
      
      $theoretical_max
      [1] 0.6666667
      

---

    Code
      centralization_closeness_impl(graph = g, mode = "in", normalized = FALSE)
    Output
      $res
      [1] 0.6666667 1.0000000 0.6666667
      
      $centralization
      [1] 0.6666667
      
      $theoretical_max
      [1] 0.6666667
      

# centralization_closeness_impl errors

    Code
      centralization_closeness_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# centralization_closeness_tmax_impl basic

    Code
      centralization_closeness_tmax_impl(nodes = 3)
    Output
      [1] 1.333333

---

    Code
      centralization_closeness_tmax_impl(nodes = 3, mode = "in")
    Output
      [1] 1.333333

# centralization_closeness_tmax_impl errors

    Code
      centralization_closeness_tmax_impl(nodes = -1)
    Condition
      Error in `centralization_closeness_tmax_impl()`:
      ! At vendor/cigraph/src/centrality/centralization.c:xx : Number of vertices must not be negative. Invalid value

# centralization_eigenvector_centrality_impl basic

    Code
      centralization_eigenvector_centrality_impl(graph = g)
    Output
      $vector
      [1] 0.7071068 1.0000000 0.7071068
      
      $value
      [1] 1.414214
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 3
      
      
      $centralization
      [1] 0.5857864
      
      $theoretical_max
      [1] 1
      

---

    Code
      centralization_eigenvector_centrality_impl(graph = g, directed = TRUE,
        normalized = FALSE)
    Output
      $vector
      [1] 0.7071068 1.0000000 0.7071068
      
      $value
      [1] 1.414214
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 3
      
      
      $centralization
      [1] 0.5857864
      
      $theoretical_max
      [1] 1
      

# centralization_eigenvector_centrality_impl errors

    Code
      centralization_eigenvector_centrality_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# centralization_eigenvector_centrality_tmax_impl basic

    Code
      centralization_eigenvector_centrality_tmax_impl(nodes = 3)
    Output
      [1] 1

---

    Code
      centralization_eigenvector_centrality_tmax_impl(nodes = 3, directed = TRUE)
    Output
      [1] 2

# centralization_eigenvector_centrality_tmax_impl errors

    Code
      centralization_eigenvector_centrality_tmax_impl(nodes = -1)
    Condition
      Error in `centralization_eigenvector_centrality_tmax_impl()`:
      ! At vendor/cigraph/src/centrality/centralization.c:xx : Number of vertices must not be negative. Invalid value

# assortativity_nominal_impl basic

    Code
      assortativity_nominal_impl(graph = g, types = c(1, 2, 1))
    Output
      [1] -1

---

    Code
      assortativity_nominal_impl(graph = g, types = c(1, 2, 1), directed = FALSE,
      normalized = FALSE)
    Output
      [1] -0.5

# assortativity_nominal_impl errors

    Code
      assortativity_nominal_impl(graph = NULL, types = c(1, 2, 1))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# assortativity_impl basic

    Code
      assortativity_impl(graph = g, values = c(1, 2, 1))
    Output
      [1] -1

---

    Code
      assortativity_impl(graph = g, values = c(1, 2, 1), directed = FALSE,
      normalized = FALSE)
    Output
      [1] -0.25

# assortativity_impl errors

    Code
      assortativity_impl(graph = NULL, values = c(1, 2, 1))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# assortativity_degree_impl basic

    Code
      assortativity_degree_impl(graph = g)
    Output
      [1] -1

---

    Code
      assortativity_degree_impl(graph = g, directed = FALSE)
    Output
      [1] -1

# assortativity_degree_impl errors

    Code
      assortativity_degree_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# joint_degree_matrix_impl basic

    Code
      joint_degree_matrix_impl(graph = g)
    Output
           [,1] [,2]
      [1,]    0    2
      [2,]    2    0

---

    Code
      joint_degree_matrix_impl(graph = g, max_out_degree = 2, max_in_degree = 2)
    Output
           [,1] [,2]
      [1,]    0    2
      [2,]    2    0

# joint_degree_matrix_impl errors

    Code
      joint_degree_matrix_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# joint_degree_distribution_impl basic

    Code
      joint_degree_distribution_impl(graph = g)
    Output
           [,1] [,2] [,3]
      [1,]    0  0.0  0.0
      [2,]    0  0.0  0.5
      [3,]    0  0.5  0.0

---

    Code
      joint_degree_distribution_impl(graph = g, from_mode = "in", to_mode = "out",
        directed_neighbors = FALSE, normalized = FALSE, max_from_degree = 2,
        max_to_degree = 2)
    Output
           [,1] [,2] [,3]
      [1,]    0    0    0
      [2,]    0    0    2
      [3,]    0    2    0

# joint_degree_distribution_impl errors

    Code
      joint_degree_distribution_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# joint_type_distribution_impl basic

    Code
      joint_type_distribution_impl(graph = g, from_types = c(1, 2, 1))
    Output
           [,1] [,2]
      [1,]  0.0  0.5
      [2,]  0.5  0.0

---

    Code
      joint_type_distribution_impl(graph = g, from_types = c(1, 2, 1), to_types = c(1,
        2, 1), directed = FALSE, normalized = FALSE)
    Output
           [,1] [,2]
      [1,]    0    2
      [2,]    2    0

# joint_type_distribution_impl errors

    Code
      joint_type_distribution_impl(graph = NULL, from_types = c(1, 2, 1))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# contract_vertices_impl basic

    Code
      contract_vertices_impl(graph = g, mapping = c(1, 1, 2))
    Output
      IGRAPH U--- 2 2 -- 
      + edges:
      [1] 1--1 1--2

# contract_vertices_impl errors

    Code
      contract_vertices_impl(graph = NULL, mapping = c(1, 1, 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# eccentricity_dijkstra_impl basic

    Code
      eccentricity_dijkstra_impl(graph = g)
    Output
      [1] 2 1 2

---

    Code
      eccentricity_dijkstra_impl(graph = g, mode = "in")
    Output
      [1] 2 1 2

# eccentricity_dijkstra_impl errors

    Code
      eccentricity_dijkstra_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# graph_center_dijkstra_impl basic

    Code
      graph_center_dijkstra_impl(graph = g)
    Output
      + 1/3 vertex:
      [1] 2

---

    Code
      graph_center_dijkstra_impl(graph = g, mode = "in")
    Output
      + 1/3 vertex:
      [1] 2

# graph_center_dijkstra_impl errors

    Code
      graph_center_dijkstra_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# radius_dijkstra_impl basic

    Code
      radius_dijkstra_impl(graph = g)
    Output
      [1] 1

---

    Code
      radius_dijkstra_impl(graph = g, mode = "in")
    Output
      [1] 1

# radius_dijkstra_impl errors

    Code
      radius_dijkstra_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# pseudo_diameter_impl basic

    Code
      pseudo_diameter_impl(graph = g, start_vid = 1)
    Output
      $diameter
      [1] 2
      
      $from
      [1] 0
      
      $to
      [1] 2
      

---

    Code
      pseudo_diameter_impl(graph = g, start_vid = 1, directed = FALSE, unconnected = FALSE)
    Output
      $diameter
      [1] 2
      
      $from
      [1] 0
      
      $to
      [1] 2
      

# pseudo_diameter_impl errors

    Code
      pseudo_diameter_impl(graph = NULL, start_vid = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# pseudo_diameter_dijkstra_impl basic

    Code
      pseudo_diameter_dijkstra_impl(graph = g, start_vid = 1)
    Output
      $diameter
      [1] 2
      
      $from
      [1] 0
      
      $to
      [1] 2
      

---

    Code
      pseudo_diameter_dijkstra_impl(graph = g, start_vid = 1, directed = FALSE,
        unconnected = FALSE)
    Output
      $diameter
      [1] 2
      
      $from
      [1] 0
      
      $to
      [1] 2
      

# pseudo_diameter_dijkstra_impl errors

    Code
      pseudo_diameter_dijkstra_impl(graph = NULL, start_vid = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# diversity_impl basic

    Code
      diversity_impl(graph = g)
    Output
      [1] 0.0000000 0.9182958 0.0000000

# diversity_impl errors

    Code
      diversity_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# random_walk_impl basic

    Code
      random_walk_impl(graph = g, start = 1, steps = 2)
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 3
      
      $edges
      + 2/2 edges:
      [1] 1--2 2--3
      

---

    Code
      random_walk_impl(graph = g, start = 1, steps = 2, mode = "in", stuck = "error")
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 1
      
      $edges
      + 2/2 edges:
      [1] 1--2 1--2
      

# random_walk_impl errors

    Code
      random_walk_impl(graph = NULL, start = 1, steps = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# global_efficiency_impl basic

    Code
      global_efficiency_impl(graph = g)
    Output
      [1] 0.8333333

---

    Code
      global_efficiency_impl(graph = g, directed = FALSE)
    Output
      [1] 0.8333333

# global_efficiency_impl errors

    Code
      global_efficiency_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_efficiency_impl basic

    Code
      local_efficiency_impl(graph = g)
    Output
      [1] 0 0 0

---

    Code
      local_efficiency_impl(graph = g, directed = FALSE, mode = "in")
    Output
      [1] 0 0 0

# local_efficiency_impl errors

    Code
      local_efficiency_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# average_local_efficiency_impl basic

    Code
      average_local_efficiency_impl(graph = g)
    Output
      [1] 0

---

    Code
      average_local_efficiency_impl(graph = g, directed = FALSE, mode = "in")
    Output
      [1] 0

# average_local_efficiency_impl errors

    Code
      average_local_efficiency_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitive_closure_dag_impl basic

    Code
      transitive_closure_dag_impl(graph = g)
    Output
      IGRAPH D--- 3 3 -- 
      + edges:
      [1] 1->3 1->2 2->3

# transitive_closure_dag_impl errors

    Code
      transitive_closure_dag_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitive_closure_impl basic

    Code
      transitive_closure_impl(graph = g)
    Output
      IGRAPH U--- 3 3 -- 
      + edges:
      [1] 1--2 1--3 2--3

# transitive_closure_impl errors

    Code
      transitive_closure_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# trussness_impl basic

    Code
      trussness_impl(graph = g)
    Output
      [1] 2 2

# trussness_impl errors

    Code
      trussness_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_graphical_impl basic

    Code
      is_graphical_impl(out_deg = c(2, 2, 2))
    Output
      [1] TRUE

---

    Code
      is_graphical_impl(out_deg = c(2, 2, 2), in_deg = c(1, 1, 1),
      allowed_edge_types = "all")
    Output
      [1] FALSE

# is_graphical_impl errors

    Code
      is_graphical_impl(out_deg = "a")
    Condition
      Warning in `is_graphical_impl()`:
      NAs introduced by coercion
      Error in `is_graphical_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# bfs_simple_impl basic

    Code
      bfs_simple_impl(graph = g, root = 1)
    Output
      $order
      + 3/3 vertices:
      [1] 1 2 3
      
      $layers
      [1] 0 1 2 3
      
      $parents
      [1] -1  0  1
      

---

    Code
      bfs_simple_impl(graph = g, root = 1, mode = "in")
    Output
      $order
      + 3/3 vertices:
      [1] 1 2 3
      
      $layers
      [1] 0 1 2 3
      
      $parents
      [1] -1  0  1
      

# bfs_simple_impl errors

    Code
      bfs_simple_impl(graph = NULL, root = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# bipartite_projection_size_impl basic

    Code
      bipartite_projection_size_impl(graph = g)
    Output
      $vcount1
      [1] 2
      
      $ecount1
      [1] 1
      
      $vcount2
      [1] 2
      
      $ecount2
      [1] 1
      

# bipartite_projection_size_impl errors

    Code
      bipartite_projection_size_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# biadjacency_impl basic

    Code
      biadjacency_impl(incidence = m)
    Output
      $graph
      IGRAPH U--- 5 4 -- 
      + edges:
      [1] 1--3 1--4 1--5 2--5
      
      $types
      [1] FALSE FALSE  TRUE  TRUE  TRUE
      

---

    Code
      biadjacency_impl(incidence = m, directed = TRUE, mode = "in", multiple = TRUE)
    Output
      $graph
      IGRAPH D--- 5 4 -- 
      + edges:
      [1] 3->1 4->1 5->1 5->2
      
      $types
      [1] FALSE FALSE  TRUE  TRUE  TRUE
      

# biadjacency_impl errors

    Code
      biadjacency_impl(incidence = "a")
    Condition
      Warning in `biadjacency_impl()`:
      NAs introduced by coercion
      Error in `biadjacency_impl()`:
      ! REAL() can only be applied to a 'numeric', not a 'character'

# get_biadjacency_impl basic

    Code
      get_biadjacency_impl(graph = g, types = c(TRUE, FALSE, TRUE))
    Output
      $res
           [,1] [,2]
      [1,]    1    1
      
      $row_ids
      [1] 2
      
      $col_ids
      [1] 1 3
      

# get_biadjacency_impl errors

    Code
      get_biadjacency_impl(graph = NULL, types = c(TRUE, FALSE, TRUE))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_bipartite_impl basic

    Code
      is_bipartite_impl(graph = g)
    Output
      $res
      [1] TRUE
      
      $type
      [1] FALSE  TRUE FALSE
      

# is_bipartite_impl errors

    Code
      is_bipartite_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# bipartite_game_gnp_impl basic

    Code
      bipartite_game_gnp_impl(n1 = 2, n2 = 2, p = 0.5)
    Output
      $graph
      IGRAPH U--- 4 4 -- 
      + edges:
      [1] 1--3 2--3 1--4 2--4
      
      $types
      [1] FALSE FALSE  TRUE  TRUE
      

---

    Code
      bipartite_game_gnp_impl(n1 = 2, n2 = 2, p = 0.5, directed = TRUE, mode = "in")
    Output
      $graph
      IGRAPH D--- 4 1 -- 
      + edge:
      [1] 3->2
      
      $types
      [1] FALSE FALSE  TRUE  TRUE
      

# bipartite_game_gnp_impl errors

    Code
      bipartite_game_gnp_impl(n1 = -1, n2 = 2, p = 0.5)
    Condition
      Error in `bipartite_game_gnp_impl()`:
      ! At vendor/cigraph/src/misc/bipartite.c:xx : Invalid number of vertices for bipartite graph. Invalid value

# bipartite_game_gnm_impl basic

    Code
      bipartite_game_gnm_impl(n1 = 2, n2 = 2, m = 1)
    Output
      $graph
      IGRAPH U--- 4 1 -- 
      + edge:
      [1] 2--4
      
      $types
      [1] FALSE FALSE  TRUE  TRUE
      

---

    Code
      bipartite_game_gnm_impl(n1 = 2, n2 = 2, m = 1, directed = TRUE, mode = "in")
    Output
      $graph
      IGRAPH D--- 4 1 -- 
      + edge:
      [1] 3->1
      
      $types
      [1] FALSE FALSE  TRUE  TRUE
      

# bipartite_game_gnm_impl errors

    Code
      bipartite_game_gnm_impl(n1 = -1, n2 = 2, m = 1)
    Condition
      Error in `bipartite_game_gnm_impl()`:
      ! At vendor/cigraph/src/misc/bipartite.c:xx : Invalid number of vertices for bipartite graph. Invalid value

# get_laplacian_impl basic

    Code
      get_laplacian_impl(graph = g)
    Output
           [,1] [,2] [,3]
      [1,]    1   -1    0
      [2,]   -1    2   -1
      [3,]    0   -1    1

---

    Code
      get_laplacian_impl(graph = g, mode = "in", normalization = "symmetric",
        weights = c(1, 2))
    Output
                 [,1]       [,2]       [,3]
      [1,]  1.0000000 -0.5773503  0.0000000
      [2,] -0.5773503  1.0000000 -0.8164966
      [3,]  0.0000000 -0.8164966  1.0000000

# get_laplacian_impl errors

    Code
      get_laplacian_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_laplacian_sparse_impl basic

    Code
      get_laplacian_sparse_impl(graph = g)
    Output
      $type
      [1] "triplet"
      
      $dim
      [1] 3 3
      
      $p
      [1] 0 1 2 0 1 1 2
      
      $i
      [1] 0 1 2 1 0 2 1
      
      $x
      [1]  1  2  1 -1 -1 -1 -1
      
      attr(,"class")
      [1] "igraph.tmp.sparse"

---

    Code
      get_laplacian_sparse_impl(graph = g, mode = "in", normalization = "symmetric",
        weights = c(1, 2))
    Output
      $type
      [1] "triplet"
      
      $dim
      [1] 3 3
      
      $p
      [1] 0 1 2 0 1 1 2
      
      $i
      [1] 0 1 2 1 0 2 1
      
      $x
      [1]  1.0000000  1.0000000  1.0000000 -0.5773503 -0.5773503 -0.8164966 -0.8164966
      
      attr(,"class")
      [1] "igraph.tmp.sparse"

# get_laplacian_sparse_impl errors

    Code
      get_laplacian_sparse_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# connected_components_impl basic

    Code
      connected_components_impl(graph = g)
    Output
      [1] 0 0 0

---

    Code
      connected_components_impl(graph = g, mode = "strong", details = TRUE)
    Output
      $membership
      [1] 0 0 0
      
      $csize
      [1] 3
      
      $no
      [1] 1
      

# connected_components_impl errors

    Code
      connected_components_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_connected_impl basic

    Code
      is_connected_impl(graph = g)
    Output
      [1] TRUE

---

    Code
      is_connected_impl(graph = g, mode = "strong")
    Output
      [1] TRUE

# is_connected_impl errors

    Code
      is_connected_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# articulation_points_impl basic

    Code
      articulation_points_impl(graph = g)
    Output
      + 1/3 vertex:
      [1] 2

# articulation_points_impl errors

    Code
      articulation_points_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# biconnected_components_impl basic

    Code
      biconnected_components_impl(graph = g)
    Output
      $no
      [1] 2
      
      $tree_edges
      $tree_edges[[1]]
      + 1/2 edge:
      [1] 2--3
      
      $tree_edges[[2]]
      + 1/2 edge:
      [1] 1--2
      
      
      $component_edges
      $component_edges[[1]]
      + 1/2 edge:
      [1] 2--3
      
      $component_edges[[2]]
      + 1/2 edge:
      [1] 1--2
      
      
      $components
      $components[[1]]
      + 2/3 vertices:
      [1] 3 2
      
      $components[[2]]
      + 2/3 vertices:
      [1] 2 1
      
      
      $articulation_points
      + 1/3 vertex:
      [1] 2
      

# biconnected_components_impl errors

    Code
      biconnected_components_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# bridges_impl basic

    Code
      bridges_impl(graph = g)
    Output
      + 2/2 edges:
      [1] 2--3 1--2

# bridges_impl errors

    Code
      bridges_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_biconnected_impl basic

    Code
      is_biconnected_impl(graph = g)
    Output
      [1] FALSE

# is_biconnected_impl errors

    Code
      is_biconnected_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_reachable_impl basic

    Code
      count_reachable_impl(graph = g, mode = "out")
    Output
      [1] 5 5 5 5 5

---

    Code
      count_reachable_impl(graph = g, mode = "in")
    Output
      [1] 5 5 5 5 5

# count_reachable_impl errors

    Code
      count_reachable_impl(graph = NULL, mode = "out")
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# bond_percolation_impl basic

    Code
      bond_percolation_impl(graph = g)
    Output
      $giant_size
      numeric(0)
      
      $vetex_count
      numeric(0)
      

# bond_percolation_impl errors

    Code
      bond_percolation_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# site_percolation_impl basic

    Code
      site_percolation_impl(graph = g)
    Output
      $giant_size
      numeric(0)
      
      $edge_count
      numeric(0)
      

# site_percolation_impl errors

    Code
      site_percolation_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# edgelist_percolation_impl basic

    Code
      edgelist_percolation_impl(edges = matrix(c(1, 2, 2, 3), ncol = 2))
    Output
      $giant_size
      [1] 2 3
      
      $vertex_count
      [1] 2 3
      

# edgelist_percolation_impl errors

    Code
      edgelist_percolation_impl(edges = "a")
    Condition
      Error in `edgelist_percolation_impl()`:
      ! REAL() can only be applied to a 'numeric', not a 'character'

# is_clique_impl basic

    Code
      is_clique_impl(graph = g, candidate = 1:2)
    Output
      [1] TRUE

---

    Code
      is_clique_impl(graph = g, candidate = 1:2, directed = TRUE)
    Output
      [1] TRUE

# is_clique_impl errors

    Code
      is_clique_impl(graph = NULL, candidate = 1:2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# cliques_impl basic

    Code
      cliques_impl(graph = g)
    Output
      [[1]]
      + 1/3 vertex:
      [1] 2
      
      [[2]]
      + 1/3 vertex:
      [1] 3
      
      [[3]]
      + 2/3 vertices:
      [1] 2 3
      
      [[4]]
      + 1/3 vertex:
      [1] 1
      
      [[5]]
      + 2/3 vertices:
      [1] 1 2
      

---

    Code
      cliques_impl(graph = g, min = 2, max = 2)
    Output
      [[1]]
      + 2/3 vertices:
      [1] 2 3
      
      [[2]]
      + 2/3 vertices:
      [1] 1 2
      

# cliques_impl errors

    Code
      cliques_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# clique_size_hist_impl basic

    Code
      clique_size_hist_impl(graph = g)
    Output
      [1] 3 2

---

    Code
      clique_size_hist_impl(graph = g, min_size = 2, max_size = 2)
    Output
      [1] 0 2

# clique_size_hist_impl errors

    Code
      clique_size_hist_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# largest_cliques_impl basic

    Code
      largest_cliques_impl(graph = g)
    Output
      [[1]]
      + 2/3 vertices:
      [1] 1 2
      
      [[2]]
      + 2/3 vertices:
      [1] 2 3
      

# largest_cliques_impl errors

    Code
      largest_cliques_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# maximal_cliques_hist_impl basic

    Code
      maximal_cliques_hist_impl(graph = g)
    Output
      [1] 0 2

---

    Code
      maximal_cliques_hist_impl(graph = g, min_size = 2, max_size = 2)
    Output
      [1] 0 2

# maximal_cliques_hist_impl errors

    Code
      maximal_cliques_hist_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# clique_number_impl basic

    Code
      clique_number_impl(graph = g)
    Output
      [1] 2

# clique_number_impl errors

    Code
      clique_number_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# weighted_cliques_impl basic

    Code
      weighted_cliques_impl(graph = g)
    Output
      [[1]]
      + 1/3 vertex:
      [1] 2
      
      [[2]]
      + 1/3 vertex:
      [1] 3
      
      [[3]]
      + 2/3 vertices:
      [1] 2 3
      
      [[4]]
      + 1/3 vertex:
      [1] 1
      
      [[5]]
      + 2/3 vertices:
      [1] 1 2
      

---

    Code
      weighted_cliques_impl(graph = g, vertex_weights = c(1, 2, 3), min_weight = 1,
      max_weight = 3, maximal = TRUE)
    Output
      [[1]]
      + 2/3 vertices:
      [1] 1 2
      

# weighted_cliques_impl errors

    Code
      weighted_cliques_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# largest_weighted_cliques_impl basic

    Code
      largest_weighted_cliques_impl(graph = g)
    Output
      [[1]]
      + 2/3 vertices:
      [1] 1 2
      
      [[2]]
      + 2/3 vertices:
      [1] 2 3
      

---

    Code
      largest_weighted_cliques_impl(graph = g, vertex_weights = c(1, 2, 3))
    Output
      [[1]]
      + 2/3 vertices:
      [1] 2 3
      

# largest_weighted_cliques_impl errors

    Code
      largest_weighted_cliques_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# weighted_clique_number_impl basic

    Code
      weighted_clique_number_impl(graph = g)
    Output
      [1] 2

---

    Code
      weighted_clique_number_impl(graph = g, vertex_weights = c(1, 2, 3))
    Output
      [1] 5

# weighted_clique_number_impl errors

    Code
      weighted_clique_number_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_independent_vertex_set_impl basic

    Code
      is_independent_vertex_set_impl(graph = g, candidate = 1:2)
    Output
      [1] FALSE

# is_independent_vertex_set_impl errors

    Code
      is_independent_vertex_set_impl(graph = NULL, candidate = 1:2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_random_impl basic

    Code
      layout_random_impl(graph = g)
    Output
                  [,1]       [,2]
      [1,]  0.91714717  0.7003783
      [2,] -0.84358557  0.6509057
      [3,] -0.08120892 -0.8259847

# layout_random_impl errors

    Code
      layout_random_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_circle_impl basic

    Code
      layout_circle_impl(graph = g)
    Output
           [,1]       [,2]
      [1,]  1.0  0.0000000
      [2,] -0.5  0.8660254
      [3,] -0.5 -0.8660254

---

    Code
      layout_circle_impl(graph = g, order = 1:3)
    Output
           [,1]       [,2]
      [1,]  1.0  0.0000000
      [2,] -0.5  0.8660254
      [3,] -0.5 -0.8660254

# layout_circle_impl errors

    Code
      layout_circle_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_star_impl basic

    Code
      round(layout_star_impl(graph = g), 4)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    1    0
      [3,]   -1    0

---

    Code
      round(layout_star_impl(graph = g, center = 1, order = 3:1), 4)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]   -1    0
      [3,]    1    0

# layout_star_impl errors

    Code
      layout_star_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_grid_impl basic

    Code
      layout_grid_impl(graph = g)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    1    0
      [3,]    0    1

---

    Code
      layout_grid_impl(graph = g, width = 2)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    1    0
      [3,]    0    1

# layout_grid_impl errors

    Code
      layout_grid_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_grid_3d_impl basic

    Code
      layout_grid_3d_impl(graph = g)
    Output
           [,1] [,2] [,3]
      [1,]    0    0    0
      [2,]    1    0    0
      [3,]    0    1    0

---

    Code
      layout_grid_3d_impl(graph = g, width = 2, height = 2)
    Output
           [,1] [,2] [,3]
      [1,]    0    0    0
      [2,]    1    0    0
      [3,]    0    1    0

# layout_grid_3d_impl errors

    Code
      layout_grid_3d_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# roots_for_tree_layout_impl basic

    Code
      roots_for_tree_layout_impl(graph = g, mode = "out", heuristic = 1)
    Output
      + 1/3 vertex:
      [1] 2

# roots_for_tree_layout_impl errors

    Code
      roots_for_tree_layout_impl(graph = NULL, mode = "out", heuristic = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_random_3d_impl basic

    Code
      layout_random_3d_impl(graph = g)
    Output
                  [,1]       [,2]      [,3]
      [1,]  0.91714717  0.7003783 0.7338074
      [2,] -0.84358557  0.6509057 0.4644714
      [3,] -0.08120892 -0.8259847 0.5240391

# layout_random_3d_impl errors

    Code
      layout_random_3d_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_sphere_impl basic

    Code
      layout_sphere_impl(graph = g)
    Output
                 [,1]      [,2] [,3]
      [1,]  0.0000000 0.0000000   -1
      [2,] -0.4861377 0.8738822    0
      [3,]  0.0000000 0.0000000    1

---

    Code
      layout_sphere_impl(graph = g)
    Output
                 [,1]       [,2] [,3]
      [1,]  0.0000000  0.0000000 -1.0
      [2,] -0.2461774  0.8302992 -0.5
      [3,] -0.9468790 -0.3215901  0.0
      [4,]  0.5001161 -0.7070246  0.5
      [5,]  0.0000000  0.0000000  1.0

# layout_sphere_impl errors

    Code
      layout_sphere_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_sugiyama_impl basic

    Code
      layout_sugiyama_impl(graph = g)
    Output
      $res
           [,1] [,2]
      [1,]  0.0    1
      [2,]  0.5    0
      [3,]  1.0    1
      
      $extd_graph
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $extd_to_orig_eids
      [1] 1 2
      

---

    Code
      layout_sugiyama_impl(graph = g, layers = 1:3, hgap = 2, vgap = 2, maxiter = 10,
      weights = c(1, 2))
    Output
      $res
           [,1] [,2]
      [1,]    0    0
      [2,]    0    2
      [3,]    0    4
      
      $extd_graph
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $extd_to_orig_eids
      [1] 1 2
      

# layout_sugiyama_impl errors

    Code
      layout_sugiyama_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_mds_impl basic

    Code
      layout_mds_impl(graph = g)
    Output
           [,1]         [,2]
      [1,]    1 2.807594e-08
      [2,]    0 0.000000e+00
      [3,]   -1 2.807594e-08

---

    Code
      layout_mds_impl(graph = g, dist = matrix(1:9, nrow = 3), dim = 3)
    Output
                [,1]        [,2]     [,3]
      [1,] -2.907521  2.32638426 1.444979
      [2,] -3.900013 -1.63291106 2.258035
      [3,]  3.975674  0.09951448 3.271816

# layout_mds_impl errors

    Code
      layout_mds_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_bipartite_impl basic

    Code
      layout_bipartite_impl(graph = g, types = c(TRUE, FALSE, TRUE))
    Output
           [,1] [,2]
      [1,]  0.0    0
      [2,]  0.5    1
      [3,]  1.0    0

---

    Code
      layout_bipartite_impl(graph = g, types = c(TRUE, FALSE, TRUE), hgap = 2, vgap = 2,
      maxiter = 10)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    1    2
      [3,]    2    0

# layout_bipartite_impl errors

    Code
      layout_bipartite_impl(graph = NULL, types = c(TRUE, FALSE, TRUE))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_gem_impl basic

    Code
      layout_gem_impl(graph = g, res = matrix(0, nrow = 3, ncol = 2))
    Output
                [,1]      [,2]
      [1,] 262.48135 -232.3960
      [2,] -15.77371  195.0729
      [3,] 182.43029 -223.2375

---

    Code
      layout_gem_impl(graph = g, res = matrix(0, nrow = 3, ncol = 2), use_seed = TRUE,
      maxiter = 10, temp_max = 2, temp_min = 0.1, temp_init = 1)
    Output
                [,1]       [,2]
      [1,] -3.512540 -3.4930988
      [2,]  1.774751  0.1310939
      [3,] -1.004480  2.5739849

# layout_gem_impl errors

    Code
      layout_gem_impl(graph = NULL, res = matrix(0, nrow = 3, ncol = 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_davidson_harel_impl basic

    Code
      layout_davidson_harel_impl(graph = g, res = matrix(0, nrow = 3, ncol = 2))
    Output
               [,1]      [,2]
      [1,] 1.152116 0.9424808
      [2,] 2.474361 2.5195497
      [3,] 3.849187 4.0402661

---

    Code
      layout_davidson_harel_impl(graph = g, res = matrix(0, nrow = 3, ncol = 2),
      use_seed = TRUE, maxiter = 10, fineiter = 5, cool_fact = 0.5, weight_node_dist = 2,
      weight_border = 1, weight_edge_lengths = 0.1, weight_edge_crossings = 0.2,
      weight_node_edge_dist = 0.3)
    Output
                [,1]      [,2]
      [1,] -6.609493 -2.155221
      [2,] -8.660255 -3.797365
      [3,] -6.485087 -5.224752

# layout_davidson_harel_impl errors

    Code
      layout_davidson_harel_impl(graph = NULL, res = matrix(0, nrow = 3, ncol = 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_umap_impl basic

    Code
      layout_umap_impl(graph = g, res = matrix(0, nrow = 3, ncol = 2), use_seed = TRUE)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    0    0
      [3,]    0    0

---

    Code
      layout_umap_impl(graph = g, res = matrix(0, nrow = 3, ncol = 2), use_seed = TRUE,
      distances = 1:3, min_dist = 0.1, epochs = 10, distances_are_weights = TRUE)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    0    0
      [3,]    0    0

# layout_umap_impl errors

    Code
      layout_umap_impl(graph = NULL, res = matrix(0, nrow = 3, ncol = 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_umap_3d_impl basic

    Code
      layout_umap_3d_impl(graph = g, res = matrix(0, nrow = 3, ncol = 3), use_seed = TRUE)
    Output
           [,1] [,2] [,3]
      [1,]    0    0    0
      [2,]    0    0    0
      [3,]    0    0    0

---

    Code
      layout_umap_3d_impl(graph = g, res = matrix(0, nrow = 3, ncol = 3), use_seed = TRUE,
      distances = 1:3, min_dist = 0.1, epochs = 10, distances_are_weights = TRUE)
    Output
           [,1] [,2] [,3]
      [1,]    0    0    0
      [2,]    0    0    0
      [3,]    0    0    0

# layout_umap_3d_impl errors

    Code
      layout_umap_3d_impl(graph = NULL, res = matrix(0, nrow = 3, ncol = 3))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_umap_compute_weights_impl basic

    Code
      layout_umap_compute_weights_impl(graph = g, distances = 1:2, weights = 1:3)
    Output
      [1] 1 1

# layout_umap_compute_weights_impl errors

    Code
      layout_umap_compute_weights_impl(graph = NULL, distances = 1:3, weights = 1:3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_align_impl basic

    Code
      layout_align_impl(graph = g, layout = matrix(0, nrow = 3, ncol = 2))
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    0    0
      [3,]    0    0

# layout_align_impl errors

    Code
      layout_align_impl(graph = NULL, layout = matrix(0, nrow = 3, ncol = 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_dice_impl basic

    Code
      similarity_dice_impl(graph = g)
    Output
           [,1] [,2] [,3]
      [1,]    1    0    1
      [2,]    0    1    0
      [3,]    1    0    1

---

    Code
      similarity_dice_impl(graph = g, vids = 1:2, mode = "in", loops = TRUE)
    Output
           [,1] [,2]
      [1,]  1.0  0.8
      [2,]  0.8  1.0

# similarity_dice_impl errors

    Code
      similarity_dice_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_dice_es_impl basic

    Code
      similarity_dice_es_impl(graph = g)
    Output
      [1] 0 0

---

    Code
      similarity_dice_es_impl(graph = g, es = 1:2, mode = "in", loops = TRUE)
    Output
      [1] 0.8 0.8

# similarity_dice_es_impl errors

    Code
      similarity_dice_es_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_dice_pairs_impl basic

    Code
      similarity_dice_pairs_impl(graph = g, pairs = matrix(c(1, 2, 2, 3), ncol = 2))
    Output
      [1] 0 0

---

    Code
      similarity_dice_pairs_impl(graph = g, pairs = matrix(c(1, 2, 2, 3), ncol = 2),
      mode = "in", loops = TRUE)
    Output
      [1] 0.6666667 0.8000000

# similarity_dice_pairs_impl errors

    Code
      similarity_dice_pairs_impl(graph = NULL, pairs = matrix(c(1, 2, 2, 3), ncol = 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_inverse_log_weighted_impl basic

    Code
      similarity_inverse_log_weighted_impl(graph = g)
    Output
               [,1] [,2]     [,3]
      [1,] 0.000000    0 1.442695
      [2,] 0.000000    0 0.000000
      [3,] 1.442695    0 0.000000

---

    Code
      similarity_inverse_log_weighted_impl(graph = g, vids = 1:2, mode = "in")
    Output
           [,1] [,2]     [,3]
      [1,]    0    0 1.442695
      [2,]    0    0 0.000000

# similarity_inverse_log_weighted_impl errors

    Code
      similarity_inverse_log_weighted_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_jaccard_impl basic

    Code
      similarity_jaccard_impl(graph = g)
    Output
           [,1] [,2] [,3]
      [1,]    1    0    1
      [2,]    0    1    0
      [3,]    1    0    1

---

    Code
      similarity_jaccard_impl(graph = g, vids = 1:2, mode = "in", loops = TRUE)
    Output
                [,1]      [,2]
      [1,] 1.0000000 0.6666667
      [2,] 0.6666667 1.0000000

# similarity_jaccard_impl errors

    Code
      similarity_jaccard_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_jaccard_es_impl basic

    Code
      similarity_jaccard_es_impl(graph = g)
    Output
      [1] 0 0

---

    Code
      similarity_jaccard_es_impl(graph = g, es = 1:2, mode = "in", loops = TRUE)
    Output
      [1] 0.6666667 0.6666667

# similarity_jaccard_es_impl errors

    Code
      similarity_jaccard_es_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_jaccard_pairs_impl basic

    Code
      similarity_jaccard_pairs_impl(graph = g, pairs = matrix(c(1, 2, 2, 3), ncol = 2))
    Output
      [1] 0 0

---

    Code
      similarity_jaccard_pairs_impl(graph = g, pairs = matrix(c(1, 2, 2, 3), ncol = 2),
      mode = "in", loops = TRUE)
    Output
      [1] 0.5000000 0.6666667

# similarity_jaccard_pairs_impl errors

    Code
      similarity_jaccard_pairs_impl(graph = NULL, pairs = matrix(c(1, 2, 2, 3), ncol = 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# compare_communities_impl basic

    Code
      compare_communities_impl(comm1 = c(1, 2, 1), comm2 = c(2, 1, 2))
    Output
      [1] 0

---

    Code
      compare_communities_impl(comm1 = c(1, 2, 1), comm2 = c(2, 1, 2), method = "nmi")
    Output
      [1] 1

---

    Code
      compare_communities_impl(comm1 = comm1, comm2 = comm2, method = "vi")
    Output
      [1] 0.5493061

# compare_communities_impl errors

    Code
      compare_communities_impl(comm1 = "a", comm2 = c(2, 1, 2))
    Condition
      Warning in `compare_communities_impl()`:
      NAs introduced by coercion
      Error in `compare_communities_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# modularity_impl basic

    Code
      modularity_impl(graph = g, membership = c(1, 2, 1))
    Output
      [1] -0.5

---

    Code
      modularity_impl(graph = g, membership = c(1, 2, 1), weights = c(1, 2),
      resolution = 0.5, directed = FALSE)
    Output
      [1] -0.25

# modularity_impl errors

    Code
      modularity_impl(graph = NULL, membership = c(1, 2, 1))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# modularity_matrix_impl basic

    Code
      modularity_matrix_impl(graph = g)
    Output
            [,1] [,2]  [,3]
      [1,] -0.25  0.5 -0.25
      [2,]  0.50 -1.0  0.50
      [3,] -0.25  0.5 -0.25

---

    Code
      modularity_matrix_impl(graph = g, weights = c(1, 2), resolution = 0.5,
      directed = FALSE)
    Output
                  [,1]  [,2]       [,3]
      [1,] -0.08333333  0.75 -0.1666667
      [2,]  0.75000000 -0.75  1.5000000
      [3,] -0.16666667  1.50 -0.3333333

# modularity_matrix_impl errors

    Code
      modularity_matrix_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# community_fluid_communities_impl basic

    Code
      community_fluid_communities_impl(graph = g, no_of_communities = 2)
    Output
      [1] 1 0 0

# community_fluid_communities_impl errors

    Code
      community_fluid_communities_impl(graph = NULL, no_of_communities = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# community_label_propagation_impl basic

    Code
      community_label_propagation_impl(graph = g)
    Output
      [1] 0 0 0

---

    Code
      community_label_propagation_impl(graph = g, mode = "in", weights = c(1, 2),
      initial = 1:3, fixed = c(TRUE, FALSE, TRUE))
    Output
      [1] 0 1 1

# community_label_propagation_impl errors

    Code
      community_label_propagation_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# community_multilevel_impl basic

    Code
      community_multilevel_impl(graph = g)
    Output
      $membership
      [1] 0 0 0
      
      $memberships
           [,1] [,2] [,3]
      [1,]    0    0    0
      
      $modularity
      [1] 0
      

---

    Code
      community_multilevel_impl(graph = g, weights = c(1, 2), resolution = 0.5)
    Output
      $membership
      [1] 0 0 0
      
      $memberships
           [,1] [,2] [,3]
      [1,]    0    0    0
      
      $modularity
      [1] 0.5
      

# community_multilevel_impl errors

    Code
      community_multilevel_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# community_optimal_modularity_impl basic

    Code
      community_optimal_modularity_impl(graph = g)
    Output
      $modularity
      [1] 0
      
      $membership
      [1] 0 0 0
      

---

    Code
      community_optimal_modularity_impl(graph = g, weights = c(1, 2))
    Output
      $modularity
      [1] 1.850372e-17
      
      $membership
      [1] 0 0 0
      

# community_optimal_modularity_impl errors

    Code
      community_optimal_modularity_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# community_leiden_impl basic

    Code
      community_leiden_impl(graph = g, weights = c(1, 2), vertex_weights = c(1, 2, 3),
      resolution = 0.5, beta = 0.1, start = TRUE, n_iterations = 1, membership = 1:3)
    Output
      $membership
      [1] 0 1 2
      
      $nb_clusters
      [1] 3
      
      $quality
      [1] -1.166667
      

# community_leiden_impl errors

    Code
      community_leiden_impl(graph = NULL, resolution = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# split_join_distance_impl basic

    Code
      split_join_distance_impl(comm1 = c(1, 2, 1), comm2 = c(2, 1, 2))
    Output
      $distance12
      [1] 0
      
      $distance21
      [1] 0
      

# split_join_distance_impl errors

    Code
      split_join_distance_impl(comm1 = "a", comm2 = c(2, 1, 2))
    Condition
      Warning in `split_join_distance_impl()`:
      NAs introduced by coercion
      Error in `split_join_distance_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# community_infomap_impl basic

    Code
      community_infomap_impl(graph = g)
    Output
      $membership
      [1] 0 0 0
      
      $codelength
      [1] 1.512987
      

---

    Code
      community_infomap_impl(graph = g, e_weights = c(1, 2), v_weights = c(1, 2, 3),
      nb_trials = 2)
    Output
      $membership
      [1] 0 0 0
      
      $codelength
      [1] 1.462254
      

# community_infomap_impl errors

    Code
      community_infomap_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# graphlets_impl basic

    Code
      graphlets_impl(graph = g)
    Output
      $cliques
      $cliques[[1]]
      + 2/3 vertices:
      [1] 2 3
      
      $cliques[[2]]
      + 2/3 vertices:
      [1] 1 2
      
      
      $Mu
      [1] 0.6665667 0.3332333
      

---

    Code
      graphlets_impl(graph = g, weights = c(3, 4), niter = 10)
    Output
      $cliques
      $cliques[[1]]
      + 2/3 vertices:
      [1] 2 3
      
      $cliques[[2]]
      + 2/3 vertices:
      [1] 1 2
      
      
      $Mu
      [1] 1.333233 0.999900
      

# graphlets_impl errors

    Code
      graphlets_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

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
      ! At vendor/cigraph/src/hrg/hrg_types.cc:xx : Assertion failed: n >= 0. This is an unexpected igraph error; please report this as a bug, along with the steps to reproduce it.
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
      ! At vendor/cigraph/src/hrg/hrg_types.cc:xx : Assertion failed: n >= 0. This is an unexpected igraph error; please report this as a bug, along with the steps to reproduce it.
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
      ! At vendor/cigraph/src/hrg/hrg_types.cc:xx : Assertion failed: n >= 0. This is an unexpected igraph error; please report this as a bug, along with the steps to reproduce it.
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
      ! At vendor/cigraph/src/hrg/hrg.cc:xx : HRG probability vector size (1) should be equal to the number of internal nodes (2). Invalid value

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
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

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
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

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
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# get_adjacency_sparse_impl basic

    Code
      get_adjacency_sparse_impl(graph = g)
    Output
      $type
      [1] "triplet"
      
      $dim
      [1] 3 3
      
      $p
      [1] 0 1 1 2
      
      $i
      [1] 1 0 2 1
      
      $x
      [1] 1 1 1 1
      
      attr(,"class")
      [1] "igraph.tmp.sparse"

---

    Code
      get_adjacency_sparse_impl(graph = g, type = "upper", weights = c(1, 2), loops = "none")
    Output
      $type
      [1] "triplet"
      
      $dim
      [1] 3 3
      
      $p
      [1] 1 2
      
      $i
      [1] 0 1
      
      $x
      [1] 1 2
      
      attr(,"class")
      [1] "igraph.tmp.sparse"

# get_adjacency_sparse_impl errors

    Code
      get_adjacency_sparse_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_stochastic_impl basic

    Code
      get_stochastic_impl(graph = g)
    Output
           [,1] [,2] [,3]
      [1,]  0.0    1  0.0
      [2,]  0.5    0  0.5
      [3,]  0.0    1  0.0

---

    Code
      get_stochastic_impl(graph = g, column_wise = TRUE, weights = c(1, 2))
    Output
           [,1]      [,2] [,3]
      [1,]    0 0.3333333    0
      [2,]    1 0.0000000    1
      [3,]    0 0.6666667    0

# get_stochastic_impl errors

    Code
      get_stochastic_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_stochastic_sparse_impl basic

    Code
      get_stochastic_sparse_impl(graph = g)
    Output
      $type
      [1] "triplet"
      
      $dim
      [1] 3 3
      
      $p
      [1] 0 1 1 2
      
      $i
      [1] 1 0 2 1
      
      $x
      [1] 0.5 1.0 1.0 0.5
      
      attr(,"class")
      [1] "igraph.tmp.sparse"

---

    Code
      get_stochastic_sparse_impl(graph = g, column_wise = TRUE, weights = c(1, 2))
    Output
      $type
      [1] "triplet"
      
      $dim
      [1] 3 3
      
      $p
      [1] 0 1 1 2
      
      $i
      [1] 1 0 2 1
      
      $x
      [1] 1.0000000 0.3333333 0.6666667 1.0000000
      
      attr(,"class")
      [1] "igraph.tmp.sparse"

# get_stochastic_sparse_impl errors

    Code
      get_stochastic_sparse_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# to_directed_impl basic

    Code
      to_directed_impl(graph = g)
    Output
      IGRAPH D--- 3 4 -- 
      + edges:
      [1] 1->2 2->3 2->1 3->2

---

    Code
      to_directed_impl(graph = g, mode = "acyclic")
    Output
      IGRAPH D--- 3 2 -- 
      + edges:
      [1] 1->2 2->3

# to_directed_impl errors

    Code
      to_directed_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# to_undirected_impl basic

    Code
      to_undirected_impl(graph = g)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

---

    Code
      to_undirected_impl(graph = g, mode = "mutual", edge_attr_comb = "sum")
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

# to_undirected_impl errors

    Code
      to_undirected_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

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
      ! At vendor/cigraph/src/misc/motifs.c:xx : Cut probability vector size (1) must agree with motif size (3). Invalid value

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
      At vendor/cigraph/src/misc/motifs.c:1157 : Triad census called on an undirected graph. All connections will be treated as mutual.
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

# local_scan_0_impl basic

    Code
      local_scan_0_impl(graph = g)
    Output
      [1] 1 2 1

---

    Code
      local_scan_0_impl(graph = g, weights = c(1, 2), mode = "in")
    Output
      [1] 1 3 2

# local_scan_0_impl errors

    Code
      local_scan_0_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_0_them_impl basic

    Code
      local_scan_0_them_impl(us = g1, them = g2)
    Output
      [1] 1 2 1

---

    Code
      local_scan_0_them_impl(us = g1, them = g2, weights_them = c(1, 2), mode = "in")
    Output
      [1] 1 3 2

# local_scan_0_them_impl errors

    Code
      local_scan_0_them_impl(us = NULL, them = them)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_1_ecount_impl basic

    Code
      local_scan_1_ecount_impl(graph = g)
    Output
      [1] 1 2 1

---

    Code
      local_scan_1_ecount_impl(graph = g, weights = c(1, 2), mode = "in")
    Output
      [1] 1 3 2

# local_scan_1_ecount_impl errors

    Code
      local_scan_1_ecount_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_1_ecount_them_impl basic

    Code
      local_scan_1_ecount_them_impl(us = g1, them = g2)
    Output
      [1] 1 2 1

---

    Code
      local_scan_1_ecount_them_impl(us = g1, them = g2, weights_them = c(1, 2), mode = "in")
    Output
      [1] 1 3 2

# local_scan_1_ecount_them_impl errors

    Code
      local_scan_1_ecount_them_impl(us = NULL, them = them)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_k_ecount_impl basic

    Code
      local_scan_k_ecount_impl(graph = g, k = 1)
    Output
      [1] 1 2 1

---

    Code
      local_scan_k_ecount_impl(graph = g, k = 1, weights = c(1, 2), mode = "in")
    Output
      [1] 1 3 2

# local_scan_k_ecount_impl errors

    Code
      local_scan_k_ecount_impl(graph = NULL, k = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_k_ecount_them_impl basic

    Code
      local_scan_k_ecount_them_impl(us = g1, them = g2, k = 1)
    Output
      [1] 1 2 1

---

    Code
      local_scan_k_ecount_them_impl(us = g1, them = g2, k = 1, weights_them = c(1, 2),
      mode = "in")
    Output
      [1] 1 3 2

# local_scan_k_ecount_them_impl errors

    Code
      local_scan_k_ecount_them_impl(us = NULL, them = them, k = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_neighborhood_ecount_impl basic

    Code
      local_scan_neighborhood_ecount_impl(graph = g, neighborhoods = list(1:2, 2:3, 2:
        4, 2))
    Output
      [1] 1 1 2 0

---

    Code
      local_scan_neighborhood_ecount_impl(graph = g, weights = c(1, 2, 3),
      neighborhoods = list(1:2, 1:3, 2:4, 1))
    Output
      [1] 1 3 5 0

# local_scan_neighborhood_ecount_impl errors

    Code
      local_scan_neighborhood_ecount_impl(graph = NULL, neighborhoods = list(1:2, 2:3))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_subset_ecount_impl basic

    Code
      local_scan_subset_ecount_impl(graph = g, subsets = list(c(1, 2), c(2, 3)))
    Output
      [1] 1 1

---

    Code
      local_scan_subset_ecount_impl(graph = g, weights = c(1, 2, 3), subsets = list(c(
        1, 2), c(2, 3)))
    Output
      [1] 1 2

# local_scan_subset_ecount_impl errors

    Code
      local_scan_subset_ecount_impl(graph = g, subsets = list(1:2, letters[2:3]))
    Condition
      Error in `.x - 1`:
      ! non-numeric argument to binary operator

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

# join_impl basic

    Code
      join_impl(left = g1, right = g2)
    Output
      IGRAPH U--- 6 13 -- 
      + edges:
       [1] 1--2 2--3 4--5 5--6 1--4 1--5 1--6 2--4 2--5 2--6 3--4 3--5 3--6

# join_impl errors

    Code
      join_impl(left = NULL, right = right)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# induced_subgraph_map_impl basic

    Code
      induced_subgraph_map_impl(graph = g, vids = 1:2, impl = "auto")
    Output
      $res
      IGRAPH U--- 2 1 -- 
      + edge:
      [1] 1--2
      
      $map
      [1] 2 3 1
      
      $invmap
      [1] 1 2
      

---

    Code
      induced_subgraph_map_impl(graph = g, vids = 1:2, impl = "copy_and_delete")
    Output
      $res
      IGRAPH U--- 2 1 -- 
      + edge:
      [1] 1--2
      
      $map
      [1] 2 3 1
      
      $invmap
      [1] 1 2
      

# induced_subgraph_map_impl errors

    Code
      induced_subgraph_map_impl(graph = NULL, vids = 1:2, impl = "auto")
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# mycielskian_impl basic

    Code
      mycielskian_impl(graph = g)
    Output
      IGRAPH U--- 7 9 -- 
      + edges:
      [1] 1--2 2--3 1--5 2--4 2--6 3--5 4--7 5--7 6--7

---

    Code
      mycielskian_impl(graph = g, k = 2)
    Output
      IGRAPH U--- 15 34 -- 
      + edges:
       [1]  1-- 2  2-- 3  1-- 5  2-- 4  2-- 6  3-- 5  4-- 7  5-- 7  6-- 7  1-- 9
      [11]  2-- 8  2--10  3-- 9  1--12  5-- 8  2--11  4-- 9  2--13  6-- 9  3--12
      [21]  5--10  4--14  7--11  5--14  7--12  6--14  7--13  8--15  9--15 10--15
      [31] 11--15 12--15 13--15 14--15

# mycielskian_impl errors

    Code
      mycielskian_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# product_impl basic

    Code
      product_impl(g1 = g1, g2 = g2)
    Output
      IGRAPH U--- 9 12 -- 
      + edges:
       [1] 1--4 2--5 3--6 4--7 5--8 6--9 1--2 4--5 7--8 2--3 5--6 8--9

---

    Code
      product_impl(g1 = g1, g2 = g2, type = "tensor")
    Output
      IGRAPH U--- 9 8 -- 
      + edges:
      [1] 1--5 2--4 2--6 3--5 4--8 5--7 5--9 6--8

# product_impl errors

    Code
      product_impl(g1 = NULL, g2 = g2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# rooted_product_impl basic

    Code
      rooted_product_impl(g1 = g1, g2 = g2, root = 1)
    Output
      IGRAPH U--- 9 8 -- 
      + edges:
      [1] 1--4 4--7 1--2 4--5 7--8 2--3 5--6 8--9

# rooted_product_impl errors

    Code
      rooted_product_impl(g1 = NULL, g2 = g2, root = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# gomory_hu_tree_impl basic

    Code
      gomory_hu_tree_impl(graph = g)
    Output
      $tree
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $flows
      [1] 1 1
      

---

    Code
      gomory_hu_tree_impl(graph = g, capacity = c(1, 2))
    Output
      $tree
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $flows
      [1] 1 2
      

# gomory_hu_tree_impl errors

    Code
      gomory_hu_tree_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# maxflow_impl basic

    Code
      maxflow_impl(graph = g, source = 1, target = 3)
    Output
      $value
      [1] 1
      
      $flow
      [1] 1 1
      
      $cut
      + 1/2 edge:
      [1] 2--3
      
      $partition1
      + 2/3 vertices:
      [1] 1 2
      
      $partition2
      + 1/3 vertex:
      [1] 3
      
      $stats
      $stats$nopush
      [1] 1
      
      $stats$norelabel
      [1] 0
      
      $stats$nogap
      [1] 0
      
      $stats$nogapnodes
      [1] 0
      
      $stats$nobfs
      [1] 1
      
      

---

    Code
      maxflow_impl(graph = g, source = 1, target = 3, capacity = c(1, 2))
    Output
      $value
      [1] 1
      
      $flow
      [1] 1 1
      
      $cut
      + 1/2 edge:
      [1] 1--2
      
      $partition1
      + 1/3 vertex:
      [1] 1
      
      $partition2
      + 2/3 vertices:
      [1] 2 3
      
      $stats
      $stats$nopush
      [1] 1
      
      $stats$norelabel
      [1] 0
      
      $stats$nogap
      [1] 0
      
      $stats$nogapnodes
      [1] 0
      
      $stats$nobfs
      [1] 1
      
      

# maxflow_impl errors

    Code
      maxflow_impl(graph = NULL, source = 1, target = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# residual_graph_impl basic

    Code
      residual_graph_impl(graph = g, capacity = c(1, 2), flow = c(1, 2))
    Output
      $residual
      IGRAPH D--- 3 0 -- 
      + edges:
      
      $residual_capacity
      numeric(0)
      

# residual_graph_impl errors

    Code
      residual_graph_impl(graph = NULL, capacity = c(1, 2), flow = c(1, 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# reverse_residual_graph_impl basic

    Code
      reverse_residual_graph_impl(graph = g, capacity = c(1, 2), flow = c(1, 2))
    Output
      IGRAPH D--- 3 2 -- 
      + edges:
      [1] 2->1 3->2

# reverse_residual_graph_impl errors

    Code
      reverse_residual_graph_impl(graph = NULL, capacity = c(1, 2), flow = c(1, 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# st_mincut_impl basic

    Code
      st_mincut_impl(graph = g, source = 1, target = 3)
    Output
      $value
      [1] 1
      
      $cut
      + 1/2 edge:
      [1] 2--3
      
      $partition1
      + 2/3 vertices:
      [1] 1 2
      
      $partition2
      + 1/3 vertex:
      [1] 3
      

---

    Code
      st_mincut_impl(graph = g, source = 1, target = 3, capacity = c(1, 2))
    Output
      $value
      [1] 1
      
      $cut
      + 1/2 edge:
      [1] 1--2
      
      $partition1
      + 1/3 vertex:
      [1] 1
      
      $partition2
      + 2/3 vertices:
      [1] 2 3
      

# st_mincut_impl errors

    Code
      st_mincut_impl(graph = NULL, source = 1, target = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# dominator_tree_impl basic

    Code
      dominator_tree_impl(graph = g, root = 1)
    Output
      $dom
      [1] 0 1 2
      
      $domtree
      IGRAPH D--- 3 2 -- 
      + edges:
      [1] 1->2 2->3
      
      $leftout
      + 0/3 vertices:
      

---

    Code
      dominator_tree_impl(graph = g, root = 1, mode = "in")
    Output
      $dom
      [1]  0 -1 -1
      
      $domtree
      IGRAPH D--- 3 0 -- 
      + edges:
      
      $leftout
      + 2/3 vertices:
      [1] 2 3
      

# dominator_tree_impl errors

    Code
      dominator_tree_impl(graph = NULL, root = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# all_st_cuts_impl basic

    Code
      all_st_cuts_impl(graph = g, source = 1, target = 3)
    Output
      $cuts
      $cuts[[1]]
      + 1/2 edge:
      [1] 1->2
      
      $cuts[[2]]
      + 1/2 edge:
      [1] 2->3
      
      
      $partition1s
      $partition1s[[1]]
      + 1/3 vertex:
      [1] 1
      
      $partition1s[[2]]
      + 2/3 vertices:
      [1] 1 2
      
      

# all_st_cuts_impl errors

    Code
      all_st_cuts_impl(graph = NULL, source = 1, target = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# all_st_mincuts_impl basic

    Code
      all_st_mincuts_impl(graph = g, source = 1, target = 3)
    Output
      $value
      [1] 1
      
      $cuts
      $cuts[[1]]
      + 1/2 edge:
      [1] 1->2
      
      $cuts[[2]]
      + 1/2 edge:
      [1] 2->3
      
      
      $partition1s
      $partition1s[[1]]
      + 1/3 vertex:
      [1] 1
      
      $partition1s[[2]]
      + 2/3 vertices:
      [1] 1 2
      
      

---

    Code
      all_st_mincuts_impl(graph = g, source = 1, target = 3, capacity = c(1, 2))
    Output
      $value
      [1] 1
      
      $cuts
      $cuts[[1]]
      + 1/2 edge:
      [1] 1->2
      
      
      $partition1s
      $partition1s[[1]]
      + 1/3 vertex:
      [1] 1
      
      

# all_st_mincuts_impl errors

    Code
      all_st_mincuts_impl(graph = NULL, source = 1, target = 3)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

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

# isoclass_impl basic

    Code
      isoclass_impl(graph = g)
    Output
      [1] 2

# isoclass_impl errors

    Code
      isoclass_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# isomorphic_impl basic

    Code
      isomorphic_impl(graph1 = g1, graph2 = g2)
    Output
      [1] TRUE

# isomorphic_impl errors

    Code
      isomorphic_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# isoclass_subgraph_impl basic

    Code
      isoclass_subgraph_impl(graph = g, vids = c(1, 2, 3))
    Output
      [1] 2

# isoclass_subgraph_impl errors

    Code
      isoclass_subgraph_impl(graph = NULL, vids = 1:2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# isoclass_create_impl basic

    Code
      isoclass_create_impl(size = 3, number = 1)
    Output
      IGRAPH D--- 3 1 -- 
      + edge:
      [1] 2->1

---

    Code
      isoclass_create_impl(size = 3, number = 1, directed = FALSE)
    Output
      IGRAPH U--- 3 1 -- 
      + edge:
      [1] 1--2

# isoclass_create_impl errors

    Code
      isoclass_create_impl(size = "a", number = 1)
    Condition
      Warning in `isoclass_create_impl()`:
      NAs introduced by coercion
      Error in `isoclass_create_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# isomorphic_vf2_impl basic

    Code
      isomorphic_vf2_impl(graph1 = g1, graph2 = g2)
    Output
      $iso
      [1] TRUE
      
      $map12
      [1] 1 2 3
      
      $map21
      [1] 1 2 3
      

---

    Code
      isomorphic_vf2_impl(graph1 = g1, graph2 = g2, vertex_color1 = c(1, 2, 3),
      vertex_color2 = c(1, 2, 3), edge_color1 = c(1, 2), edge_color2 = c(1, 2))
    Output
      $iso
      [1] TRUE
      
      $map12
      [1] 1 2 3
      
      $map21
      [1] 1 2 3
      

# isomorphic_vf2_impl errors

    Code
      isomorphic_vf2_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_isomorphisms_vf2_impl basic

    Code
      count_isomorphisms_vf2_impl(graph1 = g1, graph2 = g2)
    Output
      [1] 2

---

    Code
      count_isomorphisms_vf2_impl(graph1 = g1, graph2 = g2, vertex_color1 = c(1, 2, 3),
      vertex_color2 = c(1, 2, 3), edge_color1 = c(1, 2), edge_color2 = c(1, 2))
    Output
      [1] 1

# count_isomorphisms_vf2_impl errors

    Code
      count_isomorphisms_vf2_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_isomorphisms_vf2_impl basic

    Code
      get_isomorphisms_vf2_impl(graph1 = g1, graph2 = g2)
    Output
      [[1]]
      [1] 0 1 2
      
      [[2]]
      [1] 2 1 0
      

---

    Code
      get_isomorphisms_vf2_impl(graph1 = g1, graph2 = g2, vertex_color1 = c(1, 2, 3),
      vertex_color2 = c(1, 2, 3), edge_color1 = c(1, 2), edge_color2 = c(1, 2))
    Output
      [[1]]
      [1] 0 1 2
      

# get_isomorphisms_vf2_impl errors

    Code
      get_isomorphisms_vf2_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# subisomorphic_impl basic

    Code
      subisomorphic_impl(graph1 = g1, graph2 = g2)
    Output
      [1] TRUE

# subisomorphic_impl errors

    Code
      subisomorphic_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# subisomorphic_vf2_impl basic

    Code
      subisomorphic_vf2_impl(graph1 = g1, graph2 = g2)
    Output
      $iso
      [1] TRUE
      
      $map12
      [1] 1 2 3
      
      $map21
      [1] 1 2 3
      

---

    Code
      subisomorphic_vf2_impl(graph1 = g1, graph2 = g2, vertex_color1 = c(1, 2, 3),
      vertex_color2 = c(1, 2, 3), edge_color1 = c(1, 2), edge_color2 = c(1, 2))
    Output
      $iso
      [1] TRUE
      
      $map12
      [1] 1 2 3
      
      $map21
      [1] 1 2 3
      

# subisomorphic_vf2_impl errors

    Code
      subisomorphic_vf2_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_subisomorphisms_vf2_impl basic

    Code
      count_subisomorphisms_vf2_impl(graph1 = g1, graph2 = g2)
    Output
      [1] 2

---

    Code
      count_subisomorphisms_vf2_impl(graph1 = g1, graph2 = g2, vertex_color1 = c(1, 2,
        3), vertex_color2 = c(1, 2, 3), edge_color1 = c(1, 2), edge_color2 = c(1, 2))
    Output
      [1] 1

# count_subisomorphisms_vf2_impl errors

    Code
      count_subisomorphisms_vf2_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_subisomorphisms_vf2_impl basic

    Code
      get_subisomorphisms_vf2_impl(graph1 = g1, graph2 = g2)
    Output
      [[1]]
      [1] 0 1 2
      
      [[2]]
      [1] 2 1 0
      

---

    Code
      get_subisomorphisms_vf2_impl(graph1 = g1, graph2 = g2, vertex_color1 = c(1, 2,
        3), vertex_color2 = c(1, 2, 3), edge_color1 = c(1, 2), edge_color2 = c(1, 2))
    Output
      [[1]]
      [1] 0 1 2
      

# get_subisomorphisms_vf2_impl errors

    Code
      get_subisomorphisms_vf2_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# canonical_permutation_impl basic

    Code
      canonical_permutation_impl(graph = g)
    Output
      $labeling
      [1] 2 3 1
      
      $info
      $info$nof_nodes
      [1] 3
      
      $info$nof_leaf_nodes
      [1] 3
      
      $info$nof_bad_nodes
      [1] 0
      
      $info$nof_canupdates
      [1] 1
      
      $info$max_level
      [1] 1
      
      $info$group_size
      [1] "2"
      
      

---

    Code
      canonical_permutation_impl(graph = g, colors = c(1, 2, 3), sh = "fl")
    Output
      $labeling
      [1] 1 2 3
      
      $info
      $info$nof_nodes
      [1] 1
      
      $info$nof_leaf_nodes
      [1] 1
      
      $info$nof_bad_nodes
      [1] 0
      
      $info$nof_canupdates
      [1] 0
      
      $info$max_level
      [1] 0
      
      $info$group_size
      [1] "1"
      
      

# canonical_permutation_impl errors

    Code
      canonical_permutation_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# permute_vertices_impl basic

    Code
      permute_vertices_impl(graph = g, permutation = 3:1)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 2--3 1--2

# permute_vertices_impl errors

    Code
      permute_vertices_impl(graph = NULL, permutation = 3:1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# isomorphic_bliss_impl basic

    Code
      isomorphic_bliss_impl(graph1 = g1, graph2 = g2)
    Output
      $iso
      [1] TRUE
      
      $map12
      [1] 1 2 3
      
      $map21
      [1] 1 2 3
      
      $info1
      $info1$nof_nodes
      [1] 3
      
      $info1$nof_leaf_nodes
      [1] 3
      
      $info1$nof_bad_nodes
      [1] 0
      
      $info1$nof_canupdates
      [1] 1
      
      $info1$max_level
      [1] 1
      
      $info1$group_size
      [1] "2"
      
      
      $info2
      $info2$nof_nodes
      [1] 3
      
      $info2$nof_leaf_nodes
      [1] 3
      
      $info2$nof_bad_nodes
      [1] 0
      
      $info2$nof_canupdates
      [1] 1
      
      $info2$max_level
      [1] 1
      
      $info2$group_size
      [1] "2"
      
      

---

    Code
      isomorphic_bliss_impl(graph1 = g1, graph2 = g2, colors1 = c(1, 2, 3), colors2 = c(
        1, 2, 3), sh = "fl")
    Output
      $iso
      [1] TRUE
      
      $map12
      [1] 1 2 3
      
      $map21
      [1] 1 2 3
      
      $info1
      $info1$nof_nodes
      [1] 1
      
      $info1$nof_leaf_nodes
      [1] 1
      
      $info1$nof_bad_nodes
      [1] 0
      
      $info1$nof_canupdates
      [1] 0
      
      $info1$max_level
      [1] 0
      
      $info1$group_size
      [1] "1"
      
      
      $info2
      $info2$nof_nodes
      [1] 1
      
      $info2$nof_leaf_nodes
      [1] 1
      
      $info2$nof_bad_nodes
      [1] 0
      
      $info2$nof_canupdates
      [1] 0
      
      $info2$max_level
      [1] 0
      
      $info2$group_size
      [1] "1"
      
      

# isomorphic_bliss_impl errors

    Code
      isomorphic_bliss_impl(graph1 = NULL, graph2 = graph2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_automorphisms_impl basic

    Code
      count_automorphisms_impl(graph = g)
    Output
      $nof_nodes
      [1] 3
      
      $nof_leaf_nodes
      [1] 3
      
      $nof_bad_nodes
      [1] 0
      
      $nof_canupdates
      [1] 1
      
      $max_level
      [1] 1
      
      $group_size
      [1] "2"
      

---

    Code
      count_automorphisms_impl(graph = g, colors = c(1, 2, 3), sh = "fl")
    Output
      $nof_nodes
      [1] 1
      
      $nof_leaf_nodes
      [1] 1
      
      $nof_bad_nodes
      [1] 0
      
      $nof_canupdates
      [1] 0
      
      $max_level
      [1] 0
      
      $group_size
      [1] "1"
      

# count_automorphisms_impl errors

    Code
      count_automorphisms_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# automorphism_group_impl basic

    Code
      automorphism_group_impl(graph = g)
    Output
      [[1]]
      + 3/3 vertices:
      [1] 3 2 1
      

---

    Code
      automorphism_group_impl(graph = g, colors = c(1, 2, 3), sh = "fl", details = TRUE)
    Output
      $generators
      list()
      
      $info
      $info$nof_nodes
      [1] 1
      
      $info$nof_leaf_nodes
      [1] 1
      
      $info$nof_bad_nodes
      [1] 0
      
      $info$nof_canupdates
      [1] 0
      
      $info$max_level
      [1] 0
      
      $info$group_size
      [1] "1"
      
      

# automorphism_group_impl errors

    Code
      automorphism_group_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# simplify_and_colorize_impl basic

    Code
      simplify_and_colorize_impl(graph = g)
    Output
      $res
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $vertex_color
      [1] 0 0 0
      
      $edge_color
      [1] 1 1
      

# simplify_and_colorize_impl errors

    Code
      simplify_and_colorize_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# graph_count_impl basic

    Code
      graph_count_impl(n = 3)
    Output
      [1] 4

---

    Code
      graph_count_impl(n = 3, directed = TRUE)
    Output
      [1] 16

# graph_count_impl errors

    Code
      graph_count_impl(n = "a")
    Condition
      Warning in `graph_count_impl()`:
      NAs introduced by coercion
      Error in `graph_count_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# is_matching_impl basic

    Code
      is_matching_impl(graph = g, matching = 1:2)
    Output
      [1] FALSE

---

    Code
      is_matching_impl(graph = g, types = c(TRUE, FALSE, TRUE), matching = 1:2)
    Output
      [1] FALSE

# is_matching_impl errors

    Code
      is_matching_impl(graph = NULL, matching = 1:2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_maximal_matching_impl basic

    Code
      is_maximal_matching_impl(graph = g, matching = 1:2)
    Output
      [1] FALSE

---

    Code
      is_maximal_matching_impl(graph = g, types = c(TRUE, FALSE, TRUE), matching = 1:
      2)
    Output
      [1] FALSE

# is_maximal_matching_impl errors

    Code
      is_maximal_matching_impl(graph = NULL, matching = 1:2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# maximum_bipartite_matching_impl basic

    Code
      maximum_bipartite_matching_impl(graph = g, types = c(TRUE, FALSE, TRUE))
    Output
      $matching_size
      [1] 1
      
      $matching_weight
      [1] 1
      
      $matching
      [1] 2 1 0
      

---

    Code
      maximum_bipartite_matching_impl(graph = g, types = c(TRUE, FALSE, TRUE),
      weights = c(1, 2), eps = 1e-05)
    Output
      $matching_size
      [1] 1
      
      $matching_weight
      [1] 2
      
      $matching
      [1] 0 3 2
      

# maximum_bipartite_matching_impl errors

    Code
      maximum_bipartite_matching_impl(graph = NULL, types = c(TRUE, FALSE, TRUE))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# adjacency_spectral_embedding_impl basic

    Code
      adjacency_spectral_embedding_impl(graph = g, no = 2)
    Output
      $X
                [,1]       [,2]
      [1,] 0.6718598 -0.4487712
      [2,] 1.1328501  0.5323058
      [3,] 0.6718598 -0.4487712
      
      $Y
                [,1]       [,2]
      [1,] 0.6718598 -0.4487712
      [2,] 1.1328501  0.5323058
      [3,] 0.6718598 -0.4487712
      
      $D
      [1]  2.1861407 -0.6861407
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LM"
      
      $options$nev
      [1] 2
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 3
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 2
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 2
      
      

---

    Code
      adjacency_spectral_embedding_impl(graph = g, no = 2, weights = c(1, 2), which = "la",
      scaled = FALSE, cvec = c(1, 2, 3), options = list(maxiter = 10))
    Output
      $X
                [,1]       [,2]
      [1,] 0.1720265 -0.7864357
      [2,] 0.6311790 -0.3743620
      [3,] 0.7563200  0.4912963
      
      $Y
                [,1]       [,2]
      [1,] 0.1720265 -0.7864357
      [2,] 0.6311790 -0.3743620
      [3,] 0.7563200  0.4912963
      
      $D
      [1] 4.669079 1.476024
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 2
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 3
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 10
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 2
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 2
      
      

# adjacency_spectral_embedding_impl errors

    Code
      adjacency_spectral_embedding_impl(graph = NULL, no = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# laplacian_spectral_embedding_impl basic

    Code
      laplacian_spectral_embedding_impl(graph = g, no = 2)
    Output
      $X
                 [,1]       [,2]
      [1,] -0.7071068 -0.7071068
      [2,]  1.4142136  0.0000000
      [3,] -0.7071068  0.7071068
      
      $Y
                 [,1]       [,2]
      [1,] -0.7071068 -0.7071068
      [2,]  1.4142136  0.0000000
      [3,] -0.7071068  0.7071068
      
      $D
      [1] 3 1
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LM"
      
      $options$nev
      [1] 2
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 3
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 2
      
      $options$numop
      [1] 3
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 3
      
      

# laplacian_spectral_embedding_impl errors

    Code
      laplacian_spectral_embedding_impl(graph = NULL, no = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# eigen_adjacency_impl basic

    Code
      eigen_adjacency_impl(graph = g)
    Output
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 3
      
      $options$which
      [1] "LM"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 2
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 0
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 29
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 30
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 16
      
      
      $values
      [1] -1.414214
      
      $vectors
                 [,1]
      [1,] -0.5000000
      [2,]  0.7071068
      [3,] -0.5000000
      
      $cmplxvalues
      complex(0)
      
      $cmplxvectors
      <0 x 0 matrix>
      

---

    Code
      eigen_adjacency_impl(graph = g, algorithm = "lapack", which = list(which = "LA"),
      options = list(maxiter = 10))
    Condition
      Error in `eigen_adjacency_impl()`:
      ! At vendor/cigraph/src/linalg/eigen.c:xx : 'LAPACK' algorithm not implemented yet, Unimplemented function call

# eigen_adjacency_impl errors

    Code
      eigen_adjacency_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# power_law_fit_impl basic

    Code
      power_law_fit_impl(data = c(1, 2, 3))
    Output
      $continuous
      [1] FALSE
      
      $alpha
      [1] 1.646771
      
      $xmin
      [1] 1
      
      $logLik
      [1] -5.272517
      
      $KS.stat
      [1] 0.2640998
      

---

    Code
      power_law_fit_impl(data = c(1, 2, 3), xmin = 1, force_continuous = TRUE)
    Output
      $continuous
      [1] TRUE
      
      $alpha
      [1] 2.116221
      
      $xmin
      [1] 1
      
      $logLik
      [1] -3.461912
      
      $KS.stat
      [1] 0.3533555
      

# power_law_fit_impl errors

    Code
      power_law_fit_impl(data = "a")
    Condition
      Warning in `power_law_fit_impl()`:
      NAs introduced by coercion
      Error in `power_law_fit_impl()`:
      ! At vendor/cigraph/src/misc/power_law_fit.c:xx : xmin must be greater than zero, Invalid value

# sir_impl basic

    Code
      sir_impl(graph = g, beta = 0.1, gamma = 0.1)
    Output
      [[1]]
      [[1]]$times
      [1]  0.000000  6.326537  8.018361  8.809852  9.405480 17.386752
      
      [[1]]$NS
      [1] 2 1 0 0 0 0
      
      [[1]]$NI
      [1] 1 2 3 2 1 0
      
      [[1]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[2]]
      [[2]]$times
      [1]  0.000000  3.674354 13.783038 13.921168
      
      [[2]]$NS
      [1] 2 1 1 1
      
      [[2]]$NI
      [1] 1 2 1 0
      
      [[2]]$NR
      [1] 0 0 1 2
      
      
      [[3]]
      [[3]]$times
      [1]  0.000000  3.277542  7.521770 16.781182 18.515742 29.375613
      
      [[3]]$NS
      [1] 2 1 0 0 0 0
      
      [[3]]$NI
      [1] 1 2 3 2 1 0
      
      [[3]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[4]]
      [[4]]$times
      [1] 0.0000000 0.3027921
      
      [[4]]$NS
      [1] 2 2
      
      [[4]]$NI
      [1] 1 0
      
      [[4]]$NR
      [1] 0 1
      
      
      [[5]]
      [[5]]$times
      [1]  0.000000  3.559451  5.615586 20.582742
      
      [[5]]$NS
      [1] 2 1 1 1
      
      [[5]]$NI
      [1] 1 2 1 0
      
      [[5]]$NR
      [1] 0 0 1 2
      
      
      [[6]]
      [[6]]$times
      [1] 0.0000000 0.7300885 0.7328203 1.2536518 1.9258569 5.1406208
      
      [[6]]$NS
      [1] 2 1 0 0 0 0
      
      [[6]]$NI
      [1] 1 2 3 2 1 0
      
      [[6]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[7]]
      [[7]]$times
      [1] 0.000000 0.865533
      
      [[7]]$NS
      [1] 2 2
      
      [[7]]$NI
      [1] 1 0
      
      [[7]]$NR
      [1] 0 1
      
      
      [[8]]
      [[8]]$times
      [1]  0.00000 10.68605
      
      [[8]]$NS
      [1] 2 2
      
      [[8]]$NI
      [1] 1 0
      
      [[8]]$NR
      [1] 0 1
      
      
      [[9]]
      [[9]]$times
      [1]  0.000000  2.185910  7.669126 16.635095 21.440723 23.497554
      
      [[9]]$NS
      [1] 2 1 0 0 0 0
      
      [[9]]$NI
      [1] 1 2 3 2 1 0
      
      [[9]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[10]]
      [[10]]$times
      [1]  0.000000  4.105424  4.424244 22.891743 24.099505 32.514828
      
      [[10]]$NS
      [1] 2 1 1 0 0 0
      
      [[10]]$NI
      [1] 1 2 1 2 1 0
      
      [[10]]$NR
      [1] 0 0 1 1 2 3
      
      
      [[11]]
      [[11]]$times
      [1]  0.00000  4.93042 21.00935 21.07441 23.37619 41.26694
      
      [[11]]$NS
      [1] 2 1 0 0 0 0
      
      [[11]]$NI
      [1] 1 2 3 2 1 0
      
      [[11]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[12]]
      [[12]]$times
      [1]  0.00000 15.47343 26.09187 38.01744 43.76847 50.41068
      
      [[12]]$NS
      [1] 2 1 0 0 0 0
      
      [[12]]$NI
      [1] 1 2 3 2 1 0
      
      [[12]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[13]]
      [[13]]$times
      [1] 0.000000 3.540437
      
      [[13]]$NS
      [1] 2 2
      
      [[13]]$NI
      [1] 1 0
      
      [[13]]$NR
      [1] 0 1
      
      
      [[14]]
      [[14]]$times
      [1]  0.000000  7.081426  7.638086 11.569527
      
      [[14]]$NS
      [1] 2 1 1 1
      
      [[14]]$NI
      [1] 1 2 1 0
      
      [[14]]$NR
      [1] 0 0 1 2
      
      
      [[15]]
      [[15]]$times
      [1]  0.00000 15.60443 15.66654 20.19745 22.11224 42.62196
      
      [[15]]$NS
      [1] 2 1 0 0 0 0
      
      [[15]]$NI
      [1] 1 2 3 2 1 0
      
      [[15]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[16]]
      [[16]]$times
      [1]  0.000000  3.239708 17.193626 18.833130 19.040959 35.199892
      
      [[16]]$NS
      [1] 2 1 1 0 0 0
      
      [[16]]$NI
      [1] 1 2 1 2 1 0
      
      [[16]]$NR
      [1] 0 0 1 1 2 3
      
      
      [[17]]
      [[17]]$times
      [1]  0.0000000  0.2300489  1.8970602  6.9851496 16.0587095 28.8528567
      
      [[17]]$NS
      [1] 2 1 0 0 0 0
      
      [[17]]$NI
      [1] 1 2 3 2 1 0
      
      [[17]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[18]]
      [[18]]$times
      [1]  0.000000  4.674879  5.319832 17.366640 63.357258 86.262883
      
      [[18]]$NS
      [1] 2 1 1 0 0 0
      
      [[18]]$NI
      [1] 1 2 1 2 1 0
      
      [[18]]$NR
      [1] 0 0 1 1 2 3
      
      
      [[19]]
      [[19]]$times
      [1] 0.000000 1.972293
      
      [[19]]$NS
      [1] 2 2
      
      [[19]]$NI
      [1] 1 0
      
      [[19]]$NR
      [1] 0 1
      
      
      [[20]]
      [[20]]$times
      [1] 0.000000 3.177922
      
      [[20]]$NS
      [1] 2 2
      
      [[20]]$NI
      [1] 1 0
      
      [[20]]$NR
      [1] 0 1
      
      
      [[21]]
      [[21]]$times
      [1]  0.000000  1.994279  2.508129  8.208209 28.478526 36.256169
      
      [[21]]$NS
      [1] 2 1 0 0 0 0
      
      [[21]]$NI
      [1] 1 2 3 2 1 0
      
      [[21]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[22]]
      [[22]]$times
      [1]  0.000000  5.226609 14.744785 16.304309
      
      [[22]]$NS
      [1] 2 1 1 1
      
      [[22]]$NI
      [1] 1 2 1 0
      
      [[22]]$NR
      [1] 0 0 1 2
      
      
      [[23]]
      [[23]]$times
      [1]  0.000000  3.254634 13.673154 21.069828
      
      [[23]]$NS
      [1] 2 1 1 1
      
      [[23]]$NI
      [1] 1 2 1 0
      
      [[23]]$NR
      [1] 0 0 1 2
      
      
      [[24]]
      [[24]]$times
      [1]  0.00000 18.01982 18.36106 44.55144
      
      [[24]]$NS
      [1] 2 1 1 1
      
      [[24]]$NI
      [1] 1 2 1 0
      
      [[24]]$NR
      [1] 0 0 1 2
      
      
      [[25]]
      [[25]]$times
      [1]  0.00000 18.09036 30.47469 36.51570
      
      [[25]]$NS
      [1] 2 1 1 1
      
      [[25]]$NI
      [1] 1 2 1 0
      
      [[25]]$NR
      [1] 0 0 1 2
      
      
      [[26]]
      [[26]]$times
      [1]  0.00000 11.21296
      
      [[26]]$NS
      [1] 2 2
      
      [[26]]$NI
      [1] 1 0
      
      [[26]]$NR
      [1] 0 1
      
      
      [[27]]
      [[27]]$times
      [1] 0.000000 1.605373
      
      [[27]]$NS
      [1] 2 2
      
      [[27]]$NI
      [1] 1 0
      
      [[27]]$NR
      [1] 0 1
      
      
      [[28]]
      [[28]]$times
      [1]  0.000000  3.448751 12.086502 17.941228
      
      [[28]]$NS
      [1] 2 1 1 1
      
      [[28]]$NI
      [1] 1 2 1 0
      
      [[28]]$NR
      [1] 0 0 1 2
      
      
      [[29]]
      [[29]]$times
      [1] 0.000000 8.277924
      
      [[29]]$NS
      [1] 2 2
      
      [[29]]$NI
      [1] 1 0
      
      [[29]]$NR
      [1] 0 1
      
      
      [[30]]
      [[30]]$times
      [1] 0.000000 9.146159
      
      [[30]]$NS
      [1] 2 2
      
      [[30]]$NI
      [1] 1 0
      
      [[30]]$NR
      [1] 0 1
      
      
      [[31]]
      [[31]]$times
      [1] 0.00000000 0.07833588
      
      [[31]]$NS
      [1] 2 2
      
      [[31]]$NI
      [1] 1 0
      
      [[31]]$NR
      [1] 0 1
      
      
      [[32]]
      [[32]]$times
      [1] 0.000000 7.825191
      
      [[32]]$NS
      [1] 2 2
      
      [[32]]$NI
      [1] 1 0
      
      [[32]]$NR
      [1] 0 1
      
      
      [[33]]
      [[33]]$times
      [1] 0.0000000 0.4018017
      
      [[33]]$NS
      [1] 2 2
      
      [[33]]$NI
      [1] 1 0
      
      [[33]]$NR
      [1] 0 1
      
      
      [[34]]
      [[34]]$times
      [1] 0.000000 1.433794
      
      [[34]]$NS
      [1] 2 2
      
      [[34]]$NI
      [1] 1 0
      
      [[34]]$NR
      [1] 0 1
      
      
      [[35]]
      [[35]]$times
      [1] 0.00000000 0.06959151 2.61176819 2.76819228
      
      [[35]]$NS
      [1] 2 1 1 1
      
      [[35]]$NI
      [1] 1 2 1 0
      
      [[35]]$NR
      [1] 0 0 1 2
      
      
      [[36]]
      [[36]]$times
      [1]  0.000000  1.539839 17.502742 21.550799 31.779748 59.056912
      
      [[36]]$NS
      [1] 2 1 0 0 0 0
      
      [[36]]$NI
      [1] 1 2 3 2 1 0
      
      [[36]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[37]]
      [[37]]$times
      [1] 0.000000 8.878624
      
      [[37]]$NS
      [1] 2 2
      
      [[37]]$NI
      [1] 1 0
      
      [[37]]$NR
      [1] 0 1
      
      
      [[38]]
      [[38]]$times
      [1] 0.000000 6.855525
      
      [[38]]$NS
      [1] 2 2
      
      [[38]]$NI
      [1] 1 0
      
      [[38]]$NR
      [1] 0 1
      
      
      [[39]]
      [[39]]$times
      [1] 0.000000 2.628739 3.809460 7.051204
      
      [[39]]$NS
      [1] 2 1 1 1
      
      [[39]]$NI
      [1] 1 2 1 0
      
      [[39]]$NR
      [1] 0 0 1 2
      
      
      [[40]]
      [[40]]$times
      [1] 0.000000 2.484282
      
      [[40]]$NS
      [1] 2 2
      
      [[40]]$NI
      [1] 1 0
      
      [[40]]$NR
      [1] 0 1
      
      
      [[41]]
      [[41]]$times
      [1] 0.0000000 0.8248393
      
      [[41]]$NS
      [1] 2 2
      
      [[41]]$NI
      [1] 1 0
      
      [[41]]$NR
      [1] 0 1
      
      
      [[42]]
      [[42]]$times
      [1]  0.000000  2.300359  3.886947  6.810196  7.223496 28.297207
      
      [[42]]$NS
      [1] 2 1 0 0 0 0
      
      [[42]]$NI
      [1] 1 2 3 2 1 0
      
      [[42]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[43]]
      [[43]]$times
      [1]  0.00000  5.52241 10.93993 29.15486
      
      [[43]]$NS
      [1] 2 1 1 1
      
      [[43]]$NI
      [1] 1 2 1 0
      
      [[43]]$NR
      [1] 0 0 1 2
      
      
      [[44]]
      [[44]]$times
      [1]  0.000000  9.526317 12.154710 21.171748
      
      [[44]]$NS
      [1] 2 1 1 1
      
      [[44]]$NI
      [1] 1 2 1 0
      
      [[44]]$NR
      [1] 0 0 1 2
      
      
      [[45]]
      [[45]]$times
      [1] 0.000000 4.448428
      
      [[45]]$NS
      [1] 2 2
      
      [[45]]$NI
      [1] 1 0
      
      [[45]]$NR
      [1] 0 1
      
      
      [[46]]
      [[46]]$times
      [1] 0.0000000 0.0560511
      
      [[46]]$NS
      [1] 2 2
      
      [[46]]$NI
      [1] 1 0
      
      [[46]]$NR
      [1] 0 1
      
      
      [[47]]
      [[47]]$times
      [1]  0.00000 11.57560 12.20970 12.58732 26.47299 36.19628
      
      [[47]]$NS
      [1] 2 1 0 0 0 0
      
      [[47]]$NI
      [1] 1 2 3 2 1 0
      
      [[47]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[48]]
      [[48]]$times
      [1] 0.000000 3.687231
      
      [[48]]$NS
      [1] 2 2
      
      [[48]]$NI
      [1] 1 0
      
      [[48]]$NR
      [1] 0 1
      
      
      [[49]]
      [[49]]$times
      [1] 0.0000000 0.3436458 1.0908931 1.4640857
      
      [[49]]$NS
      [1] 2 1 1 1
      
      [[49]]$NI
      [1] 1 2 1 0
      
      [[49]]$NR
      [1] 0 0 1 2
      
      
      [[50]]
      [[50]]$times
      [1] 0.000000 1.536136
      
      [[50]]$NS
      [1] 2 2
      
      [[50]]$NI
      [1] 1 0
      
      [[50]]$NR
      [1] 0 1
      
      
      [[51]]
      [[51]]$times
      [1] 0.000000 2.021208
      
      [[51]]$NS
      [1] 2 2
      
      [[51]]$NI
      [1] 1 0
      
      [[51]]$NR
      [1] 0 1
      
      
      [[52]]
      [[52]]$times
      [1] 0.00000 4.29424
      
      [[52]]$NS
      [1] 2 2
      
      [[52]]$NI
      [1] 1 0
      
      [[52]]$NR
      [1] 0 1
      
      
      [[53]]
      [[53]]$times
      [1]  0.000000  1.884908  5.139700  8.417338 12.272436 15.154107
      
      [[53]]$NS
      [1] 2 1 0 0 0 0
      
      [[53]]$NI
      [1] 1 2 3 2 1 0
      
      [[53]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[54]]
      [[54]]$times
      [1] 0.0000000 0.1997796
      
      [[54]]$NS
      [1] 2 2
      
      [[54]]$NI
      [1] 1 0
      
      [[54]]$NR
      [1] 0 1
      
      
      [[55]]
      [[55]]$times
      [1] 0.0000000 0.1825065
      
      [[55]]$NS
      [1] 2 2
      
      [[55]]$NI
      [1] 1 0
      
      [[55]]$NR
      [1] 0 1
      
      
      [[56]]
      [[56]]$times
      [1] 0.000000 1.913698 2.656593 7.598135
      
      [[56]]$NS
      [1] 2 1 1 1
      
      [[56]]$NI
      [1] 1 2 1 0
      
      [[56]]$NR
      [1] 0 0 1 2
      
      
      [[57]]
      [[57]]$times
      [1] 0.000000 3.435708
      
      [[57]]$NS
      [1] 2 2
      
      [[57]]$NI
      [1] 1 0
      
      [[57]]$NR
      [1] 0 1
      
      
      [[58]]
      [[58]]$times
      [1]  0.000000  0.583133  5.284710 10.065112 18.657681 21.137430
      
      [[58]]$NS
      [1] 2 1 1 0 0 0
      
      [[58]]$NI
      [1] 1 2 1 2 1 0
      
      [[58]]$NR
      [1] 0 0 1 1 2 3
      
      
      [[59]]
      [[59]]$times
      [1] 0.000000 8.526031
      
      [[59]]$NS
      [1] 2 2
      
      [[59]]$NI
      [1] 1 0
      
      [[59]]$NR
      [1] 0 1
      
      
      [[60]]
      [[60]]$times
      [1] 0.000000 3.470768
      
      [[60]]$NS
      [1] 2 2
      
      [[60]]$NI
      [1] 1 0
      
      [[60]]$NR
      [1] 0 1
      
      
      [[61]]
      [[61]]$times
      [1] 0.000000 2.311806
      
      [[61]]$NS
      [1] 2 2
      
      [[61]]$NI
      [1] 1 0
      
      [[61]]$NR
      [1] 0 1
      
      
      [[62]]
      [[62]]$times
      [1] 0.000000 5.603495
      
      [[62]]$NS
      [1] 2 2
      
      [[62]]$NI
      [1] 1 0
      
      [[62]]$NR
      [1] 0 1
      
      
      [[63]]
      [[63]]$times
      [1] 0.0000000 0.2376974
      
      [[63]]$NS
      [1] 2 2
      
      [[63]]$NI
      [1] 1 0
      
      [[63]]$NR
      [1] 0 1
      
      
      [[64]]
      [[64]]$times
      [1] 0.000000 1.164209 4.169140 7.017509
      
      [[64]]$NS
      [1] 2 1 1 1
      
      [[64]]$NI
      [1] 1 2 1 0
      
      [[64]]$NR
      [1] 0 0 1 2
      
      
      [[65]]
      [[65]]$times
      [1]  0.000000  6.415227  6.561435 14.007083
      
      [[65]]$NS
      [1] 2 1 1 1
      
      [[65]]$NI
      [1] 1 2 1 0
      
      [[65]]$NR
      [1] 0 0 1 2
      
      
      [[66]]
      [[66]]$times
      [1]  0.00000 14.28491 31.69273 39.51170
      
      [[66]]$NS
      [1] 2 1 1 1
      
      [[66]]$NI
      [1] 1 2 1 0
      
      [[66]]$NR
      [1] 0 0 1 2
      
      
      [[67]]
      [[67]]$times
      [1]  0.000000  3.592755  4.363836 11.200455
      
      [[67]]$NS
      [1] 2 1 1 1
      
      [[67]]$NI
      [1] 1 2 1 0
      
      [[67]]$NR
      [1] 0 0 1 2
      
      
      [[68]]
      [[68]]$times
      [1]  0.000000  8.044133 10.227368 12.702160 16.225120 23.696870
      
      [[68]]$NS
      [1] 2 1 1 0 0 0
      
      [[68]]$NI
      [1] 1 2 1 2 1 0
      
      [[68]]$NR
      [1] 0 0 1 1 2 3
      
      
      [[69]]
      [[69]]$times
      [1] 0.000000 3.324148
      
      [[69]]$NS
      [1] 2 2
      
      [[69]]$NI
      [1] 1 0
      
      [[69]]$NR
      [1] 0 1
      
      
      [[70]]
      [[70]]$times
      [1] 0.000000 6.316816
      
      [[70]]$NS
      [1] 2 2
      
      [[70]]$NI
      [1] 1 0
      
      [[70]]$NR
      [1] 0 1
      
      
      [[71]]
      [[71]]$times
      [1]  0.000000  7.473339  7.757794 15.139281
      
      [[71]]$NS
      [1] 2 1 1 1
      
      [[71]]$NI
      [1] 1 2 1 0
      
      [[71]]$NR
      [1] 0 0 1 2
      
      
      [[72]]
      [[72]]$times
      [1] 0.000000 4.073649 6.034897 8.135670
      
      [[72]]$NS
      [1] 2 1 1 1
      
      [[72]]$NI
      [1] 1 2 1 0
      
      [[72]]$NR
      [1] 0 0 1 2
      
      
      [[73]]
      [[73]]$times
      [1] 0.00000 1.60059
      
      [[73]]$NS
      [1] 2 2
      
      [[73]]$NI
      [1] 1 0
      
      [[73]]$NR
      [1] 0 1
      
      
      [[74]]
      [[74]]$times
      [1] 0.000000 1.497596
      
      [[74]]$NS
      [1] 2 2
      
      [[74]]$NI
      [1] 1 0
      
      [[74]]$NR
      [1] 0 1
      
      
      [[75]]
      [[75]]$times
      [1] 0.000000 1.916758
      
      [[75]]$NS
      [1] 2 2
      
      [[75]]$NI
      [1] 1 0
      
      [[75]]$NR
      [1] 0 1
      
      
      [[76]]
      [[76]]$times
      [1]  0.0000000  0.8368377  4.1462512 14.4447646
      
      [[76]]$NS
      [1] 2 1 1 1
      
      [[76]]$NI
      [1] 1 2 1 0
      
      [[76]]$NR
      [1] 0 0 1 2
      
      
      [[77]]
      [[77]]$times
      [1]  0.000000  8.546053  9.275575 11.920068 14.117820 14.371987
      
      [[77]]$NS
      [1] 2 1 0 0 0 0
      
      [[77]]$NI
      [1] 1 2 3 2 1 0
      
      [[77]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[78]]
      [[78]]$times
      [1]  0.000000  2.730273  6.669293  7.301694 14.402306 22.580301
      
      [[78]]$NS
      [1] 2 1 0 0 0 0
      
      [[78]]$NI
      [1] 1 2 3 2 1 0
      
      [[78]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[79]]
      [[79]]$times
      [1]  0.00000 13.02458
      
      [[79]]$NS
      [1] 2 2
      
      [[79]]$NI
      [1] 1 0
      
      [[79]]$NR
      [1] 0 1
      
      
      [[80]]
      [[80]]$times
      [1]  0.000000  4.655717 10.847343 15.188912 38.570735 51.548959
      
      [[80]]$NS
      [1] 2 1 0 0 0 0
      
      [[80]]$NI
      [1] 1 2 3 2 1 0
      
      [[80]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[81]]
      [[81]]$times
      [1]  0.000000  7.919139 12.774389 13.210280 20.037088 27.652380
      
      [[81]]$NS
      [1] 2 1 0 0 0 0
      
      [[81]]$NI
      [1] 1 2 3 2 1 0
      
      [[81]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[82]]
      [[82]]$times
      [1]  0.000000  4.565727  4.640174  5.827227  8.181199 13.514984
      
      [[82]]$NS
      [1] 2 1 0 0 0 0
      
      [[82]]$NI
      [1] 1 2 3 2 1 0
      
      [[82]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[83]]
      [[83]]$times
      [1] 0.0000000 0.4331829
      
      [[83]]$NS
      [1] 2 2
      
      [[83]]$NI
      [1] 1 0
      
      [[83]]$NR
      [1] 0 1
      
      
      [[84]]
      [[84]]$times
      [1] 0.0000000 0.5663187
      
      [[84]]$NS
      [1] 2 2
      
      [[84]]$NI
      [1] 1 0
      
      [[84]]$NR
      [1] 0 1
      
      
      [[85]]
      [[85]]$times
      [1]  0.000000  4.717821  7.368033 15.405952 20.251957 28.844191
      
      [[85]]$NS
      [1] 2 1 0 0 0 0
      
      [[85]]$NI
      [1] 1 2 3 2 1 0
      
      [[85]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[86]]
      [[86]]$times
      [1]  0.00000 10.41346 13.17259 31.58865 35.49247 39.20284
      
      [[86]]$NS
      [1] 2 1 1 0 0 0
      
      [[86]]$NI
      [1] 1 2 1 2 1 0
      
      [[86]]$NR
      [1] 0 0 1 1 2 3
      
      
      [[87]]
      [[87]]$times
      [1] 0.000000 7.800903
      
      [[87]]$NS
      [1] 2 2
      
      [[87]]$NI
      [1] 1 0
      
      [[87]]$NR
      [1] 0 1
      
      
      [[88]]
      [[88]]$times
      [1] 0.000000 1.164975 2.214760 3.395779 4.269503 6.277390
      
      [[88]]$NS
      [1] 2 1 0 0 0 0
      
      [[88]]$NI
      [1] 1 2 3 2 1 0
      
      [[88]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[89]]
      [[89]]$times
      [1]  0.000000  1.419246  5.241578 10.249121
      
      [[89]]$NS
      [1] 2 1 1 1
      
      [[89]]$NI
      [1] 1 2 1 0
      
      [[89]]$NR
      [1] 0 0 1 2
      
      
      [[90]]
      [[90]]$times
      [1] 0.000000 4.015171
      
      [[90]]$NS
      [1] 2 2
      
      [[90]]$NI
      [1] 1 0
      
      [[90]]$NR
      [1] 0 1
      
      
      [[91]]
      [[91]]$times
      [1]  0.00000 10.95119 10.95895 13.37237 15.94527 20.47069
      
      [[91]]$NS
      [1] 2 1 0 0 0 0
      
      [[91]]$NI
      [1] 1 2 3 2 1 0
      
      [[91]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[92]]
      [[92]]$times
      [1] 0.000000 1.719506
      
      [[92]]$NS
      [1] 2 2
      
      [[92]]$NI
      [1] 1 0
      
      [[92]]$NR
      [1] 0 1
      
      
      [[93]]
      [[93]]$times
      [1]  0.00000 20.34997 23.10320 33.53507 37.61908 42.59392
      
      [[93]]$NS
      [1] 2 1 0 0 0 0
      
      [[93]]$NI
      [1] 1 2 3 2 1 0
      
      [[93]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[94]]
      [[94]]$times
      [1]  0.000000  2.981562  4.220980  4.501876  5.930935 17.597979
      
      [[94]]$NS
      [1] 2 1 0 0 0 0
      
      [[94]]$NI
      [1] 1 2 3 2 1 0
      
      [[94]]$NR
      [1] 0 0 0 1 2 3
      
      
      [[95]]
      [[95]]$times
      [1] 0.0000000 0.8570038 6.2225289 7.4542303
      
      [[95]]$NS
      [1] 2 1 1 1
      
      [[95]]$NI
      [1] 1 2 1 0
      
      [[95]]$NR
      [1] 0 0 1 2
      
      
      [[96]]
      [[96]]$times
      [1]  0.00000 10.99346
      
      [[96]]$NS
      [1] 2 2
      
      [[96]]$NI
      [1] 1 0
      
      [[96]]$NR
      [1] 0 1
      
      
      [[97]]
      [[97]]$times
      [1]  0.000000  6.324172 10.943694 11.370294
      
      [[97]]$NS
      [1] 2 1 1 1
      
      [[97]]$NI
      [1] 1 2 1 0
      
      [[97]]$NR
      [1] 0 0 1 2
      
      
      [[98]]
      [[98]]$times
      [1] 0.00000000 0.07582625 1.04605163 3.19140611 3.57055288 9.94371399
      
      [[98]]$NS
      [1] 2 1 1 0 0 0
      
      [[98]]$NI
      [1] 1 2 1 2 1 0
      
      [[98]]$NR
      [1] 0 0 1 1 2 3
      
      
      [[99]]
      [[99]]$times
      [1] 0.000000 1.910419
      
      [[99]]$NS
      [1] 2 2
      
      [[99]]$NI
      [1] 1 0
      
      [[99]]$NR
      [1] 0 1
      
      
      [[100]]
      [[100]]$times
      [1] 0.000000 2.446835
      
      [[100]]$NS
      [1] 2 2
      
      [[100]]$NI
      [1] 1 0
      
      [[100]]$NR
      [1] 0 1
      
      
      attr(,"class")
      [1] "sir"

---

    Code
      sir_impl(graph = g, beta = 0.1, gamma = 0.1, no_sim = 2)
    Output
      [[1]]
      [[1]]$times
      [1] 0.0000000 0.5059133 5.9903814 8.4444363
      
      [[1]]$NS
      [1] 2 1 1 1
      
      [[1]]$NI
      [1] 1 2 1 0
      
      [[1]]$NR
      [1] 0 0 1 2
      
      
      [[2]]
      [[2]]$times
      [1] 0.000000 4.481524
      
      [[2]]$NS
      [1] 2 2
      
      [[2]]$NI
      [1] 1 0
      
      [[2]]$NR
      [1] 0 1
      
      
      attr(,"class")
      [1] "sir"

# sir_impl errors

    Code
      sir_impl(graph = NULL, beta = 0.1, gamma = 0.1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

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

# dim_select_impl basic

    Code
      dim_select_impl(sv = c(1, 2, 3))
    Output
      [1] 1

# dim_select_impl errors

    Code
      dim_select_impl(sv = NULL)
    Condition
      Error in `dim_select_impl()`:
      ! At vendor/cigraph/src/misc/embedding.c:xx : Need at least one singular value for dimensionality selection, Invalid value

# solve_lsap_impl basic

    Code
      solve_lsap_impl(c = matrix(1:4, ncol = 2), n = 2)
    Output
      [1] 0 1

# solve_lsap_impl errors

    Code
      solve_lsap_impl(c = "a", n = 2)
    Condition
      Warning in `solve_lsap_impl()`:
      NAs introduced by coercion
      Error in `solve_lsap_impl()`:
      ! REAL() can only be applied to a 'numeric', not a 'character'

# find_cycle_impl basic

    Code
      find_cycle_impl(graph = g)
    Output
      $vertices
      + 0/3 vertices:
      
      $edges
      + 0/2 edges:
      

---

    Code
      find_cycle_impl(graph = g, mode = "in")
    Output
      $vertices
      + 0/3 vertices:
      
      $edges
      + 0/2 edges:
      

# find_cycle_impl errors

    Code
      find_cycle_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# simple_cycles_impl basic

    Code
      simple_cycles_impl(graph = g)
    Output
      $vertices
      list()
      
      $edges
      list()
      

---

    Code
      simple_cycles_impl(graph = g, mode = "in", min_cycle_length = 2,
        max_cycle_length = 3)
    Output
      $vertices
      list()
      
      $edges
      list()
      

# simple_cycles_impl errors

    Code
      simple_cycles_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_eulerian_impl basic

    Code
      is_eulerian_impl(graph = g)
    Output
      $has_path
      [1] TRUE
      
      $has_cycle
      [1] FALSE
      

# is_eulerian_impl errors

    Code
      is_eulerian_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# eulerian_path_impl basic

    Code
      eulerian_path_impl(graph = g)
    Output
      $epath
      + 2/2 edges:
      [1] 1--2 2--3
      
      $vpath
      + 3/3 vertices:
      [1] 1 2 3
      

# eulerian_path_impl errors

    Code
      eulerian_path_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# eulerian_cycle_impl basic

    Code
      eulerian_cycle_impl(graph = g1)
    Condition
      Error in `eulerian_cycle_impl()`:
      ! At vendor/cigraph/src/paths/eulerian.c:xx : The graph does not have an Eulerian cycle. Input problem has no solution

---

    Code
      eulerian_cycle_impl(graph = g2)
    Output
      $epath
      + 4/4 edges:
      [1] 1--2 2--3 3--4 1--4
      
      $vpath
      + 5/4 vertices:
      [1] 1 2 3 4 1
      

# eulerian_cycle_impl errors

    Code
      eulerian_cycle_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# fundamental_cycles_impl basic

    Code
      fundamental_cycles_impl(graph = g, start = 1)
    Output
      list()

---

    Code
      fundamental_cycles_impl(graph = g, start = 1, bfs_cutoff = 2, weights = c(1, 2))
    Output
      list()

# fundamental_cycles_impl errors

    Code
      fundamental_cycles_impl(graph = NULL, start = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# minimum_cycle_basis_impl basic

    Code
      minimum_cycle_basis_impl(graph = g)
    Output
      list()

---

    Code
      minimum_cycle_basis_impl(graph = g, bfs_cutoff = 2, complete = FALSE,
        use_cycle_order = FALSE, weights = c(1, 2))
    Output
      list()

# minimum_cycle_basis_impl errors

    Code
      minimum_cycle_basis_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_tree_impl basic

    Code
      is_tree_impl(graph = g)
    Output
      [1] TRUE

---

    Code
      is_tree_impl(graph = g, mode = "in", details = TRUE)
    Output
      $res
      [1] TRUE
      
      $root
      + 1/3 vertex:
      [1] 1
      

# is_tree_impl errors

    Code
      is_tree_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_forest_impl basic

    Code
      is_forest_impl(graph = g)
    Output
      [1] TRUE

---

    Code
      is_forest_impl(graph = g, mode = "in", details = TRUE)
    Output
      $res
      [1] TRUE
      
      $roots
      + 1/3 vertex:
      [1] 1
      

# is_forest_impl errors

    Code
      is_forest_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# from_prufer_impl basic

    Code
      from_prufer_impl(prufer = 1:2)
    Output
      IGRAPH U--- 4 3 -- Tree from Prufer sequence
      + attr: name (g/c), prufer (g/n)
      + edges:
      [1] 1--3 1--2 2--4

# from_prufer_impl errors

    Code
      from_prufer_impl(prufer = "a")
    Condition
      Warning in `from_prufer_impl()`:
      NAs introduced by coercion
      Error in `from_prufer_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# to_prufer_impl basic

    Code
      to_prufer_impl(graph = g)
    Output
      [1] 2

# to_prufer_impl errors

    Code
      to_prufer_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# tree_from_parent_vector_impl basic

    Code
      tree_from_parent_vector_impl(parents = c(-1, 1, 2, 3))
    Output
      IGRAPH D--- 4 3 -- 
      + edges:
      [1] 1->2 2->3 3->4

---

    Code
      tree_from_parent_vector_impl(parents = c(-1, 1, 2, 3), type = "in")
    Output
      IGRAPH D--- 4 3 -- 
      + edges:
      [1] 2->1 3->2 4->3

# tree_from_parent_vector_impl errors

    Code
      tree_from_parent_vector_impl(parents = "a")
    Condition
      Warning in `tree_from_parent_vector_impl()`:
      NAs introduced by coercion
      Error in `tree_from_parent_vector_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# is_complete_impl basic

    Code
      is_complete_impl(graph = g)
    Output
      [1] FALSE

# is_complete_impl errors

    Code
      is_complete_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# random_spanning_tree_impl basic

    Code
      random_spanning_tree_impl(graph = g, vid = 1)
    Output
      + 2/2 edges:
      [1] 1--2 2--3

# random_spanning_tree_impl errors

    Code
      random_spanning_tree_impl(graph = NULL, vid = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

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
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# vertex_coloring_greedy_impl basic

    Code
      vertex_coloring_greedy_impl(graph = g)
    Output
      [1] 2 1 2

---

    Code
      vertex_coloring_greedy_impl(graph = g, heuristic = "dsatur")
    Output
      [1] 2 1 2

# vertex_coloring_greedy_impl errors

    Code
      vertex_coloring_greedy_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_vertex_coloring_impl basic

    Code
      is_vertex_coloring_impl(graph = g, types = c(1, 2, 3))
    Output
      [1] TRUE

# is_vertex_coloring_impl errors

    Code
      is_vertex_coloring_impl(graph = NULL, types = c(1, 2, 3))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_bipartite_coloring_impl basic

    Code
      is_bipartite_coloring_impl(graph = g, types = c(TRUE, FALSE, TRUE))
    Output
      [1] TRUE

# is_bipartite_coloring_impl errors

    Code
      is_bipartite_coloring_impl(graph = NULL, types = c(TRUE, FALSE, TRUE))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_edge_coloring_impl basic

    Code
      is_edge_coloring_impl(graph = g, types = c(1, 2))
    Output
      [1] TRUE

---

    Code
      is_edge_coloring_impl(graph = g)
    Output
      [1] TRUE

# is_edge_coloring_impl errors

    Code
      is_edge_coloring_impl(graph = NULL, types = c(1, 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# deterministic_optimal_imitation_impl basic

    Code
      deterministic_optimal_imitation_impl(graph = g, vid = 1, quantities = c(1, 2, 3),
      strategies = c(1, 2, 3))
    Output
      [1] 2 2 3

---

    Code
      deterministic_optimal_imitation_impl(graph = g, vid = 1, optimality = "minimum",
        quantities = c(1, 2, 3), strategies = c(1, 2, 3), mode = "in")
    Output
      [1] 1 2 3

# deterministic_optimal_imitation_impl errors

    Code
      deterministic_optimal_imitation_impl(graph = NULL, vid = 1, quantities = c(1, 2,
        3), strategies = c(1, 2, 3))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# moran_process_impl basic

    Code
      moran_process_impl(graph = g, weights = c(1, 1), quantities = c(1, 2, 3),
      strategies = c(1, 2, 3), mode = "in")
    Output
      $quantities
      [1] 1 3 3
      
      $strategies
      [1] 1 3 3
      

# moran_process_impl errors

    Code
      moran_process_impl(graph = NULL, quantities = c(1, 2, 3), strategies = c(1, 2,
        3))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# roulette_wheel_imitation_impl basic

    Code
      roulette_wheel_imitation_impl(graph = g, vid = 1, is_local = TRUE, quantities = c(
        1, 2, 3), strategies = c(1, 2, 3))
    Output
      [1] 1 2 3

---

    Code
      roulette_wheel_imitation_impl(graph = g, vid = 1, is_local = FALSE, quantities = c(
        1, 2, 3), strategies = c(1, 2, 3), mode = "in")
    Output
      [1] 3 2 3

# roulette_wheel_imitation_impl errors

    Code
      roulette_wheel_imitation_impl(graph = NULL, vid = 1, is_local = TRUE,
        quantities = c(1, 2, 3), strategies = c(1, 2, 3))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# stochastic_imitation_impl basic

    Code
      stochastic_imitation_impl(graph = g, vid = 1, algo = 1, quantities = c(1, 2, 3),
      strategies = c(1, 2, 3))
    Output
      [1] 1 2 3

---

    Code
      stochastic_imitation_impl(graph = g, vid = 1, algo = 2, quantities = c(1, 2, 3),
      strategies = c(1, 2, 3), mode = "in")
    Output
      [1] 1 2 3

# stochastic_imitation_impl errors

    Code
      stochastic_imitation_impl(graph = NULL, vid = 1, algo = 1, quantities = c(1, 2,
        3), strategies = c(1, 2, 3))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# invalidate_cache_impl basic

    Code
      invalidate_cache_impl(graph = g)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

# invalidate_cache_impl errors

    Code
      invalidate_cache_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# vertex_path_from_edge_path_impl basic

    Code
      vertex_path_from_edge_path_impl(graph = g, start = 1, edge_path = c(1, 2))
    Output
      + 3/3 vertices:
      [1] 1 2 3

---

    Code
      vertex_path_from_edge_path_impl(graph = g, start = 1, edge_path = c(1), mode = "in")
    Output
      + 2/3 vertices:
      [1] 1 2

# vertex_path_from_edge_path_impl errors

    Code
      vertex_path_from_edge_path_impl(graph = NULL, start = 1, edge_path = c(1, 2))
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# version_impl basic

    Code
      version_impl_clean()
    Output
      [1] "0.10.17"

# version_impl errors

    Code
      version_impl("invalid")
    Condition
      Error in `version_impl()`:
      ! unused argument ("invalid")

# ecount_impl basic

    Code
      ecount_impl(graph = g)
    Output
      [1] 0

---

    Code
      ecount_impl(graph = g)
    Output
      [1] 3

# ecount_impl errors

    Code
      ecount_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_directed_impl basic

    Code
      is_directed_impl(graph = g)
    Output
      [1] TRUE

---

    Code
      is_directed_impl(graph = g)
    Output
      [1] FALSE

# is_directed_impl errors

    Code
      is_directed_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# edges_impl basic

    Code
      edges_impl(graph = g, eids = E(g))
    Output
      + 6/4 vertices:
      [1] 1 2 2 3 3 4

---

    Code
      edges_impl(graph = g, eids = c(1, 3))
    Output
      + 4/4 vertices:
      [1] 1 2 3 4

# edges_impl errors

    Code
      edges_impl(graph = NULL, eids = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# add_vertices_impl basic

    Code
      vcount(g_new)
    Output
      [1] 5

# add_vertices_impl errors

    Code
      add_vertices_impl(graph = NULL, nv = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# delete_edges_impl basic

    Code
      ecount(g_new)
    Output
      [1] 1

# delete_edges_impl errors

    Code
      delete_edges_impl(graph = NULL, edges = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# delete_vertices_impl basic

    Code
      vcount(g_new)
    Output
      [1] 2

# delete_vertices_impl errors

    Code
      delete_vertices_impl(graph = NULL, vertices = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# incident_impl basic

    Code
      incident_impl(graph = g, vid = 2, mode = "out")
    Output
      + 1/3 edge:
      [1] 2->3

---

    Code
      incident_impl(graph = g, vid = 2, mode = "in")
    Output
      + 1/3 edge:
      [1] 1->2

---

    Code
      incident_impl(graph = g, vid = 2, mode = "all")
    Output
      + 2/3 edges:
      [1] 1->2 2->3

# incident_impl errors

    Code
      incident_impl(graph = NULL, vid = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# famous_impl basic

    Code
      famous_impl(name = "Zachary")
    Output
      IGRAPH U--- 34 78 -- 
      + edges:
       [1]  1-- 2  1-- 3  1-- 4  1-- 5  1-- 6  1-- 7  1-- 8  1-- 9  1--11  1--12
      [11]  1--13  1--14  1--18  1--20  1--22  1--32  2-- 3  2-- 4  2-- 8  2--14
      [21]  2--18  2--20  2--22  2--31  3-- 4  3-- 8  3--28  3--29  3--33  3--10
      [31]  3-- 9  3--14  4-- 8  4--13  4--14  5-- 7  5--11  6-- 7  6--11  6--17
      [41]  7--17  9--31  9--33  9--34 10--34 14--34 15--33 15--34 16--33 16--34
      [51] 19--33 19--34 20--34 21--33 21--34 23--33 23--34 24--26 24--28 24--33
      [61] 24--34 24--30 25--26 25--28 25--32 26--32 27--30 27--34 28--34 29--32
      [71] 29--34 30--33 30--34 31--33 31--34 32--33 32--34 33--34

# famous_impl errors

    Code
      famous_impl(name = "NonexistentGraph")
    Condition
      Error in `famous_impl()`:
      ! At vendor/cigraph/src/constructors/famous.c:xx : NonexistentGraph is not a known graph. See the documentation for valid graph names. Invalid value

# constraint_impl errors

    Code
      constraint_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# cocitation_impl errors

    Code
      cocitation_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# bibcoupling_impl errors

    Code
      bibcoupling_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# girth_impl basic

    Code
      result$girth
    Output
      [1] 5

# girth_impl errors

    Code
      girth_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# coreness_impl basic

    Code
      coreness_impl(graph = g)
    Output
      [1] 2 2 2 1

# coreness_impl errors

    Code
      coreness_impl(graph = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# union_impl basic

    Code
      union_impl(left = g1, right = g2)
    Output
      $res
      IGRAPH D--- 4 4 -- 
      + edges:
      [1] 1->2 1->3 2->3 3->4
      
      $edge_map_left
      [1] 1 3
      
      $edge_map_right
      [1] 2 4
      

# union_impl errors

    Code
      union_impl(left = NULL, right = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# intersection_impl basic

    Code
      intersection_impl(left = g1, right = g2)
    Output
      $res
      IGRAPH D--- 3 2 -- 
      + edges:
      [1] 1->2 2->3
      
      $edge_map_left
      [1] 1 2
      
      $edge_map_right
      [1] 1 2
      

# intersection_impl errors

    Code
      intersection_impl(left = NULL, right = NULL)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# ring_impl basic

    Code
      ring_impl(n = 5, directed = FALSE, mutual = FALSE, circular = TRUE)
    Output
      IGRAPH U--- 5 5 -- 
      + edges:
      [1] 1--2 2--3 3--4 4--5 1--5

---

    Code
      ring_impl(n = 4, directed = TRUE, mutual = FALSE, circular = FALSE)
    Output
      IGRAPH D--- 4 3 -- 
      + edges:
      [1] 1->2 2->3 3->4

# full_impl basic

    Code
      full_impl(n = 4, directed = FALSE, loops = FALSE)
    Output
      IGRAPH U--- 4 6 -- 
      + edges:
      [1] 1--2 1--3 1--4 2--3 2--4 3--4

---

    Code
      full_impl(n = 3, directed = TRUE, loops = FALSE)
    Output
      IGRAPH D--- 3 6 -- 
      + edges:
      [1] 1->2 1->3 2->1 2->3 3->1 3->2

# kary_tree_impl basic

    Code
      kary_tree_impl(n = 7, children = 2, type = c("out", "in", "undirected"))
    Output
      IGRAPH D--- 7 6 -- 
      + edges:
      [1] 1->2 1->3 2->4 2->5 3->6 3->7

---

    Code
      kary_tree_impl(n = 10, children = 3, type = c("in", "out", "undirected"))
    Output
      IGRAPH D--- 10 9 -- 
      + edges:
      [1]  2->1  3->1  4->1  5->2  6->2  7->2  8->3  9->3 10->3

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

# distances_impl basic

    Code
      distances_impl(graph = g, from = V(g), to = V(g), mode = c("out", "in", "all",
        "total"))
    Output
           [,1] [,2] [,3] [,4] [,5]
      [1,]    0    1    2    2    1
      [2,]    1    0    1    2    2
      [3,]    2    1    0    1    2
      [4,]    2    2    1    0    1
      [5,]    1    2    2    1    0

# diameter_impl basic

    Code
      diameter_impl(graph = g, directed = FALSE, unconnected = TRUE)
    Output
      $res
      [1] 5
      
      $from
      [1] 0
      
      $to
      [1] 5
      
      $vertex_path
      [1] 0 1 2 3 4 5
      
      $edge_path
      [1] 0 1 2 3 4
      

# get_shortest_paths_impl basic

    Code
      get_shortest_paths_impl(graph = g, from = 1, to = 3, mode = c("out", "in",
        "all", "total"))
    Output
      $vertices
      $vertices[[1]]
      + 3/5 vertices:
      [1] 1 2 3
      
      
      $edges
      $edges[[1]]
      + 2/5 edges:
      [1] 1--2 2--3
      
      
      $parents
      [1] -1  0  1 -2  0
      
      $inbound_edges
      [1] -1  0  1 -1  4
      

# subcomponent_impl basic

    Code
      subcomponent_impl(graph = g, v = 1, mode = c("all", "out", "in"))
    Output
      + 3/6 vertices, named:
      [1] A B C

# betweenness_impl basic

    Code
      betweenness_impl(graph = g, vids = V(g), directed = FALSE)
    Output
      [1] 6 0 0 0 0

# harmonic_centrality_impl basic

    Code
      harmonic_centrality_impl(graph = g, vids = V(g), mode = c("out", "in", "all",
        "total"))
    Output
      [1] 4.0 2.5 2.5 2.5 2.5

# pagerank_impl basic

    Code
      pagerank_impl(graph = g, vids = V(g), directed = TRUE, damping = 0.85)
    Output
      $vector
      [1] 0.2 0.2 0.2 0.2 0.2
      
      $value
      [1] 1
      
      $options
      NULL
      

# hub_score_impl basic

    Code
      hub_score_impl(graph = g, scale = TRUE, weights = NULL)
    Output
      $vector
      [1] 1 0 0 0 0
      
      $value
      [1] 4
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 5
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 4
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 4
      
      

# authority_score_impl basic

    Code
      authority_score_impl(graph = g, scale = TRUE, weights = NULL)
    Output
      $vector
      [1] 0 1 1 1 1
      
      $value
      [1] 4
      
      $options
      $options$bmat
      [1] "I"
      
      $options$n
      [1] 5
      
      $options$which
      [1] "LA"
      
      $options$nev
      [1] 1
      
      $options$tol
      [1] 0
      
      $options$ncv
      [1] 0
      
      $options$ldv
      [1] 0
      
      $options$ishift
      [1] 1
      
      $options$maxiter
      [1] 3000
      
      $options$nb
      [1] 1
      
      $options$mode
      [1] 1
      
      $options$start
      [1] 1
      
      $options$sigma
      [1] 0
      
      $options$sigmai
      [1] 0
      
      $options$info
      [1] 0
      
      $options$iter
      [1] 1
      
      $options$nconv
      [1] 1
      
      $options$numop
      [1] 4
      
      $options$numopb
      [1] 0
      
      $options$numreo
      [1] 4
      
      

# community_walktrap_impl basic

    Code
      community_walktrap_impl(graph = g, steps = 4)
    Output
      $merges
           [,1] [,2]
      [1,]    4    5
      [2,]    1    2
      [3,]    3    6
      [4,]    0    7
      [5,]    8    9
      
      $modularity
      [1] -0.17346939 -0.07142857  0.03061224  0.19387755  0.35714286  0.00000000
      
      $membership
      [1] 0 0 0 1 1 1
      

# community_fastgreedy_impl basic

    Code
      community_fastgreedy_impl(graph = g)
    Output
      $merges
           [,1] [,2]
      [1,]    2    1
      [2,]    0    6
      [3,]    5    4
      [4,]    3    8
      [5,]    9    7
      
      $modularity
      [1] -1.734694e-01 -7.142857e-02  9.183673e-02  1.938776e-01  3.571429e-01
      [6]  5.551115e-17
      
      $membership
      [1] 1 1 1 0 0 0
      

# community_edge_betweenness_impl basic

    Code
      community_edge_betweenness_impl(graph = g, directed = FALSE)
    Output
      $removed_edges
      [1] 2 0 1 3 4 5 6
      
      $edge_betweenness
      [1] 9 1 2 1 1 2 1
      
      $merges
           [,1] [,2]
      [1,]    5    4
      [2,]    6    3
      [3,]    2    1
      [4,]    8    0
      [5,]    7    9
      
      $bridges
      [1] 7 6 4 3 1
      
      $modularity
      [1] -0.17346939 -0.07142857  0.09183673  0.19387755  0.35714286  0.00000000
      
      $membership
      [1] 0 0 0 1 1 1
      

# edge_connectivity_impl basic

    Code
      edge_connectivity_impl(graph = g)
    Output
      [1] 2

# vertex_connectivity_impl basic

    Code
      vertex_connectivity_impl(graph = g)
    Output
      [1] 2

# create_bipartite_impl basic

    Code
      create_bipartite_impl(types = c(FALSE, FALSE, TRUE, TRUE), edges = c(0, 2, 0, 3,
        1, 2, 1, 3), directed = FALSE)
    Output
      IGRAPH U--- 4 4 -- 
      + edges:
      [1] 1--3 1--4 2--3 2--4

# decompose_impl basic

    Code
      decompose_impl(graph = g, mode = c("weak", "strong"))
    Output
      [[1]]
      IGRAPH UN-- 3 2 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] A--B B--C
      
      [[2]]
      IGRAPH UN-- 2 1 -- 
      + attr: name (v/c)
      + edge (vertex names):
      [1] D--E
      

# neighborhood_impl basic

    Code
      neighborhood_impl(graph = g, order = 1, vids = V(g), mode = c("all", "out",
        "in"))
    Output
      [[1]]
      + 3/5 vertices:
      [1] 1 2 5
      
      [[2]]
      + 3/5 vertices:
      [1] 2 1 3
      
      [[3]]
      + 3/5 vertices:
      [1] 3 2 4
      
      [[4]]
      + 3/5 vertices:
      [1] 4 3 5
      
      [[5]]
      + 3/5 vertices:
      [1] 5 1 4
      

# neighborhood_size_impl basic

    Code
      neighborhood_size_impl(graph = g, order = 1, vids = V(g), mode = c("all", "out",
        "in"))
    Output
      [1] 3 3 3 3 3

# get_adjacency_impl basic

    Code
      get_adjacency_impl(graph = g, type = c("both", "upper", "lower"))
    Output
           [,1] [,2] [,3]
      [1,]    0    1    1
      [2,]    1    0    1
      [3,]    1    1    0

# write_graph_edgelist_impl basic

    Code
      content
    Output
      [1] "0 1" "0 2" "1 2"

# read_graph_edgelist_impl basic

    Code
      read_graph_edgelist_impl(instream = tmp, n = 3, directed = FALSE)
    Output
      IGRAPH U--- 3 3 -- 
      + edges:
      [1] 1--2 2--3 1--3

# connect_neighborhood_impl basic

    Code
      connect_neighborhood_impl(graph = g, order = 1, mode = c("all", "out", "in"))
    Condition
      Warning in `connect_neighborhood_impl()`:
      At vendor/cigraph/src/operators/connect_neighborhood.c:85 : Order smaller than two, graph will be unchanged.
    Output
      IGRAPH U--- 5 5 -- Ring graph
      + attr: name (g/c), mutual (g/l), circular (g/l)
      + edges:
      [1] 1--2 2--3 3--4 4--5 1--5

# eccentricity_impl basic

    Code
      eccentricity_impl(graph = g, vids = V(g), mode = c("out", "in", "all"))
    Output
      [1] 2 2 2 2 2

# radius_impl basic

    Code
      radius_impl(graph = g, mode = c("out", "in", "all"))
    Output
      [1] 2

# graph_center_impl basic

    Code
      graph_center_impl(graph = g, mode = c("out", "in", "all"))
    Output
      + 1/5 vertex:
      [1] 1

# maximal_cliques_impl basic

    Code
      maximal_cliques_impl(graph = g, min_size = 1, max_size = 0)
    Output
      [[1]]
      + 4/4 vertices:
      [1] 1 2 4 3
      

# independent_vertex_sets_impl basic

    Code
      independent_vertex_sets_impl(graph = g, min_size = 1, max_size = 0)
    Output
      [[1]]
      + 1/5 vertex:
      [1] 1
      
      [[2]]
      + 1/5 vertex:
      [1] 2
      
      [[3]]
      + 1/5 vertex:
      [1] 3
      
      [[4]]
      + 1/5 vertex:
      [1] 4
      
      [[5]]
      + 1/5 vertex:
      [1] 5
      
      [[6]]
      + 2/5 vertices:
      [1] 1 3
      
      [[7]]
      + 2/5 vertices:
      [1] 1 4
      
      [[8]]
      + 2/5 vertices:
      [1] 2 4
      
      [[9]]
      + 2/5 vertices:
      [1] 2 5
      
      [[10]]
      + 2/5 vertices:
      [1] 3 5
      

