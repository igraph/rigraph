# sample_degseq() works -- exponential degree error

    Code
      sample_degseq(exponential_degrees, method = "vl")
    Condition
      Error in `sample_degseq()`:
      ! At vendor/cigraph/src/games/degree_sequence_vl/gengraph_mr-connected.cpp:<linenumber> : Cannot make a connected graph from the given degree sequence. Invalid value

# sample_degseq() works -- Power-law degree error

    Code
      sample_degseq(powerlaw_degrees, method = "vl")
    Condition
      Error in `sample_degseq()`:
      ! At vendor/cigraph/src/games/degree_sequence_vl/gengraph_mr-connected.cpp:<linenumber> : Cannot realize the given degree sequence as an undirected, simple graph. Invalid value

# sample_bipartite() deprecation

    Code
      s <- sample_bipartite(10, 5, type = "gnp", p = 0)
    Condition
      Warning:
      `sample_bipartite()` was deprecated in igraph 2.1.3.
      i Please use `sample_bipartite_gnp()` instead.

---

    Code
      s <- sample_bipartite(10, 5, type = "gnm", m = 0)
    Condition
      Warning:
      `sample_bipartite()` was deprecated in igraph 2.1.3.
      i Please use `sample_bipartite_gnm()` instead.

