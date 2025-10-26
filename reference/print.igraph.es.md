# Print an edge sequence to the screen

For long edge sequences, the printing is truncated to fit to the screen.
Use [`print()`](https://rdrr.io/r/base/print.html) explicitly and the
`full` argument to see the full sequence.

## Usage

``` r
# S3 method for class 'igraph.es'
print(x, full = igraph_opt("print.full"), id = igraph_opt("print.id"), ...)
```

## Arguments

- x:

  An edge sequence.

- full:

  Whether to show the full sequence, or truncate the output to the
  screen size.

- id:

  Whether to print the graph ID.

- ...:

  Currently ignored.

## Value

The edge sequence, invisibly.

## Details

Edge sequences created with the double bracket operator are printed
differently, together with all attributes of the edges in the sequence,
as a table.

## See also

Other vertex and edge sequences:
[`E()`](https://r.igraph.org/reference/E.md),
[`V()`](https://r.igraph.org/reference/V.md),
[`as_ids()`](https://r.igraph.org/reference/as_ids.md),
[`igraph-es-attributes`](https://r.igraph.org/reference/igraph-es-attributes.md),
[`igraph-es-indexing`](https://r.igraph.org/reference/igraph-es-indexing.md),
[`igraph-es-indexing2`](https://r.igraph.org/reference/igraph-es-indexing2.md),
[`igraph-vs-attributes`](https://r.igraph.org/reference/igraph-vs-attributes.md),
[`igraph-vs-indexing`](https://r.igraph.org/reference/igraph-vs-indexing.md),
[`igraph-vs-indexing2`](https://r.igraph.org/reference/igraph-vs-indexing2.md),
[`print.igraph.vs()`](https://r.igraph.org/reference/print.igraph.vs.md)

## Examples

``` r
# Unnamed graphs
g <- make_ring(10)
E(g)
#> + 10/10 edges from 0bf3372:
#>  [1] 1-- 2 2-- 3 3-- 4 4-- 5 5-- 6 6-- 7 7-- 8 8-- 9 9--10 1--10

# Named graphs
g2 <- make_ring(10) %>%
  set_vertex_attr("name", value = LETTERS[1:10])
E(g2)
#> + 10/10 edges from 75d8fbe (vertex names):
#>  [1] A--B B--C C--D D--E E--F F--G G--H H--I I--J A--J

# All edges in a long sequence
g3 <- make_ring(200)
E(g3)
#> + 200/200 edges from d6d7d51:
#>  [1]  1-- 2  2-- 3  3-- 4  4-- 5  5-- 6  6-- 7  7-- 8  8-- 9  9--10 10--11
#> [11] 11--12 12--13 13--14 14--15 15--16 16--17 17--18 18--19 19--20 20--21
#> [21] 21--22 22--23 23--24 24--25 25--26 26--27 27--28 28--29 29--30 30--31
#> [31] 31--32 32--33 33--34 34--35 35--36 36--37 37--38 38--39 39--40 40--41
#> [41] 41--42 42--43 43--44 44--45 45--46 46--47 47--48 48--49 49--50 50--51
#> [51] 51--52 52--53 53--54 54--55 55--56 56--57 57--58 58--59 59--60 60--61
#> [61] 61--62 62--63 63--64 64--65 65--66 66--67 67--68 68--69 69--70 70--71
#> [71] 71--72 72--73 73--74 74--75 75--76 76--77 77--78 78--79 79--80 80--81
#> [81] 81--82 82--83 83--84 84--85 85--86 86--87 87--88 88--89 89--90 90--91
#> [91] 91--92 92--93 93--94 94--95 95--96 96--97 97--98 98--99
#> + ... omitted several edges
E(g3) %>% print(full = TRUE)
#> + 200/200 edges from d6d7d51:
#>   [1]   1--  2   2--  3   3--  4   4--  5   5--  6   6--  7   7--  8   8--  9
#>   [9]   9-- 10  10-- 11  11-- 12  12-- 13  13-- 14  14-- 15  15-- 16  16-- 17
#>  [17]  17-- 18  18-- 19  19-- 20  20-- 21  21-- 22  22-- 23  23-- 24  24-- 25
#>  [25]  25-- 26  26-- 27  27-- 28  28-- 29  29-- 30  30-- 31  31-- 32  32-- 33
#>  [33]  33-- 34  34-- 35  35-- 36  36-- 37  37-- 38  38-- 39  39-- 40  40-- 41
#>  [41]  41-- 42  42-- 43  43-- 44  44-- 45  45-- 46  46-- 47  47-- 48  48-- 49
#>  [49]  49-- 50  50-- 51  51-- 52  52-- 53  53-- 54  54-- 55  55-- 56  56-- 57
#>  [57]  57-- 58  58-- 59  59-- 60  60-- 61  61-- 62  62-- 63  63-- 64  64-- 65
#>  [65]  65-- 66  66-- 67  67-- 68  68-- 69  69-- 70  70-- 71  71-- 72  72-- 73
#>  [73]  73-- 74  74-- 75  75-- 76  76-- 77  77-- 78  78-- 79  79-- 80  80-- 81
#>  [81]  81-- 82  82-- 83  83-- 84  84-- 85  85-- 86  86-- 87  87-- 88  88-- 89
#>  [89]  89-- 90  90-- 91  91-- 92  92-- 93  93-- 94  94-- 95  95-- 96  96-- 97
#>  [97]  97-- 98  98-- 99  99--100 100--101 101--102 102--103 103--104 104--105
#> [105] 105--106 106--107 107--108 108--109 109--110 110--111 111--112 112--113
#> [113] 113--114 114--115 115--116 116--117 117--118 118--119 119--120 120--121
#> [121] 121--122 122--123 123--124 124--125 125--126 126--127 127--128 128--129
#> [129] 129--130 130--131 131--132 132--133 133--134 134--135 135--136 136--137
#> [137] 137--138 138--139 139--140 140--141 141--142 142--143 143--144 144--145
#> [145] 145--146 146--147 147--148 148--149 149--150 150--151 151--152 152--153
#> [153] 153--154 154--155 155--156 156--157 157--158 158--159 159--160 160--161
#> [161] 161--162 162--163 163--164 164--165 165--166 166--167 167--168 168--169
#> [169] 169--170 170--171 171--172 172--173 173--174 174--175 175--176 176--177
#> [177] 177--178 178--179 179--180 180--181 181--182 182--183 183--184 184--185
#> [185] 185--186 186--187 187--188 188--189 189--190 190--191 191--192 192--193
#> [193] 193--194 194--195 195--196 196--197 197--198 198--199 199--200   1--200

# Metadata
g4 <- make_ring(10) %>%
  set_vertex_attr("name", value = LETTERS[1:10]) %>%
  set_edge_attr("weight", value = 1:10) %>%
  set_edge_attr("color", value = "green")
E(g4)
#> + 10/10 edges from d42d69f (vertex names):
#>  [1] A--B B--C C--D D--E E--F F--G G--H H--I I--J A--J
E(g4)[[]]
#> + 10/10 edges from d42d69f (vertex names):
#>    tail head tid hid weight color
#> 1     A    B   1   2      1 green
#> 2     B    C   2   3      2 green
#> 3     C    D   3   4      3 green
#> 4     D    E   4   5      4 green
#> 5     E    F   5   6      5 green
#> 6     F    G   6   7      6 green
#> 7     G    H   7   8      7 green
#> 8     H    I   8   9      8 green
#> 9     I    J   9  10      9 green
#> 10    A    J   1  10     10 green
E(g4)[[1:5]]
#> + 5/10 edges from d42d69f (vertex names):
#>   tail head tid hid weight color
#> 1    A    B   1   2      1 green
#> 2    B    C   2   3      2 green
#> 3    C    D   3   4      3 green
#> 4    D    E   4   5      4 green
#> 5    E    F   5   6      5 green
```
