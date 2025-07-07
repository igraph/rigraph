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

# print.igrapHRG() works

    Code
      print(small_g)
    Output
      Hierarchical random graph, at level 3:
      g1        p=   0  
      '- g5     p=0.44  
         '- g7  p=0.88  7  2  8  1  6  4  10 3 
         '- g4  p=   1  5  9 
      '- g10    p=0.31  
         '- g6  p=0.81  20 11 18 12 17 14 19 15
         '- g12 p=   1  13 16

---

    Code
      print(small_g, type = "plain")
    Output
      Hierarchical random graph:
      g1  p=0.0 -> g5 g10    g2  p=0.0 -> 1 8       g3  p=1.0 -> g19 4     
      g4  p=1.0 -> 5 9       g5  p=0.4 -> g7 g4     g6  p=0.8 -> g18 g11   
      g7  p=0.9 -> g14 g9    g8  p=0.0 -> g2 2      g9  p=0.7 -> g3 6      
      g10 p=0.3 -> g6 g12    g11 p=0.0 -> g15 g16   g12 p=1.0 -> 13 16     
      g13 p=0.0 -> 11 20     g14 p=0.3 -> g8 7      g15 p=0.0 -> 14 17     
      g16 p=0.0 -> 15 19     g17 p=0.0 -> 12 18     g18 p=0.8 -> g13 g17   
      g19 p=0.0 -> 3 10   

---

    Code
      print(big_hrg)
    Output
      Hierarchical random graph, at level 3:
      g1        p= 0.25  
      '- g20    p= 0.25  
         '- g179 p=    0  40  63  56  1   61  32  38  92  73  46  28  43  96  83  94 
                         87  89  51  19  106 16  105 9   59  41  31  84  74  30  8  
                         42  22  5   71  104 7   13  58  110 101 79  109 98  62  11 
                         35  103 90  24  23  14  72  86  70  66  75  33  76  54  25 
                         18  10  45  52  50  17  37  2   26  21  93  102 68  82  100
                         85  4   170 165 127 173 126 168 136 190 205 111 187 156 207
                         124 213 196 216 116 119 118 160 140 159 149 146 195 171 219
                         191 142 120 217 169 147 134 197 212 184 151 155 200 192 145
                         121 176 112 204 128 215 183 208 148 115 210 131 144 125 132
                         188 181 158 163 114 206 143 220 198 141 174 193 129 117 211
                         150 175 180 157 194 186
         '- g96 p=    0  80  88  91  53  60  3   47  39  48  6   20  77  12  67  57 
                         15  95  44  202 172 113 167 123 185 182 135 203 178 189 130
                         214 152 154 137 162 201 166 161 139
      '- g13    p=0.083  133
         '- g69 p=    0  29  27  49  65  81  97  34  107 99  64  108 55  36  78  69 
                         177 122 199 218 179 164 209 153 138

---

    Code
      print(big_hrg, type = "tree")
    Output
      Hierarchical random graph, at level 3:
      g1        p= 0.25  
      '- g20    p= 0.25  
         '- g179 p=    0  40  63  56  1   61  32  38  92  73  46  28  43  96  83  94 
                         87  89  51  19  106 16  105 9   59  41  31  84  74  30  8  
                         42  22  5   71  104 7   13  58  110 101 79  109 98  62  11 
                         35  103 90  24  23  14  72  86  70  66  75  33  76  54  25 
                         18  10  45  52  50  17  37  2   26  21  93  102 68  82  100
                         85  4   170 165 127 173 126 168 136 190 205 111 187 156 207
                         124 213 196 216 116 119 118 160 140 159 149 146 195 171 219
                         191 142 120 217 169 147 134 197 212 184 151 155 200 192 145
                         121 176 112 204 128 215 183 208 148 115 210 131 144 125 132
                         188 181 158 163 114 206 143 220 198 141 174 193 129 117 211
                         150 175 180 157 194 186
         '- g96 p=    0  80  88  91  53  60  3   47  39  48  6   20  77  12  67  57 
                         15  95  44  202 172 113 167 123 185 182 135 203 178 189 130
                         214 152 154 137 162 201 166 161 139
      '- g13    p=0.083  133
         '- g69 p=    0  29  27  49  65  81  97  34  107 99  64  108 55  36  78  69 
                         177 122 199 218 179 164 209 153 138

