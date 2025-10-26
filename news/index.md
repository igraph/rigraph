# Changelog

## igraph 2.2.1.9000

### Chore

- New `switch_igraph_arg()` to avoid the need for default arguments.

- Fix isomorphism callback function.

- Replace `_impl` aliases with explicit wrapper functions in
  `R/bipartite.R`
  ([\#2334](https://github.com/igraph/rigraph/issues/2334),
  [\#2361](https://github.com/igraph/rigraph/issues/2361)).

- Replace \_impl aliases with explicit wrapper functions in
  R/centralization.R
  ([\#2336](https://github.com/igraph/rigraph/issues/2336),
  [\#2360](https://github.com/igraph/rigraph/issues/2360)).

- Replace `_impl` aliases with explicit wrapper functions in
  `R/cliques.R`
  ([\#2337](https://github.com/igraph/rigraph/issues/2337),
  [\#2363](https://github.com/igraph/rigraph/issues/2363)).

- Replace `_impl` function aliases with explicit wrappers in
  `R/centrality.R`
  ([\#2335](https://github.com/igraph/rigraph/issues/2335),
  [\#2362](https://github.com/igraph/rigraph/issues/2362)).

- Replace `_impl` alias with explicit wrapper in `R/coloring.R`
  ([\#2338](https://github.com/igraph/rigraph/issues/2338),
  [\#2364](https://github.com/igraph/rigraph/issues/2364)).

- Embed Stimulus sources, add docs.

- Replace `_impl` aliases with explicit wrappers in R/assortativity.R
  ([\#2332](https://github.com/igraph/rigraph/issues/2332),
  [\#2333](https://github.com/igraph/rigraph/issues/2333)).

- Auto-update from GitHub Actions
  ([\#2331](https://github.com/igraph/rigraph/issues/2331)).

- Auto-update from GitHub Actions
  ([\#2330](https://github.com/igraph/rigraph/issues/2330)).

- Use autogen-impl functions for 3 motifs functions
  ([\#2152](https://github.com/igraph/rigraph/issues/2152)).

### Continuous integration

- Install air for Copilot.

- Update status directly for Copilot.

- Remove Claude assistant.

- Avoid passing head branch for status update.

- Always update status after run, in some cases workflows push to the
  branch.

- Detail.

- Deterministic setup for Copilot.

- Use reviewdog only for foreign PRs.

### Documentation

- Remove spaces from vignettes.

### Refactoring

- Replace `_impl` aliases with explicit wrapper functions in
  `R/triangles.R`
  ([\#2368](https://github.com/igraph/rigraph/issues/2368),
  [\#2369](https://github.com/igraph/rigraph/issues/2369)).

- Replace `_impl` aliases with explicit wrapper functions in `R/make.R`
  ([\#2352](https://github.com/igraph/rigraph/issues/2352),
  [\#2384](https://github.com/igraph/rigraph/issues/2384)).

- Replace `_impl` alias with explicit wrapper in `R/layout.R`
  ([\#2351](https://github.com/igraph/rigraph/issues/2351),
  [\#2382](https://github.com/igraph/rigraph/issues/2382)).

- Replace `_impl` aliases with explicit wrapper functions in
  `R/structural-properties.R`
  ([\#2359](https://github.com/igraph/rigraph/issues/2359),
  [\#2372](https://github.com/igraph/rigraph/issues/2372)).

- Replace `sir <- sir_impl` alias with explicit wrapper
  ([\#2358](https://github.com/igraph/rigraph/issues/2358),
  [\#2370](https://github.com/igraph/rigraph/issues/2370)).

- Replace `_impl` aliases with explicit wrapper functions in `R/games.R`
  ([\#2348](https://github.com/igraph/rigraph/issues/2348),
  [\#2383](https://github.com/igraph/rigraph/issues/2383)).

- Replace `_impl` aliases with explicit wrapper functions in
  `R/simple.R` ([\#2357](https://github.com/igraph/rigraph/issues/2357),
  [\#2386](https://github.com/igraph/rigraph/issues/2386)).

- Replace `_impl` aliases with explicit wrappers in `R/embedding.R`
  ([\#2345](https://github.com/igraph/rigraph/issues/2345),
  [\#2380](https://github.com/igraph/rigraph/issues/2380)).

- Replace `are_adjacent` alias with explicit wrapper in
  `R/structure.info.R`
  ([\#2365](https://github.com/igraph/rigraph/issues/2365),
  [\#2374](https://github.com/igraph/rigraph/issues/2374)).

- Replace `_impl` aliases with explicit wrappers in `R/trees.R`
  ([\#2367](https://github.com/igraph/rigraph/issues/2367),
  [\#2373](https://github.com/igraph/rigraph/issues/2373)).

### Testing

- Improve centralitystress test
  ([\#2214](https://github.com/igraph/rigraph/issues/2214)).

## igraph 2.2.1

### Chore

- Fix ASAN checks.

- Add protection to fix rchk error.

### Testing

- Improve centralitystress test
  ([\#2214](https://github.com/igraph/rigraph/issues/2214)).

- Fix flaky test.

## igraph 2.2.0

CRAN release: 2025-10-13

Update C core to version 0.10.17. See
<https://github.com/igraph/rigraph/blob/20552ef94aed6ae4b23465ae8c7e4d3b0e558c71/src/vendor/cigraph/CHANGELOG.md>
for a complete changelog, in particular the section “Breaking changes”.

### Features

- Generate almost all R implementations
  ([\#2047](https://github.com/igraph/rigraph/issues/2047)).

- Expose
  [`align_layout()`](https://r.igraph.org/reference/align_layout.md) and
  add to
  [`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md)
  to align layout with axis automatically
  ([\#1907](https://github.com/igraph/rigraph/issues/1907),
  [\#1957](https://github.com/igraph/rigraph/issues/1957),
  [\#1958](https://github.com/igraph/rigraph/issues/1958)).

- Expose
  [`simple_cycles()`](https://r.igraph.org/reference/simple_cycles.md)
  which lists all simple cycles
  ([\#1573](https://github.com/igraph/rigraph/issues/1573),
  [\#1580](https://github.com/igraph/rigraph/issues/1580)).

- Expose
  [`is_complete()`](https://r.igraph.org/reference/is_complete.md),
  [`is_clique()`](https://r.igraph.org/reference/cliques.md) and
  [`is_ivs()`](https://r.igraph.org/reference/ivs.md)
  ([\#1316](https://github.com/igraph/rigraph/issues/1316),
  [\#1388](https://github.com/igraph/rigraph/issues/1388),
  [\#1581](https://github.com/igraph/rigraph/issues/1581)).

- Expose [`find_cycle()`](https://r.igraph.org/reference/find_cycle.md)
  ([\#1471](https://github.com/igraph/rigraph/issues/1471),
  [\#1571](https://github.com/igraph/rigraph/issues/1571)).

- Expose
  [`feedback_vertex_set()`](https://r.igraph.org/reference/feedback_vertex_set.md)
  to find a minimum feedback vertex set in a graph
  ([\#1446](https://github.com/igraph/rigraph/issues/1446),
  [\#1447](https://github.com/igraph/rigraph/issues/1447),
  [\#1560](https://github.com/igraph/rigraph/issues/1560)).

- Add `weights` parameter to
  [`local_scan()`](https://r.igraph.org/reference/local_scan.md)
  ([\#1082](https://github.com/igraph/rigraph/issues/1082),
  [\#1448](https://github.com/igraph/rigraph/issues/1448),
  [\#1982](https://github.com/igraph/rigraph/issues/1982)).

- Add more layouts to
  [`tkplot()`](https://r.igraph.org/reference/tkplot.md)
  ([\#160](https://github.com/igraph/rigraph/issues/160),
  [\#1967](https://github.com/igraph/rigraph/issues/1967)).

- Add `plot(mark.lwd = )` to change line width of mark.groups
  ([\#306](https://github.com/igraph/rigraph/issues/306),
  [\#1898](https://github.com/igraph/rigraph/issues/1898)).

- Add `plot(vertex.label.angle = , vertex.label.adj = )` arguments to
  rotate vertex labels
  ([\#106](https://github.com/igraph/rigraph/issues/106),
  [\#1899](https://github.com/igraph/rigraph/issues/1899)).

- Add relative size scaling to vertices in
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html)
  ([@gvegayon](https://github.com/gvegayon),
  [\#172](https://github.com/igraph/rigraph/issues/172)).

- Split
  [`sample_bipartite()`](https://r.igraph.org/reference/sample_bipartite.md)
  into two functions for the G(n, m) and G(n, p) case
  ([\#630](https://github.com/igraph/rigraph/issues/630),
  [\#1692](https://github.com/igraph/rigraph/issues/1692)).

- Implement multi attribute assignment
  ([\#55](https://github.com/igraph/rigraph/issues/55),
  [\#1916](https://github.com/igraph/rigraph/issues/1916)) and adding
  attributes via data frames
  ([\#1373](https://github.com/igraph/rigraph/issues/1373),
  [\#1669](https://github.com/igraph/rigraph/issues/1669),
  [\#1716](https://github.com/igraph/rigraph/issues/1716)). Support
  factors in
  [`graph_from_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md)
  ([\#34](https://github.com/igraph/rigraph/issues/34),
  [\#1829](https://github.com/igraph/rigraph/issues/1829)).

- All `_hrg()` functions check their argument
  ([\#1074](https://github.com/igraph/rigraph/issues/1074),
  [\#1699](https://github.com/igraph/rigraph/issues/1699)).

- HRG printing with `type = "auto"` uses `"plain"` for large trees
  ([\#1879](https://github.com/igraph/rigraph/issues/1879)).

- [`get_edge_ids()`](https://r.igraph.org/reference/get_edge_ids.md)
  accepts data frames and matrices
  ([\#1663](https://github.com/igraph/rigraph/issues/1663)).

- [`igraph_version()`](https://r.igraph.org/reference/igraph_version.md)
  returns version of C core in an attribute
  ([\#1208](https://github.com/igraph/rigraph/issues/1208),
  [\#1781](https://github.com/igraph/rigraph/issues/1781)).

### Breaking changes

- Breaking change: change arguments default and order for
  [`graph_from_lcf()`](https://r.igraph.org/reference/graph_from_lcf.md)
  ([\#1858](https://github.com/igraph/rigraph/issues/1858),
  [\#1872](https://github.com/igraph/rigraph/issues/1872)).

- Breaking change: Subset assignment of a graph avoids addition of
  double edges and ignores loops unless the new `loops` argument is set
  to `TRUE` ([\#1662](https://github.com/igraph/rigraph/issues/1662),
  [\#1661](https://github.com/igraph/rigraph/issues/1661)).

- Breaking change: remove deprecated `neimode` parameter from
  [`bfs()`](https://r.igraph.org/reference/bfs.md) and
  [`dfs()`](https://r.igraph.org/reference/dfs.md)
  ([\#1105](https://github.com/igraph/rigraph/issues/1105),
  [\#1526](https://github.com/igraph/rigraph/issues/1526)).

- Breaking change: stricter deprecation of non-functional parameters of
  [`layout_with_kk()`](https://r.igraph.org/reference/layout_with_kk.md)
  and
  [`layout_with_fr()`](https://r.igraph.org/reference/layout_with_fr.md)
  ([\#1108](https://github.com/igraph/rigraph/issues/1108),
  [\#1628](https://github.com/igraph/rigraph/issues/1628)).

### Bug fixes

- `NA` attribute values are replaced with default values in
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html)
  ([\#293](https://github.com/igraph/rigraph/issues/293),
  [\#1707](https://github.com/igraph/rigraph/issues/1707)).

- `NA` checking only in from/to columns of edge data frame
  ([\#1906](https://github.com/igraph/rigraph/issues/1906)).

- Keep vertex attribute type for
  [`disjoint_union()`](https://r.igraph.org/reference/disjoint_union.md)
  ([\#1640](https://github.com/igraph/rigraph/issues/1640),
  [\#1909](https://github.com/igraph/rigraph/issues/1909)).

- Error in bipartite projection if `type` is not a vertex attribute
  ([\#898](https://github.com/igraph/rigraph/issues/898),
  [\#1889](https://github.com/igraph/rigraph/issues/1889)).

- Do not try to destroy non-initialized SIR objects upon error
  ([\#1888](https://github.com/igraph/rigraph/issues/1888)).

- Added proper `NA` handling for matrix inputs
  ([\#917](https://github.com/igraph/rigraph/issues/917),
  [\#918](https://github.com/igraph/rigraph/issues/918),
  [\#1828](https://github.com/igraph/rigraph/issues/1828)).

- Remove string matrix support from functions operating on biadjacency
  matrices ([\#1540](https://github.com/igraph/rigraph/issues/1540),
  [\#1542](https://github.com/igraph/rigraph/issues/1542),
  [\#1803](https://github.com/igraph/rigraph/issues/1803)).

- Integer vectors are validated before transferring them to the C
  library ([\#1434](https://github.com/igraph/rigraph/issues/1434),
  [\#1582](https://github.com/igraph/rigraph/issues/1582)).

- Changed base location for
  [`graph_from_graphdb()`](https://r.igraph.org/reference/graph_from_graphdb.md)
  and added tests
  ([\#1712](https://github.com/igraph/rigraph/issues/1712),
  [\#1732](https://github.com/igraph/rigraph/issues/1732)).

- Recycling of logical vectors when indexing into edge/vertex selectors
  now throws an error
  ([\#848](https://github.com/igraph/rigraph/issues/848),
  [\#1731](https://github.com/igraph/rigraph/issues/1731)).

- Use `function()` instead of `(x)` in `arrow.mode`
  ([\#1722](https://github.com/igraph/rigraph/issues/1722)).

- Temporarily disable generating an interface for
  `igraph_simple_cycles_callback()` as the framework for handling
  callback functions is not yet present.

### Plotting bug fixes

- Adjust loop position to vertex size in
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html)
  ([\#1980](https://github.com/igraph/rigraph/issues/1980)).

- Don’t rescale plot coordinates to `[-1,1] x [-1,1]` by default
  ([\#1492](https://github.com/igraph/rigraph/issues/1492),
  [\#1956](https://github.com/igraph/rigraph/issues/1956),
  [\#1962](https://github.com/igraph/rigraph/issues/1962)).

- Fail if `"layout"` attribute doesn’t match the number of vertices
  ([\#1880](https://github.com/igraph/rigraph/issues/1880)).

- Automatically arrange loops in
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html)
  ([\#407](https://github.com/igraph/rigraph/issues/407),
  [\#556](https://github.com/igraph/rigraph/issues/556),
  [\#1881](https://github.com/igraph/rigraph/issues/1881)).

- Vectorized drawing of arrows in
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html)
  ([\#257](https://github.com/igraph/rigraph/issues/257),
  [\#1904](https://github.com/igraph/rigraph/issues/1904)).

- Allow more than one edge label font family in
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html)
  ([\#37](https://github.com/igraph/rigraph/issues/37),
  [\#1896](https://github.com/igraph/rigraph/issues/1896)).

- Pie shapes now work as intended
  ([\#1882](https://github.com/igraph/rigraph/issues/1882),
  [\#1883](https://github.com/igraph/rigraph/issues/1883)).

- Loops not plotted on canvas
  ([\#1799](https://github.com/igraph/rigraph/issues/1799),
  [\#1800](https://github.com/igraph/rigraph/issues/1800)).

- Replace `NA` values in `label` attributes in
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html) with default
  values ([\#1796](https://github.com/igraph/rigraph/issues/1796),
  [\#1797](https://github.com/igraph/rigraph/issues/1797)).

- Removed duplicated plotting of arrow heads
  ([\#640](https://github.com/igraph/rigraph/issues/640),
  [\#1709](https://github.com/igraph/rigraph/issues/1709)).

- Correct mapping of edge label properties in plots when loops are
  present ([\#157](https://github.com/igraph/rigraph/issues/157),
  [\#1706](https://github.com/igraph/rigraph/issues/1706)).

### Documentation

- Welcome Maëlle Salmon and David Schoch as authors
  ([\#1733](https://github.com/igraph/rigraph/issues/1733)), add author
  links ([\#1821](https://github.com/igraph/rigraph/issues/1821)).

- Remove demos
  ([\#2008](https://github.com/igraph/rigraph/issues/2008)).

- Add 2023 preprint
  ([\#1240](https://github.com/igraph/rigraph/issues/1240),
  [\#1984](https://github.com/igraph/rigraph/issues/1984)).

- Update allcontributors info
  ([\#1975](https://github.com/igraph/rigraph/issues/1975)).

- Link to replacements of deprecated functions
  ([\#1823](https://github.com/igraph/rigraph/issues/1823)).

- Add documentation of all file formats to
  [`read_graph()`](https://r.igraph.org/reference/read_graph.md) and
  [`write_graph()`](https://r.igraph.org/reference/write_graph.md)
  ([\#777](https://github.com/igraph/rigraph/issues/777),
  [\#1969](https://github.com/igraph/rigraph/issues/1969)). Recommend
  [`saveRDS()`](https://rdrr.io/r/base/readRDS.html) and
  [`readRDS()`](https://rdrr.io/r/base/readRDS.html) for saving and
  loading graphs
  ([\#1242](https://github.com/igraph/rigraph/issues/1242),
  [\#1700](https://github.com/igraph/rigraph/issues/1700)).

- Document return value of
  [`make_clusters()`](https://r.igraph.org/reference/make_clusters.md)
  ([\#1794](https://github.com/igraph/rigraph/issues/1794)).

- Clarify that [`girth()`](https://r.igraph.org/reference/girth.md)
  returns `Inf` for acyclic graphs
  ([@eqmooring](https://github.com/eqmooring),
  [\#1831](https://github.com/igraph/rigraph/issues/1831)).

- Clarify the use of weights in
  [`layout_with_kk()`](https://r.igraph.org/reference/layout_with_kk.md).

- Refer to current latest version of R in troubleshooting page.

- Fix typos in
  [`laplacian_matrix()`](https://r.igraph.org/reference/laplacian_matrix.md)
  documentation.

- Document ellipsis in
  [`cohesion()`](https://r.igraph.org/reference/vertex_connectivity.md)
  ([\#971](https://github.com/igraph/rigraph/issues/971),
  [\#1985](https://github.com/igraph/rigraph/issues/1985)).

- Correct the description of the `weights` parameter of
  [`hits_scores()`](https://r.igraph.org/reference/hits_scores.md).

- Better describe output of
  [`all_shortest_paths()`](https://r.igraph.org/reference/distances.md)
  ([\#1029](https://github.com/igraph/rigraph/issues/1029),
  [\#1778](https://github.com/igraph/rigraph/issues/1778)).

- [`make_graph()`](https://r.igraph.org/reference/make_graph.md) now
  supports `"Groetzsch"` as an alias of `"Grotzsch"`. This change was
  implemented in the C core.

- Update description of `order` parameter of
  [`ego()`](https://r.igraph.org/reference/ego.md) and related functions
  ([\#1746](https://github.com/igraph/rigraph/issues/1746)).

- Added lifecycle table
  ([\#1525](https://github.com/igraph/rigraph/issues/1525)).

- Add more about igraph.r2cdocs in the contributing guide
  ([\#1686](https://github.com/igraph/rigraph/issues/1686),
  [\#1697](https://github.com/igraph/rigraph/issues/1697)).

### Performance

- Accelerate check if an index sequence corresponds to the entire list
  of vertices ([\#1427](https://github.com/igraph/rigraph/issues/1427),
  [\#1818](https://github.com/igraph/rigraph/issues/1818)).

- Faster single bracket querying of a graph
  ([\#1465](https://github.com/igraph/rigraph/issues/1465),
  [\#1658](https://github.com/igraph/rigraph/issues/1658)).

## igraph 2.1.4

CRAN release: 2025-01-23

### Testing

- Tweak tests that use the graph package.

## igraph 2.1.3

CRAN release: 2025-01-07

### Features

- Use `_pv` destroy functions to satisfy ASAN checks
  ([\#1630](https://github.com/igraph/rigraph/issues/1630)).

- Use safe accessor to vector elements
  ([\#1633](https://github.com/igraph/rigraph/issues/1633)).

### Chore

- Replace
  [`graph.isomorphic()`](https://r.igraph.org/reference/isomorphic.md)
  with [`isomorphic()`](https://r.igraph.org/reference/isomorphic.md)
  ([\#1583](https://github.com/igraph/rigraph/issues/1583),
  [\#1623](https://github.com/igraph/rigraph/issues/1623)).

### Documentation

- Convert `plot.common.Rd` to roxygen2
  ([\#1424](https://github.com/igraph/rigraph/issues/1424),
  [\#1636](https://github.com/igraph/rigraph/issues/1636)).

- Remove broken example from
  [`graph_from_graphdb()`](https://r.igraph.org/reference/graph_from_graphdb.md)
  manual page ([\#1622](https://github.com/igraph/rigraph/issues/1622),
  [\#1637](https://github.com/igraph/rigraph/issues/1637)).

- Document argument for NCOL format in
  [`read_graph()`](https://r.igraph.org/reference/read_graph.md)
  ([\#1621](https://github.com/igraph/rigraph/issues/1621)).

- Make documentation of
  [`disjoint_union()`](https://r.igraph.org/reference/disjoint_union.md)
  consistent with behavior
  ([\#1587](https://github.com/igraph/rigraph/issues/1587),
  [\#1641](https://github.com/igraph/rigraph/issues/1641)).

- Add central note about experimental functions
  ([\#1624](https://github.com/igraph/rigraph/issues/1624)).

## igraph 2.1.2

CRAN release: 2024-12-07

### Bug fixes

- [`adjacent_vertices()`](https://r.igraph.org/reference/adjacent_vertices.md)
  and
  [`incident_edges()`](https://r.igraph.org/reference/incident_edges.md)
  are now correct if the `"return.vs.es"` option is `FALSE`
  ([@stibu81](https://github.com/stibu81),
  [\#1605](https://github.com/igraph/rigraph/issues/1605),
  [\#1606](https://github.com/igraph/rigraph/issues/1606)).

- Fix protection errors reported by rchk
  ([\#1592](https://github.com/igraph/rigraph/issues/1592)).

- Fix the incorrect handling of the `sample` parameter in
  [`sample_motifs()`](https://r.igraph.org/reference/sample_motifs.md)
  and ensure that the default `sample.size` is integer
  ([\#1568](https://github.com/igraph/rigraph/issues/1568)).

### Documentation

- Clarify what type of graph each community detection function supports.

- Improve [`?read_graph`](https://r.igraph.org/reference/read_graph.md)
  and [`?write_graph`](https://r.igraph.org/reference/write_graph.md)
  documentation.

- Improve
  [`all_simple_paths()`](https://r.igraph.org/reference/all_simple_paths.md)
  documentation.

- [`cluster_optimal()`](https://r.igraph.org/reference/cluster_optimal.md)
  does support directed graphs.

### Testing

- Test handling of `"return.vs.es"` in several functions
  ([@stibu81](https://github.com/stibu81),
  [\#1610](https://github.com/igraph/rigraph/issues/1610)).

## igraph 2.1.1

CRAN release: 2024-10-19

See
<https://github.com/igraph/rigraph/blob/9828d7b11be330f994f07ae93a071b356eced903/src/vendor/cigraph/CHANGELOG.md>
for a complete changelog, in particular the section “Breaking changes”.

### Features

- Add `p.value` and `p.precision` arguments to
  [`fit_power_law()`](https://r.igraph.org/reference/fit_power_law.md)
  to control the computation of the p-value
  ([\#1546](https://github.com/igraph/rigraph/issues/1546)).

### Bug fixes

- Preserve
  [`as.undirected()`](https://r.igraph.org/reference/as.undirected.md)
  signature thanks to [@jhollway](https://github.com/jhollway),
  regression introduced in igraph 2.1.0
  ([\#1536](https://github.com/igraph/rigraph/issues/1536)).

### Lifecycle

- Deprecate `eigen_centrality(scale = )`
  ([\#1543](https://github.com/igraph/rigraph/issues/1543)).
- Put deprecation message at the beginning not the end of the similarity
  functions ([\#1549](https://github.com/igraph/rigraph/issues/1549)).

### Documentation

- Update allcontributors table
  ([\#1552](https://github.com/igraph/rigraph/issues/1552)).
- Use mathjax for now
  ([\#1538](https://github.com/igraph/rigraph/issues/1538)).

### Internal

- Prepare for libxml2 depending on bcrypt, use pkg-config
  ([\#1556](https://github.com/igraph/rigraph/issues/1556),
  [@kalibera](https://github.com/kalibera)).

## igraph 2.1.0

See
<https://github.com/igraph/rigraph/blob/05973441b83decdeab8cc9c500a642c00b924770/src/vendor/cigraph/CHANGELOG.md>
for a complete changelog, in particular the section “Breaking changes”.

### Lifecycle

#### Breaking changes

- Breaking change: remove tkigraph from {igraph} proper
  ([\#1474](https://github.com/igraph/rigraph/issues/1474)).
- Breaking change: Hard-deprecate
  [`get.edge()`](https://r.igraph.org/reference/get.edge.md) and
  [`layout.grid.3d()`](https://r.igraph.org/reference/layout.grid.3d.md)
  which have been deprecated for 10 years
  ([\#1398](https://github.com/igraph/rigraph/issues/1398)).
- Breaking change: use
  [`rlang::arg_match()`](https://rlang.r-lib.org/reference/arg_match.html)
  in `igraph.match.arg()`
  ([\#1165](https://github.com/igraph/rigraph/issues/1165)).

#### In-progress deprecations

We are working towards a more consistent interface, especially as
regards function naming: ultimately we want the igraph functions to use
snake case. Please update your scripts and codebases as soon as you can.

- Add [`independence_number()`](https://r.igraph.org/reference/ivs.md)
  as an alias of [`ivs_size()`](https://r.igraph.org/reference/ivs.md)
  ([\#1522](https://github.com/igraph/rigraph/issues/1522)).
- Add [`get_edge_ids()`](https://r.igraph.org/reference/get_edge_ids.md)
  as an alias of
  [`get.edge.ids()`](https://r.igraph.org/reference/get.edge.ids.md)
  ([\#1510](https://github.com/igraph/rigraph/issues/1510)).
- Increase the deprecation signal to a warning for
  [`hub.score()`](https://r.igraph.org/reference/hub.score.md) and
  [`authority.score()`](https://r.igraph.org/reference/authority.score.md)
  both replaced by
  [`hits_scores()`](https://r.igraph.org/reference/hits_scores.md)
  ([\#1352](https://github.com/igraph/rigraph/issues/1352)).
- Soft-deprecate
  [`erdos.renyi.game()`](https://r.igraph.org/reference/erdos.renyi.game.md)
  and
  [`random.graph.game()`](https://r.igraph.org/reference/erdos.renyi.game.md)
  ([\#1509](https://github.com/igraph/rigraph/issues/1509)).

### Features

#### C library

- Update vendored C/igraph sources to
  <igraph/igraph@d2e0f4eb567dfc505227c346a015bef574c4ccd1>.

#### New functionality

- Support `fit_power_law(implementation = "plfit.p")` to compute the
  P-value ([\#1386](https://github.com/igraph/rigraph/issues/1386)).
- Add [`max_degree()`](https://r.igraph.org/reference/degree.md)
  ([\#1403](https://github.com/igraph/rigraph/issues/1403)).
- Add experimental
  [`sample_chung_lu()`](https://r.igraph.org/reference/sample_chung_lu.md)
  ([\#1416](https://github.com/igraph/rigraph/issues/1416)).
- Rename methods available for
  [`sample_degseq()`](https://r.igraph.org/reference/sample_degseq.md)
  and add the `"edge.switching.simple"` method
  ([\#1376](https://github.com/igraph/rigraph/issues/1376)).
- Weight support for
  [`eccentricity()`](https://r.igraph.org/reference/eccentricity.md) and
  [`radius()`](https://r.igraph.org/reference/radius.md)
  ([\#1211](https://github.com/igraph/rigraph/issues/1211)).
- Add some argument checking to
  [`add_shape()`](https://r.igraph.org/reference/shapes.md)
  ([\#1478](https://github.com/igraph/rigraph/issues/1478)).

#### More informative errors

- Export
  [`.from()`](https://r.igraph.org/reference/inside-square-error.md)
  etc. with behavior similar to
  [`dplyr::across()`](https://dplyr.tidyverse.org/reference/across.html)
  ([\#1436](https://github.com/igraph/rigraph/issues/1436)): functions
  like
  [`.from()`](https://r.igraph.org/reference/inside-square-error.md) are
  meant to be used inside `[` but now if an user misuses them, the error
  is more informative.

### Bug fixes

- Fix including diagonal elements in dense adjacency matrices
  ([\#1437](https://github.com/igraph/rigraph/issues/1437)).
- Align the body of
  [`graph.lattice()`](https://r.igraph.org/reference/graph.lattice.md)
  with its replacement
  [`make_lattice()`](https://r.igraph.org/reference/make_lattice.md)
  ([\#1439](https://github.com/igraph/rigraph/issues/1439)).
- Use `deprecated()` as default value for `circular` argument to
  [`make_lattice()`](https://r.igraph.org/reference/make_lattice.md)
  ([\#1431](https://github.com/igraph/rigraph/issues/1431)).
- [`subgraph_centrality()`](https://r.igraph.org/reference/subgraph_centrality.md)
  now ignores edge directions
  ([\#1414](https://github.com/igraph/rigraph/issues/1414)).
- Remove unintended type conversions when using
  [`disjoint_union()`](https://r.igraph.org/reference/disjoint_union.md)
  ([\#1375](https://github.com/igraph/rigraph/issues/1375)).
- Add missing `PROTECT()`
  ([\#1382](https://github.com/igraph/rigraph/issues/1382)).
- Fix reading of LGL and NCOL files (broken in 2.0.0)
  ([\#1347](https://github.com/igraph/rigraph/issues/1347)).
- Fixed potential memory leak in `R_igraph_community_to_membership2()`
  ([\#1367](https://github.com/igraph/rigraph/issues/1367)).

### Documentation

- Improve the manual page of
  [`sample_()`](https://r.igraph.org/reference/sample_.md)
  ([\#1477](https://github.com/igraph/rigraph/issues/1477)).
- Improve cross-links from
  [`make_()`](https://r.igraph.org/reference/make_.md) manual page
  ([\#1476](https://github.com/igraph/rigraph/issues/1476)).
- Update
  [`is_separator()`](https://r.igraph.org/reference/is_separator.md)
  documentation based on C docs
  ([\#1467](https://github.com/igraph/rigraph/issues/1467)).
- Add DOI to citation
  ([\#1450](https://github.com/igraph/rigraph/issues/1450)).
- Improve documentation of normalization methods for laplacian_matrix()
  ([\#1420](https://github.com/igraph/rigraph/issues/1420)).
- Fix typos in
  [`?plot.common`](https://r.igraph.org/reference/plot.common.md)
  ([@gvegayon](https://github.com/gvegayon))
  ([\#1413](https://github.com/igraph/rigraph/issues/1413)).
- Fix
  [`sample_degseq()`](https://r.igraph.org/reference/sample_degseq.md)
  example ([\#1297](https://github.com/igraph/rigraph/issues/1297)).
- Fix
  [`graph_from_adjacency_matrix()`](https://r.igraph.org/reference/graph_from_adjacency_matrix.md)
  examples to avoid warnings
  ([\#1302](https://github.com/igraph/rigraph/issues/1302)).
- Replace `\dontrun{}` with `@examplesIf`
  ([\#1307](https://github.com/igraph/rigraph/issues/1307)).
- Improve [`sample_gnp()`](https://r.igraph.org/reference/sample_gnp.md)
  examples.
- Improve centralization docs.
- Further clarifications for
  [`betweenness()`](https://r.igraph.org/reference/betweenness.md)
  ([\#1489](https://github.com/igraph/rigraph/issues/1489)).
- Clarify how betweenness with cutoff is normalized.
- Fix
  [`centr_eigen_tmax()`](https://r.igraph.org/reference/centr_eigen_tmax.md)
  docs.
- Make
  [`edge_density()`](https://r.igraph.org/reference/edge_density.md)
  examples relevant.
- Improve
  [`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md)
  documentation.
- Improved
  [`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md)
  documentation.
- [`sample_forestfire()`](https://r.igraph.org/reference/sample_forestfire.md)
  tests and example
  ([\#1318](https://github.com/igraph/rigraph/issues/1318)).

#### Developer-facing docs

- Add slightly tweaked boilerplate `CONTRIBUTING.md`
  ([\#1423](https://github.com/igraph/rigraph/issues/1423)).
- Update troubleshooting document.
- Use {devtag} for internal function docs
  ([\#1507](https://github.com/igraph/rigraph/issues/1507)).
- Make
  [`.igraph.progress()`](https://r.igraph.org/reference/dot-igraph.progress.md)
  and
  [`.igraph.status()`](https://r.igraph.org/reference/dot-igraph.status.md)
  more internal
  ([\#1516](https://github.com/igraph/rigraph/issues/1516)).

## igraph 2.0.3

CRAN release: 2024-03-13

See
<https://github.com/igraph/rigraph/blob/3299d31/src/vendor/cigraph/CHANGELOG.md>
for a complete changelog of the bundled C core, and
<https://github.com/igraph/rigraph/compare/f3fa58b..3299d31#diff-aeb78e0159780a9b26daabaf6f95f450b0cfec7161fc735f27ad69145a57dc84>
for the changes since the igraph 2.0.1. (A permanent link to the most
recent changelog of the C core used in the R package is
<https://github.com/igraph/rigraph/blob/main/src/vendor/cigraph/CHANGELOG.md>.)

### Features

- GMP is no longer a dependency
  ([\#1256](https://github.com/igraph/rigraph/issues/1256)), libxml2
  ([\#1282](https://github.com/igraph/rigraph/issues/1282)) and glpk are
  optional.
- Update vendored sources to
  <igraph/igraph@857a125069c226f266562b3781b82833fe1d59d9>.
- New
  [`voronoi_cells()`](https://r.igraph.org/reference/voronoi_cells.md)
  to compute the Voronoi partitioning of a graph
  ([\#1173](https://github.com/igraph/rigraph/issues/1173)).

### Bug fixes

- Fix `rglplot(edge_label = )`
  ([\#1267](https://github.com/igraph/rigraph/issues/1267)).

### Continuous integration

- Run examples with sanitizer
  ([\#1288](https://github.com/igraph/rigraph/issues/1288)).
- Add scheduled builds.

### Documentation

- Make [`x11()`](https://rdrr.io/r/grDevices/x11.html) usage in example
  happen only in interactive sessions
  ([\#1301](https://github.com/igraph/rigraph/issues/1301)).
- Remove misleading comment about warning given as no warning is given
  ([\#1294](https://github.com/igraph/rigraph/issues/1294)).
- Improve
  [`min_st_separators()`](https://r.igraph.org/reference/min_st_separators.md)
  documentation
  ([\#1264](https://github.com/igraph/rigraph/issues/1264)).
- Add link to discussion forum
  ([\#1279](https://github.com/igraph/rigraph/issues/1279)) and logo
  ([\#1280](https://github.com/igraph/rigraph/issues/1280)).
- Add code finding duplicate `@seealso`, and use it
  ([\#1270](https://github.com/igraph/rigraph/issues/1270)).
- Remove duplicate `@seealso` from
  [`?sample_pa`](https://r.igraph.org/reference/sample_pa.md)
  ([\#1268](https://github.com/igraph/rigraph/issues/1268)).
- Remove incorrect claim about handling of complete graphs by
  [`is_separator()`](https://r.igraph.org/reference/is_separator.md) and
  [`is_min_separator()`](https://r.igraph.org/reference/is_min_separator.md)
  ([\#1263](https://github.com/igraph/rigraph/issues/1263)).
- Fix error messages mentioning to mention
  [`upgrade_graph()`](https://r.igraph.org/reference/upgrade_graph.md)
  instead of the nonexisting `upgrade_version()`
  ([\#1252](https://github.com/igraph/rigraph/issues/1252)).
- Split
  [`is_bipartite()`](https://r.igraph.org/reference/is_bipartite.md)
  manual page from other manual page
  ([\#1230](https://github.com/igraph/rigraph/issues/1230)).
- Improve bug report template.
- `CITATION.cff` contains only the first three version components.
- Install lock workflow to lock stale discussions after one year
  ([\#1304](https://github.com/igraph/rigraph/issues/1304)).

### Internal

- Replace use of deprecated
  [`barabasi.game()`](https://r.igraph.org/reference/barabasi.game.md)
  with [`sample_pa()`](https://r.igraph.org/reference/sample_pa.md)
  ([\#1291](https://github.com/igraph/rigraph/issues/1291)).
- Auto-generate
  [`are_adjacent()`](https://r.igraph.org/reference/are_adjacent.md),
  avoid deprecated `igraph_are_connected()` C function
  ([\#1254](https://github.com/igraph/rigraph/issues/1254)).

## igraph 2.0.2

CRAN release: 2024-02-17

See
<https://github.com/igraph/rigraph/blob/f3fa58b/src/vendor/cigraph/CHANGELOG.md>
for a complete changelog of the bundled C core, and
<https://github.com/igraph/rigraph/compare/1bd2bf79..f3fa58b#diff-aeb78e0159780a9b26daabaf6f95f450b0cfec7161fc735f27ad69145a57dc84>
for the changes since the igraph 2.0.1. (A permanent link to the most
recent changelog of the C core used in the R package is
<https://github.com/igraph/rigraph/blob/main/src/vendor/cigraph/CHANGELOG.md>.)

### Bug fixes

- `g + vertices(1, 2, foo = 3)` works again, regression introduced in
  igraph 2.0.0
  ([\#1247](https://github.com/igraph/rigraph/issues/1247)).
- [`sample_pa()`](https://r.igraph.org/reference/sample_pa.md) respects
  the `out.seq` and `out.dist` arguments again, regression introduced in
  igraph 2.0.0
  ([\#1226](https://github.com/igraph/rigraph/issues/1226)).
- [`isomorphisms()`](https://r.igraph.org/reference/isomorphisms.md) and
  `subgraph_isomorphisims(method = "vf2")` work again, regression
  introduced in 2.0.0
  ([\#1219](https://github.com/igraph/rigraph/issues/1219)).
- [`biconnected_components()`](https://r.igraph.org/reference/biconnected_components.md)
  now returns edge and vertex sequences again, regression introduced in
  2.0.0 ([\#1213](https://github.com/igraph/rigraph/issues/1213)).
- Remove zeros from the `order` and `order.out` components returned by
  [`dfs()`](https://r.igraph.org/reference/dfs.md), regression
  introduced in 2.0.0
  ([\#1179](https://github.com/igraph/rigraph/issues/1179)).
- Memory leaks when converting data to C
  ([\#1196](https://github.com/igraph/rigraph/issues/1196)).

### Features

- [`realize_bipartite_degseq()`](https://r.igraph.org/reference/realize_bipartite_degseq.md)
  creates a bipartite graph from two degree sequences
  ([\#1212](https://github.com/igraph/rigraph/issues/1212)).
- [`is_biconnected()`](https://r.igraph.org/reference/is_biconnected.md)
  checks if a graph is biconnected
  ([\#1204](https://github.com/igraph/rigraph/issues/1204)).
- [`distances()`](https://r.igraph.org/reference/distances.md) now
  supports the Floyd-Warshall algorithm
  ([\#1186](https://github.com/igraph/rigraph/issues/1186)).

### Documentation

- Use more culturally diverse names in intro vignettes
  ([\#1246](https://github.com/igraph/rigraph/issues/1246)).
- Formatting tweaks in introductory vignettes
  ([\#1243](https://github.com/igraph/rigraph/issues/1243)).
- Recommend {pak} instead of {remotes}
  ([\#1228](https://github.com/igraph/rigraph/issues/1228)).
- Fix typo in
  [`mean_distance()`](https://r.igraph.org/reference/distances.md) docs.
- Update troubleshooting document, emphasize issues with Anaconda
  environments
  ([\#1209](https://github.com/igraph/rigraph/issues/1209)).
- Improved docs for shortest path functions
  ([\#1201](https://github.com/igraph/rigraph/issues/1201)).
- Document `"dsatur"` heuristic for
  [`greedy_vertex_coloring()`](https://r.igraph.org/reference/greedy_vertex_coloring.md)
  ([\#1206](https://github.com/igraph/rigraph/issues/1206)).
- Remove scg related docs
  ([\#1167](https://github.com/igraph/rigraph/issues/1167)).
- Fix typo in
  [`?articulation_points`](https://r.igraph.org/reference/articulation_points.md)
  ([\#1191](https://github.com/igraph/rigraph/issues/1191)).
- Improve installation and troubleshooting instructions
  ([\#1184](https://github.com/igraph/rigraph/issues/1184)).
- Improve docs of assortativity
  ([\#1151](https://github.com/igraph/rigraph/issues/1151)).

### Testing

- Add tests for
  [`isomorphisms()`](https://r.igraph.org/reference/isomorphisms.md) and
  [`subgraph_isomorphisms()`](https://r.igraph.org/reference/subgraph_isomorphisms.md)
  ([\#1225](https://github.com/igraph/rigraph/issues/1225)).

### Packaging

- Always use bundled mini-gmp
  ([\#1233](https://github.com/igraph/rigraph/issues/1233)).
- `config.h` defines `HAVE___UINT128_T`
  ([\#1216](https://github.com/igraph/rigraph/issues/1216)).
- Do not rely on `which` program during configuration
  ([\#1232](https://github.com/igraph/rigraph/issues/1232)).
- `configure` manage libxml multiple include paths
  ([\#1197](https://github.com/igraph/rigraph/issues/1197)).
- Remove empty string in `configure`
  ([\#1235](https://github.com/igraph/rigraph/issues/1235)).
- Link Fortran runtime on Windows as needed by arpack.
  ([\#1215](https://github.com/igraph/rigraph/issues/1215)).
- Workaround for deprecated enum values not being supported with old GCC
  ([\#1205](https://github.com/igraph/rigraph/issues/1205)).
- `HAVE_GFORTRAN` flag for `win` and `ucrt`
  ([\#1171](https://github.com/igraph/rigraph/issues/1171)).
- [`make_empty_graph()`](https://r.igraph.org/reference/make_empty_graph.md)
  is now fully auto-generated
  ([\#1068](https://github.com/igraph/rigraph/issues/1068)).
- Eliminate manual edits from autogenerated files
  ([\#1207](https://github.com/igraph/rigraph/issues/1207)).
- Add read-only comments for RStudio IDE
  ([\#1152](https://github.com/igraph/rigraph/issues/1152)).

### Internal

- Remove unused patch files
  ([\#1234](https://github.com/igraph/rigraph/issues/1234)).
- Update stimulus to 0.21.4
  ([\#1210](https://github.com/igraph/rigraph/issues/1210)).
- Avoid duplicate objects
  ([\#1223](https://github.com/igraph/rigraph/issues/1223)).
- Eliminate a compiler warning from simpleraytracer
  ([\#1185](https://github.com/igraph/rigraph/issues/1185)).

## igraph 2.0.1.1

CRAN release: 2024-01-30

### Bug fixes

- Avoid [`is.R()`](https://rdrr.io/r/base/base-defunct.html) which is
  deprecated in R 4.4.0.

## igraph 2.0.1

CRAN release: 2024-01-29

### Bug fixes

- Use cpp11 for simpleraytracer glue to avoid `-Wlto` warnings
  ([\#1163](https://github.com/igraph/rigraph/issues/1163)).

## igraph 2.0.0

This major release brings development in line with the C core at
<https://github.com/igraph/igraph>. See
<https://github.com/igraph/rigraph/blob/1bd2bf79/src/vendor/cigraph/CHANGELOG.md>
for a complete changelog, in particular the section “Breaking changes”.
(A permanent link to the most recent changelog of the C core used in the
R package is
<https://github.com/igraph/rigraph/blob/main/src/vendor/cigraph/CHANGELOG.md>.)

Version 1.6.0 of the R package used version 0.9.9 of the C core. The
changes in the 0.10 series of the C core are relevant for version 2.0.0
of the R package, but not all C core functions are exposed in the R
interface. Changes to the implementation of some functions in the C core
may be reflected in functions in the R package.

The change log below is a summary of the additional changes in the R
interface.

### Breaking changes

- `get.edge.ids(multi = TRUE)` and `as_adjacency_matrix(edges = )` are
  no longer supported
  ([\#1101](https://github.com/igraph/rigraph/issues/1101),
  [\#1080](https://github.com/igraph/rigraph/issues/1080)).

- Remove `NA` padding for `dfs(unreachable = FALSE)$order` and
  `$order.out` and for `bfs(unreachable = FALSE)$order`, also for
  `igraph_options(return.vs.es = FALSE)`
  ([\#1062](https://github.com/igraph/rigraph/issues/1062),
  [\#1124](https://github.com/igraph/rigraph/issues/1124)).

- `laplacian_matrix(normalized = TRUE)` uses a different normalization
  method ([\#1102](https://github.com/igraph/rigraph/issues/1102)).

- [`fit_power_law()`](https://r.igraph.org/reference/fit_power_law.md)
  no longer returns a `KS.p` component.

- Remove default value for `loops` argument of
  [`centr_degree_tmax()`](https://r.igraph.org/reference/centr_degree_tmax.md)
  ([\#1114](https://github.com/igraph/rigraph/issues/1114)).

- [`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md)
  no longer supports attributes of type `character`
  ([\#1072](https://github.com/igraph/rigraph/issues/1072)).

- Remove
  [`graph.isomorphic.34()`](https://r.igraph.org/reference/isomorphic.md)
  ([\#1065](https://github.com/igraph/rigraph/issues/1065),
  [\#1067](https://github.com/igraph/rigraph/issues/1067)).

- Use
  [`lifecycle::deprecate_soft()`](https://lifecycle.r-lib.org/reference/deprecate_soft.html)
  for most deprecated functions
  ([\#1024](https://github.com/igraph/rigraph/issues/1024),
  [\#1025](https://github.com/igraph/rigraph/issues/1025),
  [\#1104](https://github.com/igraph/rigraph/issues/1104)).

- The system libraries GLPK, GMP, and libxml2 are now mandatory for
  compiling from source.

### Bug fixes

- Add scalar conversion checks in a few critical places
  ([\#1069](https://github.com/igraph/rigraph/issues/1069)).

- Check that we receive a scalar when expecting a scalar in C code
  ([\#1051](https://github.com/igraph/rigraph/issues/1051)).

- Check that matrix sizes are in the supported range before passing them
  to R ([\#1066](https://github.com/igraph/rigraph/issues/1066)).

- [`transitivity()`](https://r.igraph.org/reference/transitivity.md) now
  produces a named vector in the local (weighted) case
  ([\#1057](https://github.com/igraph/rigraph/issues/1057)).

- [`plot()`](https://rdrr.io/r/graphics/plot.default.html) correctly
  computes intersections between edges and rectangle vertices
  ([\#1021](https://github.com/igraph/rigraph/issues/1021)).

- Fix compilation on Windows with spaces in the Rtools path
  ([\#1000](https://github.com/igraph/rigraph/issues/1000)).

### Features

- Use 30 bits of R’s RNG
  ([\#1079](https://github.com/igraph/rigraph/issues/1079)).

- Breaking change: Remove `NA` padding for
  `dfs(unreachable = FALSE)$order` and `$order.out` and for
  `bfs(unreachable = FALSE)$order`, also for
  `igraph_options(return.vs.es = FALSE)`
  ([\#1062](https://github.com/igraph/rigraph/issues/1062),
  [\#1124](https://github.com/igraph/rigraph/issues/1124)).

- New
  [`k_shortest_paths()`](https://r.igraph.org/reference/k_shortest_paths.md)
  to compute the first k shortest paths between two vertices
  ([\#1028](https://github.com/igraph/rigraph/issues/1028)).

### Documentation

- Add GitHub bug report form.

- New `vignette("deprecated-dot-case")` that lists deprecated functions
  and their alternatives
  ([\#1013](https://github.com/igraph/rigraph/issues/1013)).

- Move deprecation badge to top of doc pages.

- Remove usage of
  [`get.adjacency()`](https://r.igraph.org/reference/get.adjacency.md)
  from intro vignettes
  ([\#1084](https://github.com/igraph/rigraph/issues/1084)).

- Fix math formatting in
  [`fit_power_law()`](https://r.igraph.org/reference/fit_power_law.md)
  docs.

- Fix incorrect usage in
  [`subgraph.edges()`](https://r.igraph.org/reference/subgraph.edges.md)
  example.

- Clarify that Infomap considers edge directions.

- Improve edge connectivity docs
  ([\#1119](https://github.com/igraph/rigraph/issues/1119)).

- Add some missing diacritics.

### Internal

- Use `[]` assignment for converting matrices
  ([\#1035](https://github.com/igraph/rigraph/issues/1035)).

- Move towards autogenerating all bindings
  ([\#1043](https://github.com/igraph/rigraph/issues/1043)).

- Use %\|\|% from rlang
  ([\#1112](https://github.com/igraph/rigraph/issues/1112)).

- Replace loop by [`lapply()`](https://rdrr.io/r/base/lapply.html) when
  returning vertex and edge sets
  ([\#1033](https://github.com/igraph/rigraph/issues/1033)).

- Do not duplicate prototypes, use a common header for `rinterface.c`
  and `rinterface_extra.c`
  ([\#1055](https://github.com/igraph/rigraph/issues/1055)).

- Clean up some auto-generation code
  ([\#1031](https://github.com/igraph/rigraph/issues/1031)), remove
  unused parts from code generation
  ([\#1032](https://github.com/igraph/rigraph/issues/1032)), eliminate
  the use of some deprecated C functions.

- Use integers for mode enum in
  [`cluster_label_prop()`](https://r.igraph.org/reference/cluster_label_prop.md).

- Standardize the handling of some stimulus enum types
  ([\#1064](https://github.com/igraph/rigraph/issues/1064)).

- Remove unused vectorlist / matrixlist destructors
  ([\#1070](https://github.com/igraph/rigraph/issues/1070)).

- Remove unused stimulus type VERTEXSETLIST_INT
  ([\#1049](https://github.com/igraph/rigraph/issues/1049)).

- Remove unused types
  ([\#1060](https://github.com/igraph/rigraph/issues/1060)).

- Fix Stimulus definitions
  ([\#997](https://github.com/igraph/rigraph/issues/997)).

- Avoid deprecated `R_igraph_automorphisms()`
  ([\#999](https://github.com/igraph/rigraph/issues/999)).

- Use new ARPACK_DEFAULTS symbol from C core for default arpack options.

- Ignore upstream CITATION file to avoid R CMD check NOTE
  ([\#1007](https://github.com/igraph/rigraph/issues/1007)).

- Add Aviator configuration.

### Testing

- Add
  [`as_biadjacency_matrix()`](https://r.igraph.org/reference/as_biadjacency_matrix.md)
  tests for named vectors
  ([\#1154](https://github.com/igraph/rigraph/issues/1154),
  [\#1155](https://github.com/igraph/rigraph/issues/1155)).

- Test transferring colors in isomorphism functions
  ([\#1050](https://github.com/igraph/rigraph/issues/1050)).

## igraph 1.6.0

CRAN release: 2023-12-11

### Breaking changes

- New [`arpack_defaults()`](https://r.igraph.org/reference/arpack.md)
  replaces `igraph.arpack.default` and `arpack_defaults` lists
  ([\#800](https://github.com/igraph/rigraph/issues/800)), with
  consistent usage checks
  ([\#966](https://github.com/igraph/rigraph/issues/966)).

- Define methods for
  [`ape::as.phylo()`](https://rdrr.io/pkg/ape/man/as.phylo.html) instead
  of own [`as_phylo()`](https://r.igraph.org/reference/as_phylo.md)
  generic, remove deprecated `asPhylo()`
  ([\#763](https://github.com/igraph/rigraph/issues/763)).

- [`bfs()`](https://r.igraph.org/reference/bfs.md) with unreachable
  nodes returns zero instead of `NaN` as `rank`
  ([\#956](https://github.com/igraph/rigraph/issues/956)), and negative
  instead of `NaN` for `dist`
  ([\#926](https://github.com/igraph/rigraph/issues/926)).

- [`random_walk()`](https://r.igraph.org/reference/random_walk.md) adds
  one more step, the resulting list of vertices is of length `steps + 1`
  ([\#934](https://github.com/igraph/rigraph/issues/934)).

- [`girth()`](https://r.igraph.org/reference/girth.md) returns `Inf` for
  acyclic graphs
  ([\#931](https://github.com/igraph/rigraph/issues/931)).

- Remove some behaviour / parameters that were deprecated in 1.3
  ([\#842](https://github.com/igraph/rigraph/issues/842)).

- Remove `scg_eps()`, `scg_group()` and `scg_semi_proj()`, broken and no
  longer maintained
  ([\#946](https://github.com/igraph/rigraph/issues/946)).

### Bug fixes

- Fix `printf()` warning
  ([\#975](https://github.com/igraph/rigraph/issues/975)).

- Fix calls to
  [`isSymmetric()`](https://rdrr.io/pkg/Matrix/man/isSymmetric-methods.html)
  for matrix objects with a class
  ([\#965](https://github.com/igraph/rigraph/issues/965)).

- Reduce frequency of interruption checks
  ([\#957](https://github.com/igraph/rigraph/issues/957)).

### Features

- Change “incidence matrix” naming to “biadjacency matrix”
  ([\#962](https://github.com/igraph/rigraph/issues/962)).

- Add aliases using the neighborhood terminology for all ego functions:
  ([\#950](https://github.com/igraph/rigraph/issues/950)).

- Rename arguments to `assortativity(values, values.in)` from `types1`
  and `types2` ([\#952](https://github.com/igraph/rigraph/issues/952)).

- Add ellipsis to
  [`cluster_label_prop()`](https://r.igraph.org/reference/cluster_label_prop.md)
  ([\#954](https://github.com/igraph/rigraph/issues/954)).

- Placeholders for
  [`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md) and
  [`is_forest()`](https://r.igraph.org/reference/is_forest.md), to be
  implemented in igraph 2.0.0
  ([\#945](https://github.com/igraph/rigraph/issues/945)).

- `is_tree(details = TRUE)` designates the first vertex as root for
  non-trees ([\#935](https://github.com/igraph/rigraph/issues/935)).

- [`all_shortest_paths()`](https://r.igraph.org/reference/distances.md)
  returns the vertex list in both `res` and `vpaths` components
  ([\#930](https://github.com/igraph/rigraph/issues/930)).

- Improve symmetry check for adjacency matrices on input
  ([\#911](https://github.com/igraph/rigraph/issues/911)).

- Warn if non-symmetric undirected adjacency matrix
  ([\#904](https://github.com/igraph/rigraph/issues/904)).

### Documentation

- Remove duplicate `\seealso{}`
  ([\#948](https://github.com/igraph/rigraph/issues/948)).

- Update `knnk()` and [`sir()`](https://r.igraph.org/reference/sir.md)
  docs.

- Fix formula in
  [`reciprocity()`](https://r.igraph.org/reference/reciprocity.md) docs.

- [`strength()`](https://r.igraph.org/reference/strength.md) does not
  give a warning when no weights are given.

- Update
  [`sample_smallworld()`](https://r.igraph.org/reference/sample_smallworld.md)
  manual page ([\#895](https://github.com/igraph/rigraph/issues/895)).

- Correct documentation for weighted cliques.

- Update Erdos-Renyi model docs.

### Testing

- Clean up tests
  ([\#967](https://github.com/igraph/rigraph/issues/967)).

- Stabilize tests for
  [`cluster_label_prop()`](https://r.igraph.org/reference/cluster_label_prop.md)
  ([\#932](https://github.com/igraph/rigraph/issues/932)),
  [`sample_pa()`](https://r.igraph.org/reference/sample_pa.md)
  ([\#927](https://github.com/igraph/rigraph/issues/927)),
  [`cluster_louvain()`](https://r.igraph.org/reference/cluster_louvain.md)
  ([\#933](https://github.com/igraph/rigraph/issues/933)), SIR
  ([\#936](https://github.com/igraph/rigraph/issues/936)),
  [`sample_forestfire()`](https://r.igraph.org/reference/sample_forestfire.md)
  ([\#929](https://github.com/igraph/rigraph/issues/929)).

- Hard-code graph used in test
  ([\#928](https://github.com/igraph/rigraph/issues/928)).

- Update GML test file
  ([\#925](https://github.com/igraph/rigraph/issues/925)).

- Improve test for sampling from Dirichlet distribution
  ([\#923](https://github.com/igraph/rigraph/issues/923)).

- Omit test that no longer holds with igraph 0.10
  ([\#922](https://github.com/igraph/rigraph/issues/922)).

- Stabilize test in preparation for upgrade
  ([\#920](https://github.com/igraph/rigraph/issues/920)).

- Stabilize plot test
  ([\#919](https://github.com/igraph/rigraph/issues/919)).

- Fix checks.

## igraph 1.5.1

CRAN release: 2023-08-10

### Breaking changes

- Breaking change: start deprecation of
  [`estimate_betweenness()`](https://r.igraph.org/reference/estimate_betweenness.md),
  [`estimate_edge_betweenness()`](https://r.igraph.org/reference/estimate_edge_betweenness.md),
  [`estimate_closeness()`](https://r.igraph.org/reference/estimate_closeness.md)
  ([\#852](https://github.com/igraph/rigraph/issues/852)).

### Bug fixes

- [`identical_graphs()`](https://r.igraph.org/reference/identical_graphs.md)
  now correctly detects identical graphs without node or edge attributes
  ([\#757](https://github.com/igraph/rigraph/issues/757)).

### Internal

- Change ownership rules of attribute objects
  ([\#870](https://github.com/igraph/rigraph/issues/870)).

- `R_SEXP_to_igraph()` and `R_SEXP_to_igraph_copy()` get `igraph_t`
  object from external pointer
  ([\#865](https://github.com/igraph/rigraph/issues/865)).

- Remove `ETIME()` call from Fortran code, already in CRAN version
  1.5.0.1 ([\#858](https://github.com/igraph/rigraph/issues/858)).

- Ensure that `_GNU_SOURCE` is always defined
  ([\#877](https://github.com/igraph/rigraph/issues/877)).

- Fix `make clean`
  ([\#860](https://github.com/igraph/rigraph/issues/860)).

- Fix generation of code for functions with `VERTEX_COLOR` out-arguments
  ([\#850](https://github.com/igraph/rigraph/issues/850)).

- Use `-lquadmath` in `Makevars.win`, for compatibility with alternative
  R distributions such as Microsoft R Open
  ([\#855](https://github.com/igraph/rigraph/issues/855)).

- [`getRversion()`](https://rdrr.io/r/base/numeric_version.html) uses
  strings.

### Documentation

- Add cffr file and a GHA workflow that updates it automatically
  ([\#873](https://github.com/igraph/rigraph/issues/873)).

- Undeprecate [`neighborhood()`](https://r.igraph.org/reference/ego.md)
  ([\#851](https://github.com/igraph/rigraph/issues/851)).

- Remove redundant reference to AUTHORS from DESCRIPTION.

### Refactoring

- Breaking change: start deprecation of
  [`estimate_betweenness()`](https://r.igraph.org/reference/estimate_betweenness.md),
  [`estimate_edge_betweenness()`](https://r.igraph.org/reference/estimate_edge_betweenness.md),
  [`estimate_closeness()`](https://r.igraph.org/reference/estimate_closeness.md)
  ([\#852](https://github.com/igraph/rigraph/issues/852)).

## igraph 1.5.0

CRAN release: 2023-06-16

### Breaking changes

The internal format of graph objects has changed in a mostly
backward-compatible way, to prepare for upgrading the C core to 0.10.
Details are described at
<https://github.com/igraph/rigraph/wiki/The-igraph-object-format>.
Accessing graph objects that have been created with an older igraph
version give a clean error message with instructions
([\#832](https://github.com/igraph/rigraph/issues/832)). The new format
cannot be read by igraph 1.4.3 or older, the following error is raised
when trying to do so:

    This graph was created by an old(er) igraph version.
      Call upgrade_graph() on it to use with the current igraph version
      For now we convert it on the fly...
    Error in is_directed(object) :
      REAL() can only be applied to a 'numeric', not a 'NULL'

The only supported remedy is to upgrade the igraph package to version
1.5.0 or later.

[`graph_version()`](https://r.igraph.org/reference/graph_version.md) now
returns an integer scalar
([\#832](https://github.com/igraph/rigraph/issues/832),
[\#847](https://github.com/igraph/rigraph/issues/847)), `4` as of igraph
1.5.0 ([\#835](https://github.com/igraph/rigraph/issues/835)).

### Features

- Vertex and edge sequences are converted to numeric vectors when used
  in attributes ([\#808](https://github.com/igraph/rigraph/issues/808)).

- New
  [`largest_component()`](https://r.igraph.org/reference/components.md)
  returns the largest connected component
  ([\#786](https://github.com/igraph/rigraph/issues/786),
  [@ngmaclaren](https://github.com/ngmaclaren)).

### Bug fixes

- Fix error message in
  [`make_graph()`](https://r.igraph.org/reference/make_graph.md) when
  `simplify = ...` is used with a non-formula
  ([\#834](https://github.com/igraph/rigraph/issues/834)).

### Testing

- Add more tests for
  [`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md)
  ([\#826](https://github.com/igraph/rigraph/issues/826)).

- Reenable serialization test and tests for
  [`dyad_census()`](https://r.igraph.org/reference/dyad_census.md),
  stabilize tests
  ([\#809](https://github.com/igraph/rigraph/issues/809),
  [\#822](https://github.com/igraph/rigraph/issues/822),
  [\#823](https://github.com/igraph/rigraph/issues/823)).

### Documentation

- The documentation for the R package is now hosted at
  <https://r.igraph.org/>
  ([\#780](https://github.com/igraph/rigraph/issues/780)).

- Update `vignette("installation-troubleshooting")`.

- Fix use of deprecated functions in examples, e.g., replace
  [`gsize()`](https://r.igraph.org/reference/gsize.md) by
  [`ecount()`](https://r.igraph.org/reference/gsize.md)
  ([\#827](https://github.com/igraph/rigraph/issues/827)).

- Fix typos in
  [`?eigen_centrality`](https://r.igraph.org/reference/eigen_centrality.md)
  docs ([@JJ](https://github.com/JJ)).

- Update CONTRIBUTING.md and ORCID information
  ([\#791](https://github.com/igraph/rigraph/issues/791),
  [\#774](https://github.com/igraph/rigraph/issues/774)).

- Add DOI to CITATION
  ([\#773](https://github.com/igraph/rigraph/issues/773)).

### Internal

- Add data for old igraph versions as constructed objects, and tests
  ([\#838](https://github.com/igraph/rigraph/issues/838)).

- Ensure we’re always using named indexes to access the internal data
  structure ([\#784](https://github.com/igraph/rigraph/issues/784)).

- Prepare migration to igraph/C 0.10
  ([\#781](https://github.com/igraph/rigraph/issues/781)).

- Update generated interface
  ([\#765](https://github.com/igraph/rigraph/issues/765)).

## igraph 1.4.3

CRAN release: 2023-05-22

### Internal

- Fix tests for dev waldo
  ([\#779](https://github.com/igraph/rigraph/issues/779),
  [@hadley](https://github.com/hadley)).

- Fix linking on Windows: gfortran needs quadmath.
  ([\#778](https://github.com/igraph/rigraph/issues/778)).

### Documentation

- Mention limitation of Pajek reader
  ([\#776](https://github.com/igraph/rigraph/issues/776)).

## igraph 1.4.2

CRAN release: 2023-04-07

### Breaking changes

- Remove
  [`igraph.eigen.default()`](https://r.igraph.org/reference/spectrum.md)
  and `eigen_defaults`, introduce internal `eigen_defaults()` as a
  function ([\#741](https://github.com/igraph/rigraph/issues/741)).

- Remove broken `nexus*()` functions
  ([\#705](https://github.com/igraph/rigraph/issues/705)), and `srand()`
  ([\#701](https://github.com/igraph/rigraph/issues/701)).

### C core

- Update C core.

- ARPACK-based calculations are now interruptible.

- [`shortest_paths()`](https://r.igraph.org/reference/distances.md) and
  [`all_shortest_paths()`](https://r.igraph.org/reference/distances.md)
  no longer crash when an invalid `from` vertex is passed and weights
  are being used.

See
[diff](https://github.com/igraph/igraph/compare/87c70998344a39b44218f7af903bf62b8bbf3e71...98304787bc811bf709be5aeddea7b570c370988e)
for details.

### Printing

- Use true vertex names for printing vertex sets. If a vertex set
  captures a relationship between vertices (e.g., the `father` component
  of [`bfs()`](https://r.igraph.org/reference/bfs.md)), the vertex set
  is printed as a named vector
  ([\#754](https://github.com/igraph/rigraph/issues/754)).

- Suggest restarting R session after fatal error
  ([\#745](https://github.com/igraph/rigraph/issues/745)).

### Bug fixes

- [`as_long_data_frame()`](https://r.igraph.org/reference/as_long_data_frame.md)
  now correctly processes vertex attributes and works with graphs
  without vertex attributes
  ([\#748](https://github.com/igraph/rigraph/issues/748)).

- `as.hclust(hrg.fit(g))` works again
  ([\#721](https://github.com/igraph/rigraph/issues/721)).

### Documentation

- The documentation is now available at <https://igraph.org/>
  ([\#743](https://github.com/igraph/rigraph/issues/743)).

- Reorganize function reference
  ([\#662](https://github.com/igraph/rigraph/issues/662)).

- Replace [`graph()`](https://r.igraph.org/reference/graph.md) with
  [`make_graph()`](https://r.igraph.org/reference/make_graph.md) in
  examples ([\#738](https://github.com/igraph/rigraph/issues/738)).

- Add docs for `as.hclust.igraphHRG()`
  ([\#733](https://github.com/igraph/rigraph/issues/733)).

- Merged man page of
  [`hub_score()`](https://r.igraph.org/reference/hub_score.md) and
  [`authority_score()`](https://r.igraph.org/reference/hub_score.md)
  ([\#698](https://github.com/igraph/rigraph/issues/698)).

- Refactor contributors listing
  ([\#647](https://github.com/igraph/rigraph/issues/647)).

- Improve “family” titles
  ([\#679](https://github.com/igraph/rigraph/issues/679)).

- Improve docs of ego/neighborhood functions.

- Improve
  [`transitivity()`](https://r.igraph.org/reference/transitivity.md)
  docs.

### Internal

- Introduce cpp11 package to improve error handling in the long run
  ([\#720](https://github.com/igraph/rigraph/issues/720)).

- Avoid longjmp for error handling and interrupts
  ([\#751](https://github.com/igraph/rigraph/issues/751)).

- `as.hclust.igraphHRG` uses
  [`.Call()`](https://rdrr.io/r/base/CallExternal.html) interface
  ([\#727](https://github.com/igraph/rigraph/issues/727)).

## igraph 1.4.1

CRAN release: 2023-02-24

### Bug fixes

- [`console()`](https://r.igraph.org/reference/console.md) now works
  again and provides a Tcl/Tk based UI where igraph can post status
  messages and progress info
  ([\#664](https://github.com/igraph/rigraph/issues/664)).

- Fix errors when printing long vertex names
  ([\#677](https://github.com/igraph/rigraph/issues/677),
  [@ahmohamed](https://github.com/ahmohamed)).

- Fix regression that broke builds on some systems (e.g., GCC version 5
  or earlier), introduced in igraph 1.4.0
  ([\#670](https://github.com/igraph/rigraph/issues/670),
  [\#671](https://github.com/igraph/rigraph/issues/671)).

- [`fit_hrg()`](https://r.igraph.org/reference/fit_hrg.md) does not
  crash any more when called with a graph that has less than three
  vertices.

### Documentation

- Various improvements
  ([\#663](https://github.com/igraph/rigraph/issues/663),
  [@maelle](https://github.com/maelle);
  [\#667](https://github.com/igraph/rigraph/issues/667)).

### Internal

- Fix warning about `yyget_leng()` returning wrong type when using LTO
  ([\#676](https://github.com/igraph/rigraph/issues/676)).

- Don’t mention C++11 or C++17 for best compatibility with both newest R
  and older compilers, while still requesting a C++ compiler for
  linking.

- Don’t ignore `build/` when building the package because the vignette
  index is built there.

- Skip plot test entirely on R-devel.

- Avoid submodules for building igraph
  ([\#674](https://github.com/igraph/rigraph/issues/674)).

- Makevars cleanup
  ([\#671](https://github.com/igraph/rigraph/issues/671)).

- Add Zenodo configuration file.

## igraph 1.4.0

CRAN release: 2023-02-10

### Breaking changes

- Breaking change: Allow change of attribute type when setting attribute
  for all vertices or edges; only attributes of length 1 or the length
  of the target set allowed
  ([\#633](https://github.com/igraph/rigraph/issues/633)).

### Added

- [`tkplot()`](https://r.igraph.org/reference/tkplot.md) gained a
  `palette` argument and it is now using the same palette as
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html) by default,
  for sake of consistency.
- [`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md)
  gained a `loop.size` argument that can be used to scale the common
  radius of the loop edges.

### Fixed

- The default maximum number of iterations for ARPACK has been increased
  to 3000 to match that of the igraph C core.
- Rare convergence problems have been corrected in
  [`cluster_leading_eigen()`](https://r.igraph.org/reference/cluster_leading_eigen.md).
- All ARPACK-based functions now respect random seeds set in R when
  generating a random starting vector.
- [`igraph_version()`](https://r.igraph.org/reference/igraph_version.md)
  returned an invalid value in 1.3.4, this is now corrected.
- The value of `par(xpd=...)` is now restored after plotting a graph.
- Fixed a bug in
  [`as.dendrogram.communities()`](https://r.igraph.org/reference/communities.md)
  for large dendrograms, thanks to
  [@pkharchenko](https://github.com/pkharchenko) (see PR
  [\#292](https://github.com/igraph/rigraph/issues/292)).
- Fixed two bugs in
  [`graph_from_incidence_matrix()`](https://r.igraph.org/reference/graph_from_incidence_matrix.md)
  that prevented the creation of directed graphs with `mode="all"` from
  dense or sparse matrices.
- [`dfs()`](https://r.igraph.org/reference/dfs.md) accidentally returned
  zero-based root vertex indices in the result object; this is now fixed
  and the indices are now 1-based.
- [`as_graphnel()`](https://r.igraph.org/reference/as_graphnel.md) does
  not duplicate loop edges any more.
- [`as_graphnel()`](https://r.igraph.org/reference/as_graphnel.md) now
  checks that the input graph has no multi-edges. Multi-edges are not
  supported by the graphNEL class.
- [`convex_hull()`](https://r.igraph.org/reference/convex_hull.md) now
  returns the vertices of the convex hull with 1-based indexing.
- Some `rgl.*()` function calls in the codebase were replaced with
  equivalent `*3d()` function calls in preparation for upcoming
  deprecations in `rgl` (see PR
  [\#619](https://github.com/igraph/rigraph/issues/619))
- [`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md) does
  not use the `frame=...` partial argument any more when calling
  [`plot.default()`](https://rdrr.io/r/graphics/plot.default.html). The
  default `NULL` value of `frame.plot` is now also handled correctly.
- [`hub_score()`](https://r.igraph.org/reference/hub_score.md) and
  [`authority_score()`](https://r.igraph.org/reference/hub_score.md)
  considered self-loops only once on the diagonal of the adjacency
  matrix of undirected graphs, thus the result was not identical to that
  obtained by
  [`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md)
  on loopy undirected graphs. This is now corrected.
- [`distances()`](https://r.igraph.org/reference/distances.md) no longer
  ignores the `mode` parameter when `algorithm='johnson'`.

### Deprecated

- [`automorphisms()`](https://r.igraph.org/reference/automorphisms.md)
  was renamed to
  [`count_automorphisms()`](https://r.igraph.org/reference/count_automorphisms.md);
  the old name is still available, but it is deprecated.

### Other

- Documentation improvements.
- The Github repository was now moved to a single-branch setup where the
  package can be built from the `main` branch directly.
- Added igraph extended tutorial as an R vignette
  ([\#587](https://github.com/igraph/rigraph/issues/587)).
- igraph now has a homepage based on `pkgdown` thanks to
  [@maelle](https://github.com/maelle) (see
  [\#645](https://github.com/igraph/rigraph/issues/645)). This will
  eventually become the official homepage.

## igraph 1.3.5

CRAN release: 2022-09-22

Added:

- `mark.groups=...` argument of
  [`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md) now
  accepts `communities` objects

Fixed:

- Negative degree exponents are not allowed any more in
  [`sample_pa()`](https://r.igraph.org/reference/sample_pa.md) and
  `sample_aging_pa()`.

- Package updated to be compatible with Matrix 1.5.

Other:

- Documentation improvements and fixes.

## igraph 1.3.4

CRAN release: 2022-07-19

Added:

- [`sample_asym_pref()`](https://r.igraph.org/reference/sample_pref.md)
  now returns the generated types of the vertices in the vertex
  attributes named `outtype` and `intype`.

Fixed:

- [`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md)
  does not recurse infinitely any more if it is assigned to the `layout`
  attribute of a graph

- [`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md)
  now ignores edge weights when there are non-positive edge weights.
  This is needed because igraph 1.3.3 started validating edge weights in
  [`layout_with_fr()`](https://r.igraph.org/reference/layout_with_fr.md)
  and
  [`layout_with_drl()`](https://r.igraph.org/reference/layout_with_drl.md),
  resulting in errors when
  [`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md)
  was used on weighted graphs with negative weights. Since
  [`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md)
  is the default layout algorithm for
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html), most users
  were not even aware that they were using the FR or DrL layouts behind
  the scenes. Now the policy is that
  [`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md)
  attempts to get the job done without errors if possible, even if that
  means that edge weights must be ignored. A warning is printed if this
  is the case.

## igraph 1.3.3

CRAN release: 2022-07-14

Added:

- [`reverse_edges()`](https://r.igraph.org/reference/reverse_edges.md)
  reverses specific or all edges in a graph.

- Single-bracket indexing of
  [`V()`](https://r.igraph.org/reference/V.md) and
  [`E()`](https://r.igraph.org/reference/E.md) resolves attribute names
  in the indexing expressions by default (for instance,
  `E(g)[weight > x]` matches edges with a weight larger than a
  threshold). This can be problematic if the attribute masks one of the
  variables in the local evaluation context. We now have a pronoun
  called `.env` (similarly to
  [`rlang::.env`](https://rlang.r-lib.org/reference/dot-data.html)) that
  allows you to force attribute name lookup to the calling environment.
  For sake of completeness, we also provide `.data` (similarly to
  [`rlang::.data`](https://rlang.r-lib.org/reference/dot-data.html)) to
  force attribute name lookup to the vertex / edge attributes only.
  These pronouns are automatically injected into the environment where
  the indexing expression is evaluated.

Deprecated:

- Names of functions that can be used inside a
  [`V()`](https://r.igraph.org/reference/V.md) or
  [`E()`](https://r.igraph.org/reference/E.md) indexing start with a dot
  since igraph 1.1.1; however, the old dotless names did not print a
  deprecation warning so this may have gone unnoticed for years. We are
  introducting a deprecation warning for `nei()`, `innei()`, `outnei()`,
  `inc()`, `from()` and `to()` inside single-bracket indexing of vertex
  and edge sequences and will remove the old variants soon.

## igraph 1.3.2

CRAN release: 2022-06-13

The C core is updated to 0.9.9, fixing a range of bugs.

Fixed:

- The length of size-zero `communities` objects is now reported
  correctly.
- [`layout_with_kk()`](https://r.igraph.org/reference/layout_with_kk.md)
  would fail to produce reasonable results with the default initial
  coordinates. This has been corrected, however, this function no longer
  produces precisely the same output for a given graph as before. To
  restore the previous behaviour, use
  `layout_with_kk(g, coord=layout_in_circle(g))` in 2D or
  `layout_with_kk(g, dim=3, coord=layout_on_sphere(g))` in 3D.
- Indexing an `igraph.vs` object with `v[x, na_ok=T]` now correctly
  handles the `na_ok` argument in all cases; previous versions ignored
  it when `x` was a single number.

Other:

- Documentation improvements and fixes.

## igraph 1.3.1

CRAN release: 2022-04-20

Fixed:

- [`graph_from_adjacency_matrix()`](https://r.igraph.org/reference/graph_from_adjacency_matrix.md)
  now works with sparse matrices even if the cell values in the sparse
  matrix are unspecified.
- Fixed crash in
  [`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md)
  when `modularity=FALSE` and `membership=FALSE`.
- [`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md)
  no longer accepts invalid weight vectors.
- [`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md)
  no longer returns a modularity vector of invalid length for
  disconnected graphs. This also fixes some rare failures of this
  function on weighted disconnected graphs.
- [`edge_attr()`](https://r.igraph.org/reference/edge_attr.md) does not
  ignore its `index=...` argument any more.
- [`automorphisms()`](https://r.igraph.org/reference/automorphisms.md),
  [`automorphism_group()`](https://r.igraph.org/reference/automorphism_group.md)
  and
  [`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md)
  now allow all possible values supported by the C core in the `sh`
  argument. Earlier versions supported only `"fm"`.
- The `vertex.frame.width` plotting parameter now allows zero and
  negative values; these will simply remove the outline of the
  corresponding vertex.
- The documentation of the `sh` argument of the BLISS isomorphism
  algorithm in
  [`isomorphic()`](https://r.igraph.org/reference/isomorphic.md) was
  fixed; earlier versions incorrectly referred to `sh1` and `sh2`.
- [`dominator_tree()`](https://r.igraph.org/reference/dominator_tree.md)
  now conforms to its documentation with respect to the `dom` component
  of the result: it contains the indices of the dominator vertices for
  each vertex and `-1` for the root of the dominator tree.
- Mentions of the `"power"` algorithm of
  [`page_rank()`](https://r.igraph.org/reference/page_rank.md) have been
  removed from the documentation, as this method is no longer available.
- Several other documentation fixes to bring the docs up to date with
  new behaviours in igraph 1.3.

## igraph 1.3.0

CRAN release: 2022-04-01

The C core is updated to 0.9.7, fixing a range of bugs and introducing a
number of new functions.

Added:

- [`has_eulerian_path()`](https://r.igraph.org/reference/has_eulerian_path.md)
  and
  [`has_eulerian_cycle()`](https://r.igraph.org/reference/has_eulerian_path.md)
  decides whether there is an Eulerian path or cycle in the graph.
- [`eulerian_path()`](https://r.igraph.org/reference/has_eulerian_path.md)
  and
  [`eulerian_cycle()`](https://r.igraph.org/reference/has_eulerian_path.md)
  returns the edges and vertices in an Eulerian path or cycle in the
  graph.
- [`any_loop()`](https://r.igraph.org/reference/which_multiple.md)
  checks whether a graph contains at least one loop edge.
- [`is_tree()`](https://r.igraph.org/reference/is_tree.md) checks
  whether a graph is a tree and also finds a possible root
- [`to_prufer()`](https://r.igraph.org/reference/to_prufer.md) converts
  a tree graph into its Prufer sequence
- [`make_from_prufer()`](https://r.igraph.org/reference/make_from_prufer.md)
  creates a tree graph from its Prufer sequence
- [`sample_tree()`](https://r.igraph.org/reference/sample_tree.md) to
  sample labelled trees uniformly at random
- [`sample_spanning_tree()`](https://r.igraph.org/reference/sample_spanning_tree.md)
  to sample spanning trees of an undirected graph uniformly at random
- [`automorphisms()`](https://r.igraph.org/reference/automorphisms.md)
  and
  [`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md)
  now supports vertex colors
- [`random_edge_walk()`](https://r.igraph.org/reference/random_walk.md)
  to record the edges traversed during a random walk
- [`harmonic_centrality()`](https://r.igraph.org/reference/harmonic_centrality.md)
  calculates the harmonic centrality of vertices, optionally with a
  cutoff on path lengths
- [`mean_distance()`](https://r.igraph.org/reference/distances.md) now
  supports edge weights and it can also return the number of unconnected
  vertex pairs when `details=TRUE` is passed as an argument
- [`greedy_vertex_coloring()`](https://r.igraph.org/reference/greedy_vertex_coloring.md)
  finds vertex colorings based on a simple greedy algorithm.
- [`bridges()`](https://r.igraph.org/reference/articulation_points.md)
  finds the bridges (cut-edges) of a graph
- The frame width of circle, rectangle and square vertex shapes can now
  be adjusted on plots with the `frame.width` vertex attribute or the
  `vertex.frame.width` keyword argument, thanks to
  [@simoncarrignon](https://github.com/simoncarrignon) . See PR
  [\#500](https://github.com/igraph/rigraph/issues/500) for more
  details.
- [`automorphism_group()`](https://r.igraph.org/reference/automorphism_group.md)
  returns a possible (not necessarily minimal) generating set of the
  automorphism group of a graph.
- [`global_efficiency()`](https://r.igraph.org/reference/global_efficiency.md)
  calculates the global efficiency of the graph.
- [`local_efficiency()`](https://r.igraph.org/reference/global_efficiency.md)
  calculates the local efficiency of each vertex in a graph.
- [`average_local_efficiency()`](https://r.igraph.org/reference/global_efficiency.md)
  calculates the average local efficiency across the set of vertices in
  a graph.
- `rewire(each_edge(...))` now supports rewiring only one endpoint of
  each edge.
- [`realize_degseq()`](https://r.igraph.org/reference/realize_degseq.md)
  generates graphs from degree sequences in a deterministic manner. It
  is also available as `make_(degseq(..., deterministic=TRUE))`.
- [`clique_size_counts()`](https://r.igraph.org/reference/cliques.md)
  counts cliques of different sizes without storing them all.
- [`feedback_arc_set()`](https://r.igraph.org/reference/feedback_arc_set.md)
  finds a minimum-weight feedback arc set in a graph, either with an
  exact integer programming algorithm or with a linear-time
  approximation.
- [`make_bipartite_graph()`](https://r.igraph.org/reference/make_bipartite_graph.md)
  now handles vertices with names.
- [`shortest_paths()`](https://r.igraph.org/reference/distances.md) now
  supports graphs with negative edge weights.
- [`min_cut()`](https://r.igraph.org/reference/min_cut.md) now supports
  s-t mincuts even if `value.only=FALSE`.
- [`as.matrix()`](https://rdrr.io/r/base/matrix.html) now supports
  converting an igraph graph to an adjacency or edge list matrix
  representation. See
  [`as.matrix.igraph()`](https://r.igraph.org/reference/as.matrix.igraph.md)
  for more details. This function was migrated from `intergraph`; thanks
  to Michal Bojanowski.

Fixed:

- [`is_connected()`](https://r.igraph.org/reference/components.md) now
  returns FALSE for the null graph
- Calling [`length()`](https://rdrr.io/r/base/length.html) on a graph
  now returns the number of vertices to make it consistent with indexing
  the graph with `[[`.
- [`diameter()`](https://r.igraph.org/reference/diameter.md) now
  corrently returns infinity for disconnected graphs when
  `unconnected=FALSE`. Previous versions returned the number of vertices
  plus one, which was clearly invalid for weighted graphs.
- [`mean_distance()`](https://r.igraph.org/reference/distances.md) now
  correctly treats the path length between disconnected vertices as
  infinite when `unconnected=FALSE`. Previous versions used the number
  of vertices plus one, adding a bias towards this number, even if the
  graph was weighted and the number of vertices plus one was not a path
  length that could safely have been considered as being longer than any
  “valid” path.
- [`layout_with_sugiyama()`](https://r.igraph.org/reference/layout_with_sugiyama.md)
  now handles the case of exactly one extra virtual node correctly;
  fixes [\#85](https://github.com/igraph/rigraph/issues/85)
- [`bfs()`](https://r.igraph.org/reference/bfs.md) and
  [`dfs()`](https://r.igraph.org/reference/dfs.md) callback functions
  now correctly receive 1-based vertex indices and ranks; it used to be
  zero-based in earlier versions
- Accidentally returning a non-logical value from a
  [`bfs()`](https://r.igraph.org/reference/bfs.md) or
  [`dfs()`](https://r.igraph.org/reference/dfs.md) callback does not
  crash R any more
- Calling [`print()`](https://rdrr.io/r/base/print.html) on a graph with
  a small `max.lines` value (smaller than the number of lines needed to
  print the attribute list and the header) does not raise an error any
  more; fixes [\#179](https://github.com/igraph/rigraph/issues/179)
- `as_adjacency_matrix(edges=TRUE, sparse=TRUE)` now consistently
  returns the last edge ID for each cell in the matrix instead of
  summing them.
- Using the `+` and `-` operators with a
  [`path()`](https://r.igraph.org/reference/path.md) object consisting
  of two vertices is now handled correctly; fixes
  [\#355](https://github.com/igraph/rigraph/issues/355)
- [`topo_sort()`](https://r.igraph.org/reference/topo_sort.md) now
  throws an error if the input graph is not acyclic instead of returning
  an incorrect partial ordering.
- Weighted transitivity calculations (i.e. `transitivity(mode="barrat")`
  now throw an error for multigraphs; the implementation does not work
  correctly for multigraphs and earlier versions did not warn about
  this.

Changed:

- The `neimode` argument of
  [`bfs()`](https://r.igraph.org/reference/bfs.md) and
  [`dfs()`](https://r.igraph.org/reference/dfs.md) was renamed to `mode`
  for sake of consistency with other functions. The old argument name is
  deprecated and will be removed in 1.4.0.
- [`bfs()`](https://r.igraph.org/reference/bfs.md) and
  [`dfs()`](https://r.igraph.org/reference/dfs.md) callback functions
  now correctly receive 1-based vertex indices and ranks; it used to be
  zero-based in earlier versions. (This is actually a bugfix so it’s
  also mentioned in the “Fixed” section).
- [`closeness()`](https://r.igraph.org/reference/closeness.md),
  [`betweenness()`](https://r.igraph.org/reference/betweenness.md) and
  [`edge_betweenness()`](https://r.igraph.org/reference/betweenness.md)
  now all take a `cutoff` argument on their own.
  [`estimate_closeness()`](https://r.igraph.org/reference/estimate_closeness.md),
  [`estimate_betweenness()`](https://r.igraph.org/reference/estimate_betweenness.md)
  and
  [`estimate_edge_betweenness()`](https://r.igraph.org/reference/estimate_edge_betweenness.md)
  became aliases, with identical signature. They are *not* deprecated
  but their implementation might change in future versions to provide
  proper estimation schemes instead of a simple cutoff-based
  approximation. If you explicitly need cutoffs and you want your
  results to be reproducible with future versions, use
  [`closeness()`](https://r.igraph.org/reference/closeness.md),
  [`betweenness()`](https://r.igraph.org/reference/betweenness.md) and
  [`edge_betweenness()`](https://r.igraph.org/reference/betweenness.md)
  in your code with a `cutoff` argument.
- [`closeness()`](https://r.igraph.org/reference/closeness.md) now only
  considers *reachable* vertices during the calculation; in other words,
  closeness centrality is now calculated on a per-component basis for
  disconnected graphs. Earlier versions considered *all* vertices.

Deprecated:

- Using `cutoff=0` for
  [`closeness()`](https://r.igraph.org/reference/closeness.md),
  [`betweenness()`](https://r.igraph.org/reference/betweenness.md) and
  [`edge_betweenness()`](https://r.igraph.org/reference/betweenness.md)
  is deprecated; if you want exact scores, use a negative cutoff.
  `cutoff=0` will be interpreted literally from igraph 1.4.0.
- [`centr_degree_tmax()`](https://r.igraph.org/reference/centr_degree_tmax.md)
  now prints a warning when it is invoked without an explicit `loops`
  argument. `loops` will be mandatory from igraph 1.4.0.
- The `nexus_list()`, `nexus_info()`, `nexus_get()` and `nexus_search()`
  functions now return an error informing the user that the Nexus graph
  repository has been taken offline (actually, several years ago). These
  functions will be removed in 1.4.0.
- The `edges` argument of
  [`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md)
  is deprecated; it will be removed in igraph 1.4.0.

Removed:

- The deprecated `page_rank_old()` function and the deprecated `power`
  method of [`page_rank()`](https://r.igraph.org/reference/page_rank.md)
  were removed.

## igraph 1.2.11

CRAN release: 2022-01-04

Dec 27, 2021

No user visible changes.

## igraph 1.2.10

CRAN release: 2021-12-15

Dec 14, 2021

Fixed:

- The macOS versions of `igraph` were accidentally built without GraphML
  support on CRAN; this should now be fixed.

## igraph 1.2.9

CRAN release: 2021-11-23

Nov 22, 2021

No user visible changes.

## igraph 1.2.8

CRAN release: 2021-11-07

Oct 26, 2021

No user visible changes.

## igraph 1.2.7

CRAN release: 2021-10-15

Oct 15, 2021

The C core is updated to 0.8.5, fixing a range of bugs and introducing a
number of new functions.

Added:

- cluster_leiden added
  ([\#399](https://github.com/igraph/rigraph/issues/399)).
- cluster_fluid_communities added
  ([\#454](https://github.com/igraph/rigraph/issues/454))

Fixed:

- [`make_lattice()`](https://r.igraph.org/reference/make_lattice.md)
  correctly rounds `length` to the nearest integer while printing a
  warning ([\#115](https://github.com/igraph/rigraph/issues/115)).
- `make_empty_graph(NULL)` now prints an error instead of producing an
  invalid graph ([\#404](https://github.com/igraph/rigraph/issues/404)).
- `make_graph(c())` now produces an empty graph instead of printing a
  misleading error message
  ([\#431](https://github.com/igraph/rigraph/issues/431)).
- Printing a graph where some edges have NA as the names of both
  endpoints does not produce a misleading error message any more
  ([\#410](https://github.com/igraph/rigraph/issues/410)).
- The `types` argument of functions related to bipartite graphs now
  prints a warning when the types are coerced to booleans
  ([\#476](https://github.com/igraph/rigraph/issues/476)).
- Betweenness normalisation no longer overflows
  ([\#442](https://github.com/igraph/rigraph/issues/442)).
- [`layout_with_sugiyama()`](https://r.igraph.org/reference/layout_with_sugiyama.md)
  returns a layout of type matrix even if there is only one vertex in
  the graph ([\#408](https://github.com/igraph/rigraph/issues/408)).
- Plotting a null graph (i.e. a graph with no vertices) does not throw
  an error any more
  ([\#387](https://github.com/igraph/rigraph/issues/387)).

Deprecated:

- The `membership` argument of `modularity.matrix()` is now deprecated
  as the function never needed it anyway.
- [`modularity()`](https://r.igraph.org/reference/modularity.igraph.md)
  now prints a warning when it is applied on a directed graph because
  the implementation in igraph’s C core does not support directed graphs
  as of version 0.8.5. The warning will be turned into an error in the
  next minor (1.3.0) version of the R interface; the error will be
  removed later when the C core is updated to a version that supports
  modularity for directed networks.
- [`transitivity()`](https://r.igraph.org/reference/transitivity.md) now
  prints a warning when its local variant (`type="local"`) is called on
  a directed graph or a graph with multiple edges beecause the
  implementation in the C core of igraph does not work reliably in these
  cases as of version 0.8.5. The warning will be turned into an error in
  the next minor (1.3.0) version of the R interface; the error will be
  removed later when the C core is updated to a version that supports
  transitivity for networks with multiple edges.

Misc:

- Documentation improvements.

## igraph 1.2.6

CRAN release: 2020-10-06

Oct 5, 2020

No user visible changes.

## igraph 1.2.5

CRAN release: 2020-03-19

Mar 27, 2020

No user visible changes.

## igraph 1.2.4

CRAN release: 2019-02-13

Feb 13, 2019

No user visible changes.

## igraph 1.2.3

CRAN release: 2019-02-10

Jan 27, 2019

No user visible changes.

## igraph 1.2.2

CRAN release: 2018-07-27

Jul 27, 2018

No user visible changes.

## igraph 1.2.1

CRAN release: 2018-03-10

- The GLPK library is optional, if it is not available, then the
  [`cluster_optimal()`](https://r.igraph.org/reference/cluster_optimal.md)
  function does not work. Unfortunately we cannot bundle the GLPK
  library into igraph on CRAN any more, because CRAN maintainers forbid
  the pragmas in its source code.
- Removed the NMF package dependency, and related functions.
- Fix compilation without libxml2

## igraph 1.1.2

CRAN release: 2017-07-21

Jul 20, 2017

- Fix compilation on Solaris

## igraph 1.1.1

CRAN release: 2017-07-16

Jul 13, 2017

- Graph id is printed in the header, and a `graph_id` function was added
- Fix `edge_attr` for some index values
- Fix a [`bfs()`](https://r.igraph.org/reference/bfs.md) bug,
  `restricted` argument was zero-based
- `match_vertices` is exported now
- `%>%` is re-exported in a better way, to avoid interference with other
  packages
- `ego_` functions default to `order = 1` now
- New function `igraph_with_opt` to run code with temporary igraph
  options settings
- Fix broken `sample_asym_pref` function
- Fix `curve_multiple` to avoid warnings for graphs with self-loops.
- The `NMF` package is only suggested now, it is not a hard dependency
- Fix gen_uid.c \_SVID_SOURCE issues
- Avoid drawing straight lines as Bezier curves
- Use the `pkgconfig` package for options. This allows setting options
  on a per-package basis. E.g. a package using igraph can set
  `return.vs.es` to `FALSE` in its `.onLoad()` function, and then igraph
  will return plain numeric vectors instead of vertex/edge sequences *if
  called from this package*.
- [`igraph_options()`](https://r.igraph.org/reference/igraph_options.md)
  returns the *old* values of the updated options, this is actually
  useful, returning the new values was not.
- [`with_igraph_opt()`](https://r.igraph.org/reference/with_igraph_opt.md)
  function to temporarily change values of igraph options.
- [`get.edge()`](https://r.igraph.org/reference/get.edge.md) is
  deprecated, use [`ends()`](https://r.igraph.org/reference/ends.md)
  instead. (This was already the case for igraph 1.0.0, but we forgot to
  add a NEWS point for it.)
- Do not redefine [`.Call()`](https://rdrr.io/r/base/CallExternal.html),
  to make native calls faster.
- Speed up special cases of indexing vertex sequences.
- Removed an [`anyNA()`](https://rdrr.io/r/base/NA.html) call, to be
  compatible with older R versions.
- Fixed a fast-greedy community finding bug,
  <https://github.com/igraph/igraph/issues/836>
- Fixed [`head_of()`](https://r.igraph.org/reference/head_of.md) and
  [`tail_of()`](https://r.igraph.org/reference/tail_of.md), they were
  mixed up.
- Plot: make `label.dist` independent of label lengths, fixes
  [\#63](https://github.com/igraph/rigraph/issues/63).
- Plot: no error for unknown graphical parameters.
- Import functions from base packages, to eliminate `R CMD check`
  `NOTE`s.
- Re-add support for edge weights in Fruchterman-Reingold layout
- Check membership vector in
  [`modularity()`](https://r.igraph.org/reference/modularity.igraph.md).
- Rename
  [`str.igraph()`](https://r.igraph.org/reference/print.igraph.md) to
  [`print_all()`](https://r.igraph.org/reference/print.igraph.md).
- Use the igraph version in exported graphs, instead of
  [@VERSION](https://github.com/VERSION)@
  [\#75](https://github.com/igraph/rigraph/issues/75).
- Functions that can be used inside a
  [`V()`](https://r.igraph.org/reference/V.md) or
  [`E()`](https://r.igraph.org/reference/E.md) indexing now begin with a
  dot. Old names are deprecated. New names:
  [`.nei()`](https://r.igraph.org/reference/inside-square-error.md),
  [`.innei()`](https://r.igraph.org/reference/inside-square-error.md),
  [`.outnei()`](https://r.igraph.org/reference/inside-square-error.md),
  [`.inc()`](https://r.igraph.org/reference/inside-square-error.md),
  [`.from()`](https://r.igraph.org/reference/inside-square-error.md),
  [`.to()`](https://r.igraph.org/reference/inside-square-error.md).
  [\#22](https://github.com/igraph/rigraph/issues/22)
- Fix packages that convert graphs to <graph::graphNEL>: they don’t need
  to attach ‘graph’ manually any more.
- Fix a bugs in `layout_with_dh`, `layout_with_gem` and
  `layout_with_sugiyama`. They crashed in some cases.

## igraph 1.0.1

CRAN release: 2015-06-26

June 26, 2015

Some minor updates:

- Documentation fixes.
- Do not require a C++-11 compiler any more.
- Fedora, Solaris and Windows compilation fixes.

## igraph 1.0.0

CRAN release: 2015-06-24

June 21, 2015

### Release notes

This is a new major version of igraph, and then why not call it 1.0.0.
This does not mean that it is ready, it’ll never be ready.

The biggest changes in the release are - the new function names. Most
functions were renamed to make them more consistent and readable.
(Relax, old names can still be used, no need to update any code.) -
Better operations for vertex and edge sequences. Most functions return
proper vertex/edge sequences instead of numeric ids. - The versatile
[`make_()`](https://r.igraph.org/reference/make_.md) and
[`make_graph()`](https://r.igraph.org/reference/make_graph.md) functions
to create graphs.

### Major changes

- Many functions were renamed. Old names are not documented, but can
  still be used.
- A generic
  [`make_graph()`](https://r.igraph.org/reference/make_graph.md)
  function to create graphs.
- A generic [`layout_()`](https://r.igraph.org/reference/layout_.md)
  (not the underscore!) function to create graph layouts, see also
  [`add_layout_()`](https://r.igraph.org/reference/add_layout_.md).
- The igraph data type has changed. You need to call
  [`upgrade_graph()`](https://r.igraph.org/reference/upgrade_graph.md)
  on graphs created with previous igraph versions.
- Vertex and edge sequence operations: union, intersection, etc.
- Vertex and edge sequences can only be used with the graphs they belong
  to. This is now strictly checked.
- Most functions that return a (sub)set of vertices or edges return
  vertex or edge sequences instead.
- Vertex and edge sequences have a `[[` operator now, for easy viewing
  of vertex/edge metadata.
- Vertex and edge sequences are implemented as weak references. See also
  the [`as_ids()`](https://r.igraph.org/reference/as_ids.md) function to
  convert them to simple ids.
- Vertex order can be specified for the circle layout now.
- Davidson-Harel layout algorithm
  [`layout_with_dh()`](https://r.igraph.org/reference/layout_with_dh.md).
- GEM layout algorithm
  [`layout_with_gem()`](https://r.igraph.org/reference/layout_with_gem.md).
- Neighborhood functions have a `mindist` parameter for the smallest
  distance to consider.
- [`all_simple_paths()`](https://r.igraph.org/reference/all_simple_paths.md)
  function to list all simple paths in a graph.
- [`triangles()`](https://r.igraph.org/reference/count_triangles.md)
  lists all triangles in a graph.
- Fruchterman-Reingold and Kamada-Kawai layout algorithms rewritten from
  scratch. They are much faster and follow the original publications
  closely.
- Nicer printing of graphs, vertex and edge sequences.
- [`local_scan()`](https://r.igraph.org/reference/local_scan.md)
  function calculates scan statistics.
- Embeddings:
  [`embed_adjacency_matrix()`](https://r.igraph.org/reference/embed_adjacency_matrix.md)
  and
  [`embed_laplacian_matrix()`](https://r.igraph.org/reference/embed_laplacian_matrix.md).
- Product operator: `*`, the same graph multiple times. Can be also used
  as [`rep()`](https://rdrr.io/r/base/rep.html).
- Better default colors, color palettes for vertices.
- Random walk on a graph:
  [`random_walk()`](https://r.igraph.org/reference/random_walk.md)
- [`adjacent_vertices()`](https://r.igraph.org/reference/adjacent_vertices.md)
  and
  [`incident_edges()`](https://r.igraph.org/reference/incident_edges.md)
  functions, they are vectorized, as opposed to `neighhors()` and
  [`incident()`](https://r.igraph.org/reference/incident.md).
- Convert a graph to a *long* data frame with
  [`as_long_data_frame()`](https://r.igraph.org/reference/as_long_data_frame.md).

### Bug fixes

Too many to list. Please try if your issue was fixed and (re-)report it
if not. Thanks!

## igraph 0.7.1

CRAN release: 2014-04-22

April 21, 2014

### Release Notes

Some bug fixes, to make sure that the code included in ‘Statistical
Analysis of Network Data with R’ works. See
<https://github.com/kolaczyk/sand>

### Detailed changes:

- Graph drawing: fix labels of curved edges, issue
  [\#181](https://github.com/igraph/rigraph/issues/181).
- Graph drawing: allow fixing edge labels at given positions, issue
  [\#181](https://github.com/igraph/rigraph/issues/181).
- Drop the ‘type’ vertex attribute after bipartite projection, the
  projections are not bipartite any more, issue
  [\#255](https://github.com/igraph/rigraph/issues/255).
- Print logical attributes in header properly (i.e. encoded by `l`, not
  `x`, which is for complex attributes. Issue
  [\#578](https://github.com/igraph/rigraph/issues/578).
- Add a constructor for `communities` objects, see
  [`create.communities()`](https://r.igraph.org/reference/create.communities.md).
  Issue [\#547](https://github.com/igraph/rigraph/issues/547).
- Better error handling in the GraphML parser.
- GraphML reader is a bit more lenient now; makes it possible to read
  GraphML files saved from yWorks apps.
- Fixed a bug in `constaint()`, issue
  [\#580](https://github.com/igraph/rigraph/issues/580).
- Bipartite projection now detects invalid edges instead of giving a
  cryptic error, issue
  [\#543](https://github.com/igraph/rigraph/issues/543).
- Fixed the `simplify` argument of
  [`graph.formula()`](https://r.igraph.org/reference/graph.formula.md),
  which was broken, issue
  [\#586](https://github.com/igraph/rigraph/issues/586).
- The function
  [`crossing()`](https://r.igraph.org/reference/communities.md) adds
  better names to the result, fixes issue
  [\#587](https://github.com/igraph/rigraph/issues/587).
- The [`sir()`](https://r.igraph.org/reference/sir.md) function gives an
  error if the input graph is not simple, fixes issue
  [\#582](https://github.com/igraph/rigraph/issues/582).
- Calling igraph functions from igraph callbacks is not allowed now,
  fixes issue [\#571](https://github.com/igraph/rigraph/issues/571).

## igraph 0.7.0

CRAN release: 2014-02-05

February 4, 2014

### Release Notes

There are a bunch of new features in the library itself, and other
important changes in the life of the project. Thanks everyone for
sending code and reporting bugs!

#### igraph @ github

igraph’s development has moved from Launchpad to github. This has
actually happened several month ago, but never announced officially. The
place for reporting bugs is at
<https://github.com/igraph/igraph/issues>.

#### New homepage

igraph’s homepage is now hosted at <http://igraph.org>, and it is brand
new. We wanted to make it easier to use and modern.

#### Better nightly downloads

You can download nightly builds from igraph at
<http://igraph.org/nightly>. Source and binary R packages (for windows
and OSX), are all built.

### New features and bug fixes

- Added a demo for hierarchical random graphs, invoke it via
  `demo(hrg)`.
- Make attribute prefixes optional when writing a GraphML file.
- Added function
  [`mod.matrix()`](https://r.igraph.org/reference/mod.matrix.md).
- Support edge weights in leading eigenvector community detection.
- Added the LAD library for checking (sub)graph isomorphism, version 1.
- Logical attributes.
- Added
  [`layout.bipartite()`](https://r.igraph.org/reference/layout.bipartite.md)
  function, a simple two-column layout for bipartite graphs.
- Support incidence matrices in bipartite Pajek files.
- Pajek files in matrix format are now directed by default, unless they
  are bipartite.
- Support weighted (and signed) networks in Pajek when file is in matrix
  format.
- Fixed a bug in
  [`barabasi.game()`](https://r.igraph.org/reference/barabasi.game.md),
  algorithm psumtree-multiple just froze.
- Function
  [`layout.mds()`](https://r.igraph.org/reference/layout.mds.md) by
  default returns a layout matrix now.
- Added support for Boolean attributes in the GraphML and GML readers
  and writer.
- Change MDS layout coordinates, first dim is according to first
  eigenvalue, etc.
- [`plot.communities()`](https://r.igraph.org/reference/communities.md)
  ([`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md),
  really) draws a border around the marked groups by default.
- printing graphs now converts the `name` graph attribute to character
- Convenience functions to query and set all attributes at once:
  `vertex.attriubutes()`,
  [`graph.attributes()`](https://r.igraph.org/reference/graph_attr.md)
  and
  [`edge.attributes()`](https://r.igraph.org/reference/edge_attr.md).
- Function
  [`graph.disjoint.union()`](https://r.igraph.org/reference/graph.disjoint.union.md)
  handles attributes now.
- Rewrite
  [`graph.union()`](https://r.igraph.org/reference/graph.union.md) to
  handle attributes properly.
- [`rewire()`](https://r.igraph.org/reference/rewire.md): now supports
  the generation and destruction of loops.
- Erdos-Renyi type bipartite random graphs:
  [`bipartite.random.game()`](https://r.igraph.org/reference/bipartite.random.game.md).
- Support the new options (predecessors and inbound_edges) of
  `get_shortest_paths()`, reorganized the output of
  [`get.shortest.paths()`](https://r.igraph.org/reference/get.shortest.paths.md)
  completely.
- Added
  [`graphlets()`](https://r.igraph.org/reference/graphlet_basis.md) and
  related functions.
- Fix modularity values of multilevel community if there are no merges
  at all.
- Fixed bug when deleting edges with FALSE in the matrix notation.
- Fix [`bonpow()`](https://r.igraph.org/reference/bonpow.md) and
  [`alpha.centrality()`](https://r.igraph.org/reference/alpha.centrality.md)
  and make sure that the sparse solver is called.
- [`tkplot()`](https://r.igraph.org/reference/tkplot.md) news: enable
  setting coordinates from the command line via
  [`tkplot.setcoords()`](https://r.igraph.org/reference/tkplot.setcoords.md)
  and access to the canvas via
  [`tkplot.canvas()`](https://r.igraph.org/reference/tkplot.canvas.md).
- Fixed a potential crash in `igraph_edge_connectivity()`, because of an
  un-initialized variable in the C code.
- Avoiding overflow in
  [`closeness()`](https://r.igraph.org/reference/closeness.md) and
  related functions.
- Check for NAs after converting ‘type’ to logical in
  [`bipartite.projection()`](https://r.igraph.org/reference/bipartite.projection.md).
- `graphNEL` conversion functions only load the ‘graph’ package if it
  was not loaded before and they load it at the end of the search path,
  to minimize conflicts.
- Fixed a bug when creating graphs from adjacency matrices, we now
  convert them to double, in case they are integers.
- Fixed an invalid memory read (and a potential crash) in the infomap
  community detection.
- Fixed a memory leak in the functions with attribute combinations.
- Removed some memory leaks from the SCG functions.
- Fixed some memory leaks in the ray tracer.
- Fixed memory leak in
  [`graph.bfs()`](https://r.igraph.org/reference/graph.bfs.md) and
  [`graph.dfs()`](https://r.igraph.org/reference/graph.dfs.md).
- Fix a bug in triad census that set the first element of the result to
  NaN.
- Fixed a crash in
  [`is.chordal()`](https://r.igraph.org/reference/is.chordal.md).
- Fixed a bug in weighted modularity calculation, sum of the weights was
  truncated to an integer.
- Fixed a bug in weighted multilevel communtiies, the maximum weight was
  rounded to an integer.
- Fixed a bug in
  [`centralization.closeness.tmax()`](https://r.igraph.org/reference/centralization.closeness.tmax.md).
- Reimplement push-relabel maximum flow with gap heuristics.
- Maximum flow functions now return some statistics about the push
  relabel algorithm steps.
- Function [`arpack()`](https://r.igraph.org/reference/arpack.md) now
  gives error message if unknown options are given.
- Fixed missing whitespace in Pajek writer when the ID attribute was
  numeric.
- Fixed a bug that caused the GML reader to crash when the ID attribute
  was non-numeric.
- Fixed issue [\#500](https://github.com/igraph/rigraph/issues/500),
  potential segfault if the two graphs in BLISS differ in the number of
  vertices or edges.
- Added `igraphtest()` function.
- Fix dyad census instability, sometimes incorrect results were
  reported.
- Dyad census detects integer overflow now and gives a warning.
- Function [`add.edges()`](https://r.igraph.org/reference/add.edges.md)
  does not allow now zeros in the vertex set.
- Added a function to count the number of adjacent triangles:
  [`adjacent.triangles()`](https://r.igraph.org/reference/adjacent.triangles.md).
- Added [`graph.eigen()`](https://r.igraph.org/reference/graph.eigen.md)
  function, eigenproblems on adjacency matrices.
- Added some workarounds for functions that create a lot of graphs,
  [`decompose.graph()`](https://r.igraph.org/reference/decompose.graph.md)
  and
  [`graph.neighborhood()`](https://r.igraph.org/reference/graph.neighborhood.md)
  use it. Fixes issue
  [\#508](https://github.com/igraph/rigraph/issues/508).
- Added weights support for
  [`optimal.community()`](https://r.igraph.org/reference/optimal.community.md),
  closes [\#511](https://github.com/igraph/rigraph/issues/511).
- Faster maximal clique finding.
- Added a function to count maximum cliques.
- Set operations: union, intersection, disjoint, union, difference,
  compose now work based on vertex names (if they are present) and keep
  attributes, closes
  [\#20](https://github.com/igraph/rigraph/issues/20).
- Removed functions `graph.intersection.by.name()`,
  `graph.union.by.name()`, `graph.difference.by.name()`.
- The `+` operator on graphs now calls
  [`graph.union()`](https://r.igraph.org/reference/graph.union.md) if
  both argument graphs are named, and calls
  [`graph.disjoint.union()`](https://r.igraph.org/reference/graph.disjoint.union.md)
  otherwise.
- Added function
  [`igraph.version()`](https://r.igraph.org/reference/igraph.version.md).
- Generate graphs from a stochastic block model:
  [`sbm.game()`](https://r.igraph.org/reference/sbm.game.md).
- Do not suggest the stats, XML, jpeg and png packages any more.
- Fixed a `set.vertex/edge.attribute` bug that changed both graph
  objects, after copying
  ([\#533](https://github.com/igraph/rigraph/issues/533))
- Fixed a bug in `barabasi.game` that caused crashes.
- We use PRPACK to calculate PageRank scores see
  <https://github.com/dgleich/prpack>
- Added`'which` argument to `bipartite.projection`
  ([\#307](https://github.com/igraph/rigraph/issues/307)).
- Add `normalized` argument to closeness functions, fixes issue
  [\#3](https://github.com/igraph/rigraph/issues/3).
- R: better handling of complex attributes, `[[` on vertex/edge sets,
  fixes [\#231](https://github.com/igraph/rigraph/issues/231).
- Implement the `start` argument in `hrg.fit`
  ([\#225](https://github.com/igraph/rigraph/issues/225)).
- Set root vertex in Reingold-Tilford layout, solves
  [\#473](https://github.com/igraph/rigraph/issues/473).
- Fix betweenness normalization for directed graphs.
- Fixed a bug in `graph.density` that resulted in incorrect values for
  undirected graphs with loops
- Fixed a bug when many graphs were created in one C call (e.g. by
  `graph.decompose`), causing
  [\#550](https://github.com/igraph/rigraph/issues/550).
- Fixed sparse `graph.adjacency` bugs for graphs with one edge, and
  graphs with zero edges.
- Fixed a bug that made Bellman-Ford shortest paths calculations fail.
- Fixed a `graph.adjacency` bug for undirected, weighted graphs and
  sparse matrices.
- `main`, `sub`, `xlab` and `ylab` are proper graphics parameters now
  ([\#555](https://github.com/igraph/rigraph/issues/555)).
- `graph.data.frame` coerces arguments to data frame
  ([\#557](https://github.com/igraph/rigraph/issues/557)).
- Fixed a minimum cut bug for weighted undirected graphs
  ([\#564](https://github.com/igraph/rigraph/issues/564)).
- Functions for simulating epidemics (SIR model) on networks, see the
  `sir` function.
- Fixed argument ordering in `graph.mincut` and related functions.
- Avoid copying attributes in query functions and print
  ([\#573](https://github.com/igraph/rigraph/issues/573)), these
  functions are much faster now for graphs with many vertices/edges and
  attributes.
- Speed up writing GML and GraphML files, if some attributes are
  integer. It was really-really slow.
- Fix multiple root vertices in `graph.bfs`
  ([\#575](https://github.com/igraph/rigraph/issues/575)).

## igraph 0.6.6

CRAN release: 2013-10-28

Released Oct 28, 2013

Some bugs fixed:

- Fixed a potential crash in the infomap.community() function.
- Various fixed for the operators that work on vertex names
  ([\#136](https://github.com/igraph/rigraph/issues/136)).
- Fixed an example in the arpack() manual page.
- arpack() now gives error message if unknown options are supplied
  ([\#492](https://github.com/igraph/rigraph/issues/492)).
- Better arpack() error messages.
- Fixed missing whitespace in Pajek writer when ID attribute was
  numeric.
- Fixed dyad census instability, sometimes incorrect results were
  reported ([\#496](https://github.com/igraph/rigraph/issues/496)).
- Fixed a bug that caused the GML reader to crash when the ID attribute
  was non-numeric
- Fixed a potential segfault if the two graphs in BLISS differ in the
  number of vertices or edges
  ([\#500](https://github.com/igraph/rigraph/issues/500)).
- Added the igraphtest() function to run tests from R
  ([\#485](https://github.com/igraph/rigraph/issues/485)).
- Dyad census detects integer overflow now and gives a warning
  ([\#497](https://github.com/igraph/rigraph/issues/497)).
- R: add.edges() does not allow now zeros in the vertex set
  ([\#503](https://github.com/igraph/rigraph/issues/503)).
- Add C++ namespace to the files that didn’t have one. Fixes some
  incompatibility with other packages (e.g. rgl) and mysterious crashes
  ([\#523](https://github.com/igraph/rigraph/issues/523)).
- Fixed a bug that caused a side effect in set.vertex.attributes(),
  set.edge.attributes() and set.graph.attributes()
  ([\#533](https://github.com/igraph/rigraph/issues/533)).
- Fixed a bug in degree.distribution() and cluster.distribution()
  ([\#257](https://github.com/igraph/rigraph/issues/257)).

## igraph 0.6.5-2

CRAN release: 2013-05-23

Released May 16, 2013

Worked two CRAN check problems, and a gfortran bug (string bound
checking does not work if code is called from C and without string
length arguments at the “right” place).

Otherwise identical to 0.6.5-1.

## igraph 0.6.5-1

CRAN release: 2013-02-28

Released February 27, 2013

Fixing an annoying bug, that broke two other packages on CRAN:

- Setting graph attributes failed sometimes, if the attributes were
  lists or other complex objects.

## igraph 0.6.5

CRAN release: 2013-02-25

Released February 24, 2013

This is a minor release, to fix some very annoying bugs in 0.6.4:

- igraph should now work well with older R versions.
- Eliminate gap between vertex and edge when plotting an edge without an
  arrow. Fixes
  [\#1118448](https://github.com/igraph/rigraph/issues/1118448).
- Fixed an out-of-bounds array indexing error in the DrL layout, that
  potentially caused crashes.
- Fixed a crash in weighted betweenness calculation.
- Plotting: fixed a bug that caused misplaced arrows at rectangle vertex
  shapes.

## igraph 0.6.4

CRAN release: 2013-02-04

Released February 2, 2013

The version number is not a mistake, we jump to 0.6.4 from 0.6, for
technical reasons. This version was actually never really released, but
some R packages of this version were uploaded to CRAN, so we include
this version in this NEW file.

### New features and bug fixes

- Added a vertex shape API for defining new vertex shapes, and also a
  couple of new vertex shapes.

- Added the get.data.frame() function, opposite of graph.data.frame().

- Added bipartite support to the Pajek reader and writer, closes bug
  [\#1042298](https://github.com/igraph/rigraph/issues/1042298).

- degree.sequence.game() has a new method now: “simple_no_multiple”.

- Added the is.degree.sequence() and is.graphical.degree.sequence()
  functions.

- rewire() has a new method: “loops”, that can create loop edges.

- Walktrap community detection now handles isolates.

- layout.mds() returns a layout matrix now.

- layout.mds() uses LAPACK instead of ARPACK.

- Handle the ‘~’ character in write.graph and read.graph. Bug
  [\#1066986](https://github.com/igraph/rigraph/issues/1066986).

- Added k.regular.game().

- Use vertex names to plot if no labels are specified in the function
  call or as vertex attributes. Fixes issue
  [\#1085431](https://github.com/igraph/rigraph/issues/1085431).

- power.law.fit() can now use a C implementation.

- Fixed a bug in barabasi.game() when out.seq was an empty vector.

- Fixed a bug that made functions with a progress bar fail if called
  from another package.

- Fixed a bug when creating graphs from a weighted integer adjacency
  matrix via graph.adjacency(). Bug
  [\#1019624](https://github.com/igraph/rigraph/issues/1019624).

- Fixed overflow issues in centralization calculations.

- Fixed a minimal.st.separators() bug, some vertex sets were incorrectly
  reported as separators. Bug
  [\#1033045](https://github.com/igraph/rigraph/issues/1033045).

- Fixed a bug that mishandled vertex colors in VF2 isomorphism
  functions. Bug
  [\#1032819](https://github.com/igraph/rigraph/issues/1032819).

- Pajek exporter now always quotes strings, thanks to Elena Tea Russo.

- Fixed a bug with handling small edge weights in shortest paths
  calculation in shortest.paths() (Dijkstra’s algorithm.) Thanks to
  Martin J Reed.

- Weighted transitivity uses V(graph) as ‘vids’ if it is NULL.

- Fixed a bug when ‘pie’ vertices were drawn together with other vertex
  shapes.

- Speed up printing graphs.

- Speed up attribute queries and other basic operations, by avoiding
  copying of the graph. Bug
  [\#1043616](https://github.com/igraph/rigraph/issues/1043616).

- Fixed a bug in the NCV setting for ARPACK functions. It cannot be
  bigger than the matrix size.

- layout.merge()’s DLA mode has better defaults now.

- Fixed a bug in layout.mds() that resulted vertices on top of each
  other.

- Fixed a bug in layout.spring(), it was not working properly.

- Fixed layout.svd(), which was completely defunct.

- Fixed a bug in layout.graphopt() that caused warnings and on some
  platforms crashes.

- Fixed community.to.membership(). Bug
  [\#1022850](https://github.com/igraph/rigraph/issues/1022850).

- Fixed a graph.incidence() crash if it was called with a non-matrix
  argument.

- Fixed a get.shortest.paths bug, when output was set to “both”.

- Motif finding functions return NA for isomorphism classes that are not
  motifs (i.e. not connected). Fixes bug
  [\#1050859](https://github.com/igraph/rigraph/issues/1050859).

- Fixed get.adjacency() when attr is given, and the attribute has some
  complex type. Bug
  [\#1025799](https://github.com/igraph/rigraph/issues/1025799).

- Fixed attribute name in graph.adjacency() for dense matrices. Bug
  [\#1066952](https://github.com/igraph/rigraph/issues/1066952).

- Fixed erratic behavior of alpha.centrality().

- Fixed igraph indexing, when attr is given. Bug
  [\#1073705](https://github.com/igraph/rigraph/issues/1073705).

- Fixed a bug when calculating the largest cliques of a directed graph.
  Bug [\#1073800](https://github.com/igraph/rigraph/issues/1073800).

- Fixed a bug in the maximal clique search, closes
  [\#1074402](https://github.com/igraph/rigraph/issues/1074402).

- Warn for negative weights when calculating PageRank.

- Fixed dense, unweighted graph.adjacency when diag=FALSE. Closes issue
  [\#1077425](https://github.com/igraph/rigraph/issues/1077425).

- Fixed a bug in eccentricity() and radius(), the results were often
  simply wrong.

- Fixed a bug in get.all.shortest.paths() when some edges had zero
  weight.

- graph.data.frame() is more careful when vertex names are numbers, to
  avoid their scientific notation. Fixes issue
  [\#1082221](https://github.com/igraph/rigraph/issues/1082221).

- Better check for NAs in vertex names. Fixes issue
  [\#1087215](https://github.com/igraph/rigraph/issues/1087215)

- Fixed a potential crash in the DrL layout generator.

- Fixed a bug in the Reingold-Tilford layout when the graph is directed
  and mode != ALL.

## igraph 0.6

CRAN release: 2012-06-14

Released June 11, 2012

See also the release notes at
[http://igraph.sf.net/relnotes-0.6.html](http://igraph.sf.net/relnotes-0.6.md)

### R: Major new features

- Vertices and edges are numbered from 1 instead of 0. Note that this
  makes most of the old R igraph code incompatible with igraph 0.6. If
  you want to use your old code, please use the igraph0 package. See
  more at
  [http://igraph.sf.net/relnotes-0.6.html](http://igraph.sf.net/relnotes-0.6.md).
- The ‘\[’ and ‘\[\[’ operators can now be used on igraph graphs, for
  ‘\[’ the graph behaves as an adjacency matrix, for ‘\[\[’ is is
  treated as an adjacency list. It is also much simpler to manipulate
  the graph structure, i.e. add/remove edges and vertices, with some new
  operators. See more at ?graph.structure.
- In all functions that take a vector or list of vertices or edges,
  vertex/edge names can be given instead of the numeric ids.
- New package ‘igraphdata’, contains a number of data sets that can be
  used directly in igraph.
- Igraph now supports loading graphs from the Nexus online data
  repository, see nexus.get(), nexus.info(), nexus.list() and
  nexus.search().
- All the community structure finding algorithm return a ‘communities’
  object now, which has a bunch of useful operations, see ?communities
  for details.
- Vertex and edge attributes are handled much better now. They are kept
  whenever possible, and can be combined via a flexible API. See
  ?attribute.combination.
- R now prints igraph graphs to the screen in a more structured and
  informative way. The output of summary() was also updated accordingly.

### R: Other new features

- It is possible to mark vertex groups on plots, via shading.
  Communities and cohesive blocks are plotted using this by default.
- Some igraph demos are now available, see a list via
  ‘demo(package=“igraph”)’.
- igraph now tries to select the optimal layout algorithm, when plotting
  a graph.
- Added a simple console, using Tcl/Tk. It contains a text area for
  status messages and also a status bar. See igraph.console().
- Reimplemented igraph options support, see igraph.options() and
  getIgraphOpt().
- Igraph functions can now print status messages.

### R: New or updated functions

#### Community detection

- The multi-level modularity optimization community structure detection
  algorithm by Blondel et al. was added, see multilevel.community().
- Distance between two community structures: compare.communities().
- Community structure via exact modularity optimization,
  optimal.community().
- Hierarchical random graphs and community finding, porting the code
  from Aaron Clauset. See hrg.game(), hrg.fit(), etc.
- Added the InfoMAP community finding method, thanks to Emmanuel Navarro
  for the code. See infomap.community().

#### Shortest paths

- Eccentricity (eccentricity()), and radius (radius()) calculations.
- Shortest path calculations with get.shortest.paths() can now return
  the edges along the shortest paths.
- get.all.shortest.paths() now supports edge weights.

#### Centrality

- Centralization scores for degree, closeness, betweenness and
  eigenvector centrality. See centralization.scores().
- Personalized Page-Rank scores, see page.rank().
- Subgraph centrality, subgraph.centrality().
- Authority (authority.score()) and hub (hub.score()) scores support
  edge weights now.
- Support edge weights in betweenness and closeness calculations.
- bonpow(), Bonacich’s power centrality and alpha.centrality(), Alpha
  centrality calculations now use sparse matrices by default.
- Eigenvector centrality calculation, evcent() now works for directed
  graphs.
- Betweenness calculation can now use arbitrarily large integers, this
  is required for some lattice-like graphs to avoid overflow.

#### Input/output and file formats

- Support the DL file format in graph.read(). See
  <http://www.analytictech.com/networks/dataentry.htm>.
- Support writing the LEDA file format in write.graph().

#### Plotting and layouts

- Star layout: layout.star().
- Layout based on multidimensional scaling, layout.mds().
- New layouts layout.grid() and layout.grid.3d().
- Sugiyama layout algorithm for layered directed acyclic graphs,
  layout.sugiyama().

#### Graph generators

- New graph generators: static.fitness.game(), static.power.law.game().
- barabasi.game() was rewritten and it supports three algorithms now,
  the default algorithm does not generate multiple or loop edges. The
  graph generation process can now start from a supplied graph.
- The Watts-Strogatz graph generator, igraph_watts_strogatz() can now
  create graphs without loop edges.

#### Others

- Added the Spectral Coarse Graining algorithm, see scg().
- The cohesive.blocks() function was rewritten in C, it is much faster
  now. It has a nicer API, too. See demo(“cohesive”).
- Added generic breadth-first and depth-first search implementations
  with many callbacks, graph.bfs() and graph_dfs().
- Support vertex and edge coloring in the VF2 (sub)graph isomorphism
  functions (graph.isomorphic.vf2(), graph.count.isomorphisms.vf2(),
  graph.get.isomorphisms.vf2(), graph.subisomorphic.vf2(),
  graph.count.subisomorphisms.vf2(), graph.get.subisomorphisms.vf2()).
- Assortativity coefficient, assortativity(), assortativity.nominal()
  and assortativity.degree().
- Vertex operators that work by vertex names:
  graph.intersection.by.name(), graph.union.by.name(),
  graph.difference.by.name(). Thanks to Magnus Torfason for contributing
  his code!
- Function to calculate a non-induced subgraph: subgraph.edges().
- More comprehensive maximum flow and minimum cut calculation, see
  functions graph.maxflow(), graph.mincut(), stCuts(), stMincuts().
- Check whether a directed graph is a DAG, is.dag().
- has.multiple() to decide whether a graph has multiple edges.
- Added a function to calculate a diversity score for the vertices,
  graph.diversity().
- Graph Laplacian calculation (graph.laplacian()) supports edge weights
  now.
- Biconnected component calculation, biconnected.components() now
  returns the components themselves.
- bipartite.projection() calculates multiplicity of edges.
- Maximum cardinality search: maximum.cardinality.search() and
  chordality test: is.chordal()
- Convex hull computation, convex.hull().
- Contract vertices, contract.vertices().

## igraph 0.5.3

CRAN release: 2009-11-22

Released November 22, 2009

### Bugs corrected in the R interface

- Some small changes to make ‘R CMD check’ clean
- Fixed a bug in graph.incidence, the ‘directed’ and ‘mode’ arguments
  were not handled correctly
- Betweenness and edge betweenness functions work for graphs with many
  shortest paths now (up to the limit of long long int)
- When compiling the package, the configure script fails if there is no
  C compiler available
- igraph.from.graphNEL creates the right number of loop edges now
- Fixed a bug in bipartite.projection() that caused occasional crashes
  on some systems

## igraph 0.5.2

CRAN release: 2009-04-14

Released April 10, 2009

See also the release notes at
[http://igraph.sf.net/relnotes-0.5.2.html](http://igraph.sf.net/relnotes-0.5.2.md)

### New in the R interface

- Added progress bar support to beweenness() and betweenness.estimate(),
  layout.drl()
- Speeded up betweenness estimation
- Speeded up are.connected()
- Johnson’s shortest paths algorithm added
- shortest.paths() has now an ‘algorithm’ argument to choose from the
  various implementations manually
- Always quote symbolic vertex names when printing graphs or edges
- Average nearest neighbor degree calculation, graph.knn()
- Weighted degree (also called strength) calculation, graph.strength()
- Some new functions to support bipartite graphs: graph.bipartite(),
  is.bipartite(), get.incidence(), graph.incidence(),
  bipartite.projection(), bipartite.projection.size()
- Support for plotting curved edges with plot.igraph() and tkplot()
- Added support for weighted graphs in alpha.centrality()
- Added the label propagation community detection algorithm by Raghavan
  et al., label.propagation.community()
- cohesive.blocks() now has a ‘cutsetHeuristic’ argument to choose
  between two cutset algorithms
- Added a function to “unfold” a tree, unfold.tree()
- New tkplot() arguments to change the drawing area
- Added a minimal GUI, invoke it with tkigraph()
- The DrL layout generator, layout.drl() has a three dimensional mode
  now.

### Bugs corrected in the R interface

- Fixed a bug in VF2 graph isomorphism functions
- Fixed a bug when a sparse adjacency matrix was requested in
  get.adjacency() and the graph was named
- VL graph generator in degree.sequence.game() checks now that the sum
  of the degrees is even
- Many fixes for supporting various compilers, e.g. GCC 4.4 and Sun’s C
  compiler
- Fixed memory leaks in graph.automorphisms(), Bellman-Ford
  shortest.paths(), independent.vertex.sets()
- Fix a bug when a graph was imported from LGL and exported to NCOL
  format ([\#289596](https://github.com/igraph/rigraph/issues/289596))
- cohesive.blocks() creates its temporary file in the session temporary
  directory
- write.graph() and read.graph() now give error messages when unknown
  arguments are given
- The GraphML reader checks the name of the attributes to avoid adding a
  duplicate ‘id’ attribute
- It is possible to change the ‘ncv’ ARPACK parameter for
  leading.eigenvector.community()
- Fixed a bug in path.length.hist(), ‘unconnected’ was wrong for
  unconnected and undirected graphs
- Better handling of attribute assingment via iterators, this is now
  also clarified in the manual
- Better error messages for unknown vertex shapes
- Make R package unload cleanly if unloadNamespace() is used
- Fixed a bug in plotting square shaped vertices
  ([\#325244](https://github.com/igraph/rigraph/issues/325244))
- Fixed a bug in graph.adjacency() when the matrix is a sparse matrix of
  class “dgTMatrix”

## igraph 0.5.1

CRAN release: 2008-07-12

Released July 14, 2008

See also the release notes at
[http://igraph.sf.net/relnotes-0.5.1.html](http://igraph.sf.net/relnotes-0.5.1.md)

### New in the R interface

- A new layout generator called DrL.
- Uniform sampling of random connected undirected graphs with a given
  degree sequence.
- Edge labels are plotted at 1/3 of the edge, this is better if the
  graph has mutual edges.
- Initial and experimental vertex shape support in ‘plot’.
- New function, ‘graph.adjlist’ creates igraph graphs from adjacency
  lists.
- Conversion to/from graphNEL graphs, from the ‘graph’ R package.
- Fastgreedy community detection can utilize edge weights now, this was
  missing from the R interface.
- The ‘arrow.width’ graphical parameter was added.
- graph.data.frame has a new argument ‘vertices’.
- graph.adjacency and get.adjacency support sparse matrices, the
  ‘Matrix’ package is required to use this functionality.
- graph.adjacency adds column/row names as ‘name’ attribute.
- Weighted shortest paths using Dijkstra’s or the Belmann-Ford
  algorithm.
- Shortest path functions return ‘Inf’ for unreachable vertices.
- New function ‘is.mutual’ to find mutual edges in a directed graph.
- Added inverse log-weighted similarity measure (a.k.a. Adamic/Adar
  similarity).
- preference.game and asymmetric.preference.game were rewritten, they
  are O(\|V\|+\|E\|) now, instead of O(\|V\|^2).
- Edge weight support in function ‘get.shortest.paths’, it uses
  Dijkstra’s algorithm.

### Bugs corrected in the R interface

- A bug was corrected in write.pajek.bgraph.
- Several bugs were corrected in graph.adjacency.
- Pajek reader bug corrected, used to segfault if ’\*Vertices’ was
  missing.
- Directedness is handled correctly when writing GML files. (But note
  that ‘correct’ conflicts the standard here.)
- Corrected a bug when calculating weighted, directed PageRank on an
  undirected graph. (Which does not make sense anyway.)
- Several bugs were fixed in the Reingold-Tilford layout to avoid edge
  crossings.
- A bug was fixed in the GraphML reader, when the value of a graph
  attribute was not specified.
- Fixed a bug in the graph isomorphism routine for small (3-4 vertices)
  graphs.
- Corrected the random sampling implementation (igraph_random_sample),
  now it always generates unique numbers. This affects the Gnm
  Erdos-Renyi generator, it always generates simple graphs now.
- The basic igraph constructor (igraph_empty_attrs, all functions are
  expected to call this internally) now checks whether the number of
  vertices is finite.
- The LGL, NCOL and Pajek graph readers handle errors properly now.
- The non-symmetric ARPACK solver returns results in a consistent form
  now.
- The fast greedy community detection routine now checks that the graph
  is simple.
- The LGL and NCOL parsers were corrected to work with all kinds of
  end-of-line encodings.
- Hub & authority score calculations initialize ARPACK parameters now.
- Fixed a bug in the Walktrap community detection routine, when applied
  to unconnected graphs.
- Several small memory leaks were removed, and a big one from the
  Spinglass community structure detection function

## igraph 0.5

CRAN release: 2008-02-13

Released February 14, 2008

See also the release notes at
[http://igraph.sf.net/relnotes-0.5.html](http://igraph.sf.net/relnotes-0.5.md)

### New in the R interface

- The ‘rescale’, ‘asp’ and ‘frame’ graphical parameters were added

- Create graphs from a formula notation (graph.formula)

- Handle graph attributes properly

- Calculate the actual minimum cut for undirected graphs

- Adjacency lists, get.adjlist and get.adjedgelist added

- Eigenvector centrality computation is much faster now

- Proper R warnings, instead of writing the warning to the terminal

- R checks graphical parameters now, the unknown ones are not just
  ignored, but an error message is given

- plot.igraph has an ‘add’ argument now to compose plots with multiple
  graphs

- plot.igraph supports the ‘main’ and ‘sub’ arguments

- layout.norm is public now, it can normalize a layout

- It is possible to supply startup positions to layout generators

- Always free memory when CTRL+C/ESC is pressed, in all operating
  systems

- plot.igraph can plot square vertices now, see the ‘shape’ parameter

- graph.adjacency rewritten when creating weighted graphs

- We use match.arg whenever possible. This means that character scalar
  options can be abbreviated and they are always case insensitive

- VF2 graph isomorphism routines can check subgraph isomorphism now, and
  they are able to return matching(s)

- The BLISS graph isomorphism algorithm is included in igraph now. See
  canonical.permutation, graph.isomorphic.bliss

- We use ARPACK for eigenvalue/eigenvector calculation. This means that
  the following functions were rewritten: page.rank,
  leading.eigenvector.community.\*, evcent. New functions based on
  ARPACK: hub.score, authority.score, arpack.

- Edge weights for Fruchterman-Reingold layout
  (layout.fruchterman.reingold).

- Line graph calculation (line.graph)

- Kautz and de Bruijn graph generators (graph.kautz, graph.de.bruijn)

- Support for writing graphs in DOT format

- Jaccard and Dice similarity coefficients added (similarity.jaccard,
  similarity.dice)

- Counting the multiplicity of edges (count.multiple)

- The graphopt layout algorithm was added, layout.graphopt

- Generation of “famous” graphs (graph.famous).

- Create graphs from LCF notation (graph.cf).

- Dyad census and triad cencus functions (dyad.census, triad.census)

- Cheking for simple graphs (is.simple)

- Create full citation networks (graph.full.citation)

- Create a histogram of path lengths (path.length.hist)

- Forest fire model added (forest.fire.game)

- DIMACS reader can handle different file types now

- Biconnected components and articulation points
  (biconnected.components, articulation.points)

- Kleinberg’s hub and authority scores (hub.score, authority.score)

- as.undirected handles attributes now

- Geometric random graph generator (grg.game) can return the coordinates
  of the vertices

- Function added to convert leading eigenvector community structure
  result to a membership vector (community.le.to.membership)

- Weighted fast greedy community detection

- Weighted page rank calculation

- Functions for estimating closeness, betweenness, edge betweenness by
  introducing a cutoff for path lengths (closeness.estimate,
  betweenness.estimate, edge.betweenness.estimate)

- Weighted modularity calculation

- Function for permuting vertices (permute.vertices)

- Betweenness and closeness calculations are speeded up

- read.graph can handle all possible line terminators now ( , ,

- Error handling was rewritten for walktrap community detection, the
  calculation can be interrupted now

- The maxflow/mincut functions allow to supply NULL pointer for edge
  capacities, implying unit capacities for all edges

### Bugs corrected in the R interface

- Fixed a bug in cohesive.blocks, cohesive blocks were sometimes not
  calculated correctly

## igraph 0.4.5

CRAN release: 2007-12-22

Released January 1, 2008

New: - Cohesive block finding in the R interface, thanks to Peter
McMahan for contributing his code. See James Moody and Douglas R. White,
2003, in Structural Cohesion and Embeddedness: A Hierarchical Conception
of Social Groups American Sociological Review 68(1):1-25 - Biconnected
components and articulation points. - R interface: better printing of
attributes. - R interface: graph attributes can be used via ‘\$’.

Bug fixed: - Erdos-Renyi random graph generators rewritten.

## igraph 0.4.4

CRAN release: 2007-10-03

Released October 3, 2007

This release should work seamlessly with the new R 2.6.0 version. Some
other bugs were also fixed: - A bug was fixed in the Erdos-Renyi graph
generator, which sometimes added an extra vertex.

## igraph 0.4.3

CRAN release: 2007-08-09

Released August 13, 2007

The next one in the sequence of bugfix releases. Thanks to many people
sending bug reports. Here are the changes: - Some memory leaks removed
when using attributes from R or Python. - GraphML parser: entities and
character data in multiple chunks are now handled correctly. - A bug
corrected in edge betweenness community structure detection, it failed
if called many times from the same program/session. - Edge betweeness
community structure: handle unconnected graphs properly. - Fixed bug
related to fast greedy community detection in unconnected graphs. - Use
a different kind of parser (Push) for reading GraphML files. This is
almost invisible for users but fixed a nondeterministic bug when reading
in GraphML files. - R interface: plot now handles properly if called
with a vector as the edge.width argument for directed graphs. - R
interface: bug (typo) corrected for walktrap.community and weighted
graphs.

## igraph 0.4.2

CRAN release: 2007-06-06

Released June 7, 2007

This is another bugfix release, as there was a serious bug in the R
package of the previous version: it could not read and write graphs to
files in any format under MS Windows.

Some other bits added: - circular Reingold-Tilford layout generator for
trees - corrected a bug, Pajek files are written properly under MS
Windows now. - arrow.size graphical edge parameter added in the R
interface.

## igraph 0.4.1

CRAN release: 2007-05-23

Released May 23, 2007

This is a minor release, it corrects a number of bugs, mostly in the R
package.

## igraph 0.4

CRAN release: 2007-05-21

Released May 21, 2007

The major new additions in this release is a bunch of community
detection algorithms and support for the GML file format. Here is the
complete list of changes:

### New in the R interface

- as the internal representation changed, graphs stored with ‘save’ with
  an older igraph version cannot be read back with the new version
  reliably.

- neighbors returns ordered lists

- is.loop and is.multiple were added

- topological sorting

- VF2 isomorphism algorithm

- support for reading graphs from the Graph Database for isomorphism

- graph.mincut can calculate the actual minimum cut

- girth calculation added, thanks to Keith Briggs

- support for reading and writing GML files

- Walktrap community detection algorithm added, thanks to Matthieu
  Latapy and Pascal Pons

- edge betweenness based community detection algorithm added

- fast greedy algorithm for community detection by Clauset et al. added
  thanks to Aaron Clauset for sharing his code

- leading eigenvector community detection algorithm by Mark Newman added

- functions for creating dendrograms from the output of the community
  detection algorithms added

- community.membership supporting function added, creates a membership
  vector from a community structure merge tree

- modularity calculation added

- graphics parameter handling is completely rewritten, uniform handling
  of colors and fonts, make sure you read ?igraph.plotting

- new plotting parameter for edges: arrow.mode

- a bug corrected when playing a nonlinear barabasi.game

- better looking plotting in 3d using rglplot: edges are 3d too

- rglplot layout is allowed to be two dimensional now

- rglplot suspends updates while drawing, this makes it faster

- loop edges are correctly plotted by all three plotting functions

- better printing of attributes when printing graphs

- summary of a graph prints attribute names

- is.igraph rewritten to make it possible to inherit from the ‘igraph’
  class

- somewhat better looking progress meter for functions which support it

### Others

- many functions benefit from the new internal representation and are
  faster now: transitivity, reciprocity, graph operator functions like
  intersection and union, etc.

### Bugs corrected

- corrected a bug when reading Pajek files: directed graphs were read as
  undirected

## igraph 0.3.2

CRAN release: 2006-12-14

Released Dec 19, 2006

This is a new major release, it contains many new things:

### Changes in the R interface

- bonpow function ported from SNA to calculate Bonacich power centrality
- get.adjacency supports attributes now, this means that it sets the
  colnames and rownames attributes and can return attribute values in
  the matrix instead of 0/1
- grg.game, geometric random graphs
- graph.density, graph density calculation
- edge and vertex attributes can be added easily now when added new
  edges with add.edges or new vertices with add.vertices
- graph.data.frame creates graph from data frames, this can be used to
  create graphs with edge attributes easily
- plot.igraph and tkplot can plot self-loop edges now
- graph.edgelist to create a graph from an edge list, can also handle
  edge lists with symbolic names
- get.edgelist has now a ‘names’ argument and can return symbolic vertex
  names instead of vertex ids, by default id uses the ‘name’ vertex
  attribute is returned
- printing graphs on screen also prints symbolic symbolic names (the
  ‘name’ attribute if present)
- maximum flow and minimum cut functions: graph.maxflow, graph.mincut
- vertex and edge connectivity: edge.connectivity, vertex.connectivity
- edge and vertex disjoint paths: edge.disjoint.paths,
  vertex.disjoint.paths
- White’s cohesion and adhesion measure: graph.adhesion, graph.cohesion
- dimacs file format added
- as.directed handles attributes now
- constraint corrected, it handles weighted graphs as well now
- weighted attribute to graph.adjacency
- spinglass-based community structure detection, the Joerg Reichardt –
  Stefan Bornholdt algorithm added: spinglass.community
- graph.extended.chordal.ring, extended chordal ring generation
- no.clusters calculates the number of clusters without calculating the
  clusters themselves
- minimum spanning tree functions updated to keep attributes
- transitivity can calculate local transitivity as well
- neighborhood related functions added: neighborhood, neighborhood.size,
  graph.neighborhood
- new graph generators based on vertex types: preference.game and
  asymmetric.preference.game

### Bugs corrected

- attribute handling bug when deleting edges corrected
- GraphML escaping and NaN handling corrected
- bug corrected to make it possible compile the R package without the
  libxml2 library
- a bug in Erdos-Renyi graph generation corrected: it had problems with
  generating large directed graphs
- bug in constraint calculation corrected, it works well now
- fixed memory leaks in the GraphML reader
- error handling bug corrected in the GraphML reader
- bug corrected in R version of graph.laplacian when normalized
  Laplacian is requested
- memory leak corrected in get.all.shortest.paths in the R package

## igraph 0.2.1

CRAN release: 2006-08-24

Released Aug 23, 2006

This is a bug-fix release. Bugs fixed: - reciprocity corrected to avoid
segfaults - some docs updates - various R package updates to make it
conform to the CRAN rules

## igraph 0.2

CRAN release: 2006-08-23

Released Aug 18, 2006

Release time at last! There are many new things in igraph 0.2, the most
important ones: - reading writing Pajek and GraphML formats with
attributes (not all Pajek and GraphML files are supported, see
documentation for details) - the RANDEDU fast motif search algorithm is
implemented - many new graph generators, both games and regular graphs -
many new structural properties: transitivity, reciprocity, etc. - graph
operators: union, intersection, difference, structural holes, etc. -
conversion between directed and undirected graphs - new layout
algorithms for trees and large graphs, 3D layouts and many more.

New things specifically in the R package: - support for CTRL+C - new
functions: Graph Laplacian, Burt’s constraint, etc. - vertex/edge
sequences totally rewritten, smart indexing (see manual) - new R manual
and tutorial: \`Network Analysis with igraph’, still under development
but useful - very basic 3D plotting using OpenGL

Although this release was somewhat tested on Linux, MS Windows, Mac OSX,
Solaris 8 and FreeBSD, no heavy testing was done, so it might contain
bugs, and we kindly ask you to send bug reports to make igraph better.

## igraph 0.1

Released Jan 30, 2006

After about a year of development this is the first “official” release
of the igraph library. This release should be considered as beta
software, but it should be useful in general. Please send your questions
and comments.
