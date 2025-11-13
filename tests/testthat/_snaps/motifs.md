# motifs_randesu_callback output matches expected

    Code
      cat("Number of motifs found:", length(motif_data), "\n")
    Output
      Number of motifs found: 12 
    Code
      cat("Sample motif 1:\n")
    Output
      Sample motif 1:
    Code
      print(motif_data[[1]])
    Output
      $vids
      [1] 1 4 2
      
      $isoclass
      [1] 3
      
    Code
      if (length(motif_data) > 1) {
        cat("Sample motif 2:\n")
        print(motif_data[[2]])
      }
    Output
      Sample motif 2:
      $vids
      [1] 1 4 3
      
      $isoclass
      [1] 4
      

