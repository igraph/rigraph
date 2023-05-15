# as_long_data_frame() works correctly with and without names

    Code
      ring <- make_ring(3)
      as_long_data_frame(ring)
    Output
        from to
      1    1  2
      2    2  3
      3    1  3
    Code
      V(ring)$name <- letters[1:3]
      as_long_data_frame(ring)
    Output
        from to from_name to_name
      1    1  2         a       b
      2    2  3         b       c
      3    1  3         a       c
    Code
      V(ring)$score <- LETTERS[1:3]
      as_long_data_frame(ring)
    Output
        from to from_name from_score to_name to_score
      1    1  2         a          A       b        B
      2    2  3         b          B       c        C
      3    1  3         a          A       c        C
    Code
      E(ring)$info <- 3:1
      as_long_data_frame(ring)
    Output
        from to info from_name from_score to_name to_score
      1    1  2    3         a          A       b        B
      2    2  3    2         b          B       c        C
      3    1  3    1         a          A       c        C

