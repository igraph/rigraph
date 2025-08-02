test_that("union() works", {
  order_by_two_first_columns <- function(x) x[order(x[, 1], x[, 2]), ]

  g1 <- make_ring(10)
  g2 <- make_star(11, center = 11, mode = "undirected")
  gu <- union(g1, g2)

  expect_vcount(gu, 11)
  expect_ecount(gu, 20)
  expect_equal(
    order_by_two_first_columns(rbind(as_edgelist(g1), as_edgelist(g2))),
    order_by_two_first_columns(as_edgelist(gu))
  )
  expect_isomorphic(difference(gu, g1), g2)
  expect_isomorphic(intersection(gu, g2), g2)
})

test_that("disjoint_union() works", {
  order_by_two_first_columns <- function(x) x[order(x[, 1], x[, 2]), ]

  g1 <- make_ring(10)
  g2 <- make_star(11, center = 11, mode = "undirected")
  gdu <- disjoint_union(g1, g2)
  expect_equal(
    order_by_two_first_columns(as_edgelist(gdu)),
    order_by_two_first_columns(rbind(
      as_edgelist(g1),
      as_edgelist(g2) + vcount(g1)
    ))
  )
})

test_that("disjoint_union() does not convert edge types", {
  # https://github.com/igraph/rigraph/issues/761

  g1 <- make_graph(~ A - -B)
  g2 <- make_graph(~ D - -E)

  g1 <- set_edge_attr(g1, "date", value = as.POSIXct(c("2021-01-01 01:01:01")))
  g2 <- set_edge_attr(g2, "date", value = as.POSIXct(c("2021-03-03 03:03:03")))

  u <- disjoint_union(g1, g2)

  expect_s3_class(E(u)$date, c("POSIXct", "POSIXt"))
})

test_that("disjoint_union() does not convert vertex types", {
  # https://github.com/igraph/rigraph/issues/1640

  g1 <- make_graph(~ B --C, C --D)
  g2 <- make_graph(~ A --G, E --F)

  g1 <- set_vertex_attr(
    g1,
    "date",
    value = as.POSIXct(c("2021-01-01 01:01:01", "2022-02-02 02:02:02", "2023-03-03 03:03:03"))
  )
  g2 <- set_vertex_attr(
    g2,
    "date",
    value = as.POSIXct(c("2021-03-03 03:03:03", "2022-04-04 04:04:04", "2023-05-05 05:05:05", "2024-06-06 06:06:06"))
  )

  u <- disjoint_union(g1, g2)

  expect_s3_class(vertex_attr(u, "date"), c("POSIXct", "POSIXt"))
})

test_that("intersection() works", {
  g1 <- make_ring(10)
  g2 <- make_star(11, center = 11, mode = "undirected")
  gu <- union(g1, g2)

  expect_isomorphic(intersection(gu, g1, keep.all.vertices = FALSE), g1)
})

test_that("complementer() works", {
  g2 <- make_star(11, center = 11, mode = "undirected")

  x <- complementer(complementer(g2))
  expect_identical_graphs(x, g2)

  gnp <- sample_gnp(50, 3 / 50)
  gnp_comp <- complementer(gnp)
  gnp_comp_comp <- complementer(gnp_comp)
  expect_isomorphic(gnp, gnp_comp_comp)
})


test_that("compose() works", {
  g1 <- make_ring(10)
  g2 <- make_star(11, center = 11, mode = "undirected")
  gu <- union(g1, g2)

  gc <- compose(gu, g1)
  expect_vcount(gc, 11)
  expect_ecount(gc, 60)
  expect_equal(diameter(gc), 2)

  gnp <- sample_gnp(50, 3 / 50, directed = TRUE)
  gnp_i <- make_graph(rep(1:vcount(gnp), each = 2), directed = TRUE)

  gnp_comp1 <- compose(gnp, gnp_i)
  gnp_comp2 <- compose(gnp_i, gnp)

  expect_isomorphic(gnp, gnp_comp1)
  expect_isomorphic(gnp, gnp_comp2)
})

test_that("compose works for named graphs", {
  g1 <- graph_from_literal(A - B:D:E, B - C:D, C - D, D - E)
  g2 <- graph_from_literal(A - B - E - A)

  V(g1)$bar1 <- seq_len(vcount(g1))
  V(g2)$bar2 <- seq_len(vcount(g2))
  V(g1)$foo <- letters[seq_len(vcount(g1))]
  V(g2)$foo <- letters[seq_len(vcount(g2))]

  E(g1)$bar1 <- seq_len(ecount(g1))
  E(g2)$bar2 <- seq_len(ecount(g2))
  E(g1)$foo <- letters[seq_len(ecount(g1))]
  E(g2)$foo <- letters[seq_len(ecount(g2))]

  g <- compose(g1, g2)
  df <- as_data_frame(g, what = "both")

  df.v <- read.table(
    stringsAsFactors = FALSE,
    textConnection(
      "
  bar1 foo_1 foo_2 bar2 name
A    1     a     a    1    A
B    2     b     b    2    B
D    3     c    NA   NA    D
E    4     d     c    3    E
C    5     e    NA   NA    C
"
    )
  )
  expect_equal(df$vertices, df.v)

  df.e <- read.table(
    stringsAsFactors = FALSE,
    textConnection(
      "
   from to bar1 foo_1 foo_2 bar2
1     A  B    3     c     c    3
2     A  A    3     c     b    2
3     A  E    1     a     c    3
4     A  A    1     a     a    1
5     B  E    1     a     b    2
6     B  B    1     a     a    1
7     B  D    6     f     c    3
8     A  D    6     f     b    2
9     D  E    4     d     c    3
10    A  D    4     d     a    1
11    D  E    2     b     b    2
12    B  D    2     b     a    1
13    E  E    3     c     b    2
14    B  E    3     c     a    1
15    E  C    5     e     c    3
16    A  C    5     e     a    1
"
    )
  )
  rownames(df$edges) <- rownames(df$edges)
  expect_equal(df$edges, df.e)
})


test_that("Union of directed named graphs", {
  graphs <- list(
    make_graph(~ 1:2:3:4:5, 1 -+ 2, 1 -+ 3, 2 -+ 3, 2 -+ 4, 3 -+ 4, 1 -+ 5, 3 -+ 5),
    make_graph(~ 1:2:3:4:5, 2 -+ 3, 1 -+ 4, 2 -+ 4, 3 -+ 4, 2 -+ 5, 3 -+ 5),
    make_graph(~ 1:2:3:4:5, 1 -+ 2, 1 -+ 3, 2 -+ 4, 3 -+ 4, 1 -+ 5, 4 -+ 5)
  )

  gg <- union.igraph(graphs)

  expect_vcount(gg, 5)
  expect_ecount(gg, 10)
})

test_that("edge reversal works", {
  directed_graph <- make_graph(~ 1 -+ 2, 1 -+ 3, 1 -+ 4, 2 -+ 3, 3 -+ 4)
  reverse_directed_graph <- reverse_edges(directed_graph, 1:3)
  expected <- make_graph(~ 1 +- 2, 1 +- 3, 1 +- 4, 2 -+ 3, 3 -+ 4)
  expect_isomorphic(reverse_directed_graph, expected)

  reverse_all_directed_graph <- reverse_edges(directed_graph)
  expect_vcount(reverse_all_directed_graph, vcount(directed_graph))
  expect_equal(
    as_edgelist(reverse_all_directed_graph),
    as_edgelist(directed_graph)[, c(2, 1)]
  )

  undirected_graph <- make_graph(~ 1 - -2, 1 - -3, 1 - -4, 2 - -3, 3 - -4)
  reverse_undirected_graph <- reverse_edges(undirected_graph, 1:3)
  expect_identical_graphs(undirected_graph, reverse_undirected_graph)

  isolated_vertices_g <- make_graph(~ 1:2:3:4:5, 1 -+ 2, 1 -+ 4)
  reverse_isolated_vertices_g <- reverse_edges(isolated_vertices_g)
  expect_vcount(reverse_isolated_vertices_g, vcount(isolated_vertices_g))
  expect_equal(
    as_edgelist(reverse_isolated_vertices_g),
    as_edgelist(isolated_vertices_g)[, c(2, 1)]
  )
})

test_that("t() is aliased to edge reversal for graphs", {
  g <- make_graph(~ 1 -+ 2, 1 -+ 3, 1 -+ 4, 2 -+ 3, 3 -+ 4)
  expect_vcount(t(g), vcount(g))
  expect_equal(as_edgelist(t(g)), as_edgelist(g)[, c(2, 1)])
})

test_that("vertices() works", {
  g_all_unnamed <- make_empty_graph(1) + vertices("a", "b")
  expect_s3_class(V(g_all_unnamed), "igraph.vs")
  expect_identical(V(g_all_unnamed)$name, c(NA, "a", "b"))

  g_mix_named_unnamed <- make_empty_graph(1) + vertices("a", "b", foo = 5)
  expect_s3_class(V(g_mix_named_unnamed), "igraph.vs")
  expect_true(is.na(V(g_mix_named_unnamed)$name[1]))
  expect_identical(V(g_mix_named_unnamed)$name[-1], c("a", "b"))
  expect_equal(V(g_mix_named_unnamed)$foo, c(NA, 5, 5))

  g_mix_bigger_attribute <- make_empty_graph(1) +
    vertices("a", "b", "c", foo = 5:7, bar = 8)
  expect_s3_class(V(g_mix_bigger_attribute), "igraph.vs")
  expect_identical(V(g_mix_bigger_attribute)$name, c(NA, "a", "b", "c"))
  expect_equal(V(g_mix_bigger_attribute)$foo, c(NA, 5, 6, 7))
  expect_equal(V(g_mix_bigger_attribute)$bar, c(NA, 8, 8, 8))

  g_one_unnamed <- make_empty_graph(1) + vertices(letters)
  expect_s3_class(V(g_one_unnamed), "igraph.vs")
  expect_identical(V(g_one_unnamed)$name, c(NA, letters))

  g_all_named <- make_empty_graph(1) + vertices(foo = 5:7)
  expect_s3_class(V(g_all_named), "igraph.vs")
  expect_null(V(g_all_named)$name)
  expect_identical(V(g_all_named)$foo, c(NA, 5:7))

  g_all_named_empty <- make_empty_graph(1) + vertices(foo = numeric())
  expect_s3_class(V(g_all_named_empty), "igraph.vs")
  expect_null(V(g_all_named_empty)$name)
  expect_identical(V(g_all_named_empty)$foo, NA_real_)

  g_none <- make_empty_graph(1) + vertices()
  expect_s3_class(V(g_none), "igraph.vs")
  expect_null(V(g_none)$name)

  expect_snapshot_error(make_empty_graph(1) + vertices("a", "b", foo = 5:7))
})

test_that("infix operators work", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]
  E(g)$name <- LETTERS[1:10]

  g <- g - c("a", "b")
  expect_vcount(g, 8)
  expect_ecount(g, 7)
  expect_isomorphic(g, make_lattice(8))

  g <- g - edge("e|f")
  expect_isomorphic(g, make_lattice(5) + make_lattice(3))

  g <- g - edge("H")
  expect_isomorphic(g, graph_from_literal(a - b - c, d - e - f, g - h))

  g <- make_ring(10)
  V(g)$name <- letters[1:10]
  g <- g - path("a", "b")
  expect_isomorphic(
    g,
    graph_from_literal(a, b - c - d - e - f - g - h - i - j - a)
  )
  g <- g + path("a", "b")
  expect_isomorphic(g, make_ring(10))

  g <- make_ring(10)
  V(g)$name <- letters[1:10]

  g <- g - path("a", "b", "c", "d")
  expect_isomorphic(g, make_lattice(8) + 2)

  expect_isomorphic(
    g - V(g)[c("d", "g")],
    make_lattice(4) + make_lattice(2) + 2
  )

  expect_isomorphic(
    g - E(g)["f" %--% "g"],
    make_lattice(5) + make_lattice(3) + 2
  )
})

test_that("disjoint union works for named graphs", {
  g1 <- g2 <- make_ring(10)
  g1$foo <- "bar"
  V(g1)$name <- letters[1:10]
  V(g2)$name <- letters[11:20]
  E(g1)$weight <- 1:10
  E(g2)$weight <- 10:1

  V(g1)$a1 <- 1:10
  V(g2)$a2 <- 11:20

  E(g1)$b1 <- 1:10
  E(g2)$b2 <- 11:20

  g <- disjoint_union(g1, g2)

  expect_equal(
    sort(graph_attr_names(g)),
    c("circular_1", "circular_2", "foo", "mutual_1", "mutual_2", "name_1", "name_2")
  )
  expect_equal(
    sort(vertex_attr_names(g)),
    c("a1", "a2", "name")
  )
  expect_equal(
    sort(edge_attr_names(g)),
    c("b1", "b2", "weight")
  )

  expect_equal(V(g)$name, letters[1:20])
  expect_equal(V(g)$a1, c(1:10, rep(NA, 10)))
  expect_equal(V(g)$a2, c(rep(NA, 10), 11:20))

  expect_equal(E(g)$weight, c(1:10, 10:1))
  expect_equal(E(g)$b1, c(1:10, rep(NA, 10)))
  expect_equal(E(g)$b2, c(rep(NA, 10), 11:20))
})

test_that("disjoint union gives warning for non-unique vertex names", {
  g1 <- make_ring(5)
  V(g1)$name <- letters[1:5]
  g2 <- make_ring(5)
  V(g2)$name <- letters[5:9]

  expect_warning(
    disjoint_union(g1, g2),
    "Duplicate vertex names in disjoint union"
  )
})

test_that("disjoint union handles mixed named/unnamed graphs", {
  # Test named + unnamed graphs
  g1 <- make_ring(4)
  g2 <- make_ring(3)
  V(g1)$name <- c("A", "B", "C", "D")

  result <- disjoint_union(g1, g2)
  
  expect_equal(V(result)$name, c("A", "B", "C", "D", "V1", "V2", "V3"))
  expect_equal(vcount(result), 7)
  expect_equal(ecount(result), 7)
  
  # Test with existing V-pattern names
  g3 <- make_ring(3)
  g4 <- make_ring(2)
  V(g3)$name <- c("V1", "V2", "V3")
  
  result2 <- disjoint_union(g3, g4)
  expect_equal(V(result2)$name, c("V1", "V2", "V3", "V4", "V5"))
  
  # Test unnamed + named graphs (should work the same)
  result3 <- disjoint_union(g2, g1)
  expect_equal(V(result3)$name, c("V1", "V2", "V3", "A", "B", "C", "D"))
  
  # Test all unnamed graphs (should not add names)
  g5 <- make_ring(2)
  g6 <- make_ring(2)
  result4 <- disjoint_union(g5, g6)
  expect_true(is.null(V(result4)$name) || all(is.na(V(result4)$name)))
  
  # Test all named graphs (should work as before)
  g7 <- make_ring(2)
  g8 <- make_ring(2)
  V(g7)$name <- c("X", "Y")
  V(g8)$name <- c("P", "Q")
  
  result5 <- disjoint_union(g7, g8)
  expect_equal(V(result5)$name, c("X", "Y", "P", "Q"))
})


test_that("union of unnamed graphs works", {
  g1 <- make_ring(10)
  g2 <- make_ring(13)
  g1$foo <- "bar"
  E(g1)$weight <- 1:10
  E(g2)$weight <- 13:1

  V(g1)$a1 <- 1:10
  V(g2)$a2 <- 11:23

  E(g1)$b1 <- letters[1:10]
  E(g2)$b2 <- letters[11:23]

  g <- union.igraph(g1, g2)

  expect_equal(
    sort(graph_attr_names(g)),
    c("circular_1", "circular_2", "foo", "mutual_1", "mutual_2", "name_1", "name_2")
  )
  expect_equal(
    sort(vertex_attr_names(g)),
    c("a1", "a2")
  )
  expect_equal(
    sort(edge_attr_names(g)),
    c("b1", "b2", "weight_1", "weight_2")
  )

  df1 <- as_data_frame(g)
  df1 <- df1[order(df1$from, df1$to), c(1, 2, 3, 5, 4, 6)]
  df2 <- merge(
    as_data_frame(g1),
    as_data_frame(g2),
    by = c("from", "to"),
    all = TRUE
  )
  rownames(df1) <- seq_len(nrow(df1))
  colnames(df2) <- c("from", "to", "weight_1", "b1", "weight_2", "b2")
  expect_equal(df1, df2)
})

test_that("union of named graphs works", {
  g1 <- make_ring(10)
  g2 <- make_ring(13)
  V(g1)$name <- letters[seq_len(vcount(g1))]
  V(g2)$name <- letters[seq_len(vcount(g2))]

  g1$foo <- "bar"
  E(g1)$weight <- 1:10
  E(g2)$weight <- 13:1

  V(g1)$a1 <- 1:10
  V(g2)$a2 <- 11:23

  E(g1)$b1 <- letters[1:10]
  E(g2)$b2 <- letters[11:23]

  g <- union.igraph(g1, g2)

  expect_equal(
    sort(graph_attr_names(g)),
    c("circular_1", "circular_2", "foo", "mutual_1", "mutual_2", "name_1", "name_2")
  )
  expect_equal(
    sort(vertex_attr_names(g)),
    c("a1", "a2", "name")
  )
  expect_equal(
    sort(edge_attr_names(g)),
    c("b1", "b2", "weight_1", "weight_2")
  )

  df1 <- as_data_frame(g, what = "both")

  g.v <- read.table(
    stringsAsFactors = FALSE,
    textConnection(
      "
  a1 a2 name
a  1 11    a
b  2 12    b
c  3 13    c
d  4 14    d
e  5 15    e
f  6 16    f
g  7 17    g
h  8 18    h
i  9 19    i
j 10 20    j
k NA 21    k
l NA 22    l
m NA 23    m
"
    )
  )
  expect_equal(df1$vertices, g.v)

  g.e <- read.table(
    stringsAsFactors = FALSE,
    textConnection(
      "
   from to weight_1 weight_2   b1   b2
1     l  m       NA        2   NA    v
2     k  l       NA        3   NA    u
3     j  k       NA        4   NA    t
4     i  j        9        5    i    s
5     h  i        8        6    h    r
6     g  h        7        7    g    q
7     f  g        6        8    f    p
8     e  f        5        9    e    o
9     d  e        4       10    d    n
10    c  d        3       11    c    m
11    b  c        2       12    b    l
12    a  m       NA        1   NA    w
13    a  j       10       NA    j   NA
14    a  b        1       13    a    k
"
    )
  )
  rownames(df1$edges) <- rownames(df1$edges)
  expect_equal(df1$edges, g.e)
})

test_that("intersection of named graphs works", {
  g1 <- make_ring(10)
  g2 <- make_ring(13)
  V(g1)$name <- letters[V(g1)]
  V(g2)$name <- letters[V(g2)]

  g1$foo <- "bar"
  E(g1)$weight <- 1:10
  E(g2)$weight <- 13:1

  V(g1)$a1 <- 1:10
  V(g2)$a2 <- 11:23

  E(g1)$b1 <- letters[1:10]
  E(g2)$b2 <- letters[11:23]

  g <- intersection(g1, g2, keep.all.vertices = FALSE)

  expect_equal(
    sort(graph_attr_names(g)),
    c("circular_1", "circular_2", "foo", "mutual_1", "mutual_2", "name_1", "name_2")
  )
  expect_equal(
    sort(vertex_attr_names(g)),
    c("a1", "a2", "name")
  )
  expect_equal(
    sort(edge_attr_names(g)),
    c("b1", "b2", "weight_1", "weight_2")
  )

  df1 <- as_data_frame(g, what = "both")

  g.e <- read.table(
    stringsAsFactors = FALSE,
    textConnection(
      "
  from to weight_1 weight_2 b1 b2
1    i  j        9        5  i  s
2    h  i        8        6  h  r
3    g  h        7        7  g  q
4    f  g        6        8  f  p
5    e  f        5        9  e  o
6    d  e        4       10  d  n
7    c  d        3       11  c  m
8    b  c        2       12  b  l
9    a  b        1       13  a  k
"
    )
  )
  rownames(df1$edges) <- rownames(df1$edges)
  expect_equal(df1$edges, g.e)

  g.v <- read.table(
    stringsAsFactors = FALSE,
    textConnection(
      "
  a1 a2 name
a  1 11    a
b  2 12    b
c  3 13    c
d  4 14    d
e  5 15    e
f  6 16    f
g  7 17    g
h  8 18    h
i  9 19    i
j 10 20    j
"
    )
  )
  expect_equal(df1$vertices, g.v)

  gg <- intersection(g1, g2, keep.all.vertices = TRUE)

  df2 <- as_data_frame(gg, what = "both")

  rownames(df2$edges) <- rownames(df2$edges)
  expect_equal(df2$edges, g.e)

  gg.v <- read.table(
    stringsAsFactors = FALSE,
    textConnection(
      "
  a1 a2 name
a  1 11    a
b  2 12    b
c  3 13    c
d  4 14    d
e  5 15    e
f  6 16    f
g  7 17    g
h  8 18    h
i  9 19    i
j 10 20    j
k NA 21    k
l NA 22    l
m NA 23    m
"
    )
  )
  expect_equal(df2$vertices, gg.v)
})

test_that("difference of named graphs works", {
  g1 <- make_ring(10)
  g2 <- make_star(11, center = 11, mode = "undirected")
  V(g1)$name <- letters[1:10]
  V(g2)$name <- letters[1:11]
  g <- g1 %u% g2

  sg <- make_ring(4)
  V(sg)$name <- letters[c(1, 2, 3, 11)]

  df1 <- as_data_frame(g - sg, what = "both")

  t1.e <- read.table(
    stringsAsFactors = FALSE,
    textConnection(
      "
   from to
1     a  j
2     b  k
3     c  d
4     j  k
5     i  k
6     h  k
7     g  k
8     f  k
9     e  k
10    d  k
11    d  e
12    e  f
13    f  g
14    g  h
15    h  i
16    i  j
"
    )
  )
  rownames(df1$edges) <- rownames(df1$edges)
  expect_equal(df1$edges, t1.e)

  expect_equal(
    df1$vertices,
    data.frame(
      row.names = letters[1:11],
      name = letters[1:11],
      stringsAsFactors = FALSE
    )
  )

  gg <- sg - g

  expect_ecount(gg, 0)
  expect_equal(V(gg)$name, letters[c(1:3, 11)])
})


test_that("intersection of non-named graphs keeps attributes properly", {
  withr::local_seed(42)

  g <- sample_gnp(10, 1 / 2)
  g2 <- sample_gnp(10, 1 / 2)
  E(g)$weight <- sample(ecount(g))
  E(g2)$weight <- sample(ecount(g2))

  gi <- intersection(g, g2)

  rn <- function(D) {
    rownames(D) <- paste(D[, 1], D[, 2], sep = "-")
    D
  }

  df <- rn(as_data_frame(g))
  df2 <- rn(as_data_frame(g2))
  dfi <- rn(as_data_frame(gi))

  expect_equal(df[rownames(dfi), ], dfi[, 1:3], ignore_attr = TRUE)
  expect_equal(df2[rownames(dfi), ], dfi[, c(1, 2, 4)], ignore_attr = TRUE)
})

test_that("union of non-named graphs keeps attributes properly", {
  withr::local_seed(42)

  g <- sample_gnp(10, 1 / 2)
  g2 <- sample_gnp(10, 1 / 2)
  E(g)$weight <- sample(ecount(g))
  E(g2)$weight <- sample(ecount(g2))

  gu <- union.igraph(g, g2)

  rn <- function(D) {
    rownames(D) <- paste(D[, 1], D[, 2], sep = "-")
    D
  }

  df <- rn(as_data_frame(g))
  df2 <- rn(as_data_frame(g2))
  dfu <- rn(as_data_frame(gu))

  expect_equal(dfu[rownames(df), 1:3], df, ignore_attr = TRUE)
  expect_equal(dfu[rownames(df2), c(1, 2, 4)], df2, ignore_attr = TRUE)

  expect_equal(
    dfu[!rownames(dfu) %in% rownames(df), 3],
    rep(NA_real_, ecount(gu) - ecount(g))
  )
  expect_equal(
    dfu[!rownames(dfu) %in% rownames(df2), 4],
    rep(NA_real_, ecount(gu) - ecount(g2))
  )
})

test_that("c on attached vs", {
  g <- make_ring(10)

  vg <- V(g)[1:5]
  vg2 <- V(g)[6:10]
  expect_equal(ignore_attr = TRUE, c(vg, vg2), V(g))
  expect_equal(get_vs_graph_id(c(vg, vg2)), get_graph_id(g))

  vg <- V(g)
  vg2 <- V(g)[FALSE]
  expect_equal(ignore_attr = TRUE, c(vg, vg2), V(g))
  expect_equal(ignore_attr = TRUE, c(vg2, vg), V(g))

  vg <- V(g)[c(2, 5, 6, 8)]
  expect_equal(ignore_attr = TRUE, c(vg, vg), V(g)[c(2, 5, 6, 8, 2, 5, 6, 8)])
})

test_that("c on detached vs", {
  g <- make_ring(10)

  vg <- V(g)[1:5]
  vg2 <- V(g)[6:10]

  vg3 <- V(g)
  vg4 <- V(g)[FALSE]

  vg5 <- V(g)[c(2, 5, 6, 8)]
  vg6 <- V(g)[c(2, 5, 6, 8, 2, 5, 6, 8)]

  rm(g)
  gc()

  expect_equal(ignore_attr = TRUE, c(vg, vg2), vg3)
  expect_equal(ignore_attr = TRUE, c(vg3, vg4), vg3)
  expect_equal(ignore_attr = TRUE, c(vg4, vg3), vg3)
  expect_equal(ignore_attr = TRUE, c(vg5, vg5), vg6)
})

test_that("c on attached vs, names", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]

  vg <- V(g)[1:5]
  vg2 <- V(g)[6:10]
  expect_equal(ignore_attr = TRUE, c(vg, vg2), V(g))
  expect_equal(names(c(vg, vg2)), names(V(g)))

  vg <- V(g)
  vg2 <- V(g)[FALSE]
  expect_equal(ignore_attr = TRUE, c(vg, vg2), V(g))
  expect_equal(names(c(vg, vg2)), names(V(g)))
  expect_equal(ignore_attr = TRUE, c(vg2, vg), V(g))
  expect_equal(names(c(vg2, vg)), names(V(g)))

  vg <- V(g)[c(2, 5, 6, 8)]
  expect_equal(ignore_attr = TRUE, c(vg, vg), V(g)[c(2, 5, 6, 8, 2, 5, 6, 8)])
  expect_equal(names(c(vg, vg)), names(V(g)[c(2, 5, 6, 8, 2, 5, 6, 8)]))
})

test_that("c on detached vs, names", {
  g <- make_ring(10)

  vg <- V(g)[1:5]
  vg2 <- V(g)[6:10]

  vg3 <- V(g)
  vg4 <- V(g)[FALSE]

  vg5 <- V(g)[c(2, 5, 6, 8)]
  vg6 <- V(g)[c(2, 5, 6, 8, 2, 5, 6, 8)]

  rm(g)
  gc()

  expect_equal(ignore_attr = TRUE, c(vg, vg2), vg3)
  expect_equal(names(c(vg, vg2)), names(vg3))
  expect_equal(ignore_attr = TRUE, c(vg3, vg4), vg3)
  expect_equal(names(c(vg3, vg4)), names(vg3))
  expect_equal(ignore_attr = TRUE, c(vg4, vg3), vg3)
  expect_equal(names(c(vg3, vg4)), names(vg3))
  expect_equal(ignore_attr = TRUE, c(vg5, vg5), vg6)
  expect_equal(names(c(vg5, vg5)), names(vg6))
})


test_that("union on attached vs", {
  g <- make_ring(10)

  v1 <- V(g)[1:7]
  v2 <- V(g)[6:10]
  vu <- union(v1, v2)
  expect_equal(ignore_attr = TRUE, vu, V(g))

  expect_equal(ignore_attr = TRUE, union(V(g)), V(g))

  v3 <- V(g)[FALSE]
  expect_equal(ignore_attr = TRUE, union(V(g), v3), V(g))
  expect_equal(ignore_attr = TRUE, union(v3, V(g), v3), V(g))
  expect_equal(ignore_attr = TRUE, union(v3), v3)
  expect_equal(ignore_attr = TRUE, union(v3, v3, v3), v3)
  expect_equal(ignore_attr = TRUE, union(v3, v3), v3)
})

test_that("union on detached vs", {
  g <- make_ring(10)

  vg <- V(g)
  v1 <- V(g)[1:7]
  v2 <- V(g)[6:10]
  vu <- union(v1, v2)
  v3 <- V(g)[FALSE]

  rm(g)
  gc()

  expect_equal(ignore_attr = TRUE, vu, vg)

  expect_equal(ignore_attr = TRUE, union(vg), vg)

  expect_equal(ignore_attr = TRUE, union(vg, v3), vg)
  expect_equal(ignore_attr = TRUE, union(v3, vg, v3), vg)
  expect_equal(ignore_attr = TRUE, union(v3), v3)
  expect_equal(ignore_attr = TRUE, union(v3, v3, v3), v3)
  expect_equal(ignore_attr = TRUE, union(v3, v3), v3)
})

test_that("union on attached vs, names", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]

  v1 <- V(g)[1:7]
  v2 <- V(g)[6:10]
  vu <- union(v1, v2)
  expect_equal(ignore_attr = TRUE, vu, V(g))
  expect_equal(names(vu), names(V(g)))

  expect_equal(ignore_attr = TRUE, union(V(g)), V(g))
  expect_equal(names(union(V(g))), names(V(g)))

  v3 <- V(g)[FALSE]
  expect_equal(ignore_attr = TRUE, union(V(g), v3), V(g))
  expect_equal(names(union(V(g), v3)), names(V(g)))

  expect_equal(ignore_attr = TRUE, union(v3, V(g), v3), V(g))
  expect_equal(names(union(v3, V(g), v3)), names(V(g)))

  expect_equal(ignore_attr = TRUE, union(v3), v3)
  expect_equal(names(union(v3)), names(v3))

  expect_equal(ignore_attr = TRUE, union(v3, v3, v3), v3)
  expect_equal(names(union(v3, v3, v3)), names(v3))

  expect_equal(ignore_attr = TRUE, union(v3, v3), v3)
  expect_equal(names(union(v3, v3)), names(v3))
})

test_that("union on detached vs, names", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]

  vg <- V(g)
  v1 <- V(g)[1:7]
  v2 <- V(g)[6:10]
  v3 <- V(g)[FALSE]

  rm(g)
  gc()

  vu <- union(v1, v2)
  expect_equal(ignore_attr = TRUE, vu, vg)
  expect_equal(names(vu), names(vg))

  expect_equal(ignore_attr = TRUE, union(vg), vg)
  expect_equal(names(union(vg)), names(vg))

  expect_equal(ignore_attr = TRUE, union(vg, v3), vg)
  expect_equal(names(union(vg, v3)), names(vg))

  expect_equal(ignore_attr = TRUE, union(v3, vg, v3), vg)
  expect_equal(names(union(v3, vg, v3)), names(vg))

  expect_equal(ignore_attr = TRUE, union(v3), v3)
  expect_equal(names(union(v3)), names(v3))

  expect_equal(ignore_attr = TRUE, union(v3, v3, v3), v3)
  expect_equal(names(union(v3, v3, v3)), names(v3))

  expect_equal(ignore_attr = TRUE, union(v3, v3), v3)
  expect_equal(names(union(v3, v3)), names(v3))
})

test_that("intersection on attached vs", {
  g <- make_ring(10)

  vg <- V(g)
  v1 <- V(g)[1:7]
  v2 <- V(g)[6:10]
  v3 <- V(g)[FALSE]
  v4 <- V(g)[1:3]

  v12 <- V(g)[6:7]
  v13 <- V(g)[FALSE]
  v14 <- V(g)[1:3]
  v24 <- V(g)[FALSE]

  vi1 <- intersection(v1, v2)
  expect_equal(ignore_attr = TRUE, vi1, v12)

  vi2 <- intersection(v1, v3)
  expect_equal(ignore_attr = TRUE, vi2, v13)

  vi3 <- intersection(v1, v4)
  expect_equal(ignore_attr = TRUE, vi3, v14)

  vi4 <- intersection(v1, vg)
  expect_equal(ignore_attr = TRUE, vi4, v1)

  vi5 <- intersection(v2, v4)
  expect_equal(ignore_attr = TRUE, vi5, v24)

  vi6 <- intersection(v3, vg)
  expect_equal(ignore_attr = TRUE, vi6, v3)
})

test_that("intersection on detached vs", {
  g <- make_ring(10)

  vg <- V(g)
  v1 <- V(g)[1:7]
  v2 <- V(g)[6:10]
  v3 <- V(g)[FALSE]
  v4 <- V(g)[1:3]

  v12 <- V(g)[6:7]
  v13 <- V(g)[FALSE]
  v14 <- V(g)[1:3]
  v24 <- V(g)[FALSE]

  rm(g)
  gc()

  vi1 <- intersection(v1, v2)
  expect_equal(ignore_attr = TRUE, vi1, v12)

  vi2 <- intersection(v1, v3)
  expect_equal(ignore_attr = TRUE, vi2, v13)

  vi3 <- intersection(v1, v4)
  expect_equal(ignore_attr = TRUE, vi3, v14)

  vi4 <- intersection(v1, vg)
  expect_equal(ignore_attr = TRUE, vi4, v1)

  vi5 <- intersection(v2, v4)
  expect_equal(ignore_attr = TRUE, vi5, v24)

  vi6 <- intersection(v3, vg)
  expect_equal(ignore_attr = TRUE, vi6, v3)
})

test_that("intersection on attached vs, names", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]

  vg <- V(g)
  v1 <- V(g)[1:7]
  v2 <- V(g)[6:10]
  v3 <- V(g)[FALSE]
  v4 <- V(g)[1:3]

  v12 <- V(g)[6:7]
  v13 <- V(g)[FALSE]
  v14 <- V(g)[1:3]
  v24 <- V(g)[FALSE]

  vi1 <- intersection(v1, v2)
  expect_equal(ignore_attr = TRUE, vi1, v12)
  expect_equal(names(vi1), names(v12))

  vi2 <- intersection(v1, v3)
  expect_equal(ignore_attr = TRUE, vi2, v13)
  expect_equal(names(vi2), names(v13))

  vi3 <- intersection(v1, v4)
  expect_equal(ignore_attr = TRUE, vi3, v14)
  expect_equal(names(vi3), names(v14))

  vi4 <- intersection(v1, vg)
  expect_equal(ignore_attr = TRUE, vi4, v1)
  expect_equal(names(vi4), names(v1))

  vi5 <- intersection(v2, v4)
  expect_equal(ignore_attr = TRUE, vi5, v24)
  expect_equal(names(vi5), names(v24))

  vi6 <- intersection(v3, vg)
  expect_equal(ignore_attr = TRUE, vi6, v3)
  expect_equal(names(vi6), names(v3))
})

test_that("intersection on detached vs, names", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]

  vg <- V(g)
  v1 <- V(g)[1:7]
  v2 <- V(g)[6:10]
  v3 <- V(g)[FALSE]
  v4 <- V(g)[1:3]

  v12 <- V(g)[6:7]
  v13 <- V(g)[FALSE]
  v14 <- V(g)[1:3]
  v24 <- V(g)[FALSE]

  rm(g)
  gc()

  vi1 <- intersection(v1, v2)
  expect_equal(ignore_attr = TRUE, vi1, v12)
  expect_equal(names(vi1), names(v12))

  vi2 <- intersection(v1, v3)
  expect_equal(ignore_attr = TRUE, vi2, v13)
  expect_equal(names(vi2), names(v13))

  vi3 <- intersection(v1, v4)
  expect_equal(ignore_attr = TRUE, vi3, v14)
  expect_equal(names(vi3), names(v14))

  vi4 <- intersection(v1, vg)
  expect_equal(ignore_attr = TRUE, vi4, v1)
  expect_equal(names(vi4), names(v1))

  vi5 <- intersection(v2, v4)
  expect_equal(ignore_attr = TRUE, vi5, v24)
  expect_equal(names(vi5), names(v24))

  vi6 <- intersection(v3, vg)
  expect_equal(ignore_attr = TRUE, vi6, v3)
  expect_equal(names(vi6), names(v3))
})

test_that("difference on attached vs", {
  g <- make_ring(10)

  vg <- V(g)
  v1 <- V(g)[1:7]
  v2 <- V(g)[6:10]
  v3 <- V(g)[FALSE]
  v4 <- V(g)[1:3]

  vr1 <- V(g)[8:10]
  vr2 <- V(g)
  vr3 <- V(g)[1:5]
  vr4 <- V(g)[4:7]
  vr5 <- V(g)[FALSE]
  vr6 <- V(g)[FALSE]

  vd1 <- difference(vg, v1)
  vd2 <- difference(vg, v3)
  vd3 <- difference(v1, v2)
  vd4 <- difference(v1, v4)
  vd5 <- difference(v3, v3)
  vd6 <- difference(v3, v4)

  expect_equal(ignore_attr = TRUE, vd1, vr1)
  expect_equal(ignore_attr = TRUE, vd2, vr2)
  expect_equal(ignore_attr = TRUE, vd3, vr3)
  expect_equal(ignore_attr = TRUE, vd4, vr4)
  expect_equal(ignore_attr = TRUE, vd5, vr5)
  expect_equal(ignore_attr = TRUE, vd6, vr6)
})

test_that("difference on detached vs", {
  g <- make_ring(10)

  vg <- V(g)
  v1 <- V(g)[1:7]
  v2 <- V(g)[6:10]
  v3 <- V(g)[FALSE]
  v4 <- V(g)[1:3]

  vr1 <- V(g)[8:10]
  vr2 <- V(g)
  vr3 <- V(g)[1:5]
  vr4 <- V(g)[4:7]
  vr5 <- V(g)[FALSE]
  vr6 <- V(g)[FALSE]

  rm(g)
  gc()

  vd1 <- difference(vg, v1)
  vd2 <- difference(vg, v3)
  vd3 <- difference(v1, v2)
  vd4 <- difference(v1, v4)
  vd5 <- difference(v3, v3)
  vd6 <- difference(v3, v4)

  expect_equal(ignore_attr = TRUE, vd1, vr1)
  expect_equal(ignore_attr = TRUE, vd2, vr2)
  expect_equal(ignore_attr = TRUE, vd3, vr3)
  expect_equal(ignore_attr = TRUE, vd4, vr4)
  expect_equal(ignore_attr = TRUE, vd5, vr5)
  expect_equal(ignore_attr = TRUE, vd6, vr6)
})

test_that("difference on attached vs, names", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]

  vg <- V(g)
  v1 <- V(g)[1:7]
  v2 <- V(g)[6:10]
  v3 <- V(g)[FALSE]
  v4 <- V(g)[1:3]

  vr1 <- V(g)[8:10]
  vr2 <- V(g)
  vr3 <- V(g)[1:5]
  vr4 <- V(g)[4:7]
  vr5 <- V(g)[FALSE]
  vr6 <- V(g)[FALSE]

  vd1 <- difference(vg, v1)
  vd2 <- difference(vg, v3)
  vd3 <- difference(v1, v2)
  vd4 <- difference(v1, v4)
  vd5 <- difference(v3, v3)
  vd6 <- difference(v3, v4)

  expect_equal(ignore_attr = TRUE, vd1, vr1)
  expect_equal(names(vd1), names(vr1))

  expect_equal(ignore_attr = TRUE, vd2, vr2)
  expect_equal(names(vd2), names(vr2))

  expect_equal(ignore_attr = TRUE, vd3, vr3)
  expect_equal(names(vd3), names(vr3))

  expect_equal(ignore_attr = TRUE, vd4, vr4)
  expect_equal(names(vd4), names(vr4))

  expect_equal(ignore_attr = TRUE, vd5, vr5)
  expect_equal(names(vd5), names(vr5))

  expect_equal(ignore_attr = TRUE, vd6, vr6)
  expect_equal(names(vd6), names(vr6))
})

test_that("difference on detached vs, names", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]

  vg <- V(g)
  v1 <- V(g)[1:7]
  v2 <- V(g)[6:10]
  v3 <- V(g)[FALSE]
  v4 <- V(g)[1:3]

  vr1 <- V(g)[8:10]
  vr2 <- V(g)
  vr3 <- V(g)[1:5]
  vr4 <- V(g)[4:7]
  vr5 <- V(g)[FALSE]
  vr6 <- V(g)[FALSE]

  rm(g)
  gc()

  vd1 <- difference(vg, v1)
  vd2 <- difference(vg, v3)
  vd3 <- difference(v1, v2)
  vd4 <- difference(v1, v4)
  vd5 <- difference(v3, v3)
  vd6 <- difference(v3, v4)

  expect_equal(ignore_attr = TRUE, vd1, vr1)
  expect_equal(names(vd1), names(vr1))

  expect_equal(ignore_attr = TRUE, vd2, vr2)
  expect_equal(names(vd2), names(vr2))

  expect_equal(ignore_attr = TRUE, vd3, vr3)
  expect_equal(names(vd3), names(vr3))

  expect_equal(ignore_attr = TRUE, vd4, vr4)
  expect_equal(names(vd4), names(vr4))

  expect_equal(ignore_attr = TRUE, vd5, vr5)
  expect_equal(names(vd5), names(vr5))

  expect_equal(ignore_attr = TRUE, vd6, vr6)
  expect_equal(names(vd6), names(vr6))
})

test_that("rev on attached vs", {
  for (i in 1:10) {
    g <- make_ring(10)
    idx <- seq_len(i)
    vg <- V(g)[idx]
    vgr <- V(g)[rev(idx)]
    vg2 <- rev(vg)
    expect_equal(ignore_attr = TRUE, vg2, vgr)
  }
})

test_that("rev on detached vs", {
  for (i in 1:10) {
    g <- make_ring(10)
    idx <- seq_len(i)
    vg <- V(g)[idx]
    vgr <- V(g)[rev(idx)]
    rm(g)
    gc()
    vg2 <- rev(vg)
    expect_equal(ignore_attr = TRUE, vg2, vgr)
  }
})

test_that("rev on attached vs, names", {
  for (i in 1:10) {
    g <- make_ring(10)
    V(g)$name <- letters[1:10]
    idx <- seq_len(i)
    vg <- V(g)[idx]
    vgr <- V(g)[rev(idx)]
    vg2 <- rev(vg)
    expect_equal(ignore_attr = TRUE, vg2, vgr)
    expect_equal(names(vg2), names(vgr))
  }
})

test_that("rev on detached vs, names", {
  for (i in 1:10) {
    g <- make_ring(10)
    V(g)$name <- letters[1:10]
    idx <- seq_len(i)
    vg <- V(g)[idx]
    vgr <- V(g)[rev(idx)]
    rm(g)
    gc()
    vg2 <- rev(vg)
    expect_equal(ignore_attr = TRUE, vg2, vgr)
    expect_equal(names(vg2), names(vgr))
  }
})

unique_tests <- list(
  list(1:5, 1:5),
  list(c(1, 1, 2:5), 1:5),
  list(c(1, 1, 1, 1), 1),
  list(c(1, 2, 2, 2), 1:2),
  list(c(2, 2, 1, 1), 2:1),
  list(c(1, 2, 1, 2), 1:2),
  list(c(), c())
)

test_that("unique on attached vs", {
  sapply(unique_tests, function(d) {
    g <- make_ring(10)
    vg <- unique(V(g)[d[[1]]])
    vr <- V(g)[d[[2]]]
    expect_equal(ignore_attr = TRUE, vg, vr)
  })
})

test_that("unique on detached vs", {
  sapply(unique_tests, function(d) {
    g <- make_ring(10)
    vg <- V(g)[d[[1]]]
    vr <- V(g)[d[[2]]]
    rm(g)
    gc()
    vg <- unique(vg)
    expect_equal(ignore_attr = TRUE, vg, vr)
  })
})

test_that("unique on attached vs, names", {
  sapply(unique_tests, function(d) {
    g <- make_ring(10)
    V(g)$name <- letters[1:10]
    vg <- unique(V(g)[d[[1]]])
    vr <- V(g)[d[[2]]]
    expect_equal(ignore_attr = TRUE, vg, vr)
  })
})

test_that("unique on detached vs, names", {
  sapply(unique_tests, function(d) {
    g <- make_ring(10)
    V(g)$name <- letters[1:10]
    vg <- V(g)[d[[1]]]
    vr <- V(g)[d[[2]]]
    rm(g)
    gc()
    vg <- unique(vg)
    expect_equal(ignore_attr = TRUE, vg, vr)
  })
})
