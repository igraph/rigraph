# cli print.igraph: undirected unnamed ring

    Code
      print(g)
    Output
      ── <igraph> Ring graph ─────────────────────────────────────────────────────────
      ℹ undirected
      ℹ 5 vertices · 5 edges
      
      ── Attributes ──────────────────────────────────────────────────────────────────
      → graph:  name <chr>, mutual <lgl>, circular <lgl>
      
      ── Edges ───────────────────────────────────────────────────────────────────────
      [1] 1 ─ 2  2 ─ 3  3 ─ 4  4 ─ 5  1 ─ 5 

---

    Code
      summary(g)
    Output
      ── <igraph> Ring graph ─────────────────────────────────────────────────────────
      ℹ undirected
      ℹ 5 vertices · 5 edges
      
      ── Attributes ──────────────────────────────────────────────────────────────────
      → graph:  name <chr>, mutual <lgl>, circular <lgl>

# cli print.igraph: directed named weighted

    Code
      print(g)
    Output
      ── <igraph> trio ───────────────────────────────────────────────────────────────
      ℹ directed · named · weighted
      ℹ 3 vertices · 3 edges
      
      ── Attributes ──────────────────────────────────────────────────────────────────
      → graph:  name <chr>, mutual <lgl>, circular <lgl>
      → vertex: name <chr>
      → edge:   weight <dbl>
      
      ── Edges (vertex names) ────────────────────────────────────────────────────────
      [1] A → B  B → C  C → A 

---

    Code
      summary(g)
    Output
      ── <igraph> trio ───────────────────────────────────────────────────────────────
      ℹ directed · named · weighted
      ℹ 3 vertices · 3 edges
      
      ── Attributes ──────────────────────────────────────────────────────────────────
      → graph:  name <chr>, mutual <lgl>, circular <lgl>
      → vertex: name <chr>
      → edge:   weight <dbl>

# cli print.igraph: bipartite

    Code
      print(g)
    Output
      ── <igraph> ────────────────────────────────────────────────────────────────────
      ℹ undirected · bipartite
      ℹ 4 vertices · 2 edges
      
      ── Attributes ──────────────────────────────────────────────────────────────────
      → vertex: type <lgl>
      
      ── Edges ───────────────────────────────────────────────────────────────────────
      [1] 1 ─ 3  2 ─ 4 

# cli print.igraph: empty graph has no edges section

    Code
      print(make_empty_graph(0))
    Output
      ── <igraph> ────────────────────────────────────────────────────────────────────
      ℹ directed
      ℹ 0 vertices · 0 edges

---

    Code
      print(make_empty_graph(3, directed = FALSE))
    Output
      ── <igraph> ────────────────────────────────────────────────────────────────────
      ℹ undirected
      ℹ 3 vertices · 0 edges

# cli print.igraph: full mode with all attribute sections

    Code
      print(g)
    Output
      ── <igraph> trio ───────────────────────────────────────────────────────────────
      ℹ directed · named · weighted
      ℹ 3 vertices · 3 edges
      
      ── Attributes ──────────────────────────────────────────────────────────────────
      → graph:  name <chr>, mutual <lgl>, circular <lgl>
      → vertex: name <chr>
      → edge:   weight <dbl>
      
      ── Graph attributes ────────────────────────────────────────────────────────────
      name:
        [1] "trio"
      mutual:
        [1] FALSE
      circular:
        [1] TRUE
      
      ── Vertex attributes ───────────────────────────────────────────────────────────
          name
      [1]    A
      [2]    B
      [3]    C
      
      ── Edges with attributes (vertex names) ────────────────────────────────────────
           edge weight
      [1] A → B      1
      [2] B → C      2
      [3] C → A      3

# cli print.igraph.vs: single and double bracket

    Code
      V(g)
    Output
      ── <vertex sequence> 3/3 · named ───────────────────────────────────────────────
      [1] A B C
    Code
      V(g)[1:2]
    Output
      ── <vertex sequence> 2/3 · named ───────────────────────────────────────────────
      [1] A B
    Code
      V(g)[[1]]
    Output
      ── <vertex sequence> 1/3 · named ───────────────────────────────────────────────
        name weight
      1    A     10
    Code
      V(g)[[2:3]]
    Output
      ── <vertex sequence> 2/3 · named ───────────────────────────────────────────────
        name weight
      2    B     11
      3    C     12

# cli print.igraph.es: single and double bracket

    Code
      E(g)
    Output
      ── <edge sequence> 3/3 · vertex names ──────────────────────────────────────────
      [1] A → B  B → C  C → A 
    Code
      E(g)[1:2]
    Output
      ── <edge sequence> 2/3 · vertex names ──────────────────────────────────────────
      [1] A → B  B → C 
    Code
      E(g)[[1]]
    Output
      ── <edge sequence> 1/3 · vertex names ──────────────────────────────────────────
        tail head tid hid weight
      1    A    B   1   2      1
    Code
      E(g)[[2:3]]
    Output
      ── <edge sequence> 2/3 · vertex names ──────────────────────────────────────────
        tail head tid hid weight
      2    B    C   2   3      2
      3    C    A   3   1      3

# cli print.igraph: ASCII fallback when cli.unicode = FALSE

    Code
      print(g)
    Output
      -- <igraph> Ring graph ---------------------------------------------------------
      i directed * named
      i 3 vertices * 3 edges
      
      -- Attributes ------------------------------------------------------------------
      -> graph:  name <chr>, mutual <lgl>, circular <lgl>
      -> vertex: name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
      [1] A -> B  B -> C  C -> A 

---

    Code
      V(g)
    Output
      -- <vertex sequence> 3/3 * named -----------------------------------------------
      [1] A B C

---

    Code
      E(g)
    Output
      -- <edge sequence> 3/3 * vertex names ------------------------------------------
      [1] A -> B  B -> C  C -> A 

# cli print.igraph: truncation in auto mode

    Code
      print(g)
    Output
      ── <igraph> Ring graph ─────────────────────────────────────────────────────────
      ℹ undirected
      ℹ 200 vertices · 200 edges
      
      ── Attributes ──────────────────────────────────────────────────────────────────
      → graph:  name <chr>, mutual <lgl>, circular <lgl>
      
      ── Edges ───────────────────────────────────────────────────────────────────────
        [1] 1 ─ 2      2 ─ 3      3 ─ 4      4 ─ 5      5 ─ 6      6 ─ 7     
        [7] 7 ─ 8      8 ─ 9      9 ─ 10     10 ─ 11    11 ─ 12    12 ─ 13   
       [13] 13 ─ 14    14 ─ 15    15 ─ 16    16 ─ 17    17 ─ 18    18 ─ 19   
      + ... omitted several edges

