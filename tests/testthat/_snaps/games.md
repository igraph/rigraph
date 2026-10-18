# sample_degseq() works -- exponential degree error

    Code
      sample_degseq(exponential_degrees, method = "vl")
    Condition
      Error in `degree_sequence_game_impl()`:
      ! Cannot make a connected graph from the given degree sequence. Invalid value
      Source: <file>:<line>

# sample_degseq() works -- Power-law degree error

    Code
      sample_degseq(powerlaw_degrees, method = "vl")
    Condition
      Error in `degree_sequence_game_impl()`:
      ! Cannot realize the given degree sequence as an undirected, simple graph. Invalid value
      Source: <file>:<line>

# sample_correlated_gnp() validates the permutation

    Code
      sample_correlated_gnp(gnp_graph, corr = 0.5, permutation = c(1, 2, 3))
    Condition
      Error in `sample_correlated_gnp()`:
      ! `permutation` must have length equal to the number of vertices.
      i Expected length 4, got 3.

---

    Code
      sample_correlated_gnp(gnp_graph, corr = 0.5, permutation = c(NA, 2, 3, 4))
    Condition
      Error in `sample_correlated_gnp()`:
      ! `permutation` must not contain missing values.
      i Found NA at position 1.

---

    Code
      sample_correlated_gnp(gnp_graph, corr = 0.5, permutation = c(1.5, 2, 3, 4))
    Condition
      Error in `sample_correlated_gnp()`:
      ! `permutation` must contain whole numbers.
      i Found 1.5 at position 1.

---

    Code
      sample_correlated_gnp(gnp_graph, corr = 0.5, permutation = c(1, 2, 3, 5))
    Condition
      Error in `sample_correlated_gnp()`:
      ! `permutation` must contain values between 1 and 4.
      i Found 5 at position 4.

---

    Code
      sample_correlated_gnp(gnp_graph, corr = 0.5, permutation = c(1, 1, 2, 3))
    Condition
      Error in `sample_correlated_gnp()`:
      ! `permutation` must not contain duplicate values.
      i Found 1 more than once.

# sample_correlated_gnp_pair() validates the permutation

    Code
      sample_correlated_gnp_pair(4, corr = 0.5, p = 0.5, permutation = "1")
    Condition
      Error in `sample_correlated_gnp_pair()`:
      ! `permutation` must be a numeric vector, not a string.

---

    Code
      sample_correlated_gnp_pair(4, corr = 0.5, p = 0.5, permutation = 1:5)
    Condition
      Error in `sample_correlated_gnp_pair()`:
      ! `permutation` must have length equal to the number of vertices.
      i Expected length 4, got 5.

---

    Code
      sample_correlated_gnp_pair(4, corr = 0.5, p = 0.5, permutation = c(0, 1, 2, 3))
    Condition
      Error in `sample_correlated_gnp_pair()`:
      ! `permutation` must contain values between 1 and 4.
      i Found 0 at position 1.

---

    Code
      sample_correlated_gnp_pair(4, corr = 0.5, p = 0.5, permutation = c(4, 4, 4, 1))
    Condition
      Error in `sample_correlated_gnp_pair()`:
      ! `permutation` must not contain duplicate values.
      i Found 4 more than once.

