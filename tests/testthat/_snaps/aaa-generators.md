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
      ! Invalid number of vertices. Invalid vertex ID
      Source: <file>:<line>

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
      ! The requested hypercube graph dimension (10000) is too high. It must be no greater than 57. Invalid value
      Source: <file>:<line>

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
      ! Invalid dimension vector. Invalid value
      Source: <file>:<line>

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
      ! Invalid dimension vector. Invalid value
      Source: <file>:<line>

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
      ! The number of vertices must be non-negative, got -1. Invalid value
      Source: <file>:<line>

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
      ! The number of vertices must be non-negative, got -1. Invalid value
      Source: <file>:<line>

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
      ! The number of branches must be positive at each level. Invalid value
      Source: <file>:<line>

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
      ! Height of regular tree must be positive, got -1. Invalid value
      Source: <file>:<line>

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
      ! Invalid number of vertices. Invalid value
      Source: <file>:<line>

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
      ! No such graph in atlas. The graph index must be less than 1253. Invalid value
      Source: <file>:<line>

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
      ! An extended chordal ring has at least 3 nodes. Invalid value
      Source: <file>:<line>

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
      ! `m' and `n' should be non-negative in a de Bruijn graph. Invalid value
      Source: <file>:<line>

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
      ! `m' and `n' should be non-negative in a Kautz graph. Invalid value
      Source: <file>:<line>

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
      ! Number of vertices must not be negative. Invalid value
      Source: <file>:<line>

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
      ! The Mycielski graph order must not be negative. Invalid value
      Source: <file>:<line>

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
      ! Invalid (negative or too large) vertex ID. Invalid vertex ID
      Source: <file>:<line>

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
      ! Number of vertices must not be negative in any partition. Invalid value
      Source: <file>:<line>

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
      ! The sum of degrees must be even for an undirected graph. Invalid value
      Source: <file>:<line>

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
      ! The given bidegree sequence cannot be realized as a bipartite simple graph. Invalid value
      Source: <file>:<line>

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
      ! Number of nodes = -1 must be non-negative. Invalid value
      Source: <file>:<line>

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
      ! n = -1 must be at least 3. Invalid value
      Source: <file>:<line>

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
      ! Number of vertices must not be negative, got -1. Invalid value
      Source: <file>:<line>

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
      ! The value nan is not representable as an integer. Invalid value
      Source: <file>:<line>

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
      ! The value nan is not representable as an integer. Invalid value
      Source: <file>:<line>

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
      ! NonexistentGraph is not a known graph. See the documentation for valid graph names. Invalid value
      Source: <file>:<line>

# star_impl basic

    Code
      star_impl(n = 5, mode = "out", center = 0)
    Output
      IGRAPH D--- 5 4 -- 
      + edges:
      [1] 1->2 1->3 1->4 1->5

---

    Code
      star_impl(n = 6, mode = "in", center = 1)
    Output
      IGRAPH D--- 6 5 -- 
      + edges:
      [1] 1->2 3->2 4->2 5->2 6->2

---

    Code
      star_impl(n = 4, mode = "undirected", center = 0)
    Output
      IGRAPH U--- 4 3 -- 
      + edges:
      [1] 1--2 1--3 1--4

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

# sparse_adjacency_impl basic

    Code
      sparse_adjacency_impl(adjmatrix = M)
    Output
      IGRAPH D--- 4 4 -- 
      + edges:
      [1] 4->1 1->2 2->3 3->4

---

    Code
      sparse_adjacency_impl(adjmatrix = M_sym, mode = "undirected", loops = "once")
    Output
      IGRAPH U--- 4 4 -- 
      + edges:
      [1] 1--2 2--3 1--4 3--4

# sparse_weighted_adjacency_impl basic

    Code
      sparse_weighted_adjacency_impl(adjmatrix = M)
    Output
      $graph
      IGRAPH D--- 4 4 -- 
      + edges:
      [1] 4->1 1->2 2->3 3->4
      
      $weights
      [1] 0.5 2.5 1.0 3.0
      

---

    Code
      sparse_weighted_adjacency_impl(adjmatrix = M_sym, mode = "undirected", loops = "once")
    Output
      $graph
      IGRAPH U--- 4 4 -- 
      + edges:
      [1] 1--2 2--3 1--4 3--4
      
      $weights
      [1] 2.5 1.0 0.5 3.0
      

# weighted_sparsemat_impl basic

    Code
      weighted_sparsemat_impl(A = M, directed = TRUE, attr = "weight", loops = FALSE)
    Output
      IGRAPH D-W- 4 4 -- 
      + attr: weight (e/n)
      + edges:
      [1] 4->1 1->2 2->3 3->4

