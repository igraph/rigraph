# sample_degseq() works -- exponential degree error

    Code
      sample_degseq(exponential_degrees, method = "vl")
    Condition
      Error in `degree_sequence_game_impl()`:
      ! Cannot make a connected graph from the given degree sequence. Invalid value
      Source: games/degree_sequence_vl/gengraph_mr-connected.cpp:<linenumber>

# sample_degseq() works -- Power-law degree error

    Code
      sample_degseq(powerlaw_degrees, method = "vl")
    Condition
      Error in `degree_sequence_game_impl()`:
      ! Cannot realize the given degree sequence as an undirected, simple graph. Invalid value
      Source: games/degree_sequence_vl/gengraph_mr-connected.cpp:<linenumber>

