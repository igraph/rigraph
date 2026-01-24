# as.hclust.igraphHRG() works

    Code
      summary(as.hclust(hrg))
    Output
                  Length Class  Mode     
      merge       66     -none- numeric  
      height      33     -none- numeric  
      order       34     -none- numeric  
      labels      34     -none- numeric  
      method       1     -none- character
      dist.method  1     -none- character

# sample_hrg() checks its argument

    Code
      sample_hrg(make_ring(10))
    Condition
      Error in `sample_hrg()`:
      ! `hrg` must be an <igraphHRG> object, not an <igraph> object.

# hrg_tree() checks its argument

    Code
      hrg_tree(make_ring(10))
    Condition
      Error in `hrg_tree()`:
      ! `hrg` must be an <igraphHRG> object, not an <igraph> object.

