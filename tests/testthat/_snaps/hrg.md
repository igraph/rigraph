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
      Hierarchical random graph:
      g1   p=0.25 -> g20 g13     g2   p=0.50 -> g50 209     
      g3   p=0.48 -> g149 170    g4   p=0.50 -> g110 73     
      g5   p=0.00 -> g217 24     g6   p=0.83 -> g19 160     
      g7   p=0.54 -> g73 127     g8   p=0.40 -> g157 80     
      g9   p=1.00 -> g130 91     g10  p=0.00 -> g191 86     
      g11  p=0.00 -> 118 119     g12  p=0.75 -> g100 29     
      g13  p=0.08 -> g69 133     g14  p=1.00 -> 44 95       
      g15  p=0.00 -> g199 67     g16  p=1.00 -> g193 183    
      g17  p=0.91 -> g105 141    g18  p=1.00 -> g134 187    
      g19  p=1.00 -> 140 g192    g20  p=0.25 -> g179 g96    
      g21  p=0.54 -> g163 g65    g22  p=0.50 -> 43 g111     
      g23  p=0.81 -> g189 g47    g24  p=1.00 -> 12 77       
      g25  p=0.21 -> g206 g136   g26  p=0.25 -> g174 75     
      g27  p=0.50 -> g82 g113    g28  p=0.22 -> g56 g72     
      g29  p=0.75 -> g185 154    g30  p=0.57 -> g188 19     
      g31  p=0.62 -> g151 214    g32  p=0.00 -> 146 149     
      g33  p=1.00 -> g118 89     g34  p=0.54 -> g139 g209   
      g35  p=1.00 -> 2 37        g36  p=0.80 -> g87 16      
      g37  p=0.00 -> g216 175    g38  p=1.00 -> g43 g58     
      g39  p=0.40 -> g60 39      g40  p=0.75 -> g98 g18     
      g41  p=0.46 -> g53 g17     g42  p=0.29 -> 7 g178      
      g43  p=0.00 -> g54 g133    g44  p=1.00 -> 178 203     
      g45  p=0.28 -> g8 g14      g46  p=0.67 -> g177 192    
      g47  p=1.00 -> 125 144     g48  p=1.00 -> g70 193     
      g49  p=0.00 -> 130 189     g50  p=1.00 -> 138 153     
      g51  p=0.75 -> g202 g195   g52  p=0.79 -> g27 g78     
      g53  p=0.44 -> g116 132    g54  p=0.00 -> 113 g156    
      g55  p=0.71 -> g131 38     g56  p=0.50 -> g144 168    
      g57  p=0.00 -> 179 218     g58  p=0.00 -> 135 g44     
      g59  p=0.00 -> 34 97       g60  p=0.75 -> g80 48      
      g61  p=0.00 -> g10 72      g62  p=1.00 -> 11 62       
      g63  p=0.36 -> g115 g142   g64  p=0.15 -> g155 56     
      g65  p=0.00 -> 74 84       g66  p=0.00 -> 131 210     
      g67  p=0.92 -> g170 71     g68  p=0.50 -> g219 173    
      g69  p=0.00 -> g114 g171   g70  p=0.40 -> g137 g37    
      g71  p=0.78 -> g107 g101   g72  p=1.00 -> g138 213    
      g73  p=0.47 -> g74 g23     g74  p=0.49 -> g154 g126   
      g75  p=1.00 -> g159 g119   g76  p=1.00 -> 32 61       
      g77  p=0.50 -> g93 158     g78  p=0.00 -> g148 147    
      g79  p=0.50 -> g184 212    g80  p=0.00 -> 6 g180      
      g81  p=0.44 -> g83 52      g82  p=1.00 -> 120 142     
      g83  p=0.11 -> g94 g143    g84  p=1.00 -> 35 g123     
      g85  p=0.50 -> g57 199     g86  p=1.00 -> 31 41       
      g87  p=0.67 -> g146 g89    g88  p=0.00 -> 157 180     
      g89  p=0.00 -> g86 59      g90  p=1.00 -> 124 207     
      g91  p=0.00 -> g35 17      g92  p=1.00 -> g106 10     
      g93  p=1.00 -> 114 163     g94  p=0.20 -> g152 50     
      g95  p=1.00 -> 115 148     g96  p=0.00 -> g45 g122    
      g97  p=0.00 -> 128 204     g98  p=1.00 -> 111 205     
      g99  p=0.00 -> g194 8      g100 p=0.86 -> 27 g201     
      g101 p=0.25 -> g16 215     g102 p=1.00 -> g2 164      
      g103 p=0.11 -> g212 110    g104 p=1.00 -> g176 76     
      g105 p=0.00 -> g48 174     g106 p=0.50 -> g208 45     
      g107 p=0.14 -> g46 200     g108 p=0.00 -> g32 159     
      g109 p=1.00 -> g52 191     g110 p=0.00 -> 28 46       
      g111 p=1.00 -> 83 96       g112 p=1.00 -> 99 107      
      g113 p=1.00 -> 169 217     g114 p=0.52 -> g12 g140    
      g115 p=0.00 -> 3 60        g116 p=1.00 -> g197 g51    
      g117 p=0.53 -> g103 g160   g118 p=0.38 -> g30 51      
      g119 p=0.00 -> 69 78       g120 p=1.00 -> g186 65     
      g121 p=0.00 -> g62 g84     g122 p=0.55 -> g25 202     
      g123 p=1.00 -> 90 103      g124 p=0.33 -> g207 82     
      g125 p=0.18 -> g117 58     g126 p=1.00 -> g109 219    
      g127 p=0.00 -> 87 94       g128 p=0.67 -> g135 g85    
      g129 p=0.00 -> g121 98     g130 p=0.00 -> g63 53      
      g131 p=0.67 -> g210 92     g132 p=0.36 -> g9 88       
      g133 p=1.00 -> 182 185     g134 p=1.00 -> g90 156     
      g135 p=1.00 -> 122 177     g136 p=0.56 -> g49 g31     
      g137 p=0.33 -> g181 129    g138 p=1.00 -> g182 196    
      g139 p=0.70 -> g21 40      g140 p=0.80 -> g213 64     
      g141 p=1.00 -> 150 211     g142 p=0.00 -> g39 47      
      g143 p=0.00 -> g187 93     g144 p=0.86 -> g165 136    
      g145 p=1.00 -> 139 161     g146 p=0.00 -> 9 105       
      g147 p=1.00 -> g77 181     g148 p=0.25 -> 134 g162    
      g149 p=0.67 -> g7 165      g150 p=1.00 -> g153 145    
      g151 p=0.75 -> g161 g145   g152 p=0.67 -> g91 g218    
      g153 p=0.00 -> g190 121    g154 p=0.42 -> g166 g6     
      g155 p=0.59 -> g173 g127   g156 p=1.00 -> 123 167     
      g157 p=0.50 -> g132 g15    g158 p=1.00 -> 162 g215    
      g159 p=1.00 -> 36 55       g160 p=0.97 -> g5 g26      
      g161 p=0.80 -> g29 152     g162 p=0.67 -> g79 197     
      g163 p=0.00 -> g198 63     g164 p=0.00 -> g129 109    
      g165 p=0.83 -> g40 190     g166 p=0.37 -> g68 g11     
      g167 p=0.00 -> 171 195     g168 p=1.00 -> 4 85        
      g169 p=0.50 -> 14 g61      g170 p=0.28 -> g42 104     
      g171 p=0.45 -> g128 g102   g172 p=1.00 -> g164 79     
      g173 p=0.38 -> g203 g55    g174 p=1.00 -> g104 33     
      g175 p=1.00 -> g99 30      g176 p=1.00 -> 25 54       
      g177 p=0.00 -> g150 g97    g178 p=0.43 -> g125 13     
      g179 p=0.00 -> g204 g183   g180 p=1.00 -> g24 20      
      g181 p=0.50 -> 117 g141    g182 p=0.00 -> 116 216     
      g183 p=0.49 -> g3 g41      g184 p=1.00 -> 151 184     
      g185 p=0.67 -> 137 g158    g186 p=1.00 -> g211 81     
      g187 p=0.00 -> 68 102      g188 p=0.00 -> g36 106     
      g189 p=0.46 -> g196 g66    g190 p=0.00 -> 112 176     
      g191 p=0.00 -> 66 70       g192 p=0.33 -> g108 g167   
      g193 p=0.00 -> g95 208     g194 p=1.00 -> g205 42     
      g195 p=0.00 -> 198 220     g196 p=0.62 -> g71 155     
      g197 p=0.00 -> g147 188    g198 p=0.45 -> g64 g33     
      g199 p=0.00 -> 15 57       g200 p=0.44 -> g92 18      
      g201 p=1.00 -> g120 49     g202 p=1.00 -> 143 206     
      g203 p=1.00 -> 1 g76       g204 p=0.50 -> g34 g200    
      g205 p=0.00 -> 5 22        g206 p=0.12 -> g38 172     
      g207 p=0.00 -> g168 100    g208 p=0.57 -> g81 g124    
      g209 p=0.54 -> g175 g67    g210 p=0.00 -> g4 g22      
      g211 p=0.25 -> g59 g112    g212 p=0.25 -> g172 101    
      g213 p=1.00 -> g75 108     g214 p=0.00 -> 186 194     
      g215 p=0.00 -> 166 201     g216 p=1.00 -> g88 g214    
      g217 p=0.20 -> g169 23     g218 p=1.00 -> 21 26       
      g219 p=0.00 -> g28 126  

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

