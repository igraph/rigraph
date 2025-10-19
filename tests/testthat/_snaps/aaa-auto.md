# empty_impl basic

    Code
      empty_impl()
    Output
      IGRAPH D--- 0 0 -- 
      + edges:

---

    Code
      empty_impl(5, directed = FALSE)
    Output
      IGRAPH U--- 5 0 -- 
      + edges:

# empty_impl errors

    Code
      x
    Condition
      Error in `empty_impl()`:
      ! At vendor/cigraph/src/graph/type_indexededgelist.c:xx : Number of vertices must not be negative. Invalid value

# add_edges_impl basic

    Code
      add_edges_impl(g, c(0, 1, 1, 2))
    Output
      IGRAPH D--- 3 2 -- 
      + edges:
      [1] 1->2 2->3

# add_edges_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# copy_impl basic

    Code
      copy_impl(g)
    Output
      IGRAPH D--- 2 0 -- 
      + edges:

# copy_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# delete_vertices_idx_impl basic

    Code
      delete_vertices_idx_impl(g, 1)
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# vcount_impl basic

    Code
      vcount_impl(g)
    Output
      [1] 4

# vcount_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# degree_impl basic

    Code
      degree_impl(g)
    Output
      [1] 0 0 0

---

    Code
      degree_impl(g, mode = "in")
    Output
      [1] 0 0 0

# degree_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_all_eids_between_impl basic

    Code
      get_all_eids_between_impl(g, 1, 2)
    Output
      + 0/0 edges:

# get_all_eids_between_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# wheel_impl basic

    Code
      wheel_impl(5)
    Output
      IGRAPH D--- 5 8 -- 
      + edges:
      [1] 1->2 1->3 1->4 1->5 2->3 3->4 4->5 5->2

---

    Code
      wheel_impl(5, mode = "in", center = 2)
    Output
      IGRAPH D--- 5 8 -- 
      + edges:
      [1] 1->3 2->3 4->3 5->3 1->2 2->4 4->5 5->1

# wheel_impl errors

    Code
      x
    Condition
      Error in `wheel_impl()`:
      ! At vendor/cigraph/src/constructors/regular.c:xx : Invalid number of vertices. Invalid vertex ID

# hypercube_impl basic

    Code
      hypercube_impl(3)
    Output
      IGRAPH U--- 8 12 -- 
      + edges:
       [1] 1--2 1--3 1--5 2--4 2--6 3--4 3--7 4--8 5--6 5--7 6--8 7--8

---

    Code
      hypercube_impl(3, directed = TRUE)
    Output
      IGRAPH D--- 8 12 -- 
      + edges:
       [1] 1->2 1->3 1->5 2->4 2->6 3->4 3->7 4->8 5->6 5->7 6->8 7->8

# hypercube_impl errors

    Code
      x
    Condition
      Error in `hypercube_impl()`:
      ! At vendor/cigraph/src/constructors/regular.c:xx : The requested hypercube graph dimension (10000) is too high. It must be no greater than 57. Invalid value

# square_lattice_impl basic

    Code
      square_lattice_impl(c(2, 2))
    Output
      IGRAPH U--- 4 4 -- 
      + edges:
      [1] 1--2 1--3 2--4 3--4

---

    Code
      square_lattice_impl(c(2, 2), nei = 2, directed = TRUE, mutual = TRUE, periodic = c(
        TRUE, TRUE))
    Output
      IGRAPH D--- 4 10 -- 
      + edges:
       [1] 1->2 1->3 2->1 2->4 3->4 3->1 4->3 4->2 1->4 2->3

# square_lattice_impl errors

    Code
      x
    Condition
      Error in `square_lattice_impl()`:
      ! At vendor/cigraph/src/constructors/regular.c:xx : Invalid dimension vector. Invalid value

# triangular_lattice_impl basic

    Code
      triangular_lattice_impl(c(2, 2))
    Output
      IGRAPH U--- 4 5 -- 
      + edges:
      [1] 1--2 1--4 1--3 2--4 3--4

---

    Code
      triangular_lattice_impl(c(2, 2), directed = TRUE, mutual = TRUE)
    Output
      IGRAPH D--- 4 10 -- 
      + edges:
       [1] 1->2 2->1 1->4 4->1 1->3 3->1 2->4 4->2 3->4 4->3

# triangular_lattice_impl errors

    Code
      x
    Condition
      Error in `triangular_lattice_impl()`:
      ! At vendor/cigraph/src/constructors/lattices.c:xx : Invalid dimension vector. Invalid value

# path_graph_impl basic

    Code
      path_graph_impl(5)
    Output
      IGRAPH U--- 5 4 -- 
      + edges:
      [1] 1--2 2--3 3--4 4--5

---

    Code
      path_graph_impl(5, directed = TRUE, mutual = TRUE)
    Output
      IGRAPH D--- 5 8 -- 
      + edges:
      [1] 1->2 2->1 2->3 3->2 3->4 4->3 4->5 5->4

# path_graph_impl errors

    Code
      x
    Condition
      Error in `path_graph_impl()`:
      ! At vendor/cigraph/src/constructors/regular.c:xx : The number of vertices must be non-negative, got -1. Invalid value

# cycle_graph_impl basic

    Code
      cycle_graph_impl(5)
    Output
      IGRAPH U--- 5 5 -- 
      + edges:
      [1] 1--2 2--3 3--4 4--5 1--5

---

    Code
      cycle_graph_impl(5, directed = TRUE, mutual = TRUE)
    Output
      IGRAPH D--- 5 10 -- 
      + edges:
       [1] 1->2 2->1 2->3 3->2 3->4 4->3 4->5 5->4 5->1 1->5

# cycle_graph_impl errors

    Code
      x
    Condition
      Error in `cycle_graph_impl()`:
      ! At vendor/cigraph/src/constructors/regular.c:xx : The number of vertices must be non-negative, got -1. Invalid value

# symmetric_tree_impl basic

    Code
      symmetric_tree_impl(3)
    Output
      IGRAPH D--- 4 3 -- 
      + edges:
      [1] 1->2 1->3 1->4

---

    Code
      symmetric_tree_impl(3, type = "in")
    Output
      IGRAPH D--- 4 3 -- 
      + edges:
      [1] 2->1 3->1 4->1

# symmetric_tree_impl errors

    Code
      x
    Condition
      Error in `symmetric_tree_impl()`:
      ! At vendor/cigraph/src/constructors/regular.c:xx : The number of branches must be positive at each level. Invalid value

# regular_tree_impl basic

    Code
      regular_tree_impl(2)
    Output
      IGRAPH U--- 10 9 -- 
      + edges:
      [1] 1-- 2 1-- 3 1-- 4 2-- 5 2-- 6 3-- 7 3-- 8 4-- 9 4--10

---

    Code
      regular_tree_impl(2, k = 4, type = "in")
    Output
      IGRAPH D--- 17 16 -- 
      + edges:
       [1]  2->1  3->1  4->1  5->1  6->2  7->2  8->2  9->3 10->3 11->3 12->4 13->4
      [13] 14->4 15->5 16->5 17->5

# regular_tree_impl errors

    Code
      x
    Condition
      Error in `regular_tree_impl()`:
      ! At vendor/cigraph/src/constructors/regular.c:xx : Height of regular tree must be positive, got -1. Invalid value

# full_citation_impl basic

    Code
      full_citation_impl(5)
    Output
      IGRAPH D--- 5 10 -- 
      + edges:
       [1] 2->1 3->1 3->2 4->1 4->2 4->3 5->1 5->2 5->3 5->4

---

    Code
      full_citation_impl(5, directed = FALSE)
    Output
      IGRAPH U--- 5 10 -- 
      + edges:
       [1] 1--2 1--3 2--3 1--4 2--4 3--4 1--5 2--5 3--5 4--5

# full_citation_impl errors

    Code
      x
    Condition
      Error in `full_citation_impl()`:
      ! At vendor/cigraph/src/constructors/full.c:xx : Invalid number of vertices. Invalid value

# atlas_impl basic

    Code
      atlas_impl(0)
    Output
      IGRAPH U--- 0 0 -- 
      + edges:

---

    Code
      atlas_impl(5)
    Output
      IGRAPH U--- 3 1 -- 
      + edge:
      [1] 2--3

# atlas_impl errors

    Code
      x
    Condition
      Error in `atlas_impl()`:
      ! At vendor/cigraph/src/constructors/atlas.c:xx : No such graph in atlas. The graph index must be less than 1253. Invalid value

# extended_chordal_ring_impl basic

    Code
      extended_chordal_ring_impl(5, matrix(c(1, 2)))
    Output
      IGRAPH U--- 5 15 -- 
      + edges:
       [1] 1--2 2--3 3--4 4--5 1--5 1--2 1--3 2--3 2--4 3--4 3--5 4--5 1--4 1--5 2--5

---

    Code
      extended_chordal_ring_impl(5, matrix(c(1, 2)), directed = TRUE)
    Output
      IGRAPH D--- 5 15 -- 
      + edges:
       [1] 1->2 2->3 3->4 4->5 5->1 1->2 1->3 2->3 2->4 3->4 3->5 4->5 4->1 5->1 5->2

# extended_chordal_ring_impl errors

    Code
      x
    Condition
      Error in `extended_chordal_ring_impl()`:
      ! At vendor/cigraph/src/constructors/regular.c:xx : An extended chordal ring has at least 3 nodes. Invalid value

# graph_power_impl basic

    Code
      graph_power_impl(g, 2)
    Output
      IGRAPH U--- 5 7 -- 
      + edges:
      [1] 1--2 2--3 3--4 4--5 1--3 2--4 3--5

---

    Code
      graph_power_impl(g, 2, directed = TRUE)
    Output
      IGRAPH U--- 5 7 -- 
      + edges:
      [1] 1--2 2--3 3--4 4--5 1--3 2--4 3--5

# graph_power_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# linegraph_impl basic

    Code
      linegraph_impl(g)
    Output
      IGRAPH U--- 4 3 -- 
      + edges:
      [1] 1--2 2--3 3--4

# linegraph_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# de_bruijn_impl basic

    Code
      de_bruijn_impl(2, 3)
    Output
      IGRAPH D--- 8 16 -- 
      + edges:
       [1] 1->1 1->2 2->3 2->4 3->5 3->6 4->7 4->8 5->1 5->2 6->3 6->4 7->5 7->6 8->7
      [16] 8->8

# de_bruijn_impl errors

    Code
      x
    Condition
      Error in `de_bruijn_impl()`:
      ! At vendor/cigraph/src/constructors/de_bruijn.c:xx : `m' and `n' should be non-negative in a de Bruijn graph, Invalid value

# kautz_impl basic

    Code
      kautz_impl(2, 3)
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
      x
    Condition
      Error in `kautz_impl()`:
      ! At vendor/cigraph/src/constructors/kautz.c:xx : `m' and `n' should be non-negative in a Kautz graph, Invalid value

# lcf_vector_impl basic

    Code
      lcf_vector_impl(10, c(3, -3, 4), 2)
    Output
      IGRAPH U--- 10 16 -- LCF graph
      + attr: name (g/c)
      + edges:
       [1] 1-- 2 1-- 4 1--10 2-- 3 2-- 5 2-- 9 3-- 4 3-- 7 4-- 5 4-- 7 5-- 6 6-- 7
      [13] 6--10 7-- 8 8-- 9 9--10

# lcf_vector_impl errors

    Code
      x
    Condition
      Error in `lcf_vector_impl()`:
      ! At vendor/cigraph/src/graph/type_indexededgelist.c:xx : Number of vertices must not be negative. Invalid value

# mycielski_graph_impl basic

    Code
      mycielski_graph_impl(3)
    Output
      IGRAPH U--- 5 5 -- 
      + edges:
      [1] 1--2 1--4 2--3 3--5 4--5

# mycielski_graph_impl errors

    Code
      x
    Condition
      Error in `mycielski_graph_impl()`:
      ! At vendor/cigraph/src/constructors/mycielskian.c:xx : The Mycielski graph order must not be negative. Invalid value

# adjlist_impl basic

    Code
      adjlist_impl(list(c(2, 3), c(1), c(1)), mode = "out")
    Output
      IGRAPH D--- 3 4 -- 
      + edges:
      [1] 1->2 1->3 2->1 3->1

# adjlist_impl errors

    Code
      x
    Condition
      Error in `adjlist_impl()`:
      ! At vendor/cigraph/src/constructors/basic_constructors.c:xx : Invalid (negative or too large) vertex ID. Invalid vertex ID

# full_bipartite_impl basic

    Code
      full_bipartite_impl(2, 3)
    Output
      $graph
      IGRAPH U--- 5 6 -- 
      + edges:
      [1] 1--3 1--4 1--5 2--3 2--4 2--5
      
      $types
      [1] FALSE FALSE  TRUE  TRUE  TRUE
      

---

    Code
      full_bipartite_impl(2, 3, directed = TRUE, mode = "in")
    Output
      $graph
      IGRAPH D--- 5 6 -- 
      + edges:
      [1] 3->1 4->1 5->1 3->2 4->2 5->2
      
      $types
      [1] FALSE FALSE  TRUE  TRUE  TRUE
      

# full_bipartite_impl errors

    Code
      x
    Condition
      Error in `full_bipartite_impl()`:
      ! At vendor/cigraph/src/misc/bipartite.c:xx : Invalid number of vertices for bipartite graph. Invalid value

# full_multipartite_impl basic

    Code
      full_multipartite_impl(c(2, 3, 4))
    Output
      $graph
      IGRAPH U--- 9 26 -- 
      + edges:
       [1] 1--3 1--4 1--5 1--6 1--7 1--8 1--9 2--3 2--4 2--5 2--6 2--7 2--8 2--9 3--6
      [16] 3--7 3--8 3--9 4--6 4--7 4--8 4--9 5--6 5--7 5--8 5--9
      
      $types
      [1] 1 1 2 2 2 3 3 3 3
      

---

    Code
      full_multipartite_impl(c(2, 3, 4), directed = TRUE, mode = "in")
    Output
      $graph
      IGRAPH D--- 9 26 -- 
      + edges:
       [1] 3->1 4->1 5->1 6->1 7->1 8->1 9->1 3->2 4->2 5->2 6->2 7->2 8->2 9->2 6->3
      [16] 7->3 8->3 9->3 6->4 7->4 8->4 9->4 6->5 7->5 8->5 9->5
      
      $types
      [1] 1 1 2 2 2 3 3 3 3
      

# full_multipartite_impl errors

    Code
      x
    Condition
      Error in `full_multipartite_impl()`:
      ! At vendor/cigraph/src/constructors/full.c:xx : Number of vertices must not be negative in any partition. Invalid value

# realize_degree_sequence_impl basic

    Code
      realize_degree_sequence_impl(c(2, 2, 2))
    Output
      IGRAPH U--- 3 3 -- Graph from degree sequence
      + attr: name (g/c), out.deg (g/n), in.deg (g/x), allowed.edge.types
      | (g/n), method (g/n)
      + edges:
      [1] 2--3 1--3 1--2

---

    Code
      realize_degree_sequence_impl(c(2, 2, 2), c(2, 2, 2), allowed.edge.types = "simple",
      method = "largest")
    Output
      IGRAPH D--- 3 6 -- Graph from degree sequence
      + attr: name (g/c), out.deg (g/n), in.deg (g/n), allowed.edge.types
      | (g/n), method (g/n)
      + edges:
      [1] 1->2 1->3 2->1 2->3 3->1 3->2

# realize_degree_sequence_impl errors

    Code
      x
    Condition
      Error in `realize_degree_sequence_impl()`:
      ! At vendor/cigraph/src/misc/degree_sequence.cpp:xx : The sum of degrees must be even for an undirected graph. Invalid value

# realize_bipartite_degree_sequence_impl basic

    Code
      realize_bipartite_degree_sequence_impl(c(2, 2), c(2, 2))
    Output
      IGRAPH U--- 4 4 -- Bipartite graph from degree sequence
      + attr: name (g/c), degrees1 (g/n), degrees2 (g/n), allowed.edge.types
      | (g/n), method (g/n)
      + edges:
      [1] 2--3 2--4 1--4 1--3

---

    Code
      realize_bipartite_degree_sequence_impl(c(2, 2), c(2, 2), allowed.edge.types = "loops",
      method = "largest")
    Output
      IGRAPH U--- 4 4 -- Bipartite graph from degree sequence
      + attr: name (g/c), degrees1 (g/n), degrees2 (g/n), allowed.edge.types
      | (g/n), method (g/n)
      + edges:
      [1] 1--3 1--4 2--3 2--4

# realize_bipartite_degree_sequence_impl errors

    Code
      x
    Condition
      Error in `realize_bipartite_degree_sequence_impl()`:
      ! At vendor/cigraph/src/misc/degree_sequence.cpp:xx : The given bidegree sequence cannot be realized as a bipartite simple graph. Invalid value

# circulant_impl basic

    Code
      circulant_impl(5, c(1, 2))
    Output
      IGRAPH U--- 5 10 -- 
      + edges:
       [1] 1--2 2--3 3--4 4--5 1--5 1--3 2--4 3--5 1--4 2--5

---

    Code
      circulant_impl(5, c(1, 2), directed = TRUE)
    Output
      IGRAPH D--- 5 10 -- 
      + edges:
       [1] 1->2 2->3 3->4 4->5 5->1 1->3 2->4 3->5 4->1 5->2

# circulant_impl errors

    Code
      x
    Condition
      Error in `circulant_impl()`:
      ! At vendor/cigraph/src/constructors/circulant.c:xx : Number of nodes = -1 must be non-negative. Invalid value

# generalized_petersen_impl basic

    Code
      generalized_petersen_impl(5, 2)
    Output
      IGRAPH U--- 10 15 -- 
      + edges:
       [1] 1-- 2 1-- 6 6-- 8 2-- 3 2-- 7 7-- 9 3-- 4 3-- 8 8--10 4-- 5 4-- 9 6-- 9
      [13] 1-- 5 5--10 7--10

# generalized_petersen_impl errors

    Code
      x
    Condition
      Error in `generalized_petersen_impl()`:
      ! At vendor/cigraph/src/constructors/generalized_petersen.c:xx : n = -1 must be at least 3. Invalid value

# turan_impl basic

    Code
      turan_impl(5, 2)
    Output
      $graph
      IGRAPH U--- 5 6 -- 
      + edges:
      [1] 1--4 1--5 2--4 2--5 3--4 3--5
      
      $types
      [1] 1 1 1 2 2
      

# turan_impl errors

    Code
      x
    Condition
      Error in `turan_impl()`:
      ! At vendor/cigraph/src/constructors/full.c:xx : Number of vertices must not be negative, got -1. Invalid value

# erdos_renyi_game_gnp_impl basic

    Code
      erdos_renyi_game_gnp_impl(5, 0.5)
    Output
      IGRAPH U--- 5 7 -- 
      + edges:
      [1] 1--2 1--3 2--3 1--4 2--4 1--5 4--5

---

    Code
      erdos_renyi_game_gnp_impl(5, 0.5, directed = TRUE, loops = TRUE)
    Output
      IGRAPH D--- 5 12 -- 
      + edges:
       [1] 2->1 3->1 4->1 2->2 1->3 2->3 4->3 1->4 2->4 5->4 3->5 4->5

# erdos_renyi_game_gnp_impl errors

    Code
      x
    Condition
      Error in `erdos_renyi_game_gnp_impl()`:
      ! At vendor/cigraph/src/games/erdos_renyi.c:xx : Invalid number of vertices. Invalid value

# erdos_renyi_game_gnm_impl basic

    Code
      erdos_renyi_game_gnm_impl(5, 3)
    Output
      IGRAPH U--- 5 3 -- 
      + edges:
      [1] 3--4 2--5 4--5

---

    Code
      erdos_renyi_game_gnm_impl(5, 3, directed = TRUE, loops = TRUE)
    Output
      IGRAPH D--- 5 3 -- 
      + edges:
      [1] 4->3 5->3 3->5

# erdos_renyi_game_gnm_impl errors

    Code
      x
    Condition
      Error in `erdos_renyi_game_gnm_impl()`:
      ! At vendor/cigraph/src/games/erdos_renyi.c:xx : Invalid number of vertices. Invalid value

# growing_random_game_impl basic

    Code
      growing_random_game_impl(5, 2)
    Output
      IGRAPH D--- 5 8 -- Growing random graph
      + attr: name (g/c), m (g/n), citation (g/l)
      + edges:
      [1] 2->2 1->2 3->3 3->3 3->3 1->2 2->2 5->4

---

    Code
      growing_random_game_impl(5, 2, directed = FALSE, citation = TRUE)
    Output
      IGRAPH U--- 5 8 -- Growing random graph
      + attr: name (g/c), m (g/n), citation (g/l)
      + edges:
      [1] 1--2 1--2 2--3 1--3 1--4 2--4 1--5 4--5

# growing_random_game_impl errors

    Code
      x
    Condition
      Error in `growing_random_game_impl()`:
      ! At vendor/cigraph/src/games/growing_random.c:xx : Invalid number of vertices. Invalid value

# preference_game_impl basic

    Code
      preference_game_impl(5, 2, c(0.5, 0.5), FALSE, matrix(c(0.5, 0.5, 0.5, 0.5), 2,
      2))
    Output
      $graph
      IGRAPH U--- 5 4 -- 
      + edges:
      [1] 1--3 3--4 1--4 1--5
      
      $node_type_vec
      [1] 1 0 0 1 1
      

# preference_game_impl errors

    Code
      x
    Condition
      Error in `preference_game_impl()`:
      ! At vendor/cigraph/src/games/preference.c:xx : The number of vertices must be non-negative. Invalid value

# asymmetric_preference_game_impl basic

    Code
      asymmetric_preference_game_impl(5, 2, 2, matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2),
      matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2))
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
      x
    Condition
      Error in `asymmetric_preference_game_impl()`:
      ! At vendor/cigraph/src/games/preference.c:xx : The number of vertices must not be negative. Invalid value

# rewire_edges_impl basic

    Code
      rewire_edges_impl(g, 0.5)
    Output
      IGRAPH U--- 5 4 -- 
      + edges:
      [1] 2--4 3--4 1--3 2--5

# rewire_edges_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# rewire_directed_edges_impl basic

    Code
      rewire_directed_edges_impl(g, 0.5)
    Output
      IGRAPH D--- 5 4 -- 
      + edges:
      [1] 1->4 2->3 3->2 4->5

# rewire_directed_edges_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# forest_fire_game_impl basic

    Code
      forest_fire_game_impl(5, 0.5)
    Output
      IGRAPH D--- 5 9 -- Forest fire model
      + attr: name (g/c), fw.prob (g/n), bw.factor (g/n), ambs (g/n)
      + edges:
      [1] 2->1 3->2 4->2 4->1 4->3 5->1 5->2 5->4 5->3

---

    Code
      forest_fire_game_impl(5, 0.5, bw.factor = 0.2, ambs = 2, directed = FALSE)
    Output
      IGRAPH U--- 5 4 -- Forest fire model
      + attr: name (g/c), fw.prob (g/n), bw.factor (g/n), ambs (g/n)
      + edges:
      [1] 1--2 1--3 1--4 4--5

# forest_fire_game_impl errors

    Code
      x
    Condition
      Error in `forest_fire_game_impl()`:
      ! At vendor/cigraph/src/games/forestfire.c:xx : Insufficient memory for forest fire model. Out of memory

# simple_interconnected_islands_game_impl basic

    Code
      simple_interconnected_islands_game_impl(2, 3, 0.5, 1)
    Output
      IGRAPH U--- 6 5 -- Interconnected islands model
      + attr: name (g/c), islands.n (g/n), islands.size (g/n), islands.pin
      | (g/n), n.inter (g/n)
      + edges:
      [1] 1--2 1--3 2--3 3--6 5--6

# simple_interconnected_islands_game_impl errors

    Code
      x
    Condition
      Error in `simple_interconnected_islands_game_impl()`:
      ! At vendor/cigraph/src/games/islands.c:xx : Number of islands cannot be negative, got -1. Invalid value

# chung_lu_game_impl basic

    Code
      chung_lu_game_impl(c(2, 2, 2))
    Output
      IGRAPH U--- 3 5 -- Chung-Lu model
      + attr: name (g/c), variant (g/n)
      + edges:
      [1] 1--2 1--3 2--2 2--3 3--3

---

    Code
      chung_lu_game_impl(c(1, 2, 3), c(1, 2, 3), loops = FALSE, variant = "maxent")
    Output
      IGRAPH D--- 3 1 -- Chung-Lu model
      + attr: name (g/c), variant (g/n)
      + edge:
      [1] 3->1

# chung_lu_game_impl errors

    Code
      x
    Condition
      Error in `chung_lu_game_impl()`:
      ! At vendor/cigraph/src/games/chung_lu.c:xx : Vertex weights must not be negative in Chung-Lu model, got -1. Invalid value

# static_fitness_game_impl basic

    Code
      static_fitness_game_impl(3, c(1, 2, 3))
    Output
      IGRAPH U--- 3 3 -- Static fitness model
      + attr: name (g/c), loops (g/l), multiple (g/l)
      + edges:
      [1] 1--2 1--3 2--3

---

    Code
      static_fitness_game_impl(3, c(1, 2, 3), c(1, 2, 3), loops = TRUE, multiple = TRUE)
    Output
      IGRAPH D--- 3 3 -- Static fitness model
      + attr: name (g/c), loops (g/l), multiple (g/l)
      + edges:
      [1] 1->2 2->3 1->3

# static_fitness_game_impl errors

    Code
      x
    Condition
      Error in `static_fitness_game_impl()`:
      ! At vendor/cigraph/src/games/static_fitness.c:xx : Number of edges cannot be negative, got -1. Invalid value

# static_power_law_game_impl basic

    Code
      static_power_law_game_impl(5, 4, 2.5)
    Output
      IGRAPH U--- 5 4 -- Static power law model
      + attr: name (g/c), exponent.out (g/n), exponent.in (g/n), loops (g/l),
      | multiple (g/l), finite.size.correction (g/l)
      + edges:
      [1] 1--5 2--4 3--5 4--5

---

    Code
      static_power_law_game_impl(5, 4, 2.5, exponent.in = 2, loops = TRUE, multiple = TRUE,
        finite.size.correction = FALSE)
    Output
      IGRAPH D--- 5 4 -- Static power law model
      + attr: name (g/c), exponent.out (g/n), exponent.in (g/n), loops (g/l),
      | multiple (g/l), finite.size.correction (g/l)
      + edges:
      [1] 1->1 3->5 1->4 5->1

# static_power_law_game_impl errors

    Code
      x
    Condition
      Error in `static_power_law_game_impl()`:
      ! At vendor/cigraph/src/games/static_fitness.c:xx : Number of nodes cannot be negative, got -1. Invalid value

# k_regular_game_impl basic

    Code
      k_regular_game_impl(5, 2)
    Output
      IGRAPH U--- 5 5 -- k-regular graph
      + attr: name (g/c), k (g/n)
      + edges:
      [1] 1--3 1--5 2--3 2--4 4--5

---

    Code
      k_regular_game_impl(5, 2, directed = TRUE, multiple = TRUE)
    Output
      IGRAPH D--- 5 10 -- k-regular graph
      + attr: name (g/c), k (g/n)
      + edges:
       [1] 3->4 3->3 2->1 5->5 1->5 4->3 5->2 4->1 1->2 2->4

# k_regular_game_impl errors

    Code
      x
    Condition
      Error in `k_regular_game_impl()`:
      ! At vendor/cigraph/src/games/k_regular.c:xx : Number of nodes must be non-negative. Invalid value

# sbm_game_impl basic

    Code
      sbm_game_impl(5, matrix(0.5, 2, 2), c(2, 3))
    Output
      IGRAPH U--- 5 6 -- Stochastic block model
      + attr: name (g/c), loops (g/l)
      + edges:
      [1] 1--2 1--3 2--3 1--4 1--5 3--5

---

    Code
      sbm_game_impl(5, matrix(0.5, 2, 2), c(2, 3), directed = TRUE, loops = TRUE)
    Output
      IGRAPH D--- 5 14 -- Stochastic block model
      + attr: name (g/c), loops (g/l)
      + edges:
       [1] 1->1 2->1 2->4 1->5 4->1 5->1 5->2 3->3 5->3 3->4 4->4 5->4 3->5 5->5

# sbm_game_impl errors

    Code
      x
    Condition
      Error in `sbm_game_impl()`:
      ! At vendor/cigraph/src/games/sbm.c:xx : Sum of the block sizes (5) must equal the number of vertices (-1). Invalid value

# hsbm_game_impl basic

    Code
      hsbm_game_impl(6, 2, c(0.5, 0.5), matrix(1, 2, 2), 0.5)
    Output
      IGRAPH U--- 6 9 -- Hierarchical stochastic block model
      + attr: name (g/c), m (g/n), rho (g/n), C (g/n), p (g/n)
      + edges:
      [1] 1--2 3--4 5--6 1--4 1--5 2--5 1--6 4--5 3--6

# hsbm_game_impl errors

    Code
      x
    Condition
      Error in `hsbm_game_impl()`:
      ! At vendor/cigraph/src/games/sbm.c:xx : `n' must be positive for HSBM, Invalid value

# hsbm_list_game_impl basic

    Code
      hsbm_list_game_impl(100, list(50, 50), rho = list(c(3, 3, 4) / 10), C = list(C),
      p = 1 / 20)
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
      x
    Condition
      Error in `hsbm_list_game_impl()`:
      ! At vendor/cigraph/src/games/sbm.c:xx : `n' must be positive for HSBM. Invalid value

# correlated_game_impl basic

    Code
      correlated_game_impl(g, 0.5)
    Output
      IGRAPH U--- 5 3 -- Correlated random graph
      + attr: name (g/c), corr (g/n), p (g/n)
      + edges:
      [1] 1--3 3--4 2--5

# correlated_game_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# correlated_pair_game_impl basic

    Code
      correlated_pair_game_impl(5, 0.5, 0.5)
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
      correlated_pair_game_impl(5, 0.5, 0.5, directed = TRUE)
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
      x
    Condition
      Error in `correlated_pair_game_impl()`:
      ! At vendor/cigraph/src/games/erdos_renyi.c:xx : Invalid number of vertices. Invalid value

# dot_product_game_impl basic

    Code
      dot_product_game_impl(matrix(0.5, 5, 2))
    Condition
      Warning in `dot_product_game_impl()`:
      At vendor/cigraph/src/games/dotproduct.c:90 : Greater than 1 connection probability in dot-product graph.
    Output
      IGRAPH U--- 2 1 -- 
      + edge:
      [1] 1--2

---

    Code
      dot_product_game_impl(matrix(0.5, 5, 2), directed = TRUE)
    Condition
      Warning in `dot_product_game_impl()`:
      At vendor/cigraph/src/games/dotproduct.c:90 : Greater than 1 connection probability in dot-product graph.
    Output
      IGRAPH D--- 2 2 -- 
      + edges:
      [1] 1->2 2->1

# dot_product_game_impl errors

    Code
      x
    Condition
      Error in `dot_product_game_impl()`:
      ! REAL() can only be applied to a 'numeric', not a 'NULL'

# sample_sphere_surface_impl basic

    Code
      sample_sphere_surface_impl(3, 5)
    Output
                 [,1]      [,2]      [,3]      [,4]       [,5]
      [1,] 0.87877523 0.8206548 0.1430028 0.6349227 0.99933629
      [2,] 0.05165973 0.5261159 0.1145481 0.2979741 0.02649327
      [3,] 0.47443162 0.2229974 0.9830712 0.7128005 0.02500179

---

    Code
      sample_sphere_surface_impl(3, 5, radius = 2, positive = FALSE)
    Output
                 [,1]       [,2]       [,3]        [,4]     [,5]
      [1,] -0.4904253 -1.4825368 -0.5141332  1.95644246 0.369407
      [2,] -1.6787252  1.1329528 -0.7872709 -0.41498660 1.953509
      [3,] -0.9702395  0.7200713  1.7651832 -0.01090904 0.217584

# sample_sphere_surface_impl errors

    Code
      x
    Condition
      Error in `sample_sphere_surface_impl()`:
      ! At vendor/cigraph/src/games/dotproduct.c:xx : Sphere must be at least two dimensional to sample from surface. Invalid value

# sample_sphere_volume_impl basic

    Code
      sample_sphere_volume_impl(3, 5)
    Output
                 [,1]      [,2]       [,3]      [,4]       [,5]
      [1,] 0.67165090 0.6105364 0.09806950 0.4132698 0.73325518
      [2,] 0.03948371 0.3914105 0.07855561 0.1939507 0.01943923
      [3,] 0.36260970 0.1659017 0.67417787 0.4639603 0.01834487

---

    Code
      sample_sphere_volume_impl(3, 5, radius = 2, positive = FALSE)
    Output
                   [,1]       [,2]       [,3]      [,4]       [,5]
      [1,]  1.903629152 -1.3795904 -1.2061886 0.9035986 -1.1692436
      [2,] -0.159619927  0.2402815 -0.1258477 0.1842403 -1.4940836
      [3,]  0.003829883  1.2440192  0.6204597 1.5776103  0.4096058

# sample_sphere_volume_impl errors

    Code
      x
    Condition
      Error in `sample_sphere_volume_impl()`:
      ! At vendor/cigraph/src/games/dotproduct.c:xx : Sphere must be at least two dimensional to sample from surface. Invalid value

# sample_dirichlet_impl basic

    Code
      sample_dirichlet_impl(5, c(1, 1, 1))
    Output
                [,1]      [,2]       [,3]      [,4]      [,5]
      [1,] 0.6298008 0.4168413 0.29594281 0.2432340 0.1516815
      [2,] 0.1093984 0.3461600 0.08924333 0.4251328 0.3561426
      [3,] 0.2608008 0.2369988 0.61481386 0.3316331 0.4921759

# sample_dirichlet_impl errors

    Code
      x
    Condition
      Error in `sample_dirichlet_impl()`:
      ! At vendor/cigraph/src/games/dotproduct.c:xx : Number of samples should be non-negative, got -1. Invalid value

# are_adjacent_impl basic

    Code
      are_adjacent_impl(g, 1, 2)
    Output
      [1] TRUE

# are_adjacent_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# closeness_impl basic

    Code
      closeness_impl(g)
    Output
      $res
      [1] 0.3333333 0.5000000 0.3333333
      
      $reachable_count
      [1] 2 2 2
      
      $all_reachable
      [1] TRUE
      

---

    Code
      closeness_impl(g, mode = "in", normalized = TRUE)
    Output
      $res
      [1] 0.6666667 1.0000000 0.6666667
      
      $reachable_count
      [1] 2 2 2
      
      $all_reachable
      [1] TRUE
      

# closeness_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# closeness_cutoff_impl basic

    Code
      closeness_cutoff_impl(g, cutoff = 2)
    Output
      $res
      [1] 0.3333333 0.5000000 0.3333333
      
      $reachable_count
      [1] 2 2 2
      
      $all_reachable
      [1] TRUE
      

---

    Code
      closeness_cutoff_impl(g, mode = "in", normalized = TRUE, cutoff = 1)
    Output
      $res
      [1] 1 1 1
      
      $reachable_count
      [1] 1 2 1
      
      $all_reachable
      [1] FALSE
      

# closeness_cutoff_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_shortest_path_impl basic

    Code
      get_shortest_path_impl(g, 1, 3)
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 3
      
      $edges
      + 2/2 edges:
      [1] 1--2 2--3
      

# get_shortest_path_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_shortest_path_bellman_ford_impl basic

    Code
      get_shortest_path_bellman_ford_impl(g, 1, 3)
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 3
      
      $edges
      + 2/2 edges:
      [1] 1--2 2--3
      

# get_shortest_path_bellman_ford_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_shortest_path_dijkstra_impl basic

    Code
      get_shortest_path_dijkstra_impl(g, 1, 3)
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 3
      
      $edges
      + 2/2 edges:
      [1] 1--2 2--3
      

# get_shortest_path_dijkstra_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_all_shortest_paths_impl basic

    Code
      get_all_shortest_paths_impl(g, 1, 3)
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_all_shortest_paths_dijkstra_impl basic

    Code
      get_all_shortest_paths_dijkstra_impl(g, 1, 3)
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# voronoi_impl basic

    Code
      voronoi_impl(g, 1)
    Output
      $membership
      [1] 0 0 0
      
      $distances
      [1] 0 1 2
      

---

    Code
      voronoi_impl(g, 1, mode = "in", tiebreaker = "first")
    Output
      $membership
      [1] 0 0 0
      
      $distances
      [1] 0 1 2
      

# voronoi_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_all_simple_paths_impl basic

    Code
      get_all_simple_paths_impl(g, 1, 3)
    Output
      + 3/3 vertices:
      [1] 1 2 3

# get_all_simple_paths_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_k_shortest_paths_impl basic

    Code
      get_k_shortest_paths_impl(g, 1, 3, k = 2)
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_widest_path_impl basic

    Code
      get_widest_path_impl(g, 1, 3, weights = c(1, 2))
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 3
      
      $edges
      + 2/2 edges:
      [1] 1--2 2--3
      

# get_widest_path_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_widest_paths_impl basic

    Code
      get_widest_paths_impl(g, 1, 3, weights = c(1, 2))
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# spanner_impl basic

    Code
      spanner_impl(g, 2)
    Output
      + 2/2 edges:
      [1] 1--2 2--3

# spanner_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# betweenness_cutoff_impl basic

    Code
      betweenness_cutoff_impl(g, cutoff = 2)
    Output
      [1] 0 1 0

# betweenness_cutoff_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# betweenness_subset_impl basic

    Code
      betweenness_subset_impl(g)
    Output
      [1] 0 1 0

# betweenness_subset_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# edge_betweenness_impl basic

    Code
      edge_betweenness_impl(g)
    Output
      [1] 2 2

# edge_betweenness_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# edge_betweenness_cutoff_impl basic

    Code
      edge_betweenness_cutoff_impl(g, cutoff = 2)
    Output
      [1] 2 2

# edge_betweenness_cutoff_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# edge_betweenness_subset_impl basic

    Code
      edge_betweenness_subset_impl(g)
    Output
      [1] 2 2

# edge_betweenness_subset_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# harmonic_centrality_cutoff_impl basic

    Code
      harmonic_centrality_cutoff_impl(g, cutoff = 2)
    Output
      [1] 1.5 2.0 1.5

# harmonic_centrality_cutoff_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# personalized_pagerank_impl basic

    Code
      personalized_pagerank_impl(g)
    Output
      $vector
      [1] 0.2567568 0.4864865 0.2567568
      
      $value
      [1] 1
      
      $options
      NULL
      

---

    Code
      personalized_pagerank_impl(g, algo = "arpack", damping = 0.9)
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# personalized_pagerank_vs_impl basic

    Code
      personalized_pagerank_vs_impl(g, reset.vids = 1)
    Output
      [1] 0.3452703 0.4594595 0.1952703

---

    Code
      personalized_pagerank_vs_impl(g, algo = "arpack", reset.vids = 1, details = TRUE)
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# induced_subgraph_impl basic

    Code
      induced_subgraph_impl(g, 1:2)
    Output
      IGRAPH U--- 2 1 -- 
      + edge:
      [1] 1--2

# induced_subgraph_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# subgraph_from_edges_impl basic

    Code
      subgraph_from_edges_impl(g, 1)
    Output
      IGRAPH U--- 2 1 -- 
      + edge:
      [1] 1--2

# subgraph_from_edges_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# reverse_edges_impl basic

    Code
      reverse_edges_impl(g)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

# reverse_edges_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# path_length_hist_impl basic

    Code
      path_length_hist_impl(g)
    Output
      $res
      [1] 2 1
      
      $unconnected
      [1] 0
      

---

    Code
      path_length_hist_impl(g, directed = FALSE)
    Output
      $res
      [1] 2 1
      
      $unconnected
      [1] 0
      

# path_length_hist_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# simplify_impl basic

    Code
      simplify_impl(g)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

---

    Code
      simplify_impl(g, remove.multiple = FALSE, remove.loops = FALSE)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

# simplify_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitivity_undirected_impl basic

    Code
      transitivity_undirected_impl(g)
    Output
      [1] 0

---

    Code
      transitivity_undirected_impl(g, mode = "zero")
    Output
      [1] 0

# transitivity_undirected_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitivity_local_undirected_impl basic

    Code
      transitivity_local_undirected_impl(g)
    Output
      [1] NaN   0 NaN

---

    Code
      transitivity_local_undirected_impl(g, mode = "zero")
    Output
      [1] 0 0 0

# transitivity_local_undirected_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitivity_avglocal_undirected_impl basic

    Code
      transitivity_avglocal_undirected_impl(g)
    Output
      [1] 0

---

    Code
      transitivity_avglocal_undirected_impl(g, mode = "zero")
    Output
      [1] 0

# transitivity_avglocal_undirected_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitivity_barrat_impl basic

    Code
      transitivity_barrat_impl(g)
    Condition
      Warning in `transitivity_barrat_impl()`:
      At vendor/cigraph/src/properties/triangles.c:913 : No weights given for Barrat's transitivity, unweighted version is used.
    Output
      [1] NaN   0 NaN

---

    Code
      transitivity_barrat_impl(g, mode = "zero")
    Condition
      Warning in `transitivity_barrat_impl()`:
      At vendor/cigraph/src/properties/triangles.c:913 : No weights given for Barrat's transitivity, unweighted version is used.
    Output
      [1] 0 0 0

# transitivity_barrat_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# ecc_impl basic

    Code
      ecc_impl(g)
    Output
      [1] NaN   0 NaN

---

    Code
      ecc_impl(g, k = 3, offset = TRUE, normalize = FALSE)
    Output
      [1] 1 1 1

# ecc_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# reciprocity_impl basic

    Code
      reciprocity_impl(g)
    Output
      [1] 1

---

    Code
      reciprocity_impl(g, ignore.loops = FALSE, mode = "ratio")
    Output
      [1] 1

# reciprocity_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# maxdegree_impl basic

    Code
      maxdegree_impl(g)
    Output
      [1] 2

---

    Code
      maxdegree_impl(g, mode = "in", loops = FALSE)
    Output
      [1] 2

# maxdegree_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# density_impl basic

    Code
      density_impl(g)
    Output
      [1] 0.6666667

---

    Code
      density_impl(g, loops = TRUE)
    Output
      [1] 0.3333333

# density_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# mean_degree_impl basic

    Code
      mean_degree_impl(g)
    Output
      [1] 1.333333

---

    Code
      mean_degree_impl(g, loops = FALSE)
    Output
      [1] 1.333333

# mean_degree_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# feedback_arc_set_impl basic

    Code
      feedback_arc_set_impl(g)
    Output
      + 0/2 edges:

---

    Code
      feedback_arc_set_impl(g, algo = "exact_ip")
    Output
      + 0/2 edges:

# feedback_arc_set_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# feedback_vertex_set_impl basic

    Code
      feedback_vertex_set_impl(g)
    Output
      + 0/3 vertices:

# feedback_vertex_set_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_loop_impl basic

    Code
      is_loop_impl(g)
    Output
      [1] FALSE FALSE

# is_loop_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_dag_impl basic

    Code
      is_dag_impl(g)
    Output
      [1] FALSE

# is_dag_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_acyclic_impl basic

    Code
      is_acyclic_impl(g)
    Output
      [1] TRUE

# is_acyclic_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_simple_impl basic

    Code
      is_simple_impl(g)
    Output
      [1] TRUE

# is_simple_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_multiple_impl basic

    Code
      is_multiple_impl(g)
    Output
      [1] FALSE FALSE

# is_multiple_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# has_loop_impl basic

    Code
      has_loop_impl(g)
    Output
      [1] FALSE

# has_loop_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# has_multiple_impl basic

    Code
      has_multiple_impl(g)
    Output
      [1] FALSE

# has_multiple_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_loops_impl basic

    Code
      count_loops_impl(g)
    Output
      [1] 0

# count_loops_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_multiple_impl basic

    Code
      count_multiple_impl(g)
    Output
      [1] 1 1

# count_multiple_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_perfect_impl basic

    Code
      is_perfect_impl(g)
    Output
      [1] TRUE

# is_perfect_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# eigenvector_centrality_impl basic

    Code
      eigenvector_centrality_impl(g)
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
      eigenvector_centrality_impl(g, directed = TRUE, scale = FALSE)
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# hub_and_authority_scores_impl basic

    Code
      hub_and_authority_scores_impl(g)
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
      hub_and_authority_scores_impl(g, scale = FALSE)
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# unfold_tree_impl basic

    Code
      unfold_tree_impl(g, roots = 1)
    Output
      $tree
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $vertex_index
      [1] 1 2 3
      

---

    Code
      unfold_tree_impl(g, mode = "in", roots = 1)
    Output
      $tree
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $vertex_index
      [1] 1 2 3
      

# unfold_tree_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_mutual_impl basic

    Code
      is_mutual_impl(g)
    Output
      [1] TRUE TRUE

---

    Code
      is_mutual_impl(g, loops = FALSE)
    Output
      [1] TRUE TRUE

# is_mutual_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# has_mutual_impl basic

    Code
      has_mutual_impl(g)
    Output
      [1] TRUE

---

    Code
      has_mutual_impl(g, loops = FALSE)
    Output
      [1] TRUE

# has_mutual_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# maximum_cardinality_search_impl basic

    Code
      maximum_cardinality_search_impl(g)
    Output
      $alpha
      [1] 3 2 1
      
      $alpham1
      + 3/3 vertices:
      [1] 3 2 1
      

# maximum_cardinality_search_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# avg_nearest_neighbor_degree_impl basic

    Code
      avg_nearest_neighbor_degree_impl(g)
    Output
      $knn
      [1] 2 1 2
      
      $knnk
      [1] 2 1
      

---

    Code
      avg_nearest_neighbor_degree_impl(g, mode = "in", neighbor.degree.mode = "out")
    Output
      $knn
      [1] 2 1 2
      
      $knnk
      [1] 2 1
      

# avg_nearest_neighbor_degree_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# degree_correlation_vector_impl basic

    Code
      degree_correlation_vector_impl(g)
    Output
      [1] NaN   2   1

---

    Code
      degree_correlation_vector_impl(g, from.mode = "in", to.mode = "out",
        directed.neighbors = FALSE)
    Output
      [1] NaN   2   1

# degree_correlation_vector_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# rich_club_sequence_impl basic

    Code
      rich_club_sequence_impl(g, vertex.order = 1:3)
    Output
      [1] 0.6666667 1.0000000       NaN

---

    Code
      rich_club_sequence_impl(g, vertex.order = 1:3, normalized = FALSE, loops = TRUE,
      directed = FALSE)
    Output
      [1] 2 1 0

# rich_club_sequence_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# strength_impl basic

    Code
      strength_impl(g)
    Output
      [1] 1 2 1

---

    Code
      strength_impl(g, mode = "in", loops = FALSE)
    Output
      [1] 1 2 1

# strength_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# centralization_impl basic

    Code
      centralization_impl(c(1, 2, 3))
    Output
      [1] Inf

---

    Code
      centralization_impl(c(1, 2, 3), theoretical.max = 2, normalized = FALSE)
    Output
      [1] 3

# centralization_impl errors

    Code
      x
    Condition
      Error in `centralization_impl()`:
      ! 'list' object cannot be coerced to type 'double'

# centralization_degree_impl basic

    Code
      centralization_degree_impl(g)
    Output
      $res
      [1] 1 2 1
      
      $centralization
      [1] 0.3333333
      
      $theoretical_max
      [1] 6
      

---

    Code
      centralization_degree_impl(g, mode = "in", loops = FALSE, normalized = FALSE)
    Output
      $res
      [1] 1 2 1
      
      $centralization
      [1] 2
      
      $theoretical_max
      [1] 2
      

# centralization_degree_impl errors

    Code
      x
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
      x
    Condition
      Error in `centralization_degree_tmax_impl()`:
      ! At vendor/cigraph/src/centrality/centralization.c:xx : Number of vertices must not be negative. Invalid value

# centralization_betweenness_impl basic

    Code
      centralization_betweenness_impl(g)
    Output
      $res
      [1] 0 1 0
      
      $centralization
      [1] 1
      
      $theoretical_max
      [1] 2
      

---

    Code
      centralization_betweenness_impl(g, directed = FALSE, normalized = FALSE)
    Output
      $res
      [1] 0 1 0
      
      $centralization
      [1] 2
      
      $theoretical_max
      [1] 2
      

# centralization_betweenness_impl errors

    Code
      x
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
      x
    Condition
      Error in `centralization_betweenness_tmax_impl()`:
      ! At vendor/cigraph/src/centrality/centralization.c:xx : Number of vertices must not be negative. Invalid value

# centralization_closeness_impl basic

    Code
      centralization_closeness_impl(g)
    Output
      $res
      [1] 0.6666667 1.0000000 0.6666667
      
      $centralization
      [1] 1
      
      $theoretical_max
      [1] 0.6666667
      

---

    Code
      centralization_closeness_impl(g, mode = "in", normalized = FALSE)
    Output
      $res
      [1] 0.6666667 1.0000000 0.6666667
      
      $centralization
      [1] 0.6666667
      
      $theoretical_max
      [1] 0.6666667
      

# centralization_closeness_impl errors

    Code
      x
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
      x
    Condition
      Error in `centralization_closeness_tmax_impl()`:
      ! At vendor/cigraph/src/centrality/centralization.c:xx : Number of vertices must not be negative. Invalid value

# centralization_eigenvector_centrality_impl basic

    Code
      centralization_eigenvector_centrality_impl(g)
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
      centralization_eigenvector_centrality_impl(g, directed = TRUE, normalized = FALSE)
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
      x
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
      x
    Condition
      Error in `centralization_eigenvector_centrality_tmax_impl()`:
      ! At vendor/cigraph/src/centrality/centralization.c:xx : Number of vertices must not be negative. Invalid value

# assortativity_nominal_impl basic

    Code
      assortativity_nominal_impl(g, c(1, 2, 1))
    Output
      [1] -1

---

    Code
      assortativity_nominal_impl(g, c(1, 2, 1), directed = FALSE, normalized = FALSE)
    Output
      [1] -0.5

# assortativity_nominal_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# assortativity_impl basic

    Code
      assortativity_impl(g, c(1, 2, 1))
    Output
      [1] -1

---

    Code
      assortativity_impl(g, c(1, 2, 1), directed = FALSE, normalized = FALSE)
    Output
      [1] -0.25

# assortativity_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# assortativity_degree_impl basic

    Code
      assortativity_degree_impl(g)
    Output
      [1] -1

---

    Code
      assortativity_degree_impl(g, directed = FALSE)
    Output
      [1] -1

# assortativity_degree_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# joint_degree_matrix_impl basic

    Code
      joint_degree_matrix_impl(g)
    Output
           [,1] [,2]
      [1,]    0    2
      [2,]    2    0

---

    Code
      joint_degree_matrix_impl(g, max.out.degree = 2, max.in.degree = 2)
    Output
           [,1] [,2]
      [1,]    0    2
      [2,]    2    0

# joint_degree_matrix_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# joint_degree_distribution_impl basic

    Code
      joint_degree_distribution_impl(g)
    Output
           [,1] [,2] [,3]
      [1,]    0  0.0  0.0
      [2,]    0  0.0  0.5
      [3,]    0  0.5  0.0

---

    Code
      joint_degree_distribution_impl(g, from.mode = "in", to.mode = "out",
        directed.neighbors = FALSE, normalized = FALSE, max.from.degree = 2,
        max.to.degree = 2)
    Output
           [,1] [,2] [,3]
      [1,]    0    0    0
      [2,]    0    0    2
      [3,]    0    2    0

# joint_degree_distribution_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# joint_type_distribution_impl basic

    Code
      joint_type_distribution_impl(g, from.types = c(1, 2, 1))
    Output
           [,1] [,2]
      [1,]  0.0  0.5
      [2,]  0.5  0.0

---

    Code
      joint_type_distribution_impl(g, from.types = c(1, 2, 1), to.types = c(1, 2, 1),
      directed = FALSE, normalized = FALSE)
    Output
           [,1] [,2]
      [1,]    0    2
      [2,]    2    0

# joint_type_distribution_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# contract_vertices_impl basic

    Code
      contract_vertices_impl(g, c(1, 1, 2))
    Output
      IGRAPH U--- 2 2 -- 
      + edges:
      [1] 1--1 1--2

# contract_vertices_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# eccentricity_dijkstra_impl basic

    Code
      eccentricity_dijkstra_impl(g)
    Output
      [1] 2 1 2

---

    Code
      eccentricity_dijkstra_impl(g, mode = "in")
    Output
      [1] 2 1 2

# eccentricity_dijkstra_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# graph_center_dijkstra_impl basic

    Code
      graph_center_dijkstra_impl(g)
    Output
      + 1/3 vertex:
      [1] 2

---

    Code
      graph_center_dijkstra_impl(g, mode = "in")
    Output
      + 1/3 vertex:
      [1] 2

# graph_center_dijkstra_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# radius_dijkstra_impl basic

    Code
      radius_dijkstra_impl(g)
    Output
      [1] 1

---

    Code
      radius_dijkstra_impl(g, mode = "in")
    Output
      [1] 1

# radius_dijkstra_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# pseudo_diameter_impl basic

    Code
      pseudo_diameter_impl(g, 1)
    Output
      $diameter
      [1] 2
      
      $from
      [1] 0
      
      $to
      [1] 2
      

---

    Code
      pseudo_diameter_impl(g, 1, directed = FALSE, unconnected = FALSE)
    Output
      $diameter
      [1] 2
      
      $from
      [1] 0
      
      $to
      [1] 2
      

# pseudo_diameter_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# pseudo_diameter_dijkstra_impl basic

    Code
      pseudo_diameter_dijkstra_impl(g, start.vid = 1)
    Output
      $diameter
      [1] 2
      
      $from
      [1] 0
      
      $to
      [1] 2
      

---

    Code
      pseudo_diameter_dijkstra_impl(g, start.vid = 1, directed = FALSE, unconnected = FALSE)
    Output
      $diameter
      [1] 2
      
      $from
      [1] 0
      
      $to
      [1] 2
      

# pseudo_diameter_dijkstra_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# diversity_impl basic

    Code
      diversity_impl(g)
    Output
      [1] 0.0000000 0.9182958 0.0000000

# diversity_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# random_walk_impl basic

    Code
      random_walk_impl(g, 1, 2)
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 3
      
      $edges
      + 2/2 edges:
      [1] 1--2 2--3
      

---

    Code
      random_walk_impl(g, 1, 2, mode = "in", stuck = "error")
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 1
      
      $edges
      + 2/2 edges:
      [1] 1--2 1--2
      

# random_walk_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# global_efficiency_impl basic

    Code
      global_efficiency_impl(g)
    Output
      [1] 0.8333333

---

    Code
      global_efficiency_impl(g, directed = FALSE)
    Output
      [1] 0.8333333

# global_efficiency_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_efficiency_impl basic

    Code
      local_efficiency_impl(g)
    Output
      [1] 0 0 0

---

    Code
      local_efficiency_impl(g, directed = FALSE, mode = "in")
    Output
      [1] 0 0 0

# local_efficiency_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# average_local_efficiency_impl basic

    Code
      average_local_efficiency_impl(g)
    Output
      [1] 0

---

    Code
      average_local_efficiency_impl(g, directed = FALSE, mode = "in")
    Output
      [1] 0

# average_local_efficiency_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitive_closure_dag_impl basic

    Code
      transitive_closure_dag_impl(g)
    Output
      IGRAPH D--- 3 3 -- 
      + edges:
      [1] 1->3 1->2 2->3

# transitive_closure_dag_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# transitive_closure_impl basic

    Code
      transitive_closure_impl(g)
    Output
      IGRAPH U--- 3 3 -- 
      + edges:
      [1] 1--2 1--3 2--3

# transitive_closure_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# trussness_impl basic

    Code
      trussness_impl(g)
    Output
      [1] 2 2

# trussness_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_graphical_impl basic

    Code
      is_graphical_impl(c(2, 2, 2))
    Output
      [1] TRUE

---

    Code
      is_graphical_impl(c(2, 2, 2), c(1, 1, 1), allowed.edge.types = "all")
    Output
      [1] FALSE

# is_graphical_impl errors

    Code
      x
    Condition
      Warning in `is_graphical_impl()`:
      NAs introduced by coercion
      Error in `is_graphical_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# bfs_simple_impl basic

    Code
      bfs_simple_impl(g, 1)
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
      bfs_simple_impl(g, 1, mode = "in")
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# bipartite_projection_size_impl basic

    Code
      bipartite_projection_size_impl(g)
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# biadjacency_impl basic

    Code
      biadjacency_impl(m)
    Output
      $graph
      IGRAPH U--- 5 4 -- 
      + edges:
      [1] 1--3 1--4 1--5 2--5
      
      $types
      [1] FALSE FALSE  TRUE  TRUE  TRUE
      

---

    Code
      biadjacency_impl(m, directed = TRUE, mode = "in", multiple = TRUE)
    Output
      $graph
      IGRAPH D--- 5 4 -- 
      + edges:
      [1] 3->1 4->1 5->1 5->2
      
      $types
      [1] FALSE FALSE  TRUE  TRUE  TRUE
      

# biadjacency_impl errors

    Code
      x
    Condition
      Warning in `biadjacency_impl()`:
      NAs introduced by coercion
      Error in `biadjacency_impl()`:
      ! REAL() can only be applied to a 'numeric', not a 'character'

# get_biadjacency_impl basic

    Code
      get_biadjacency_impl(g, c(TRUE, FALSE, TRUE))
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_bipartite_impl basic

    Code
      is_bipartite_impl(g)
    Output
      $res
      [1] TRUE
      
      $type
      [1] FALSE  TRUE FALSE
      

# is_bipartite_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# bipartite_game_gnp_impl basic

    Code
      bipartite_game_gnp_impl(2, 2, 0.5)
    Output
      $graph
      IGRAPH U--- 4 4 -- 
      + edges:
      [1] 1--3 2--3 1--4 2--4
      
      $types
      [1] FALSE FALSE  TRUE  TRUE
      

---

    Code
      bipartite_game_gnp_impl(2, 2, 0.5, directed = TRUE, mode = "in")
    Output
      $graph
      IGRAPH D--- 4 1 -- 
      + edge:
      [1] 3->2
      
      $types
      [1] FALSE FALSE  TRUE  TRUE
      

# bipartite_game_gnp_impl errors

    Code
      x
    Condition
      Error in `bipartite_game_gnp_impl()`:
      ! At vendor/cigraph/src/misc/bipartite.c:xx : Invalid number of vertices for bipartite graph. Invalid value

# bipartite_game_gnm_impl basic

    Code
      bipartite_game_gnm_impl(2, 2, 1)
    Output
      $graph
      IGRAPH U--- 4 1 -- 
      + edge:
      [1] 2--4
      
      $types
      [1] FALSE FALSE  TRUE  TRUE
      

---

    Code
      bipartite_game_gnm_impl(2, 2, 1, directed = TRUE, mode = "in")
    Output
      $graph
      IGRAPH D--- 4 1 -- 
      + edge:
      [1] 3->1
      
      $types
      [1] FALSE FALSE  TRUE  TRUE
      

# bipartite_game_gnm_impl errors

    Code
      x
    Condition
      Error in `bipartite_game_gnm_impl()`:
      ! At vendor/cigraph/src/misc/bipartite.c:xx : Invalid number of vertices for bipartite graph. Invalid value

# get_laplacian_impl basic

    Code
      get_laplacian_impl(g)
    Output
           [,1] [,2] [,3]
      [1,]    1   -1    0
      [2,]   -1    2   -1
      [3,]    0   -1    1

---

    Code
      get_laplacian_impl(g, mode = "in", normalization = "symmetric", weights = c(1,
        2))
    Output
                 [,1]       [,2]       [,3]
      [1,]  1.0000000 -0.5773503  0.0000000
      [2,] -0.5773503  1.0000000 -0.8164966
      [3,]  0.0000000 -0.8164966  1.0000000

# get_laplacian_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_laplacian_sparse_impl basic

    Code
      get_laplacian_sparse_impl(g)
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
      get_laplacian_sparse_impl(g, mode = "in", normalization = "symmetric", weights = c(
        1, 2))
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# connected_components_impl basic

    Code
      connected_components_impl(g)
    Output
      [1] 0 0 0

---

    Code
      connected_components_impl(g, mode = "strong", details = TRUE)
    Output
      $membership
      [1] 0 0 0
      
      $csize
      [1] 3
      
      $no
      [1] 1
      

# connected_components_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_connected_impl basic

    Code
      is_connected_impl(g)
    Output
      [1] TRUE

---

    Code
      is_connected_impl(g, mode = "strong")
    Output
      [1] TRUE

# is_connected_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# articulation_points_impl basic

    Code
      articulation_points_impl(g)
    Output
      + 1/3 vertex:
      [1] 2

# articulation_points_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# biconnected_components_impl basic

    Code
      biconnected_components_impl(g)
    Output
      $no
      [1] 2
      
      $tree_edges
      $tree_edges[[1]]
      [1] 2
      
      $tree_edges[[2]]
      [1] 1
      
      
      $component_edges
      $component_edges[[1]]
      [1] 2
      
      $component_edges[[2]]
      [1] 1
      
      
      $components
      $components[[1]]
      + 2/3 vertices:
      [1] 3 2
      
      $components[[2]]
      + 2/3 vertices:
      [1] 2 1
      
      
      $articulation_points
      [1] 2
      
      $tree.edges
      list()
      
      $component.edges
      list()
      
      $articulation.points
      + 0/3 vertices:
      

# biconnected_components_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# bridges_impl basic

    Code
      bridges_impl(g)
    Output
      + 2/2 edges:
      [1] 2--3 1--2

# bridges_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_biconnected_impl basic

    Code
      is_biconnected_impl(g)
    Output
      [1] FALSE

# is_biconnected_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_reachable_impl basic

    Code
      count_reachable_impl(g, mode = "out")
    Output
      [1] 5 5 5 5 5

---

    Code
      count_reachable_impl(g, mode = "in")
    Output
      [1] 5 5 5 5 5

# count_reachable_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# bond_percolation_impl basic

    Code
      bond_percolation_impl(g)
    Output
      $giant_size
      numeric(0)
      
      $vetex_count
      numeric(0)
      

# bond_percolation_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# site_percolation_impl basic

    Code
      site_percolation_impl(g)
    Output
      $giant_size
      numeric(0)
      
      $edge_count
      numeric(0)
      

# site_percolation_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# edgelist_percolation_impl basic

    Code
      edgelist_percolation_impl(matrix(c(1, 2, 2, 3), ncol = 2))
    Output
      $giant_size
      [1] 2 3
      
      $vertex_count
      [1] 2 3
      

# edgelist_percolation_impl errors

    Code
      x
    Condition
      Error in `edgelist_percolation_impl()`:
      ! REAL() can only be applied to a 'numeric', not a 'character'

# is_clique_impl basic

    Code
      is_clique_impl(g, 1:2)
    Output
      [1] TRUE

---

    Code
      is_clique_impl(g, 1:2, directed = TRUE)
    Output
      [1] TRUE

# is_clique_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# cliques_impl basic

    Code
      cliques_impl(g)
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
      cliques_impl(g, min = 2, max = 2)
    Output
      [[1]]
      + 2/3 vertices:
      [1] 2 3
      
      [[2]]
      + 2/3 vertices:
      [1] 1 2
      

# cliques_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# clique_size_hist_impl basic

    Code
      clique_size_hist_impl(g)
    Output
      [1] 3 2

---

    Code
      clique_size_hist_impl(g, min.size = 2, max.size = 2)
    Output
      [1] 0 2

# clique_size_hist_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# largest_cliques_impl basic

    Code
      largest_cliques_impl(g)
    Output
      [[1]]
      + 2/3 vertices:
      [1] 1 2
      
      [[2]]
      + 2/3 vertices:
      [1] 2 3
      

# largest_cliques_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# maximal_cliques_hist_impl basic

    Code
      maximal_cliques_hist_impl(g)
    Output
      [1] 0 2

---

    Code
      maximal_cliques_hist_impl(g, min.size = 2, max.size = 2)
    Output
      [1] 0 2

# maximal_cliques_hist_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# clique_number_impl basic

    Code
      clique_number_impl(g)
    Output
      [1] 2

# clique_number_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# weighted_cliques_impl basic

    Code
      weighted_cliques_impl(g)
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
      weighted_cliques_impl(g, vertex.weights = c(1, 2, 3), min.weight = 1,
      max.weight = 3, maximal = TRUE)
    Output
      [[1]]
      + 2/3 vertices:
      [1] 1 2
      

# weighted_cliques_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# largest_weighted_cliques_impl basic

    Code
      largest_weighted_cliques_impl(g)
    Output
      [[1]]
      + 2/3 vertices:
      [1] 1 2
      
      [[2]]
      + 2/3 vertices:
      [1] 2 3
      

---

    Code
      largest_weighted_cliques_impl(g, vertex.weights = c(1, 2, 3))
    Output
      [[1]]
      + 2/3 vertices:
      [1] 2 3
      

# largest_weighted_cliques_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# weighted_clique_number_impl basic

    Code
      weighted_clique_number_impl(g)
    Output
      [1] 2

---

    Code
      weighted_clique_number_impl(g, vertex.weights = c(1, 2, 3))
    Output
      [1] 5

# weighted_clique_number_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_independent_vertex_set_impl basic

    Code
      is_independent_vertex_set_impl(g, 1:2)
    Output
      [1] FALSE

# is_independent_vertex_set_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_random_impl basic

    Code
      layout_random_impl(g)
    Output
                  [,1]       [,2]
      [1,]  0.91714717  0.7003783
      [2,] -0.84358557  0.6509057
      [3,] -0.08120892 -0.8259847

# layout_random_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_circle_impl basic

    Code
      layout_circle_impl(g)
    Output
           [,1]       [,2]
      [1,]  1.0  0.0000000
      [2,] -0.5  0.8660254
      [3,] -0.5 -0.8660254

---

    Code
      layout_circle_impl(g, order = 1:3)
    Output
           [,1]       [,2]
      [1,]  1.0  0.0000000
      [2,] -0.5  0.8660254
      [3,] -0.5 -0.8660254

# layout_circle_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_star_impl basic

    Code
      round(layout_star_impl(g), 4)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    1    0
      [3,]   -1    0

---

    Code
      round(layout_star_impl(g, center = 1, order = 3:1), 4)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]   -1    0
      [3,]    1    0

# layout_star_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_grid_impl basic

    Code
      layout_grid_impl(g)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    1    0
      [3,]    0    1

---

    Code
      layout_grid_impl(g, width = 2)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    1    0
      [3,]    0    1

# layout_grid_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_grid_3d_impl basic

    Code
      layout_grid_3d_impl(g)
    Output
           [,1] [,2] [,3]
      [1,]    0    0    0
      [2,]    1    0    0
      [3,]    0    1    0

---

    Code
      layout_grid_3d_impl(g, width = 2, height = 2)
    Output
           [,1] [,2] [,3]
      [1,]    0    0    0
      [2,]    1    0    0
      [3,]    0    1    0

# layout_grid_3d_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# roots_for_tree_layout_impl basic

    Code
      roots_for_tree_layout_impl(g, mode = "out", heuristic = 1)
    Output
      + 1/3 vertex:
      [1] 2

# roots_for_tree_layout_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_random_3d_impl basic

    Code
      layout_random_3d_impl(g)
    Output
                  [,1]       [,2]      [,3]
      [1,]  0.91714717  0.7003783 0.7338074
      [2,] -0.84358557  0.6509057 0.4644714
      [3,] -0.08120892 -0.8259847 0.5240391

# layout_random_3d_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_sphere_impl basic

    Code
      layout_sphere_impl(g)
    Output
                 [,1]      [,2] [,3]
      [1,]  0.0000000 0.0000000   -1
      [2,] -0.4861377 0.8738822    0
      [3,]  0.0000000 0.0000000    1

# layout_sphere_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_sugiyama_impl basic

    Code
      layout_sugiyama_impl(g)
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
      layout_sugiyama_impl(g, layers = 1:3, hgap = 2, vgap = 2, maxiter = 10,
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_mds_impl basic

    Code
      layout_mds_impl(g)
    Output
           [,1]         [,2]
      [1,]    1 2.807594e-08
      [2,]    0 0.000000e+00
      [3,]   -1 2.807594e-08

---

    Code
      layout_mds_impl(g, dist = matrix(1:9, nrow = 3), dim = 3)
    Output
                [,1]        [,2]     [,3]
      [1,] -2.907521  2.32638426 1.444979
      [2,] -3.900013 -1.63291106 2.258035
      [3,]  3.975674  0.09951448 3.271816

# layout_mds_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_bipartite_impl basic

    Code
      layout_bipartite_impl(g, types = c(TRUE, FALSE, TRUE))
    Output
           [,1] [,2]
      [1,]  0.0    0
      [2,]  0.5    1
      [3,]  1.0    0

---

    Code
      layout_bipartite_impl(g, types = c(TRUE, FALSE, TRUE), hgap = 2, vgap = 2,
      maxiter = 10)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    1    2
      [3,]    2    0

# layout_bipartite_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_gem_impl basic

    Code
      layout_gem_impl(g, res = matrix(0, nrow = 3, ncol = 2))
    Output
                [,1]      [,2]
      [1,] 200.18284 -69.23950
      [2,]  86.00346  64.12806
      [3,]  66.22930 -92.94294

---

    Code
      layout_gem_impl(g, res = matrix(0, nrow = 3, ncol = 2), use.seed = TRUE,
      maxiter = 10, temp.max = 2, temp.min = 0.1, temp.init = 1)
    Output
                 [,1]       [,2]
      [1,]  1.0114521 -0.1206363
      [2,] -0.2178589  2.9621162
      [3,] -0.7089555 -3.8896500

# layout_gem_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_davidson_harel_impl basic

    Code
      layout_davidson_harel_impl(g, res = matrix(0, nrow = 3, ncol = 2))
    Output
               [,1]      [,2]
      [1,] 1.152116 0.9424808
      [2,] 2.474361 2.5195497
      [3,] 3.849187 4.0402661

---

    Code
      layout_davidson_harel_impl(g, res = matrix(0, nrow = 3, ncol = 2), use.seed = TRUE,
      maxiter = 10, fineiter = 5, cool.fact = 0.5, weight.node.dist = 2,
      weight.border = 1, weight.edge.lengths = 0.1, weight.edge.crossings = 0.2,
      weight.node.edge.dist = 0.3)
    Output
                [,1]      [,2]
      [1,] -6.609493 -2.155221
      [2,] -8.660255 -3.797365
      [3,] -6.485087 -5.224752

# layout_davidson_harel_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_umap_impl basic

    Code
      layout_umap_impl(g, res = matrix(0, nrow = 3, ncol = 2), use.seed = TRUE)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    0    0
      [3,]    0    0

---

    Code
      layout_umap_impl(g, res = matrix(0, nrow = 3, ncol = 2), use.seed = TRUE,
      distances = 1:3, min.dist = 0.1, epochs = 10, distances.are.weights = TRUE)
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    0    0
      [3,]    0    0

# layout_umap_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_umap_3d_impl basic

    Code
      layout_umap_3d_impl(g, res = matrix(0, nrow = 3, ncol = 3), use.see = TRUE)
    Output
           [,1] [,2] [,3]
      [1,]    0    0    0
      [2,]    0    0    0
      [3,]    0    0    0

---

    Code
      layout_umap_3d_impl(g, res = matrix(0, nrow = 3, ncol = 3), use.seed = TRUE,
      distances = 1:3, min.dist = 0.1, epochs = 10, distances.are.weights = TRUE)
    Output
           [,1] [,2] [,3]
      [1,]    0    0    0
      [2,]    0    0    0
      [3,]    0    0    0

# layout_umap_3d_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_umap_compute_weights_impl basic

    Code
      layout_umap_compute_weights_impl(g, distances = 1:2, weights = 1:3)
    Output
      [1] 1 1

# layout_umap_compute_weights_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# layout_align_impl basic

    Code
      layout_align_impl(g, layout = matrix(0, nrow = 3, ncol = 2))
    Output
           [,1] [,2]
      [1,]    0    0
      [2,]    0    0
      [3,]    0    0

# layout_align_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_dice_impl basic

    Code
      similarity_dice_impl(g)
    Output
           [,1] [,2] [,3]
      [1,]    1    0    1
      [2,]    0    1    0
      [3,]    1    0    1

---

    Code
      similarity_dice_impl(g, vids = 1:2, mode = "in", loops = TRUE)
    Output
           [,1] [,2]
      [1,]  1.0  0.8
      [2,]  0.8  1.0

# similarity_dice_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_dice_es_impl basic

    Code
      similarity_dice_es_impl(g)
    Output
      [1] 0 0

---

    Code
      similarity_dice_es_impl(g, es = 1:2, mode = "in", loops = TRUE)
    Output
      [1] 0.8 0.8

# similarity_dice_es_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_dice_pairs_impl basic

    Code
      similarity_dice_pairs_impl(g, pairs = matrix(c(1, 2, 2, 3), ncol = 2))
    Output
      [1] 0 0

---

    Code
      similarity_dice_pairs_impl(g, pairs = matrix(c(1, 2, 2, 3), ncol = 2), mode = "in",
      loops = TRUE)
    Output
      [1] 0.6666667 0.8000000

# similarity_dice_pairs_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_inverse_log_weighted_impl basic

    Code
      similarity_inverse_log_weighted_impl(g)
    Output
               [,1] [,2]     [,3]
      [1,] 0.000000    0 1.442695
      [2,] 0.000000    0 0.000000
      [3,] 1.442695    0 0.000000

---

    Code
      similarity_inverse_log_weighted_impl(g, vids = 1:2, mode = "in")
    Output
           [,1] [,2]     [,3]
      [1,]    0    0 1.442695
      [2,]    0    0 0.000000

# similarity_inverse_log_weighted_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_jaccard_impl basic

    Code
      similarity_jaccard_impl(g)
    Output
           [,1] [,2] [,3]
      [1,]    1    0    1
      [2,]    0    1    0
      [3,]    1    0    1

---

    Code
      similarity_jaccard_impl(g, vids = 1:2, mode = "in", loops = TRUE)
    Output
                [,1]      [,2]
      [1,] 1.0000000 0.6666667
      [2,] 0.6666667 1.0000000

# similarity_jaccard_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_jaccard_es_impl basic

    Code
      similarity_jaccard_es_impl(g)
    Output
      [1] 0 0

---

    Code
      similarity_jaccard_es_impl(g, es = 1:2, mode = "in", loops = TRUE)
    Output
      [1] 0.6666667 0.6666667

# similarity_jaccard_es_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# similarity_jaccard_pairs_impl basic

    Code
      similarity_jaccard_pairs_impl(g, pairs = matrix(c(1, 2, 2, 3), ncol = 2))
    Output
      [1] 0 0

---

    Code
      similarity_jaccard_pairs_impl(g, pairs = matrix(c(1, 2, 2, 3), ncol = 2), mode = "in",
      loops = TRUE)
    Output
      [1] 0.5000000 0.6666667

# similarity_jaccard_pairs_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# compare_communities_impl basic

    Code
      compare_communities_impl(c(1, 2, 1), c(2, 1, 2))
    Output
      [1] 0

---

    Code
      compare_communities_impl(c(1, 2, 1), c(2, 1, 2), method = "nmi")
    Output
      [1] 1

# compare_communities_impl errors

    Code
      x
    Condition
      Warning in `compare_communities_impl()`:
      NAs introduced by coercion
      Error in `compare_communities_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# modularity_impl basic

    Code
      modularity_impl(g, membership = c(1, 2, 1))
    Output
      [1] -0.5

---

    Code
      modularity_impl(g, membership = c(1, 2, 1), weights = c(1, 2), resolution = 0.5,
      directed = FALSE)
    Output
      [1] -0.25

# modularity_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# modularity_matrix_impl basic

    Code
      modularity_matrix_impl(g)
    Output
            [,1] [,2]  [,3]
      [1,] -0.25  0.5 -0.25
      [2,]  0.50 -1.0  0.50
      [3,] -0.25  0.5 -0.25

---

    Code
      modularity_matrix_impl(g, weights = c(1, 2), resolution = 0.5, directed = FALSE)
    Output
                  [,1]  [,2]       [,3]
      [1,] -0.08333333  0.75 -0.1666667
      [2,]  0.75000000 -0.75  1.5000000
      [3,] -0.16666667  1.50 -0.3333333

# modularity_matrix_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# community_fluid_communities_impl basic

    Code
      community_fluid_communities_impl(g, no.of.communities = 2)
    Output
      [1] 1 0 0

# community_fluid_communities_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# community_label_propagation_impl basic

    Code
      community_label_propagation_impl(g)
    Output
      [1] 0 0 0

---

    Code
      community_label_propagation_impl(g, mode = "in", weights = c(1, 2), initial = 1:
        3, fixed = c(TRUE, FALSE, TRUE))
    Output
      [1] 0 1 1

# community_label_propagation_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# community_multilevel_impl basic

    Code
      community_multilevel_impl(g)
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
      community_multilevel_impl(g, weights = c(1, 2), resolution = 0.5)
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# community_optimal_modularity_impl basic

    Code
      community_optimal_modularity_impl(g)
    Output
      $modularity
      [1] 0
      
      $membership
      [1] 0 0 0
      

---

    Code
      community_optimal_modularity_impl(g, weights = c(1, 2))
    Output
      $modularity
      [1] 1.850372e-17
      
      $membership
      [1] 0 0 0
      

# community_optimal_modularity_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# community_leiden_impl basic

    Code
      community_leiden_impl(g, weights = c(1, 2), vertex.weights = c(1, 2, 3),
      resolution = 0.5, beta = 0.1, start = TRUE, n.iterations = 1, membership = 1:3)
    Output
      $membership
      [1] 0 1 2
      
      $nb_clusters
      [1] 3
      
      $quality
      [1] -1.166667
      

# community_leiden_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# split_join_distance_impl basic

    Code
      split_join_distance_impl(c(1, 2, 1), c(2, 1, 2))
    Output
      $distance12
      [1] 0
      
      $distance21
      [1] 0
      

# split_join_distance_impl errors

    Code
      x
    Condition
      Warning in `split_join_distance_impl()`:
      NAs introduced by coercion
      Error in `split_join_distance_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# community_infomap_impl basic

    Code
      community_infomap_impl(g)
    Output
      $membership
      [1] 0 0 0
      
      $codelength
      [1] 1.512987
      

---

    Code
      community_infomap_impl(g, e.weights = c(1, 2), v.weights = c(1, 2, 3),
      nb.trials = 2)
    Output
      $membership
      [1] 0 0 0
      
      $codelength
      [1] 1.462254
      

# community_infomap_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# graphlets_impl basic

    Code
      graphlets_impl(g)
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
      graphlets_impl(g, weights = c(3, 4), niter = 10)
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# hrg_fit_impl basic

    Code
      hrg_fit_impl(g1)
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# hrg_sample_impl basic

    Code
      hrg_sample_impl(hrg_model)
    Output
      IGRAPH U--- 10 45 -- 
      + edges:
       [1] 1-- 2 1-- 3 1-- 4 1-- 5 1-- 6 1-- 7 1-- 8 1-- 9 1--10 2-- 3 2-- 4 2-- 5
      [13] 2-- 6 2-- 7 2-- 8 2-- 9 2--10 3-- 4 3-- 5 3-- 6 3-- 7 3-- 8 3-- 9 3--10
      [25] 4-- 5 4-- 6 4-- 7 4-- 8 4-- 9 4--10 5-- 6 5-- 7 5-- 8 5-- 9 5--10 6-- 7
      [37] 6-- 8 6-- 9 6--10 7-- 8 7-- 9 7--10 8-- 9 8--10 9--10

# hrg_sample_impl errors

    Code
      x
    Condition
      Error in `hrg_sample_impl()`:
      ! At vendor/cigraph/src/hrg/hrg_types.cc:xx : Assertion failed: n >= 0. This is an unexpected igraph error; please report this as a bug, along with the steps to reproduce it.
      Please restart your R session to avoid crashes or other surprising behavior.

# hrg_sample_many_impl basic

    Code
      hrg_sample_many_impl(hrg_model, num.samples = 2)
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
      x
    Condition
      Error in `hrg_sample_many_impl()`:
      ! At vendor/cigraph/src/hrg/hrg_types.cc:xx : Assertion failed: n >= 0. This is an unexpected igraph error; please report this as a bug, along with the steps to reproduce it.
      Please restart your R session to avoid crashes or other surprising behavior.

# hrg_game_impl basic

    Code
      hrg_game_impl(hrg_model)
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
      x
    Condition
      Error in `hrg_game_impl()`:
      ! At vendor/cigraph/src/hrg/hrg_types.cc:xx : Assertion failed: n >= 0. This is an unexpected igraph error; please report this as a bug, along with the steps to reproduce it.
      Please restart your R session to avoid crashes or other surprising behavior.

# hrg_consensus_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# hrg_predict_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# hrg_create_impl basic

    Code
      hrg_create_impl(g, prob = rep(0.5, 2))
    Output
      Hierarchical random graph, at level 3:
      g1     p=0.5  1
      '- g2  p=0.5  2 3

# hrg_create_impl errors

    Code
      x
    Condition
      Error in `hrg_create_impl()`:
      ! At vendor/cigraph/src/hrg/hrg.cc:xx : HRG probability vector size (1) should be equal to the number of internal nodes (2). Invalid value

# hrg_resize_impl basic

    Code
      hrg_resize_impl(hrg_model, newsize = 5)
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
      x
    Condition
      Error in `hrg_resize_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# hrg_size_impl basic

    Code
      hrg_size_impl(hrg_model)
    Output
      [1] 10

# hrg_size_impl errors

    Code
      x
    Condition
      Error in `hrg_size_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# from_hrg_dendrogram_impl basic

    Code
      from_hrg_dendrogram_impl(hrg_model)
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
      x
    Condition
      Error in `from_hrg_dendrogram_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# get_adjacency_sparse_impl basic

    Code
      get_adjacency_sparse_impl(g)
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
      get_adjacency_sparse_impl(g, type = "upper", weights = c(1, 2), loops = "none")
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_stochastic_impl basic

    Code
      get_stochastic_impl(g)
    Output
           [,1] [,2] [,3]
      [1,]  0.0    1  0.0
      [2,]  0.5    0  0.5
      [3,]  0.0    1  0.0

---

    Code
      get_stochastic_impl(g, column.wise = TRUE, weights = c(1, 2))
    Output
           [,1]      [,2] [,3]
      [1,]    0 0.3333333    0
      [2,]    1 0.0000000    1
      [3,]    0 0.6666667    0

# get_stochastic_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_stochastic_sparse_impl basic

    Code
      get_stochastic_sparse_impl(g)
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
      get_stochastic_sparse_impl(g, column.wise = TRUE, weights = c(1, 2))
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# to_directed_impl basic

    Code
      to_directed_impl(g)
    Output
      IGRAPH D--- 3 4 -- 
      + edges:
      [1] 1->2 2->3 2->1 3->2

---

    Code
      to_directed_impl(g, mode = "acyclic")
    Output
      IGRAPH D--- 3 2 -- 
      + edges:
      [1] 1->2 2->3

# to_directed_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# to_undirected_impl basic

    Code
      to_undirected_impl(g)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

---

    Code
      to_undirected_impl(g, mode = "mutual", edge.attr.comb = "sum")
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

# to_undirected_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# motifs_randesu_impl basic

    Code
      motifs_randesu_impl(g)
    Output
      [1] NaN NaN   1   0

---

    Code
      motifs_randesu_impl(g, size = 4, cut.prob = rep(0.1, 4))
    Output
       [1] NaN NaN NaN NaN   0 NaN   0   0   0   0   0

# motifs_randesu_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# motifs_randesu_estimate_impl basic

    Code
      motifs_randesu_estimate_impl(g, size = 3, sample.size = 2)
    Output
      [1] 3

---

    Code
      motifs_randesu_estimate_impl(g, size = 4, cut.prob = rep(0.1, 4), sample.size = 2,
      sample = 1:2)
    Output
      [1] 3

# motifs_randesu_estimate_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# motifs_randesu_no_impl basic

    Code
      motifs_randesu_no_impl(g)
    Output
      [1] 1

---

    Code
      motifs_randesu_no_impl(g, size = 4, cut.prob = c(0.1, 0.1, 0.1, 0.1))
    Output
      [1] 0

# motifs_randesu_no_impl errors

    Code
      x
    Condition
      Error in `motifs_randesu_no_impl()`:
      ! At vendor/cigraph/src/misc/motifs.c:xx : Cut probability vector size (1) must agree with motif size (3). Invalid value

# dyad_census_impl basic

    Code
      dyad_census_impl(g)
    Output
      $mut
      [1] 2
      
      $asym
      [1] 0
      
      $null
      [1] 1
      

# dyad_census_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# triad_census_impl basic

    Code
      triad_census_impl(g)
    Condition
      Warning in `triad_census_impl()`:
      At vendor/cigraph/src/misc/motifs.c:1157 : Triad census called on an undirected graph. All connections will be treated as mutual.
    Output
       [1] 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0

# triad_census_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_adjacent_triangles_impl basic

    Code
      count_adjacent_triangles_impl(g)
    Output
      [1] 0 0 0

---

    Code
      count_adjacent_triangles_impl(g, vids = 1:2)
    Output
      [1] 0 0

# count_adjacent_triangles_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_triangles_impl basic

    Code
      count_triangles_impl(g)
    Output
      [1] 0

# count_triangles_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_0_impl basic

    Code
      local_scan_0_impl(g)
    Output
      [1] 1 2 1

---

    Code
      local_scan_0_impl(g, weights = c(1, 2), mode = "in")
    Output
      [1] 1 3 2

# local_scan_0_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_0_them_impl basic

    Code
      local_scan_0_them_impl(g1, g2)
    Output
      [1] 1 2 1

---

    Code
      local_scan_0_them_impl(g1, g2, weights.them = c(1, 2), mode = "in")
    Output
      [1] 1 3 2

# local_scan_0_them_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_1_ecount_impl basic

    Code
      local_scan_1_ecount_impl(g)
    Output
      [1] 1 2 1

---

    Code
      local_scan_1_ecount_impl(g, weights = c(1, 2), mode = "in")
    Output
      [1] 1 3 2

# local_scan_1_ecount_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_1_ecount_them_impl basic

    Code
      local_scan_1_ecount_them_impl(g1, g2)
    Output
      [1] 1 2 1

---

    Code
      local_scan_1_ecount_them_impl(g1, g2, weights.them = c(1, 2), mode = "in")
    Output
      [1] 1 3 2

# local_scan_1_ecount_them_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_k_ecount_impl basic

    Code
      local_scan_k_ecount_impl(g, k = 1)
    Output
      [1] 1 2 1

---

    Code
      local_scan_k_ecount_impl(g, k = 1, weights = c(1, 2), mode = "in")
    Output
      [1] 1 3 2

# local_scan_k_ecount_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_k_ecount_them_impl basic

    Code
      local_scan_k_ecount_them_impl(g1, g2, k = 1)
    Output
      [1] 1 2 1

---

    Code
      local_scan_k_ecount_them_impl(g1, g2, k = 1, weights.them = c(1, 2), mode = "in")
    Output
      [1] 1 3 2

# local_scan_k_ecount_them_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_neighborhood_ecount_impl basic

    Code
      local_scan_neighborhood_ecount_impl(g, neighborhoods = list(1:2, 2:3, 2:4, 2))
    Output
      [1] 1 1 2 0

---

    Code
      local_scan_neighborhood_ecount_impl(g, weights = c(1, 2, 3), neighborhoods = list(
        1:2, 1:3, 2:4, 1))
    Output
      [1] 1 3 5 0

# local_scan_neighborhood_ecount_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# local_scan_subset_ecount_impl basic

    Code
      local_scan_subset_ecount_impl(g, subsets = list(c(1, 2), c(2, 3)))
    Output
      [1] 1 1

---

    Code
      local_scan_subset_ecount_impl(g, weights = c(1, 2, 3), subsets = list(c(1, 2),
      c(2, 3)))
    Output
      [1] 1 2

# local_scan_subset_ecount_impl errors

    Code
      x
    Condition
      Error in `.x - 1`:
      ! non-numeric argument to binary operator

# list_triangles_impl basic

    Code
      list_triangles_impl(g)
    Output
      + 0/3 vertices:

# list_triangles_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# join_impl basic

    Code
      join_impl(g1, g2)
    Output
      IGRAPH U--- 6 13 -- 
      + edges:
       [1] 1--2 2--3 4--5 5--6 1--4 1--5 1--6 2--4 2--5 2--6 3--4 3--5 3--6

# join_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# induced_subgraph_map_impl basic

    Code
      induced_subgraph_map_impl(g, 1:2, impl = "auto")
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
      induced_subgraph_map_impl(g, 1:2, impl = "copy_and_delete")
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# mycielskian_impl basic

    Code
      mycielskian_impl(g)
    Output
      IGRAPH U--- 7 9 -- 
      + edges:
      [1] 1--2 2--3 1--5 2--4 2--6 3--5 4--7 5--7 6--7

---

    Code
      mycielskian_impl(g, k = 2)
    Output
      IGRAPH U--- 15 34 -- 
      + edges:
       [1]  1-- 2  2-- 3  1-- 5  2-- 4  2-- 6  3-- 5  4-- 7  5-- 7  6-- 7  1-- 9
      [11]  2-- 8  2--10  3-- 9  1--12  5-- 8  2--11  4-- 9  2--13  6-- 9  3--12
      [21]  5--10  4--14  7--11  5--14  7--12  6--14  7--13  8--15  9--15 10--15
      [31] 11--15 12--15 13--15 14--15

# mycielskian_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# product_impl basic

    Code
      product_impl(g1, g2)
    Output
      IGRAPH U--- 9 12 -- 
      + edges:
       [1] 1--4 2--5 3--6 4--7 5--8 6--9 1--2 4--5 7--8 2--3 5--6 8--9

---

    Code
      product_impl(g1, g2, type = "tensor")
    Output
      IGRAPH U--- 9 8 -- 
      + edges:
      [1] 1--5 2--4 2--6 3--5 4--8 5--7 5--9 6--8

# product_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# rooted_product_impl basic

    Code
      rooted_product_impl(g1, g2, root = 1)
    Output
      IGRAPH U--- 9 8 -- 
      + edges:
      [1] 1--4 4--7 1--2 4--5 7--8 2--3 5--6 8--9

# rooted_product_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# gomory_hu_tree_impl basic

    Code
      gomory_hu_tree_impl(g)
    Output
      $tree
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $flows
      [1] 1 1
      

---

    Code
      gomory_hu_tree_impl(g, capacity = c(1, 2))
    Output
      $tree
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3
      
      $flows
      [1] 1 2
      

# gomory_hu_tree_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# maxflow_impl basic

    Code
      maxflow_impl(g, source = 1, target = 3)
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
      maxflow_impl(g, source = 1, target = 3, capacity = c(1, 2))
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# residual_graph_impl basic

    Code
      residual_graph_impl(g, capacity = c(1, 2), flow = c(1, 2))
    Output
      $residual
      IGRAPH D--- 3 0 -- 
      + edges:
      
      $residual_capacity
      numeric(0)
      

# residual_graph_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# reverse_residual_graph_impl basic

    Code
      reverse_residual_graph_impl(g, capacity = c(1, 2), flow = c(1, 2))
    Output
      IGRAPH D--- 3 2 -- 
      + edges:
      [1] 2->1 3->2

# reverse_residual_graph_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# st_mincut_impl basic

    Code
      st_mincut_impl(g, source = 1, target = 3)
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
      st_mincut_impl(g, source = 1, target = 3, capacity = c(1, 2))
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# dominator_tree_impl basic

    Code
      dominator_tree_impl(g, root = 1)
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
      dominator_tree_impl(g, root = 1, mode = "in")
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# all_st_cuts_impl basic

    Code
      all_st_cuts_impl(g, source = 1, target = 3)
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# all_st_mincuts_impl basic

    Code
      all_st_mincuts_impl(g, source = 1, target = 3)
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
      all_st_mincuts_impl(g, source = 1, target = 3, capacity = c(1, 2))
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# even_tarjan_reduction_impl basic

    Code
      even_tarjan_reduction_impl(g)
    Output
      $graphbar
      IGRAPH D--- 6 7 -- 
      + edges:
      [1] 1->4 2->5 3->6 5->1 4->2 6->2 5->3
      
      $capacity
      [1] 1 1 1 3 3 3 3
      

# even_tarjan_reduction_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_separator_impl basic

    Code
      is_separator_impl(g, 1:2)
    Output
      [1] FALSE

# is_separator_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_minimal_separator_impl basic

    Code
      is_minimal_separator_impl(g, 1:2)
    Output
      [1] FALSE

# is_minimal_separator_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# all_minimal_st_separators_impl basic

    Code
      all_minimal_st_separators_impl(g)
    Output
      [[1]]
      + 1/3 vertex:
      [1] 2
      

# all_minimal_st_separators_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# minimum_size_separators_impl basic

    Code
      minimum_size_separators_impl(g)
    Output
      [[1]]
      + 1/3 vertex:
      [1] 2
      

# minimum_size_separators_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# isoclass_impl basic

    Code
      isoclass_impl(g)
    Output
      [1] 2

# isoclass_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# isomorphic_impl basic

    Code
      isomorphic_impl(g1, g2)
    Output
      [1] TRUE

# isomorphic_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# isoclass_subgraph_impl basic

    Code
      isoclass_subgraph_impl(g, c(1, 2, 3))
    Output
      [1] 2

# isoclass_subgraph_impl errors

    Code
      x
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
      x
    Condition
      Warning in `isoclass_create_impl()`:
      NAs introduced by coercion
      Error in `isoclass_create_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# isomorphic_vf2_impl basic

    Code
      isomorphic_vf2_impl(g1, g2)
    Output
      $iso
      [1] TRUE
      
      $map12
      [1] 1 2 3
      
      $map21
      [1] 1 2 3
      

---

    Code
      isomorphic_vf2_impl(g1, g2, vertex.color1 = c(1, 2, 3), vertex.color2 = c(1, 2,
        3), edge.color1 = c(1, 2), edge.color2 = c(1, 2))
    Output
      $iso
      [1] TRUE
      
      $map12
      [1] 1 2 3
      
      $map21
      [1] 1 2 3
      

# isomorphic_vf2_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_isomorphisms_vf2_impl basic

    Code
      count_isomorphisms_vf2_impl(g1, g2)
    Output
      [1] 2

---

    Code
      count_isomorphisms_vf2_impl(g1, g2, vertex.color1 = c(1, 2, 3), vertex.color2 = c(
        1, 2, 3), edge.color1 = c(1, 2), edge.color2 = c(1, 2))
    Output
      [1] 1

# count_isomorphisms_vf2_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_isomorphisms_vf2_impl basic

    Code
      get_isomorphisms_vf2_impl(g1, g2)
    Output
      [[1]]
      [1] 0 1 2
      
      [[2]]
      [1] 2 1 0
      

---

    Code
      get_isomorphisms_vf2_impl(g1, g2, vertex.color1 = c(1, 2, 3), vertex.color2 = c(
        1, 2, 3), edge.color1 = c(1, 2), edge.color2 = c(1, 2))
    Output
      [[1]]
      [1] 0 1 2
      

# get_isomorphisms_vf2_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# subisomorphic_impl basic

    Code
      subisomorphic_impl(g1, g2)
    Output
      [1] TRUE

# subisomorphic_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# subisomorphic_vf2_impl basic

    Code
      subisomorphic_vf2_impl(g1, g2)
    Output
      $iso
      [1] TRUE
      
      $map12
      [1] 1 2 3
      
      $map21
      [1] 1 2 3
      

---

    Code
      subisomorphic_vf2_impl(g1, g2, vertex.color1 = c(1, 2, 3), vertex.color2 = c(1,
        2, 3), edge.color1 = c(1, 2), edge.color2 = c(1, 2))
    Output
      $iso
      [1] TRUE
      
      $map12
      [1] 1 2 3
      
      $map21
      [1] 1 2 3
      

# subisomorphic_vf2_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_subisomorphisms_vf2_impl basic

    Code
      count_subisomorphisms_vf2_impl(g1, g2)
    Output
      [1] 2

---

    Code
      count_subisomorphisms_vf2_impl(g1, g2, vertex.color1 = c(1, 2, 3),
      vertex.color2 = c(1, 2, 3), edge.color1 = c(1, 2), edge.color2 = c(1, 2))
    Output
      [1] 1

# count_subisomorphisms_vf2_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# get_subisomorphisms_vf2_impl basic

    Code
      get_subisomorphisms_vf2_impl(g1, g2)
    Output
      [[1]]
      [1] 0 1 2
      
      [[2]]
      [1] 2 1 0
      

---

    Code
      get_subisomorphisms_vf2_impl(g1, g2, vertex.color1 = c(1, 2, 3), vertex.color2 = c(
        1, 2, 3), edge.color1 = c(1, 2), edge.color2 = c(1, 2))
    Output
      [[1]]
      [1] 0 1 2
      

# get_subisomorphisms_vf2_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# canonical_permutation_impl basic

    Code
      canonical_permutation_impl(g)
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
      canonical_permutation_impl(g, colors = c(1, 2, 3), sh = "fl")
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# permute_vertices_impl basic

    Code
      permute_vertices_impl(g, permutation = 3:1)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 2--3 1--2

# permute_vertices_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# isomorphic_bliss_impl basic

    Code
      isomorphic_bliss_impl(g1, g2)
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
      isomorphic_bliss_impl(g1, g2, colors1 = c(1, 2, 3), colors2 = c(1, 2, 3), sh = "fl")
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# count_automorphisms_impl basic

    Code
      count_automorphisms_impl(g)
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
      count_automorphisms_impl(g, colors = c(1, 2, 3), sh = "fl")
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# automorphism_group_impl basic

    Code
      automorphism_group_impl(g)
    Output
      [[1]]
      + 3/3 vertices:
      [1] 3 2 1
      

---

    Code
      automorphism_group_impl(g, colors = c(1, 2, 3), sh = "fl", details = TRUE)
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# simplify_and_colorize_impl basic

    Code
      simplify_and_colorize_impl(g)
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# graph_count_impl basic

    Code
      graph_count_impl(3)
    Output
      [1] 4

---

    Code
      graph_count_impl(3, directed = TRUE)
    Output
      [1] 16

# graph_count_impl errors

    Code
      x
    Condition
      Warning in `graph_count_impl()`:
      NAs introduced by coercion
      Error in `graph_count_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# is_matching_impl basic

    Code
      is_matching_impl(g, matching = 1:2)
    Output
      [1] FALSE

---

    Code
      is_matching_impl(g, types = c(TRUE, FALSE, TRUE), matching = 1:2)
    Output
      [1] FALSE

# is_matching_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_maximal_matching_impl basic

    Code
      is_maximal_matching_impl(g, matching = 1:2)
    Output
      [1] FALSE

---

    Code
      is_maximal_matching_impl(g, types = c(TRUE, FALSE, TRUE), matching = 1:2)
    Output
      [1] FALSE

# is_maximal_matching_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# maximum_bipartite_matching_impl basic

    Code
      maximum_bipartite_matching_impl(g, types = c(TRUE, FALSE, TRUE))
    Output
      $matching_size
      [1] 1
      
      $matching_weight
      [1] 1
      
      $matching
      [1] 2 1 0
      

---

    Code
      maximum_bipartite_matching_impl(g, types = c(TRUE, FALSE, TRUE), weights = c(1,
        2), eps = 1e-05)
    Output
      $matching_size
      [1] 1
      
      $matching_weight
      [1] 2
      
      $matching
      [1] 0 3 2
      

# maximum_bipartite_matching_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# adjacency_spectral_embedding_impl basic

    Code
      adjacency_spectral_embedding_impl(g, no = 2)
    Output
      $X
                [,1]       [,2]
      [1,] 0.6718598 -0.4487712
      [2,] 1.1328501  0.5323058
      [3,] 0.6718598 -0.4487712
      
      $Y
      NULL
      
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
      adjacency_spectral_embedding_impl(g, no = 2, weights = c(1, 2), which = "la",
      scaled = FALSE, cvec = c(1, 2, 3), options = list(maxiter = 10))
    Output
      $X
                [,1]       [,2]
      [1,] 0.1720265 -0.7864357
      [2,] 0.6311790 -0.3743620
      [3,] 0.7563200  0.4912963
      
      $Y
      NULL
      
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# laplacian_spectral_embedding_impl basic

    Code
      laplacian_spectral_embedding_impl(g, no = 2)
    Output
      $X
                 [,1]       [,2]
      [1,] -0.7071068 -0.7071068
      [2,]  1.4142136  0.0000000
      [3,] -0.7071068  0.7071068
      
      $Y
      NULL
      
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# eigen_adjacency_impl basic

    Code
      eigen_adjacency_impl(g)
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
      x
    Condition
      Error in `eigen_adjacency_impl()`:
      ! At vendor/cigraph/src/linalg/eigen.c:xx : 'LAPACK' algorithm not implemented yet, Unimplemented function call

# eigen_adjacency_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# power_law_fit_impl basic

    Code
      power_law_fit_impl(c(1, 2, 3))
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
      power_law_fit_impl(c(1, 2, 3), xmin = 1, force.continuous = TRUE)
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
      x
    Condition
      Warning in `power_law_fit_impl()`:
      NAs introduced by coercion
      Error in `power_law_fit_impl()`:
      ! At vendor/cigraph/src/misc/power_law_fit.c:xx : xmin must be greater than zero, Invalid value

# sir_impl basic

    Code
      sir_impl(g, beta = 0.1, gamma = 0.1)
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
      sir_impl(g, beta = 0.1, gamma = 0.1, no.sim = 2)
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
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# convex_hull_2d_impl basic

    Code
      convex_hull_2d_impl(matrix(1:6, ncol = 2))
    Output
      $resverts
      [1] 1 3
      
      $rescoords
           [,1] [,2]
      [1,]    1    4
      [2,]    3    6
      

# convex_hull_2d_impl errors

    Code
      x
    Condition
      Warning in `convex_hull_2d_impl()`:
      NAs introduced by coercion
      Error in `convex_hull_2d_impl()`:
      ! REAL() can only be applied to a 'numeric', not a 'character'

# dim_select_impl basic

    Code
      dim_select_impl(c(1, 2, 3))
    Output
      [1] 1

# dim_select_impl errors

    Code
      x
    Condition
      Error in `dim_select_impl()`:
      ! At vendor/cigraph/src/misc/embedding.c:xx : Need at least one singular value for dimensionality selection, Invalid value

# solve_lsap_impl basic

    Code
      solve_lsap_impl(matrix(1:4, ncol = 2), n = 2)
    Output
      [1] 0 1

# solve_lsap_impl errors

    Code
      x
    Condition
      Warning in `solve_lsap_impl()`:
      NAs introduced by coercion
      Error in `solve_lsap_impl()`:
      ! REAL() can only be applied to a 'numeric', not a 'character'

# find_cycle_impl basic

    Code
      find_cycle_impl(g)
    Output
      $vertices
      + 0/3 vertices:
      
      $edges
      + 0/2 edges:
      

---

    Code
      find_cycle_impl(g, mode = "in")
    Output
      $vertices
      + 0/3 vertices:
      
      $edges
      + 0/2 edges:
      

# find_cycle_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# simple_cycles_impl basic

    Code
      simple_cycles_impl(g)
    Output
      $vertices
      list()
      
      $edges
      list()
      

---

    Code
      simple_cycles_impl(g, mode = "in", min.cycle.length = 2, max.cycle.length = 3)
    Output
      $vertices
      list()
      
      $edges
      list()
      

# simple_cycles_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_eulerian_impl basic

    Code
      is_eulerian_impl(g)
    Output
      $has_path
      [1] TRUE
      
      $has_cycle
      [1] FALSE
      

# is_eulerian_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# eulerian_path_impl basic

    Code
      eulerian_path_impl(g)
    Output
      $epath
      + 2/2 edges:
      [1] 1--2 2--3
      
      $vpath
      + 3/3 vertices:
      [1] 1 2 3
      

# eulerian_path_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# eulerian_cycle_impl basic

    Code
      x
    Condition
      Error in `eulerian_cycle_impl()`:
      ! At vendor/cigraph/src/paths/eulerian.c:xx : The graph does not have an Eulerian cycle. Input problem has no solution

---

    Code
      eulerian_cycle_impl(g2)
    Output
      $epath
      + 4/4 edges:
      [1] 1--2 2--3 3--4 1--4
      
      $vpath
      + 5/4 vertices:
      [1] 1 2 3 4 1
      

# eulerian_cycle_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# fundamental_cycles_impl basic

    Code
      fundamental_cycles_impl(g, start = 1)
    Output
      list()

---

    Code
      fundamental_cycles_impl(g, start = 1, bfs.cutoff = 2, weights = c(1, 2))
    Output
      list()

# fundamental_cycles_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# minimum_cycle_basis_impl basic

    Code
      minimum_cycle_basis_impl(g)
    Output
      list()

---

    Code
      minimum_cycle_basis_impl(g, bfs.cutoff = 2, complete = FALSE, use.cycle.order = FALSE,
        weights = c(1, 2))
    Output
      list()

# minimum_cycle_basis_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_tree_impl basic

    Code
      is_tree_impl(g)
    Output
      [1] TRUE

---

    Code
      is_tree_impl(g, mode = "in", details = TRUE)
    Output
      $res
      [1] TRUE
      
      $root
      + 1/3 vertex:
      [1] 1
      

# is_tree_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_forest_impl basic

    Code
      is_forest_impl(g)
    Output
      [1] TRUE

---

    Code
      is_forest_impl(g, mode = "in", details = TRUE)
    Output
      $res
      [1] TRUE
      
      $roots
      + 1/3 vertex:
      [1] 1
      

# is_forest_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# from_prufer_impl basic

    Code
      from_prufer_impl(1:2)
    Output
      IGRAPH U--- 4 3 -- Tree from Prufer sequence
      + attr: name (g/c), prufer (g/n)
      + edges:
      [1] 1--3 1--2 2--4

# from_prufer_impl errors

    Code
      x
    Condition
      Warning in `from_prufer_impl()`:
      NAs introduced by coercion
      Error in `from_prufer_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# to_prufer_impl basic

    Code
      to_prufer_impl(g)
    Output
      [1] 2

# to_prufer_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# tree_from_parent_vector_impl basic

    Code
      tree_from_parent_vector_impl(c(-1, 1, 2, 3))
    Output
      IGRAPH D--- 4 3 -- 
      + edges:
      [1] 1->2 2->3 3->4

---

    Code
      tree_from_parent_vector_impl(c(-1, 1, 2, 3), type = "in")
    Output
      IGRAPH D--- 4 3 -- 
      + edges:
      [1] 2->1 3->2 4->3

# tree_from_parent_vector_impl errors

    Code
      x
    Condition
      Warning in `tree_from_parent_vector_impl()`:
      NAs introduced by coercion
      Error in `tree_from_parent_vector_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# is_complete_impl basic

    Code
      is_complete_impl(g)
    Output
      [1] FALSE

# is_complete_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# random_spanning_tree_impl basic

    Code
      random_spanning_tree_impl(g, vid = 1)
    Output
      + 2/2 edges:
      [1] 1--2 2--3

# random_spanning_tree_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# tree_game_impl basic

    Code
      tree_game_impl(3)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 2--3 1--2

---

    Code
      tree_game_impl(3, directed = TRUE, method = "lerw")
    Output
      IGRAPH D--- 3 2 -- 
      + edges:
      [1] 3->1 1->2

# tree_game_impl errors

    Code
      x
    Condition
      Warning in `tree_game_impl()`:
      NAs introduced by coercion
      Error in `tree_game_impl()`:
      ! At rinterface_extra.c:xx : The value nan is not representable as an integer. Invalid value

# vertex_coloring_greedy_impl basic

    Code
      vertex_coloring_greedy_impl(g)
    Output
      [1] 2 1 2

---

    Code
      vertex_coloring_greedy_impl(g, heuristic = "dsatur")
    Output
      [1] 2 1 2

# vertex_coloring_greedy_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_vertex_coloring_impl basic

    Code
      is_vertex_coloring_impl(g, types = c(1, 2, 3))
    Output
      [1] TRUE

# is_vertex_coloring_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_bipartite_coloring_impl basic

    Code
      is_bipartite_coloring_impl(g, types = c(TRUE, FALSE, TRUE))
    Output
      [1] TRUE

# is_bipartite_coloring_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# is_edge_coloring_impl basic

    Code
      is_edge_coloring_impl(g, types = c(1, 2))
    Output
      [1] TRUE

---

    Code
      is_edge_coloring_impl(g)
    Output
      [1] TRUE

# is_edge_coloring_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# deterministic_optimal_imitation_impl basic

    Code
      deterministic_optimal_imitation_impl(g, 1, quantities = c(1, 2, 3), strategies = c(
        1, 2, 3))
    Output
      [1] 2 2 3

---

    Code
      deterministic_optimal_imitation_impl(g, 1, optimality = "minimum", quantities = c(
        1, 2, 3), strategies = c(1, 2, 3), mode = "in")
    Output
      [1] 1 2 3

# deterministic_optimal_imitation_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# moran_process_impl basic

    Code
      moran_process_impl(g, weights = c(1, 1), quantities = c(1, 2, 3), strategies = c(
        1, 2, 3), mode = "in")
    Output
      $quantities
      [1] 1 3 3
      
      $strategies
      [1] 1 3 3
      

# moran_process_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# roulette_wheel_imitation_impl basic

    Code
      roulette_wheel_imitation_impl(g, 1, TRUE, quantities = c(1, 2, 3), strategies = c(
        1, 2, 3))
    Output
      [1] 1 2 3

---

    Code
      roulette_wheel_imitation_impl(g, 1, FALSE, quantities = c(1, 2, 3), strategies = c(
        1, 2, 3), mode = "in")
    Output
      [1] 3 2 3

# roulette_wheel_imitation_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# stochastic_imitation_impl basic

    Code
      stochastic_imitation_impl(g, 1, algo = 1, quantities = c(1, 2, 3), strategies = c(
        1, 2, 3))
    Output
      [1] 1 2 3

---

    Code
      stochastic_imitation_impl(g, 1, algo = 2, quantities = c(1, 2, 3), strategies = c(
        1, 2, 3), mode = "in")
    Output
      [1] 1 2 3

# stochastic_imitation_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# invalidate_cache_impl basic

    Code
      invalidate_cache_impl(g)
    Output
      IGRAPH U--- 3 2 -- 
      + edges:
      [1] 1--2 2--3

# invalidate_cache_impl errors

    Code
      x
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# vertex_path_from_edge_path_impl basic

    Code
      vertex_path_from_edge_path_impl(g, start = 1, edge.path = c(1, 2))
    Output
      + 3/3 vertices:
      [1] 1 2 3

---

    Code
      vertex_path_from_edge_path_impl(g, start = 1, edge.path = c(1), mode = "in")
    Output
      + 2/3 vertices:
      [1] 1 2

# vertex_path_from_edge_path_impl errors

    Code
      x
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
      x
    Condition
      Error in `version_impl()`:
      ! unused argument ("invalid")

