<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# igraph 2.1.4.9079

## vendor

- Update vendored sources to igraph/igraph@6a92b9a7aedcbdf1e40ac93b88031e06cfa1a8c7 (#2044).

- Update vendored sources to igraph/igraph@dce0a61a0bf67be4926d42bf8dd8a475a20a52a7 (#2040).


# igraph 2.1.4.9078

## Continuous integration

- Cleanup and fix macOS (#2042).


# igraph 2.1.4.9077

## vendor

- Update vendored sources to igraph/igraph@09bc672c2d1221c0a3a78a312584fae8da3d0af6 (#2039).

- Update vendored sources to igraph/igraph@5ff19a9281745f8d7b39bf7b477865d3ad573729 (#2038).

- Update vendored sources to igraph/igraph@0b3d9704f616651a4937c9a6079a5cdf36ec39e7 (#2037).


# igraph 2.1.4.9076

## Continuous integration

- Format with air, check detritus, better handling of `extra-packages` (#2035).

## vendor

- Update vendored sources to igraph/igraph@d7a119ddef575026d9eba9414fedea4d8f11774b (#2034).

- Update vendored sources to igraph/igraph@01cabca5a8c685ff263a11a6563ff42cac8572b8 (#2033).

- Update vendored sources to igraph/igraph@f01a024b1dc6f49720cc2d089687228a55f4aa6b (#2032).


# igraph 2.1.4.9075

## vendor

- Update vendored sources to igraph/igraph@9d9ad1935c6cea28415b8616e33d80c0c7a33c0d (#2030).

- Update vendored sources to igraph/igraph@33be55ee088923d8b6b485e3b63352d258cde184 (#2029).


# igraph 2.1.4.9074

## vendor

- Update vendored sources to igraph/igraph@a546942ec1d99acfd4d6b2aa35965b028a633665 (#2027).


# igraph 2.1.4.9073

## Chore

- Adapt default path.

## Continuous integration

- Fix vendoring.

- Align vendoring workflow with duckdb.

## vendor

- Update vendored sources to igraph/igraph@d807fc2bff14714686fa75f945772899dda8925c (#2025).

- Update vendored sources to igraph/igraph@7788ba9623c249cd00f45f204d3aed2bfb295328 (#2024).

- Update vendored sources to igraph/igraph@db03c3207a27a6ea5559ec79941ae2ff26a27386 (#2023).

## Uncategorized

- Vendor: Update vendored sources to igraph/igraph@a1c1a30aed2c4afb2892b18227e936d5b68660ca.


# igraph 2.1.4.9072

## vendor

- Update vendored sources to igraph/igraph@a3a1271a91a476b2623275d05fd722c1fb171b00 (#2021).

- Update vendored sources to igraph/igraph@cfb3e897a2b82fa60146325535c3d97c81c1936d (#2020).


# igraph 2.1.4.9071

## vendor

- Update vendored sources to igraph/igraph@ba9bbc17aa56a75bd6529f3168d4dd76330689db (#2018).

- Update vendored sources to igraph/igraph@6b59bafb6acf36a3c2ef1885927c613e80405379 (#2017).

- Update vendored sources to igraph/igraph@232a9819f414d66c2841f7b5c8afe01ebed7374d (#2016).

- Update vendored sources to igraph/igraph@36fec29268a872935ee0bb20727114f8bf81f7c5 (#2015).

- Update vendored sources to igraph/igraph@0f99574f928a8463c042bf14541708def3bf4e98 (#2014).


# igraph 2.1.4.9070

## Chore

- No `stop()` in version.

- Don't use `stop()` in tests.

- Improve error in stochastic_matrix.

- Improve errors in sgm.R.

- Improve errors in operator.R.

- Fix cli syntax.

- Improve error in rewire.

- Improve errors in plot.common.

- Improve error in `rename.attr.if.needed()`.


# igraph 2.1.4.9069

## Chore

- Improve errors in layout.R (#2007).

- Remove one more `stop()`.

- Use `cli_abort()`.

- Use `cli_abort()` instead of `stop()`.

- Simplify error by relying on default behavior (#1997).

- Better error in centrality (#2000).

- Simplify error (#1999).

- Rm useless error message (#1998).

- Improve `igraph_match_arg()` (#1996).


# igraph 2.1.4.9068

## vendor

- Update vendored sources to igraph/igraph@fd1d3a75efafaf57aea513e0820733c32f3ffc02 (#1994).


# igraph 2.1.4.9067

## vendor

- Update vendored sources to igraph/igraph@0224bb3745b974fa7b6804af4ef893e85e7e1f8c (#1992).

- Update vendored sources to igraph/igraph@f73277f19681d169d65e69d36f450b7edd7fe5a3 (#1991).

- Update vendored sources to igraph/igraph@accada1256e859610bac5009c57de46852f7bc69 (#1990).


# igraph 2.1.4.9066

## vendor

- Update vendored sources to igraph/igraph@8309c746e2e8aa4416c6e02b7f076738509598eb (#1988).

- Update vendored sources to igraph/igraph@9239256bd56b19263d1cf9e16d1fa882becd7a3b (#1987).


# igraph 2.1.4.9065

## Features

- Added weights parameter to `local_scan()` (#1082, #1448, #1982).

## Documentation

- Document ellipsis in `cohesion()` (#971, #1985).

- Add 2023 preprint (#1240, #1984).

## Testing

- Simplify test (@1741643+krlmlr).


# igraph 2.1.4.9064

## Bug fixes

- Adjust loop position to vertex size (#1980).


# igraph 2.1.4.9063

## Chore

- Results for revdepchecks.


# igraph 2.1.4.9062

## Bug fixes

- Dont rescale coordinates to `[-1,1] x [-1,1]` by default (#1492, #1956, #1962).

- HRG printing with `type = "auto"` uses `"plain"` for large trees (#1879).

## Features

- Add multi attribute assignment (#55, #1916).

- Expose `align_layout()` and add to `layout_nicely()` to align layout with axis automatically (#1907, #1957, #1958).

## Documentation

- Update allcontributors info (#1975).

## Refactoring

- Improve logic for updating edge attributes (#1332, #1915).


# igraph 2.1.4.9061

## Features

- Add documentation of all file formats to `read_graph()` and `write_graph()` (#777, #1969).

- Add more layouts to tkplot (#160, #1967).


# igraph 2.1.4.9060

## vendor

- Update vendored sources to igraph/igraph@f51ea4f217a45f5895e749e7ea919040492cab5e (#1965).

- Update vendored sources to igraph/igraph@94c0284cc6f45080cc7edb7586f137a69993ae7b (#1964).


# igraph 2.1.4.9059

## Bug fixes

- Fail if `"layout"` attribute doesn't match the number of vertices (#1880).


# igraph 2.1.4.9058

## vendor

- Update vendored sources to igraph/igraph@ccf3125052d65ee504abe9b29e6d089a4275b187 (#1954).


# igraph 2.1.4.9057

## vendor

- Update vendored sources to igraph/igraph@cb8a06487520edf3c5e8d30225cfdcbc22c209df (#1952).

- Update vendored sources to igraph/igraph@44c57191247e7fec2940db9bef2e6d07c2d88e7c (#1951).

- Update vendored sources to igraph/igraph@46f1e12c7cd12801d62e6b712130071b4ed3d151 (#1950).

- Update vendored sources to igraph/igraph@fbcbfb7ed47a9bd644d4c3bef3c6cac02b7a220d (#1949).

- Update vendored sources to igraph/igraph@ae1f405faa2c0e2dfec6c7006f06486dfd4e6146 (#1948).

- Update vendored sources to igraph/igraph@4e71883edad5f343d76954ce29374627820a28a0 (#1947).


# igraph 2.1.4.9056

## Bug fixes

- Automatically arrange loops in `plot()` (#407, #556, #1881).

- `NA` checking only in from/to columns of edge data.frame (#1906).

- Vectorized drawing of arrows (#257, #1904).

- Keep vertex attribute type for `disjoint_union()` (#1640, #1909).

## Features

- Support for more graph product types.

- Added `plot(mark.lwd = )` to change line width of mark.groups (#306, #1898).

- Add `plot(vertex.label.angle = , vertex.label.adj = )` arguments to rotate vertex labels (#106, #1899).

## Chore

- Auto-update from GitHub Actions (#1920).

- Auto-update from GitHub Actions (#1918).

## Continuous integration

- Show Git status.

- Fix flag.

- Fix shell.

- Use air.

- Do not talk about Claude failures.

## vendor

- Update vendored sources to igraph/igraph@83b1d7a2cda5e0fcc3b6d04800cc96c32c47e2b3 (#1944).

- Update vendored sources to igraph/igraph@8b0500e47f2777e1a2380cd3f9a717be1ea38881 (#1942).

- Update vendored sources to igraph/igraph@7c967b95f62ca1a58f672a2fd9bea194334dc632 (#1941).

- Update vendored sources to igraph/igraph@7239a13da6037e3f6b10ee19b095bca2b0a18742 (#1940).

- Update vendored sources to igraph/igraph@65a83a4f34261a5e453cf2e5a04a0591f50d0da6 (#1939).

- Update vendored sources to igraph/igraph@a3967d418293e382174b4e848921221b00dffb6e (#1938).

- Update vendored sources to igraph/igraph@873aa6c8d823b7cca18fca5032c0a2487fb9d082 (#1937).

- Update vendored sources to igraph/igraph@06074d94ffd0f8e283e079415c8e47b2eaf92cda (#1936).

- Update vendored sources to igraph/igraph@50cf73d2844dd2ace266b38ac09ca29b627cb7ce (#1935).

- Update vendored sources to igraph/igraph@e2a3b7c6e26683e9bb5f6a07d4e380861bd40f93 (#1934).

- Update vendored sources to igraph/igraph@12078c2b256e7cc15404ccf32c349101ececcf56 (#1933).

- Update vendored sources to igraph/igraph@cd62af9732e71060cc3b579fa49364bd08917175 (#1931).

- Update vendored sources to igraph/igraph@015d34e5b6e6876d8328bf959a7c494bdd61c756 (#1930).

- Update vendored sources to igraph/igraph@ea227139ceaa3d5525bf0ccb0656c93c6ca0b93c (#1929).

- Update vendored sources to igraph/igraph@4b18e606d56b01d0ce7aa60063e88be3500c896e (#1928).

- Update vendored sources (tag 0.10.16) to igraph/igraph@beebfcdcd707f50a31cf8eb3568cf09f8b7baf54 (#1927).

- Update vendored sources to igraph/igraph@0f4e5be81a752112e828ce6614ad692cef29f5fb (#1926).

- Update vendored sources to igraph/igraph@881c7d39b63b7986143db617afe65d4cf3b23e0e (#1925).

- Update vendored sources to igraph/igraph@075be76c92b99ca4c95ad9207bcc1af6d471c85e (#1924).

- Update vendored sources to igraph/igraph@06754306e700de9c6751301221744b781cdc791c (#1923).

- Update vendored sources to igraph/igraph@ab6faf22c37cc5169063edd134193233ebab264e (#1922).

- Update vendored sources to igraph/igraph@753afcc39f16942730913dcfd331c10668c18de1 (#1921).

- Update vendored sources to igraph/igraph@80aea5c5897c67137872c945f684ad29408a5810 (#1919).

- Update vendored sources to igraph/igraph@2c3cc367a24299b41cc7ae3f308781fde27950db (#1917).

- Update vendored sources to igraph/igraph@7180ad04d0a1a3c796eb6931a21d25f5df532c7a (#1914).

- Update vendored sources to igraph/igraph@8c1a72c8a38df0bd1337b5458f96555fbfce2778 (#1913).

- Update vendored sources to igraph/igraph@f845707d5b35e889676821ee31b30a2cf7b670ef (#1912).

- Update vendored sources to igraph/igraph@83f1f05905ff23f0c16e526b79ec1277f4209669 (#1911).


# igraph 2.1.4.9055

## Chore

- Auto-update from GitHub Actions (#1901).

- Revdepchecks, second run.

- Ignore.

- Revdepchecks.

- Ignore.

## Continuous integration

- Ignore vendored libraries.


# igraph 2.1.4.9054

## Continuous integration

- Fix main coverage workflow.

- Install covr fix.


# igraph 2.1.4.9053

## Bug fixes

- Allow more than one edge label font family (#37, #1896).

- Pie shapes work as intended (#1882, #1883).

## Features

- Breaking change: change arguments default and order for `graph_from_lcf()` (#1858, #1872).

## Chore

- Auto-update from GitHub Actions (#1895).

- Auto-update from GitHub Actions (#1893).

- Auto-update from GitHub Actions (#1892).

## Continuous integration

- Turn off gcov.

- More timeouts.

- No timeout for covr.

- Add plain covr workflow.

- Add instructions.

- Add Claude workflow.

- Add description for workflow.

## Breaking changes

- Breaking change: change arguments default and order for `graph_from_lcf()` (#1858, #1872).


# igraph 2.1.4.9052

## Bug fixes

- Error in bipartite projection if type is not a vertex attribute (#898, #1889).

- Do not try to destroy non-initialized SIR objects upon error.

  see https://github.com/igraph/rigraph/issues/1888


# igraph 2.1.4.9051

## Chore

- Add air code formatting (#1734, #1869).


# igraph 2.1.4.9050

## Continuous integration

- Increase timeout also for covr step.

- Increase timeout for all builds.

- Give more time to covr.


# igraph 2.1.4.9049

## Documentation

- Fix indentation of `\describe{}` elements (#1867).


# igraph 2.1.4.9048

## Bug fixes

- Added `NA` handling for matrix inputs (#917, #918, #1828).

## Chore

- Auto-update from GitHub Actions (#1865).

## Documentation

- Ensure use of `\describe{}` if using `\item{}` in return value (#1736, #1779).

- Link to replacements of deprecated functions (#1823).

## Refactoring

- Use `check_string()` instead of `as.character()` (#1365).


# igraph 2.1.4.9047

## doc

- Refer to current latest version of R in troubleshooting page.


# igraph 2.1.4.9046

## Chore

- Auto-update from GitHub Actions (#1861).

- Add deps file to build-ignore.

## Continuous integration

- Allow workflow dispatch.

- Allow PR creation.


# igraph 2.1.4.9045

## Chore

- Fix `devtools::load_all()` (#1857).


# igraph 2.1.4.9044

## Bug fixes

- Added factor support for `graph_from_data_frame()` (#34, #1829).

## Chore

- Refer to the dev version of roxygen2 as build dependency (#1832).

## Continuous integration

- Fix sanitizer.

- Permissions, better tests for missing suggests, lints (#1851).

- Only fail covr builds if token is given (#1848).

- Always use `_R_CHECK_FORCE_SUGGESTS_=false` (#1846).

- Correct installation of xml2 (#1842).

- Add xml2 for covr, print testthat results (#1840).

- Sync (#1839).

## Documentation

- Clarify that `girth()` returns `Inf` for acyclic graphs (@eqmooring, #1831).

## Testing

- Don't `library(Matrix)` in tests (@MichaelChirico, #1833).

## vendor

- Update vendored sources to igraph/igraph@ca0fca2d41bfd2819e49cf98cbc69044dbca9a28 (#1854).

- Update vendored sources to igraph/igraph@cb74a4a43c5b35ad4ec2bf2e3acbc547d23f2267 (#1853).

- Update vendored sources to igraph/igraph@f159656faeed3ab23313fceddc17fa60cb6f2760 (#1852).

- Update vendored sources to igraph/igraph@595b969fb1b5f206f474f0c6e4befa80f0f14fa3 (#1843).


# igraph 2.1.4.9043

## vendor

- Update vendored sources to igraph/igraph@2d6d0abc05ac3cb53872cc3ea86b847a7556198e (#1837).

- Update vendored sources to igraph/igraph@a899e60c8e3992f769e2159aeedf480ad46de337 (#1836).

- Update vendored sources to igraph/igraph@145b35107659f73d85186b6a021dfe4284cf50c7 (#1835).

- Update vendored sources to igraph/igraph@198fe3751b97bb130e724ca847d8aa5f9a58c4dc (#1834).


# igraph 2.1.4.9042

## vendor

- Update vendored sources to igraph/igraph@05d18670f356403c1dcca4e48f78710e31b3c9b0 (#1825).


# igraph 2.1.4.9041

## Chore

- Results from main.

- Results from check with new arpack.

## Documentation

- Document return value of `make_clusters()` (#1794).


# igraph 2.1.4.9040

## Documentation

- Add author links (#1821).


# igraph 2.1.4.9039

## Bug fixes

- Remove string matrix support from biadjacency matrix functions (#1540, #1542, #1803).

## Features

- `simple_cycles()` lists all simple cycles (#1573, #1580).

- Expose C version (#1208, #1781).

## Chore

- Format with air.

## Documentation

- Fix style (#1819).

## Performance

- Accelerate check if an index sequence corresponds to the entire list of vertices (#1427, #1818).


# igraph 2.1.4.9038

## Documentation

- Correct the description of the `weights` parameter of `hits_scores()`.

## Refactoring

- Adapt to `cut.prob`'s new handling of NULL in the C core (#1570, #1602).


# igraph 2.1.4.9037

## vendor

- Update vendored sources to igraph/igraph@09f6f258c4a864654ad1950e053ff2f5c507be54 (#1814).

- Update vendored sources to igraph/igraph@d48a25ba0f6d72e447c6d17d74b667b1f21754fb (#1813).


# igraph 2.1.4.9036

## Features

- Expose `is_complete()`, `is_clique()` and `is_ivs()` (#1316, #1388, #1581).

## vendor

- Update vendored sources to igraph/igraph@a68d7cafcd0935e6f229437981811e730af4f03f (#1811).


# igraph 2.1.4.9035

## vendor

- Update vendored sources to igraph/igraph@01b15eb1f44d36418ea65394710a02887ca16857 (#1808).

- Update vendored sources to igraph/igraph@8d5db4db95e2e80cbe8169bbe66ce64f73df7bd3 (#1807).

- Update vendored sources to igraph/igraph@6c5b349a4b56ebee0003953ee43994d2dd93f189 (#1806).


# igraph 2.1.4.9034

## Bug fixes

- Removed redundant inheritParams call (#1802).

- Loops not plotted on canvas (#1799, #1800).

- Load the Matrix package before coercing to a sparse matrix.

- `NA` replacement for labels in plots and arrow mode (#1796, #1797).

## Chore

- Results from revdepcheck.

## Testing

- Added more weight tests to `graph_from_biadjacency_matrix()` (#1544, #1804).


# igraph 2.1.4.9033

## Features

- Add relative size scaling to vertices in plots (@gvegayon, #172).

## Chore

- Render docs.

- Updated results.

## Documentation

- Better describe output of `all_shortest_paths()` (#1029, #1778).


# igraph 2.1.4.9032

## vendor

- Update vendored sources to igraph/igraph@0a22a85cb9281ce147b0db7415610e55dee2e332 (#1791).


# igraph 2.1.4.9031

## vendor

- Update vendored sources to igraph/igraph@e5de49c7f65708763b70413dbde4ac0eba7ef5b6 (#1789).

- Update vendored sources to igraph/igraph@7d634197abd2bb0bc3317c1216cfb82c3813d1af (#1788).

- Update vendored sources to igraph/igraph@bc19dd7ec62ceb80409513009caefb5412c0dab1 (#1787).


# igraph 2.1.4.9030

## Documentation

- `make_graph()` now supports `Groetzsch` as an alias of `Grotzsch`.
  This change was implemented in the C core.

## vendor

- Update vendored sources to igraph/igraph@ead8aea0dcecf43755f9a1857d09ce092d6ff9cf (#1785).


# igraph 2.1.4.9029

## vendor

- Update vendored sources to igraph/igraph@65cf9a269634047812afbbe966099bb6983ced68 (#1783).


# igraph 2.1.4.9028

## vendor

- Update vendored sources to igraph/igraph@fc6860b31887b362e8ddbb07e44e6a12e9cef82d (#1776).

- Update vendored sources to igraph/igraph@dcdad62cbb2e7969fb58429850487a5f0e00c812 (#1775).

- Update vendored sources to igraph/igraph@1636677c821f9dd453049b86e370c0dd6477640b (#1774).

- Update vendored sources to igraph/igraph@6d85a48755d5de8e36fa9d4e53fee891ad0428fa (#1773).

- Update vendored sources to igraph/igraph@fe6bdb78c4a3269b542c6af7a167b9599f08173d (#1772).

- Update vendored sources to igraph/igraph@e5e5374c55164557ba29beee4dbde1a61fa1c50b (igraph/igraph#2473, #1771).


# igraph 2.1.4.9027

## vendor

- Update vendored sources to igraph/igraph@910770148045f66ee30bd0c519adaec0e7a7cc31 (igraph/igraph#2473, #1769).

- Update vendored sources to igraph/igraph@10d4fc75f146f5fc8ec17d99ab808c53a3c49dae (#1768).

- Update vendored sources to igraph/igraph@92ec35b3e427734fde7f8ebc9d978ee6fd207c68 (#1767).


# igraph 2.1.4.9026

## vendor

- Update vendored sources to igraph/igraph@dd208201b117baecfb1f0de9018e20a6929da865 (#1765).

- Update vendored sources to igraph/igraph@64e4649039ab5b2762068e56fd07ce4b93256767 (#1764).

- Update vendored sources to igraph/igraph@aec39d00ee55245b368421cc3453457ac7ae737e (#1763).


# igraph 2.1.4.9025

## Features

- Expose `find_cycle()` (#1471, #1571).

- Split `sample_bipartite()` into two functions for the G(n, m) a… (#630, #1692).

## Chore

- Results from revdepcheck.

- Update generated documentation.

- Install build dependencies.

## Documentation

- Update decription of `order` parameter of `ego()` and related functions (#1746).

## Testing

- Snapshot updates for rcc-smoke (null) (#1738).


# igraph 2.1.4.9024

## Bug fixes

- Integer vectors are validated before transferring them to the C library (#1434, #1582).


# igraph 2.1.4.9023

## vendor

- Update vendored sources to igraph/igraph@b42d0101d7c2a6d31ac6568aa4b4398d5f619e2e (#1758).

- Update vendored sources to igraph/igraph@627f71a5e0eac5c00f56499fb4457ff4f9ee315d (igraph/igraph#2710, #1757).

- Update vendored sources to igraph/igraph@a7d22863ea48ec7b206ef6a03869ff7817cb8a5b (#1756).


# igraph 2.1.4.9022

## Chore

- Require copyright assignment in PR template (#1747).


# igraph 2.1.4.9021

## Chore

- Fix `Makefile-cigraph` again.

- Deprecate `scale` argument of `centr_eigen()` and `centr_eigen_tmax()` (#1531, #1625).

## Testing

- Rename, add test for `laplacian_matrix()` (#1714).

## vendor

- Update vendored sources to igraph/igraph@662abbdfa467a6436bad650c31a8360787d75379 (#1753).

- Update vendored sources to igraph/igraph@1a7f9b71505c8455afb836628bc133e387154118 (#1752).

- Update vendored sources to igraph/igraph@410fc4089639fde7f2e6b42ce4588bd6af3d78de (#1751).

- Update vendored sources to igraph/igraph@1cbe1ae2abedacb0afde1b367a788580c9810c6c (#1750).

- Update vendored sources to igraph/igraph@5bda8315202ff0647e30da77de0d70c7f25d89bf (#1749).

- Update vendored sources to igraph/igraph@091e2927a6acce4e89db0db37d7db8496a59f117 (#1748).


# igraph 2.1.4.9020

## Bug fixes

- Changed base location for graph_from_graphdb and added tests (@schochastics, #1712, #1732).

- Recycling of logical vectors when indexing into edge/vertex selectors now throws an error (@schochastics, #848, #1731).

## Features

- `feedback_vertex_set()` finds a minimum feedback vertex set in a graph (#1446, #1447, #1560).

## Chore

- Add include.

- R 4.0 compat.

- Remove `Rf_allocSExp()` which is no longer in R's C API (#1735).

- Fix Stimulus (#1737).

- Use `"parent"` instead of `"father"` in `bfs()` and `dfs()` (#880, #1523).

## Documentation

- Welcome Maëlle Salmon and David Schoch as authors (#1733).

## Testing

- Merged feedback.set tests into structural.properties (#1743).


# igraph 2.1.4.9019

## Testing

- Added tests for untested files (@schochastics, #1728).

- Merged and refactored other.R tests (@schochastics, #1727).

- Merged and refactored structural.properties.R tests (@schochastics, #1726).


# igraph 2.1.4.9018

## Bug fixes

- Use function instead of (x) in arrow.mode (@schochastics, #1722).

## Documentation

- Lifecycle table (#1525).

## Refactoring

- One less tmp use case (#1715).

## Testing

- Merged and refactored orphaned test files (@schochastics, #1724).

- Merged and refactored iterators.R and operators.R tests (@schochastics, #1723).

- Merged and refactored topology.R tests (@schochastics, #1720).

- Merged and refactored embedding.R tests (@schochastics, #1721).

- Merge all tests for foreign.R into one test file (#1713).


# igraph 2.1.4.9017

## Features

- Added proper support for adding attributes via data.frames (@schochastics, #1373, #1669, #1716).


# igraph 2.1.4.9016

## doc

- Fix typos in `laplacian_matrix` documentation.


# igraph 2.1.4.9015

## Chore

- Run `devtools::document()` (#1710).


# igraph 2.1.4.9014

## Bug fixes

- Duplicated arrowhead drawing (@schochastics, #640, #1709).

- Correct mapping of edge label properties in plots when loops are present (@schochastics, #157, #1706).

- NA attribute values are replaced with default values for plotting (@schochastics, #293, #1707).

## vendor

- Update vendored sources to igraph/igraph@10ef19bc2a61de6c6cfe76e5a068f82b1d29fff1 (#1694).


# igraph 2.1.4.9013

## Features

- Hrg functions check their argument (#1074, #1699).

## Documentation

- Replace instances of `#' if` with `#' @examplesIf` (#1134, #1698).

- Update graph saving rec (#1242, #1700).

## Testing

- Improve test-dot.product.game (#1396, #1705).


# igraph 2.1.4.9012

## Chore

- Run {styler} (with {igraph.style}) (#1696).

## Documentation

- Add more about igraph.r2cdocs in the contributing guide (#1686, #1697).

## Testing

- Merged and refactored conversion.R tests (@schochastics, #1701).

- Create helpers (#1691, #1695).

- Merged and refactored make.R tests (@schochastics, #1685).

- Merged and refactored community.R tests (@schochastics, #1689).

- Merged and refactored indexing.R tests (@schochastics, #1687).


# igraph 2.1.4.9011

## Testing

- Merged and refactored flow.R tests (@schochastics, #1675).

- Merged and refactored games.R tests (@schochastics, #1682).

## Uncategorized

- Refactor: consolidate graph.incidence.\* (#1483) (#1654).


# igraph 2.1.4.9010

## vendor

- Update vendored sources to igraph/igraph@6981deb377ddd9ca9f098d683a743c3dd793e563 (#1680).

- Update vendored sources to igraph/igraph@7955e08f37feda6c61f684428063e13e5a71ff5f (#1679).


# igraph 2.1.4.9009

## vendor

- Update vendored sources to igraph/igraph@199fdbf0a511294c7444eaa25c1861e784b3aa8a (#1677).


# igraph 2.1.4.9008

## Refactoring

- Enhance readability and performance of graph.adjacency.sparse (@schochastics, #1667).

## Performance

- Faster single bracket querying of a graph (@schochastics, #1465, #1658).


# igraph 2.1.4.9007

## vendor

- Update vendored sources to igraph/igraph@27624a9b65031aabd3bb976efe944524d9e7dd43 (#1672).

## doc

- Clarify weights use in `layout_with_kk()`.


# igraph 2.1.4.9006

## Continuous integration

- Use igraph repo for vendoring.

- Fix vendoring workflow.

## vendor

- Update vendored sources to igraph/igraph@2ab6b87947187a0b046fa3cbb10a30ec370843aa (#1670).


# igraph 2.1.4.9005

## Features

- `get_edge_ids()` accepts data frames and matrices (#1663).


# igraph 2.1.4.9004

- Refactor: forward `get.adjacency.dense()` to `get.adjacency.sparse()` if attributes are present (#1483) (#1653).


# igraph 2.1.4.9003

## Bug fixes

- Breaking change: Subset assignment of a graph avoids addition of double edges and ignores loops unless the new `loops` argument is set to `TRUE` (@schochastics, #1662, #1661).

## Breaking changes

- Breaking change: Subset assignment of a graph avoids addition of double edges and ignores loops unless the new `loops` argument is set to `TRUE` (@schochastics, #1662, #1661).


# igraph 2.1.4.9002

## Bug fixes

- Temporarily disable generating an interface for `igraph_simple_cycles_callback()`.
  as the framework for handling callback functions is not yet present

## Chore

- Breaking change: remove deprecated `neimode` parameter from `bfs()` and `dfs()` (#1105, #1526).

- Adapt handling of optional parameters to interface definition changes in the C core (#1567).

- Breaking change: stricter deprecation of non-functional parameters of `layout_with_kk()` and `layout_with_fr()` (#1108, #1628).

## Continuous integration

- Sync vendor workflow with duckdb.

## Refactoring

- Prepare for C core interface standardizing 'type' -\> 'types' in igraph_is_bipartite.

## Breaking changes

- Breaking change: remove deprecated `neimode` parameter from `bfs()` and `dfs()` (#1105, #1526).

- Breaking change: stricter deprecation of non-functional parameters of `layout_with_kk()` and `layout_with_fr()` (#1108, #1628).

## vendor

- Update vendored sources to igraph/igraph@5216243786a5368ab14db9649008d1caca75f5af.

  refactor: cleaner workaround in plfit for Windows 11 SDK bug where NAN is defined in a non-constant manner

- Update vendored sources to igraph/igraph@622f331dc9249b050bc6afbad2032e2c4e78de9e.

  fix: remove unused converage exclusion

- Update vendored sources to igraph/igraph@c675c805a6ed436887ec0e6f9c6e18ca6d13ecad.

  chore: update CodeCoverage.cmake from upstream https://github.com/bilke/cmake-modules/blob/master/CodeCoverage.cmake

- Update vendored sources to igraph/igraph@b25eda2dba6ccbcf5a47fe1cb77796a7f0f524d4.

  fix: UBSan warning about negative shift when generating Q_0 hypercube graph

- Update vendored sources to igraph/igraph@e0dbe374e30adc654ad55a50d5aaf47ebc753908.

  chore: update plfit to 1.0.0

- Update vendored sources to igraph/igraph@2cdc20a37fe048143ac54a3fa8288bb017402e7c.

  chore: update plfit
  fuzzer: use libxml2 2.13.5
  chore(deps): bump codecov/codecov-action from 4 to 5

- Update vendored sources to igraph/igraph@082e2c6ba1a96d34d05a4e75a59c4f690aeca58d.

  chore: update changelog \[skip ci\]

- Update vendored sources to igraph/igraph@8d242741a1cdc2686f180838d28f80cb96985c74.

  chore: update plfit

- Update vendored sources to igraph/igraph@6c57e8c955d3c4d81160281d018dd3fa0a4052d8.

  refactor: minor cleanup in maximal cliques

- Update vendored sources to igraph/igraph@d6348668ba511735110758dc4ee0423a983bf1ac.

  refactor: remove extraneous whitespace before continuation backslashes in max clique template code

- Update vendored sources to igraph/igraph@9f06e4c34d8b1d533ba331ae581844a2ea9b565f.

  chore: punctuate som error messages

- Update vendored sources to igraph/igraph@befc831fff74e4bae39743b1f83b38e6b3af0390.

  fix: correct some implicit integer conversions

- Update vendored sources to igraph/igraph@5e3c56c6a10cb954b78c7441c5460a3c6ad4f5b7.

  fix: eliminate some unused parameter warnings

- Update vendored sources to igraph/igraph@8cdfd787c2be8886cc4eac014f3004055a8c3ca0.

  refactor: improved const-correctness in vector implementation

- Update vendored sources to igraph/igraph@ab123f04e487bc8bc1b93b9258e577e5f05d7ce9.

  chore: update plfit, works around non-compile-time-constant NAN bug in recent Windows 11 SDKs

- Update vendored sources to igraph/igraph@833672f02161051010d1b633b23be53765663372.

  chore: restrict workaround to CMake 3.31.0 USE_TERMINAL bug to the single affected CMake version

- Update vendored sources to igraph/igraph@5e734a2c1211d017088a882ed121f25956e20189.

  ci: support for controlling the use of plfit and improve alpine jon

- Update vendored sources to igraph/igraph@ed43183a2eeb9e604addf1dc672908b7b845cec7.

  refactor: some cleanup in shortest path implementations

- Update vendored sources to igraph/igraph@2412652489721e41617e3d9719b02923da31ab0d.

  chore: devcontainer update

- Update vendored sources to igraph/igraph@48ff9407b74cca8e50f1d256b039452e40662985.

  chore: link to relevant CMake bug regarding policy CMP0175

- Update vendored sources to igraph/igraph@3631b1d5a0f3b7e49463f89cbbba762b24d9383d.

  refactor: clean up igraph_path_length_hist()

- Update vendored sources to igraph/igraph@6fd3903c84d741d4bed0284c85db277836a4af79.

  refactor: clean up igraph_vertex_path_from_edge_path() and clarify that it is suitable for any walk, not just paths

- Update vendored sources to igraph/igraph@379ef39bb89f41ba6d0ff39a86039571796e3bde.

  refactor: eliminate redundant pointer variable in GraphML reader

- Update vendored sources to igraph/igraph@af14d843991f9e4f2894477a8644cfbd27a13d11.

  fix: mark global variables in GraphML parser as static

- Update vendored sources to igraph/igraph@05979d3b2c85c12334ce5d3508dd473cdfa3c6f5.

  doc: improve maximal clique docs

- Update vendored sources to igraph/igraph@41d855d470c7e5cca40bb8a2e294656504aa2a56.

  chore: update changelog

- Update vendored sources to igraph/igraph@a2109c50681c0b444285cf40d09a602047141ea1.

  docs: more cross-referencing

- Update vendored sources to igraph/igraph@62881320e766e8df227839a67078dd22e909cd2d.

  docs: fix typo

- Update vendored sources to igraph/igraph@3673a0a9c3b3604ab1975432f6bbeed697dc9f7c.

  doc: more cross-linking

- Update vendored sources to igraph/igraph@e842e658993df7305aec9d805baf36008aec9e4d.

  fix: compatibility with CMake 3.31

- Update vendored sources to igraph/igraph@2f0e27c9c19e8e7eb9b3b2df01ae3186f1e62470.

  ci: use modern CMake features for CTest parallelization

- Update vendored sources to igraph/igraph@a16619502b6c21d4883eeee992794b271e1035d9.

  chore: updated changelog

- Update vendored sources (tag 0.10.15) to igraph/igraph@635b432eff0a89580ac9bb98068d2fbc8ef374f2.

  chore: updated changelog

- Update vendored sources to igraph/igraph@563aa5e8569b85a73680752bd8ad5624575610b6.

  chore: run pre-commit hooks

- Update vendored sources to igraph/igraph@f32e621f3833556e361a3078ab9e046f6acdd9b8.

  chore: bump VERSION property in shared library

- Update vendored sources to igraph/igraph@26d3718b364167dd0528c63a35f9e5e513df6845.

  refactor: do not use vector_get() in simple cycle finder

- Update vendored sources to igraph/igraph@cd7bcd9d9b9bfd9acd83dace6438507947297ce2.

  refactor: cleaner parameter ordering in igraph_i_simple_cycles_circuit()

- Update vendored sources to igraph/igraph@dafe829b811f9344fb1f5a8412a100b586817e3f.

  refactor: support specifying a minimum cycle length in `igraph_simple_cycles()`

- Update vendored sources to igraph/igraph@c263ce7541e904f71dbcb7e06ca0dfb08cbf2ed7.

  interface: loops=True default for igraph_degree()

- Update vendored sources to igraph/igraph@f6ec07e8a9425f09259bd04b0fefe1ebdfe64067.

  chore: updated contributors list

- Update vendored sources to igraph/igraph@a6441e7a00118988aeac528910d6b9d417aec364.

  chore: trim trailing whitespace in interface file

- Update vendored sources to igraph/igraph@042a2c5230e8008b976a5ad0f04fe2b3e00cde97.

  interface: add missing interface for igraph_get_isomorphisms_vf2_callback()

- Update vendored sources to igraph/igraph@797ab4fa6c9a119ff12af1f5d6080de8d1e4f142.

  interface: mark all callback extra parameters and some callback functions as optional

- Update vendored sources to igraph/igraph@518fcc4165c420b9f4958d1496a607d325d69826.

  interface: add default parameter values for fundamental_cycles() and minimum_cycle_basis()

- Update vendored sources to igraph/igraph@d9c328f61e31d93681e2c0894ace18ad59a5dba2.

  interface: even more missing OPTIONAL markers

- Update vendored sources to igraph/igraph@3b9cb6ff078cf4e7fdb2be593811e50b97232fea.

  interface: add more missing OPTIONAL markers

- Update vendored sources to igraph/igraph@5512e864ecddc76af4a7c93b7e4ebfd7030cc404.

  fix: some weights parameters were incorrectly marked as OPTIONAL in functions.yaml

- Update vendored sources to igraph/igraph@4b208d877de74a730e8707e94ebad5318cf308ae.

  fix: mark some optional weight parameters as OPTIONAL in functions.yaml

- Update vendored sources to igraph/igraph@d0616a433134dcb6ae6f3195c5a72e456f5a4809.

  fix: type -\> types in is_bipartite interface

- Update vendored sources to igraph/igraph@c3f9a823d8bc7fa210df4e1225c86226195e1f16.

  fix: some BIPARTITE_TYPES parameters were incorrectly marked as optional

- Update vendored sources to igraph/igraph@34f8d72f3c702aa490644244ebee98b836ac45d1.

  refactor: use OPTIONAL instead of =NULL in interfaces

- Update vendored sources to igraph/igraph@5c74801197212e9908f561139af3141410cf49d2.

  feat: functionality for listing all simple cycles

- Update vendored sources to igraph/igraph@f5d79f2eb90c2597ea0e33c60d0e6a083efc4abc.

  interface: default OUT mode for igraph_find_cycle()

- Update vendored sources to igraph/igraph@992f77abdbe675c2d0dd2926536c57496b720c81.

  refactor: better error reporting for igraph_find_cycle()

- Update vendored sources to igraph/igraph@207f0bb1624bb73a9d1f2f979bf2b2bfde60626f.

  chore: some copyright header cleanup in public headers

- Update vendored sources to igraph/igraph@8eaa07489a27f55cdf8421bbbb8e34b60eacd1bf.

  refactor: minor readability improvements

- Update vendored sources to igraph/igraph@5cd6552bf00d6a774cdd64b5fabf2c79524ccfc7.

  fix: add some missing IGRAPH_CHECKs

- Update vendored sources to igraph/igraph@82d35eebd8c73a9476d5e2d205a851b4ebfc8eda.

  refactor: minor readability cleanup in matching functions

- Update vendored sources to igraph/igraph@01db8e25a80dd8f93ccb9d7a6f39379a57fdc3ad.

  fix: `igraph_bipartite_projection_size()` now validates the bipartite `types` vector

- Update vendored sources to igraph/igraph@7284ee015d2662ca4e1ab62e3ce17ff34df24430.

  chore: fix some spelling mistakes

- Update vendored sources to igraph/igraph@1d6ef7c417e38c881ef325d8c553ccf767db6b6f.

  refactor: minor readability cleanup in igraph_decompose()

- Update vendored sources to igraph/igraph@0878f577d45ff5fdc33e0ecacc542277a8024af9.

  doc: more documentation improvements

- Update vendored sources to igraph/igraph@bd7b3a82bb9db038ebfcc046319947c5ea196660.

  doc: several documentation improvements and cross-referencing

- Update vendored sources to igraph/igraph@764954eda823c40341d302ac290629d96d5bd9bf.

  chore: fix typo in error message

- Update vendored sources to igraph/igraph@6c0a4310474e9935acc557673e1a2f9ec0dd6db3.

  docs: community_optimal_modulairty() does support directed graphs

- Update vendored sources to igraph/igraph@59d71d001308d424782a386fea3069cf880d82a2.

  chore: do not warn about unknown warning options with legacy Intel compiler

- Update vendored sources to igraph/igraph@7a0d4918abfd34c38eb2fdeec4460b2370cea1c9.

  fix: validate sample size in igraph_motifs_randesu_estimate()

- Update vendored sources to igraph/igraph@e7820cf969a8c63d6564452f73246c044ee99ba9.

  chore: fix typo in comment

## hack

- Provide NULL default for types argument of `bipartite_projection_size()`.
  This parameter is optional in R, but not in C. Therefore the C interface definition doesn't provide a default or OPTIONAL marker.

## Uncategorized

- Refactor: removed `for` loops from `get.incidence.dense()` (#1483) (#1655).

- Vendor: Update vendored sources to igraph/igraph@ae93a3a2431bb6fd8a1feb687cac32feef63730b.

- Vendor: Update vendored sources to igraph/igraph@e940ab737938dfdd4518164c866b2599af40856f.

- Vendor: Update vendored sources to igraph/igraph@3ac79b81bdf835460445ca6163f25e6559ec9958.

- Vendor: Update vendored sources to igraph/igraph@f7b77f9e9cb4d670886b7e15e876c5549250befa.

- Vendor: Update vendored sources to igraph/igraph@a662f79d46970bbcc2888e69dce5daa3fee8906e.

- Vendor: Update vendored sources to igraph/igraph@a1389c191ac42b5ed3fcaf341ff3235c9f6f19f3.

- Vendor: Update vendored sources to igraph/igraph@12299c4928f9f463c06d0b46752df69a6d67c289.


# igraph 2.1.3.9003

- Refactor: removed `for` loops from `get.incidence.dense()` (#1483) (#1655).


# igraph 2.1.3.9002

## Chore

- Breaking change: remove deprecated `neimode` parameter from `bfs()` and `dfs()` (#1105, #1526).

- Adapt handling of optional parameters to interface definition changes in the C core (#1567).

- Breaking change: stricter deprecation of non-functional parameters of `layout_with_kk()` and `layout_with_fr()` (#1108, #1628).

## Breaking changes

- Breaking change: remove deprecated `neimode` parameter from `bfs()` and `dfs()` (#1105, #1526).

- Breaking change: stricter deprecation of non-functional parameters of `layout_with_kk()` and `layout_with_fr()` (#1108, #1628).


# igraph 2.1.3.9001

## Bug fixes

- Temporarily disable generating an interface for `igraph_simple_cycles_callback()`.
  as the framework for handling callback functions is not yet present

## Refactoring

- Prepare for C core interface standardizing 'type' -\> 'types' in igraph_is_bipartite.

## vendor

- Update vendored sources to igraph/igraph@5216243786a5368ab14db9649008d1caca75f5af.

  refactor: cleaner workaround in plfit for Windows 11 SDK bug where NAN is defined in a non-constant manner

- Update vendored sources to igraph/igraph@622f331dc9249b050bc6afbad2032e2c4e78de9e.

  fix: remove unused converage exclusion

- Update vendored sources to igraph/igraph@c675c805a6ed436887ec0e6f9c6e18ca6d13ecad.

  chore: update CodeCoverage.cmake from upstream https://github.com/bilke/cmake-modules/blob/master/CodeCoverage.cmake

- Update vendored sources to igraph/igraph@b25eda2dba6ccbcf5a47fe1cb77796a7f0f524d4.

  fix: UBSan warning about negative shift when generating Q_0 hypercube graph

- Update vendored sources to igraph/igraph@e0dbe374e30adc654ad55a50d5aaf47ebc753908.

  chore: update plfit to 1.0.0

- Update vendored sources to igraph/igraph@2cdc20a37fe048143ac54a3fa8288bb017402e7c.

  chore: update plfit
  fuzzer: use libxml2 2.13.5
  chore(deps): bump codecov/codecov-action from 4 to 5

- Update vendored sources to igraph/igraph@082e2c6ba1a96d34d05a4e75a59c4f690aeca58d.

  chore: update changelog \[skip ci\]

- Update vendored sources to igraph/igraph@8d242741a1cdc2686f180838d28f80cb96985c74.

  chore: update plfit

- Update vendored sources to igraph/igraph@6c57e8c955d3c4d81160281d018dd3fa0a4052d8.

  refactor: minor cleanup in maximal cliques

- Update vendored sources to igraph/igraph@d6348668ba511735110758dc4ee0423a983bf1ac.

  refactor: remove extraneous whitespace before continuation backslashes in max clique template code

- Update vendored sources to igraph/igraph@9f06e4c34d8b1d533ba331ae581844a2ea9b565f.

  chore: punctuate som error messages

- Update vendored sources to igraph/igraph@befc831fff74e4bae39743b1f83b38e6b3af0390.

  fix: correct some implicit integer conversions

- Update vendored sources to igraph/igraph@5e3c56c6a10cb954b78c7441c5460a3c6ad4f5b7.

  fix: eliminate some unused parameter warnings

- Update vendored sources to igraph/igraph@8cdfd787c2be8886cc4eac014f3004055a8c3ca0.

  refactor: improved const-correctness in vector implementation

- Update vendored sources to igraph/igraph@ab123f04e487bc8bc1b93b9258e577e5f05d7ce9.

  chore: update plfit, works around non-compile-time-constant NAN bug in recent Windows 11 SDKs

- Update vendored sources to igraph/igraph@833672f02161051010d1b633b23be53765663372.

  chore: restrict workaround to CMake 3.31.0 USE_TERMINAL bug to the single affected CMake version

- Update vendored sources to igraph/igraph@5e734a2c1211d017088a882ed121f25956e20189.

  ci: support for controlling the use of plfit and improve alpine jon

- Update vendored sources to igraph/igraph@ed43183a2eeb9e604addf1dc672908b7b845cec7.

  refactor: some cleanup in shortest path implementations

- Update vendored sources to igraph/igraph@2412652489721e41617e3d9719b02923da31ab0d.

  chore: devcontainer update

- Update vendored sources to igraph/igraph@48ff9407b74cca8e50f1d256b039452e40662985.

  chore: link to relevant CMake bug regarding policy CMP0175

- Update vendored sources to igraph/igraph@3631b1d5a0f3b7e49463f89cbbba762b24d9383d.

  refactor: clean up igraph_path_length_hist()

- Update vendored sources to igraph/igraph@6fd3903c84d741d4bed0284c85db277836a4af79.

  refactor: clean up igraph_vertex_path_from_edge_path() and clarify that it is suitable for any walk, not just paths

- Update vendored sources to igraph/igraph@379ef39bb89f41ba6d0ff39a86039571796e3bde.

  refactor: eliminate redundant pointer variable in GraphML reader

- Update vendored sources to igraph/igraph@af14d843991f9e4f2894477a8644cfbd27a13d11.

  fix: mark global variables in GraphML parser as static

- Update vendored sources to igraph/igraph@05979d3b2c85c12334ce5d3508dd473cdfa3c6f5.

  doc: improve maximal clique docs

- Update vendored sources to igraph/igraph@41d855d470c7e5cca40bb8a2e294656504aa2a56.

  chore: update changelog

- Update vendored sources to igraph/igraph@a2109c50681c0b444285cf40d09a602047141ea1.

  docs: more cross-referencing

- Update vendored sources to igraph/igraph@62881320e766e8df227839a67078dd22e909cd2d.

  docs: fix typo

- Update vendored sources to igraph/igraph@3673a0a9c3b3604ab1975432f6bbeed697dc9f7c.

  doc: more cross-linking

- Update vendored sources to igraph/igraph@e842e658993df7305aec9d805baf36008aec9e4d.

  fix: compatibility with CMake 3.31

- Update vendored sources to igraph/igraph@2f0e27c9c19e8e7eb9b3b2df01ae3186f1e62470.

  ci: use modern CMake features for CTest parallelization

- Update vendored sources to igraph/igraph@a16619502b6c21d4883eeee992794b271e1035d9.

  chore: updated changelog

- Update vendored sources (tag 0.10.15) to igraph/igraph@635b432eff0a89580ac9bb98068d2fbc8ef374f2.

  chore: updated changelog

- Update vendored sources to igraph/igraph@563aa5e8569b85a73680752bd8ad5624575610b6.

  chore: run pre-commit hooks

- Update vendored sources to igraph/igraph@f32e621f3833556e361a3078ab9e046f6acdd9b8.

  chore: bump VERSION property in shared library

- Update vendored sources to igraph/igraph@26d3718b364167dd0528c63a35f9e5e513df6845.

  refactor: do not use vector_get() in simple cycle finder

- Update vendored sources to igraph/igraph@cd7bcd9d9b9bfd9acd83dace6438507947297ce2.

  refactor: cleaner parameter ordering in igraph_i_simple_cycles_circuit()

- Update vendored sources to igraph/igraph@dafe829b811f9344fb1f5a8412a100b586817e3f.

  refactor: support specifying a minimum cycle length in `igraph_simple_cycles()`

- Update vendored sources to igraph/igraph@c263ce7541e904f71dbcb7e06ca0dfb08cbf2ed7.

  interface: loops=True default for igraph_degree()

- Update vendored sources to igraph/igraph@f6ec07e8a9425f09259bd04b0fefe1ebdfe64067.

  chore: updated contributors list

- Update vendored sources to igraph/igraph@a6441e7a00118988aeac528910d6b9d417aec364.

  chore: trim trailing whitespace in interface file

- Update vendored sources to igraph/igraph@042a2c5230e8008b976a5ad0f04fe2b3e00cde97.

  interface: add missing interface for igraph_get_isomorphisms_vf2_callback()

- Update vendored sources to igraph/igraph@797ab4fa6c9a119ff12af1f5d6080de8d1e4f142.

  interface: mark all callback extra parameters and some callback functions as optional

- Update vendored sources to igraph/igraph@518fcc4165c420b9f4958d1496a607d325d69826.

  interface: add default parameter values for fundamental_cycles() and minimum_cycle_basis()

- Update vendored sources to igraph/igraph@d9c328f61e31d93681e2c0894ace18ad59a5dba2.

  interface: even more missing OPTIONAL markers

- Update vendored sources to igraph/igraph@3b9cb6ff078cf4e7fdb2be593811e50b97232fea.

  interface: add more missing OPTIONAL markers

- Update vendored sources to igraph/igraph@5512e864ecddc76af4a7c93b7e4ebfd7030cc404.

  fix: some weights parameters were incorrectly marked as OPTIONAL in functions.yaml

- Update vendored sources to igraph/igraph@4b208d877de74a730e8707e94ebad5318cf308ae.

  fix: mark some optional weight parameters as OPTIONAL in functions.yaml

- Update vendored sources to igraph/igraph@d0616a433134dcb6ae6f3195c5a72e456f5a4809.

  fix: type -\> types in is_bipartite interface

- Update vendored sources to igraph/igraph@c3f9a823d8bc7fa210df4e1225c86226195e1f16.

  fix: some BIPARTITE_TYPES parameters were incorrectly marked as optional

- Update vendored sources to igraph/igraph@34f8d72f3c702aa490644244ebee98b836ac45d1.

  refactor: use OPTIONAL instead of =NULL in interfaces

- Update vendored sources to igraph/igraph@5c74801197212e9908f561139af3141410cf49d2.

  feat: functionality for listing all simple cycles

- Update vendored sources to igraph/igraph@f5d79f2eb90c2597ea0e33c60d0e6a083efc4abc.

  interface: default OUT mode for igraph_find_cycle()

- Update vendored sources to igraph/igraph@992f77abdbe675c2d0dd2926536c57496b720c81.

  refactor: better error reporting for igraph_find_cycle()

- Update vendored sources to igraph/igraph@207f0bb1624bb73a9d1f2f979bf2b2bfde60626f.

  chore: some copyright header cleanup in public headers

- Update vendored sources to igraph/igraph@8eaa07489a27f55cdf8421bbbb8e34b60eacd1bf.

  refactor: minor readability improvements

- Update vendored sources to igraph/igraph@5cd6552bf00d6a774cdd64b5fabf2c79524ccfc7.

  fix: add some missing IGRAPH_CHECKs

- Update vendored sources to igraph/igraph@82d35eebd8c73a9476d5e2d205a851b4ebfc8eda.

  refactor: minor readability cleanup in matching functions

- Update vendored sources to igraph/igraph@01db8e25a80dd8f93ccb9d7a6f39379a57fdc3ad.

  fix: `igraph_bipartite_projection_size()` now validates the bipartite `types` vector

- Update vendored sources to igraph/igraph@7284ee015d2662ca4e1ab62e3ce17ff34df24430.

  chore: fix some spelling mistakes

- Update vendored sources to igraph/igraph@1d6ef7c417e38c881ef325d8c553ccf767db6b6f.

  refactor: minor readability cleanup in igraph_decompose()

- Update vendored sources to igraph/igraph@0878f577d45ff5fdc33e0ecacc542277a8024af9.

  doc: more documentation improvements

- Update vendored sources to igraph/igraph@bd7b3a82bb9db038ebfcc046319947c5ea196660.

  doc: several documentation improvements and cross-referencing

- Update vendored sources to igraph/igraph@764954eda823c40341d302ac290629d96d5bd9bf.

  chore: fix typo in error message

- Update vendored sources to igraph/igraph@6c0a4310474e9935acc557673e1a2f9ec0dd6db3.

  docs: community_optimal_modulairty() does support directed graphs

- Update vendored sources to igraph/igraph@59d71d001308d424782a386fea3069cf880d82a2.

  chore: do not warn about unknown warning options with legacy Intel compiler

- Update vendored sources to igraph/igraph@7a0d4918abfd34c38eb2fdeec4460b2370cea1c9.

  fix: validate sample size in igraph_motifs_randesu_estimate()

- Update vendored sources to igraph/igraph@e7820cf969a8c63d6564452f73246c044ee99ba9.

  chore: fix typo in comment

## hack

- Provide NULL default for types argument of `bipartite_projection_size()`.
  This parameter is optional in R, but not in C. Therefore the C interface definition doesn't provide a default or OPTIONAL marker.

## Uncategorized

- Vendor: Update vendored sources to igraph/igraph@ae93a3a2431bb6fd8a1feb687cac32feef63730b.

- Vendor: Update vendored sources to igraph/igraph@e940ab737938dfdd4518164c866b2599af40856f.

- Vendor: Update vendored sources to igraph/igraph@3ac79b81bdf835460445ca6163f25e6559ec9958.

- Vendor: Update vendored sources to igraph/igraph@f7b77f9e9cb4d670886b7e15e876c5549250befa.

- Vendor: Update vendored sources to igraph/igraph@a662f79d46970bbcc2888e69dce5daa3fee8906e.

- Vendor: Update vendored sources to igraph/igraph@a1389c191ac42b5ed3fcaf341ff3235c9f6f19f3.

- Vendor: Update vendored sources to igraph/igraph@12299c4928f9f463c06d0b46752df69a6d67c289.


# igraph 2.1.3.9000

- Switching to development version.


# igraph 2.1.4

## Testing

- Tweak tests that use the graph package.


# igraph 2.1.3

## Features

- Use `_pv` destroy functions to satisfy ASAN checks (#1630).

- Use safe accessor to vector elements (#1633).

## Chore

- Replace `graph.isomorphic()` with `isomorphic()` (#1583, #1623).

## Documentation

- Convert `plot.common.Rd` to roxygen2 (#1424, #1636).

- Remove broken example from `graph_from_graphdb()` manual page (#1622, #1637).

- Document argument for NCOL format in `read_graph()` (#1621).

- Make documentation of `disjoint_union()` consistent with behavior (#1587, #1641).

- Add central note about experimental functions (#1624).


# igraph 2.1.2

## Bug fixes

- `adjacent_vertices()` and `incident_edges()` are now correct if the `"return.vs.es"` option is `FALSE` (@stibu81, #1605, #1606).

- Fix protection errors reported by rchk (#1592).

- Fix the incorrect handling of the `sample` parameter in `sample_motifs()` and ensure that the default `sample.size` is integer (#1568).

## Documentation

- Clarify what type of graph each community detection function supports.

- Improve `?read_graph` and `?write_graph` documentation.

- Improve `all_simple_paths()` documentation.

- `cluster_optimal()` does support directed graphs.

## Testing

- Test handling of `"return.vs.es"` in several functions (@stibu81, #1610).


# igraph 2.1.1

See <https://github.com/igraph/rigraph/blob/9828d7b11be330f994f07ae93a071b356eced903/src/vendor/cigraph/CHANGELOG.md> for a complete changelog, in particular the section "Breaking changes".

## Features

- Add `p.value` and `p.precision` arguments to `fit_power_law()` to control the computation of the p-value (#1546).

## Bug fixes

- Preserve `as.undirected()` signature thanks to @jhollway, regression introduced in igraph 2.1.0 (#1536).

## Lifecycle

- Deprecate `eigen_centrality(scale = )` (#1543).
- Put deprecation message at the beginning not the end of the similarity functions (#1549).

## Documentation

- Update allcontributors table (#1552).
- Use mathjax for now (#1538).

## Internal

- Prepare for libxml2 depending on bcrypt, use pkg-config (#1556, @kalibera).


# igraph 2.1.0

See <https://github.com/igraph/rigraph/blob/05973441b83decdeab8cc9c500a642c00b924770/src/vendor/cigraph/CHANGELOG.md> for a complete changelog, in particular the section "Breaking changes".

## Lifecycle 

### Breaking changes

- Breaking change: remove tkigraph from {igraph} proper (#1474).
- Breaking change: Hard-deprecate `get.edge()` and `layout.grid.3d()` which have been deprecated for 10 years (#1398).
- Breaking change: use `rlang::arg_match()` in `igraph_match_arg()` (#1165).

### In-progress deprecations

We are working towards a more consistent interface, especially as regards function naming: ultimately we want the igraph functions to use snake case.
Please update your scripts and codebases as soon as you can.

- Add `independence_number()` as an alias of `ivs_size()` (#1522).
- Add `get_edge_ids()` as an alias of `get.edge.ids()` (#1510).
- Increase the deprecation signal to a warning for `hub.score()` and `authority.score()` both replaced by `hits_scores()` (#1352).
- Soft-deprecate `erdos.renyi.game()` and `random.graph.game()` (#1509).

## Features

### C library

- Update vendored C/igraph sources to igraph/igraph@d2e0f4eb567dfc505227c346a015bef574c4ccd1.

### New functionality

- Support `fit_power_law(implementation = "plfit.p")` to compute the P-value (#1386).
- Add `max_degree()` (#1403).
- Add experimental `sample_chung_lu()` (#1416).
- Rename methods available for `sample_degseq()` and add the `"edge.switching.simple"` method (#1376).
- Weight support for `eccentricity()` and `radius()` (#1211).
- Add some argument checking to `add_shape()` (#1478).

### More informative errors

- Export `.from()` etc. with behavior similar to `dplyr::across()` (#1436): functions like `.from()` are meant to be used inside `[` but now if an user misuses them, the error is more informative.

## Bug fixes

- Fix including diagonal elements in dense adjacency matrices (#1437).
- Align the body of `graph.lattice()` with its replacement `make_lattice()` (#1439).
- Use `deprecated()` as default value for `circular` argument to `make_lattice()` (#1431).
- `subgraph_centrality()` now ignores edge directions (#1414).
- Remove unintended type conversions when using `disjoint_union()` (#1375).
- Add missing `PROTECT()` (#1382).
- Fix reading of LGL and NCOL files (broken in 2.0.0) (#1347).
- Fixed potential memory leak in `R_igraph_community_to_membership2()` (#1367).

## Documentation

- Improve the manual page of `sample_()` (#1477).
- Improve cross-links from `make_()` manual page (#1476).
- Update `is_separator()` documentation based on C docs (#1467).
- Add DOI to citation (#1450).
- Improve documentation of normalization methods for laplacian_matrix() (#1420).
- Fix typos in `?plot.common` (@gvegayon) (#1413).
- Fix `sample_degseq()` example (#1297).
- Fix `graph_from_adjacency_matrix()` examples to avoid warnings (#1302).
- Replace `\dontrun{}` with `@examplesIf` (#1307).
- Improve `sample_gnp()` examples.
- Improve centralization docs.
- Further clarifications for `betweenness()` (#1489).
- Clarify how betweenness with cutoff is normalized.
- Fix `centr_eigen_tmax()` docs.
- Make `edge_density()` examples relevant.
- Improve `eigen_centrality()` documentation.
- Improved `cluster_edge_betweenness()` documentation.
- `sample_forestfire()` tests and example (#1318).

### Developer-facing docs

- Add slightly tweaked boilerplate `CONTRIBUTING.md` (#1423).
- Update troubleshooting document.
- Use {devtag} for internal function docs (#1507).
- Make `.igraph.progress()` and `.igraph.status()` more internal (#1516).


# igraph 2.0.3

See <https://github.com/igraph/rigraph/blob/3299d31/src/vendor/cigraph/CHANGELOG.md> for a complete changelog of the bundled C core, and <https://github.com/igraph/rigraph/compare/f3fa58b..3299d31#diff-aeb78e0159780a9b26daabaf6f95f450b0cfec7161fc735f27ad69145a57dc84> for the changes since the igraph 2.0.1.
(A permanent link to the most recent changelog of the C core used in the R package is
<https://github.com/igraph/rigraph/blob/main/src/vendor/cigraph/CHANGELOG.md>.)

## Features

- GMP is no longer a dependency (#1256), libxml2 (#1282) and glpk are optional.
- Update vendored sources to igraph/igraph@857a125069c226f266562b3781b82833fe1d59d9.
- New `voronoi_cells()` to compute the Voronoi partitioning of a graph (#1173).

## Bug fixes

- Fix `rglplot(edge_label = )` (#1267).

## Continuous integration

- Run examples with sanitizer (#1288).
- Add scheduled builds.

## Documentation

- Make `x11()` usage in example happen only in interactive sessions (#1301).
- Remove misleading comment about warning given as no warning is given (#1294).
- Improve `min_st_separators()` documentation (#1264).
- Add link to discussion forum (#1279) and logo (#1280).
- Add code finding duplicate `@seealso`, and use it (#1270).
- Remove duplicate `@seealso` from `?sample_pa` (#1268).
- Remove incorrect claim about handling of complete graphs by `is_separator()` and `is_min_separator()` (#1263).
- Fix error messages mentioning to mention `upgrade_graph()` instead of the nonexisting `upgrade_version()` (#1252).
- Split `is_bipartite()` manual page from other manual page (#1230).
- Improve bug report template.
- `CITATION.cff` contains only the first three version components.
- Install lock workflow to lock stale discussions after one year (#1304).

## Internal

- Replace use of deprecated `barabasi.game()` with `sample_pa()` (#1291).
- Auto-generate `are_adjacent()`, avoid deprecated `igraph_are_connected()` C function (#1254).


# igraph 2.0.2

See <https://github.com/igraph/rigraph/blob/f3fa58b/src/vendor/cigraph/CHANGELOG.md> for a complete changelog of the bundled C core, and <https://github.com/igraph/rigraph/compare/1bd2bf79..f3fa58b#diff-aeb78e0159780a9b26daabaf6f95f450b0cfec7161fc735f27ad69145a57dc84> for the changes since the igraph 2.0.1.
(A permanent link to the most recent changelog of the C core used in the R package is
<https://github.com/igraph/rigraph/blob/main/src/vendor/cigraph/CHANGELOG.md>.)

## Bug fixes

- `g + vertices(1, 2, foo = 3)` works again, regression introduced in igraph 2.0.0 (#1247).
- `sample_pa()` respects the `out.seq` and `out.dist` arguments again, regression introduced in igraph 2.0.0 (#1226).
- `isomorphisms()` and `subgraph_isomorphisims(method = "vf2")` work again, regression introduced in 2.0.0 (#1219).
- `biconnected_components()` now returns edge and vertex sequences again, regression introduced in 2.0.0 (#1213).
- Remove zeros from the `order` and `order.out` components returned by `dfs()`, regression introduced in 2.0.0 (#1179).
- Memory leaks when converting data to C (#1196).

## Features

- `realize_bipartite_degseq()` creates a bipartite graph from two degree sequences (#1212).
- `is_biconnected()` checks if a graph is biconnected (#1204).
- `distances()` now supports the Floyd-Warshall algorithm (#1186).

## Documentation

- Use more culturally diverse names in intro vignettes (#1246).
- Formatting tweaks in introductory vignettes (#1243).
- Recommend {pak} instead of {remotes} (#1228).
- Fix typo in `mean_distance()` docs.
- Update troubleshooting document, emphasize issues with Anaconda environments (#1209).
- Improved docs for shortest path functions (#1201).
- Document `"dsatur"` heuristic for `greedy_vertex_coloring()` (#1206).
- Remove scg related docs (#1167).
- Fix typo in `?articulation_points` (#1191).
- Improve installation and troubleshooting instructions (#1184).
- Improve docs of assortativity (#1151).

## Testing

- Add tests for `isomorphisms()` and `subgraph_isomorphisms()` (#1225).

## Packaging

- Always use bundled mini-gmp (#1233).
- `config.h` defines `HAVE___UINT128_T` (#1216).
- Do not rely on `which` program during configuration (#1232).
- `configure` manage libxml multiple include paths (#1197).
- Remove empty string in `configure` (#1235).
- Link Fortran runtime on Windows as needed by arpack. (#1215).
- Workaround for deprecated enum values not being supported with old GCC (#1205).
- `HAVE_GFORTRAN` flag for `win` and `ucrt` (#1171).
- `make_empty_graph()` is now fully auto-generated (#1068).
- Eliminate manual edits from autogenerated files (#1207).
- Add read-only comments for RStudio IDE (#1152).

## Internal

- Remove unused patch files (#1234).
- Update stimulus to 0.21.4 (#1210).
- Avoid duplicate objects (#1223).
- Eliminate a compiler warning from simpleraytracer (#1185).


# igraph 2.0.1.1

## Bug fixes

- Avoid `is.R()` which is deprecated in R 4.4.0.


# igraph 2.0.1

## Bug fixes

- Use cpp11 for simpleraytracer glue to avoid `-Wlto` warnings (#1163).


# igraph 2.0.0

This major release brings development in line with the C core at <https://github.com/igraph/igraph>.
See <https://github.com/igraph/rigraph/blob/1bd2bf79/src/vendor/cigraph/CHANGELOG.md> for a complete changelog, in particular the section "Breaking changes".
(A permanent link to the most recent changelog of the C core used in the R package is
<https://github.com/igraph/rigraph/blob/main/src/vendor/cigraph/CHANGELOG.md>.)

Version 1.6.0 of the R package used version 0.9.9 of the C core.
The changes in the 0.10 series of the C core are relevant for version 2.0.0 of the R package, but not all C core functions are exposed in the R interface.
Changes to the implementation of some functions in the C core may be reflected in functions in the R package.

The change log below is a summary of the additional changes in the R interface.

## Breaking changes

- `get.edge.ids(multi = TRUE)` and `as_adjacency_matrix(edges = )` are no longer supported (#1101, #1080).

- Remove `NA` padding for `dfs(unreachable = FALSE)$order` and `$order.out` and for `bfs(unreachable = FALSE)$order`, also for `igraph_options(return.vs.es = FALSE)` (#1062, #1124).

- `laplacian_matrix(normalized = TRUE)` uses a different normalization method (#1102).

- `fit_power_law()` no longer returns a `KS.p` component.

- Remove default value for `loops` argument of `centr_degree_tmax()` (#1114).

- `as_adjacency_matrix()` no longer supports attributes of type `character` (#1072).

- Remove `graph.isomorphic.34()` (#1065, #1067).

- Use `lifecycle::deprecate_soft()` for most deprecated functions (#1024, #1025, #1104).

- The system libraries GLPK, GMP, and libxml2 are now mandatory for compiling from source.


## Bug fixes

- Add scalar conversion checks in a few critical places (#1069).

- Check that we receive a scalar when expecting a scalar in C code (#1051).

- Check that matrix sizes are in the supported range before passing them to R (#1066).

- `transitivity()` now produces a named vector in the local (weighted) case (#1057).

- `plot()` correctly computes intersections between edges and rectangle vertices (#1021).

- Fix compilation on Windows with spaces in the Rtools path (#1000).

## Features

- Use 30 bits of R's RNG (#1079).

- Breaking change: Remove `NA` padding for `dfs(unreachable = FALSE)$order` and `$order.out` and for `bfs(unreachable = FALSE)$order`, also for `igraph_options(return.vs.es = FALSE)` (#1062, #1124).

- New `k_shortest_paths()` to compute the first k shortest paths between two vertices (#1028).

## Documentation

- Add GitHub bug report form.

- New `vignette("deprecated-dot-case")` that lists deprecated functions and their alternatives (#1013).

- Move deprecation badge to top of doc pages.

- Remove usage of `get.adjacency()` from intro vignettes (#1084).

- Fix math formatting in `fit_power_law()` docs.

- Fix incorrect usage in `subgraph.edges()` example.

- Clarify that Infomap considers edge directions.

- Improve edge connectivity docs (#1119).

- Add some missing diacritics.

## Internal

- Use `[]` assignment for converting matrices (#1035).

- Move towards autogenerating all bindings (#1043).

- Use %\|\|% from rlang (#1112).

- Replace loop by `lapply()` when returning vertex and edge sets (#1033).

- Do not duplicate prototypes, use a common header for `rinterface.c` and `rinterface_extra.c` (#1055).

- Clean up some auto-generation code (#1031), remove unused parts from code generation (#1032), eliminate the use of some deprecated C functions.

- Use integers for mode enum in `cluster_label_prop()`.

- Standardize the handling of some stimulus enum types (#1064).

- Remove unused vectorlist / matrixlist destructors (#1070).

- Remove unused stimulus type VERTEXSETLIST_INT (#1049).

- Remove unused types (#1060).

- Fix Stimulus definitions (#997).

- Avoid deprecated `R_igraph_automorphisms()` (#999).

- Use new ARPACK_DEFAULTS symbol from C core for default arpack options.

- Ignore upstream CITATION file to avoid R CMD check NOTE (#1007).

- Add Aviator configuration.

## Testing

- Add `as_biadjacency_matrix()` tests for named vectors (#1154, #1155).

- Test transferring colors in isomorphism functions (#1050).


# igraph 1.6.0

## Breaking changes

- New `arpack_defaults()` replaces `igraph.arpack.default` and `arpack_defaults` lists (#800), with consistent usage checks (#966).

- Define methods for `ape::as.phylo()` instead of own `as_phylo()` generic, remove deprecated `asPhylo()` (#763).

- `bfs()` with unreachable nodes returns zero instead of `NaN` as `rank` (#956), and negative instead of `NaN` for `dist` (#926).

- `random_walk()` adds one more step, the resulting list of vertices is of length `steps + 1` (#934).

- `girth()` returns `Inf` for acyclic graphs (#931).

- Remove some behaviour / parameters that were deprecated in 1.3 (#842).

- Remove `scg_eps()`, `scg_group()` and `scg_semi_proj()`, broken and no longer maintained (#946).

## Bug fixes

- Fix `printf()` warning (#975).

- Fix calls to `isSymmetric()` for matrix objects with a class (#965).

- Reduce frequency of interruption checks (#957).

## Features

- Change "incidence matrix" naming to "biadjacency matrix" (#962).

- Add aliases using the neighborhood terminology for all ego functions: (#950).

- Rename arguments to `assortativity(values, values.in)` from `types1` and `types2` (#952).

- Add ellipsis to `cluster_label_prop()` (#954).

- Placeholders for `is_acyclic()` and `is_forest()`, to be implemented in igraph 2.0.0 (#945).

- `is_tree(details = TRUE)` designates the first vertex as root for non-trees (#935).

- `all_shortest_paths()` returns the vertex list in both `res` and `vpaths` components (#930).

- Improve symmetry check for adjacency matrices on input (#911).

- Warn if non-symmetric undirected adjacency matrix (#904).

## Documentation

- Remove duplicate `\seealso{}` (#948).

- Update `knnk()` and `sir()` docs.

- Fix formula in `reciprocity()` docs.

- `strength()` does not give a warning when no weights are given.

- Update `sample_smallworld()` manual page (#895).

- Correct documentation for weighted cliques.

- Update Erdos-Renyi model docs.

## Testing

- Clean up tests (#967).

- Stabilize tests for `cluster_label_prop()` (#932), `sample_pa()` (#927), `cluster_louvain()` (#933), SIR (#936), `sample_forestfire()` (#929).

- Hard-code graph used in test (#928).

- Update GML test file (#925).

- Improve test for sampling from Dirichlet distribution (#923).

- Omit test that no longer holds with igraph 0.10 (#922).

- Stabilize test in preparation for upgrade (#920).

- Stabilize plot test (#919).

- Fix checks.


# igraph 1.5.1

## Breaking changes

- Breaking change: start deprecation of `estimate_betweenness()`, `estimate_edge_betweenness()`, `estimate_closeness()` (#852).

## Bug fixes

- `identical_graphs()` now correctly detects identical graphs without node or edge attributes (#757).

## Internal

- Change ownership rules of attribute objects (#870).

- `R_SEXP_to_igraph()` and `R_SEXP_to_igraph_copy()` get `igraph_t` object from external pointer (#865).

- Remove `ETIME()` call from Fortran code, already in CRAN version 1.5.0.1 (#858).

- Ensure that `_GNU_SOURCE` is always defined (#877).

- Fix `make clean` (#860).

- Fix generation of code for functions with `VERTEX_COLOR` out-arguments (#850).

- Use `-lquadmath` in `Makevars.win`, for compatibility with alternative R distributions such as Microsoft R Open (#855).

- `getRversion()` uses strings.

## Documentation

- Add cffr file and a GHA workflow that updates it automatically (#873).

- Undeprecate `neighborhood()` (#851).

- Remove redundant reference to AUTHORS from DESCRIPTION.

## Refactoring

- Breaking change: start deprecation of `estimate_betweenness()`, `estimate_edge_betweenness()`, `estimate_closeness()` (#852).


# igraph 1.5.0

## Breaking changes

The internal format of graph objects has changed in a mostly backward-compatible way, to prepare for upgrading the C core to 0.10. Details are described at <https://github.com/igraph/rigraph/wiki/The-igraph-object-format>. Accessing graph objects that have been created with an older igraph version give a clean error message with instructions (#832). The new format cannot be read by igraph 1.4.3 or older, the following error is raised when trying to do so:

```
This graph was created by an old(er) igraph version.
  Call upgrade_graph() on it to use with the current igraph version
  For now we convert it on the fly...
Error in is_directed(object) : 
  REAL() can only be applied to a 'numeric', not a 'NULL'
```

The only supported remedy is to upgrade the igraph package to version 1.5.0 or later.

`graph_version()` now returns an integer scalar (#832, #847), `4` as of igraph 1.5.0 (#835).

## Features

- Vertex and edge sequences are converted to numeric vectors when used in attributes (#808).

- New `largest_component()` returns the largest connected component (#786, @ngmaclaren).

## Bug fixes

- Fix error message in `make_graph()` when `simplify = ...` is used with a non-formula (#834).

## Testing

- Add more tests for `graph_from_literal()` (#826).

- Reenable serialization test and tests for `dyad_census()`, stabilize tests (#809, #822, #823).

## Documentation

- The documentation for the R package is now hosted at <https://r.igraph.org/> (#780).

- Update `vignette("installation-troubleshooting")`.

- Fix use of deprecated functions in examples, e.g., replace `gsize()` by `ecount()` (#827).

- Fix typos in `?eigen_centrality` docs (@JJ).

- Update CONTRIBUTING.md and ORCID information (#791, #774).

- Add DOI to CITATION (#773).

## Internal

- Add data for old igraph versions as constructed objects, and tests (#838).

- Ensure we're always using named indexes to access the internal data structure (#784).

- Prepare migration to igraph/C 0.10 (#781).

- Update generated interface (#765).


# igraph 1.4.3

## Internal

- Fix tests for dev waldo (#779, @hadley).

- Fix linking on Windows: gfortran needs quadmath. (#778).

## Documentation

- Mention limitation of Pajek reader (#776).


# igraph 1.4.2

## Breaking changes

- Remove `igraph.eigen.default()` and `eigen_defaults`, introduce internal `eigen_defaults()` as a function (#741).

- Remove broken `nexus*()` functions (#705), and `srand()` (#701).


## C core

- Update C core.

- ARPACK-based calculations are now interruptible.

- `shortest_paths()` and `all_shortest_paths()` no longer crash when an invalid `from` vertex is passed and weights are being used.

See [diff](https://github.com/igraph/igraph/compare/87c70998344a39b44218f7af903bf62b8bbf3e71...98304787bc811bf709be5aeddea7b570c370988e) for details.


## Printing

- Use true vertex names for printing vertex sets. If a vertex set captures a relationship between vertices (e.g., the `father` component of `bfs()`), the vertex set is printed as a named vector (#754).

- Suggest restarting R session after fatal error (#745).


## Bug fixes

- `as_long_data_frame()` now correctly processes vertex attributes and works with graphs without vertex attributes (#748).

- `as.hclust(hrg.fit(g))` works again (#721).


## Documentation

- The documentation is now available at <https://igraph.org/> (#743).

- Reorganize function reference (#662).

- Replace `graph()` with `make_graph()` in examples (#738).

- Add docs for `as.hclust.igraphHRG()` (#733).

- Merged man page of `hub_score()` and `authority_score()` (#698).

- Refactor contributors listing (#647).

- Improve "family" titles (#679).

- Improve docs of ego/neighborhood functions.

- Improve `transitivity()` docs.


## Internal

- Introduce cpp11 package to improve error handling in the long run (#720).

- Avoid longjmp for error handling and interrupts (#751).

- `as.hclust.igraphHRG` uses `.Call()` interface (#727).


# igraph 1.4.1

## Bug fixes

- `console()` now works again and provides a Tcl/Tk based UI where igraph can post status messages and progress info (#664).

- Fix errors when printing long vertex names (#677, @ahmohamed).

- Fix regression that broke builds on some systems (e.g., GCC version 5 or earlier), introduced in igraph 1.4.0 (#670, #671).

- `fit_hrg()` does not crash any more when called with a graph that has less than three vertices.

## Documentation

- Various improvements (#663, @maelle; #667).

## Internal

- Fix warning about `yyget_leng()` returning wrong type when using LTO (#676).

- Don't mention C++11 or C++17 for best compatibility with both newest R and older compilers, while still requesting a C++ compiler for linking.

- Don't ignore `build/` when building the package because the vignette index is built there.

- Skip plot test entirely on R-devel.

- Avoid submodules for building igraph (#674).

- Makevars cleanup (#671).

- Add Zenodo configuration file.


# igraph 1.4.0

## Breaking changes

 - Breaking change: Allow change of attribute type when setting attribute for all vertices or edges; only attributes of length 1 or the length of the target set allowed (#633).


## Added

 - `tkplot()` gained a `palette` argument and it is now using the same palette as `plot()` by default, for sake of consistency.
 - `plot.igraph()` gained a `loop.size` argument that can be used to scale the common radius of the loop edges.

## Fixed

 - The default maximum number of iterations for ARPACK has been increased to 3000 to match that of the igraph C core.
 - Rare convergence problems have been corrected in `cluster_leading_eigen()`.
 - All ARPACK-based functions now respect random seeds set in R when generating a random starting vector.
 - `igraph_version()` returned an invalid value in 1.3.4, this is now corrected.
 - The value of `par(xpd=...)` is now restored after plotting a graph.
 - Fixed a bug in `as.dendrogram.communities()` for large dendrograms, thanks
   to @pkharchenko (see PR #292).
 - Fixed two bugs in `graph_from_incidence_matrix()` that prevented the creation of directed graphs with `mode="all"` from dense or sparse matrices.
 - `dfs()` accidentally returned zero-based root vertex indices in the result object; this is now fixed and the indices are now 1-based.
 - `as_graphnel()` does not duplicate loop edges any more.
 - `as_graphnel()` now checks that the input graph has no multi-edges. Multi-edges are not supported by the graphNEL class.
 - `convex_hull()` now returns the vertices of the convex hull with 1-based indexing.
 - Some `rgl.*()` function calls in the codebase were replaced with equivalent `*3d()` function calls in preparation for upcoming deprecations in `rgl` (see PR #619)
 - `plot.igraph()` does not use the `frame=...` partial argument any more when calling `plot.default()`. The default `NULL` value of `frame.plot` is now also handled correctly.
 - `hub_score()` and `authority_score()` considered self-loops only once on the diagonal of the adjacency matrix of undirected graphs, thus the result was not identical to that obtained by `eigen_centrality()` on loopy undirected graphs. This is now corrected.
 - `distances()` no longer ignores the `mode` parameter when `algorithm='johnson'`.

## Deprecated

 - `automorphisms()` was renamed to `count_automorphisms()`; the old name is still available, but it is deprecated.

## Other

 - Documentation improvements.
 - The Github repository was now moved to a single-branch setup where the package can be built from the `main` branch directly.
 - Added igraph extended tutorial as an R vignette (#587).
 - igraph now has a homepage based on `pkgdown` thanks to @maelle (see #645). This will eventually become the official homepage.

# igraph 1.3.5

Added:

- `mark.groups=...` argument of `plot.igraph()` now accepts `communities`
  objects

Fixed:

- Negative degree exponents are not allowed any more in `sample_pa()` and
  `sample_aging_pa()`.

- Package updated to be compatible with Matrix 1.5.

Other:

 - Documentation improvements and fixes.

# igraph 1.3.4

Added:

- `sample_asym_pref()` now returns the generated types of the vertices in the
  vertex attributes named `outtype` and `intype`.

Fixed:

- `layout_nicely()` does not recurse infinitely any more if it is assigned to
  the `layout` attribute of a graph

- `layout_nicely()` now ignores edge weights when there are non-positive
  edge weights. This is needed because igraph 1.3.3 started validating edge
  weights in `layout_with_fr()` and `layout_with_drl()`, resulting in
  errors when `layout_nicely()` was used on weighted graphs with negative
  weights. Since `layout_nicely()` is the default layout algorithm for
  `plot()`, most users were not even aware that they were using the FR or
  DrL layouts behind the scenes. Now the policy is that `layout_nicely()`
  attempts to get the job done without errors if possible, even if that means
  that edge weights must be ignored. A warning is printed if this is the case.

# igraph 1.3.3

Added:

- `reverse_edges()` reverses specific or all edges in a graph.

- Single-bracket indexing of `V()` and `E()` resolves attribute names in the
  indexing expressions by default (for instance, `E(g)[weight > x]` matches
  edges with a weight larger than a threshold). This can be problematic if the
  attribute masks one of the variables in the local evaluation context.
  We now have a pronoun called `.env` (similarly to `rlang::.env`) that
  allows you to force attribute name lookup to the calling environment. For
  sake of completeness, we also provide `.data` (similarly to `rlang::.data`)
  to force attribute name lookup to the vertex / edge attributes only. These
  pronouns are automatically injected into the environment where the indexing
  expression is evaluated.

Deprecated:

- Names of functions that can be used inside a `V()` or `E()` indexing start
  with a dot since igraph 1.1.1; however, the old dotless names did not print
  a deprecation warning so this may have gone unnoticed for years. We are
  introducting a deprecation warning for `nei()`, `innei()`, `outnei()`,
  `inc()`, `from()` and `to()` inside single-bracket indexing of vertex and
  edge sequences and will remove the old variants soon.

# igraph 1.3.2

The C core is updated to 0.9.9, fixing a range of bugs.

Fixed:

- The length of size-zero `communities` objects is now reported correctly.
- `layout_with_kk()` would fail to produce reasonable results with the default initial
  coordinates. This has been corrected, however, this function no longer produces
  precisely the same output for a given graph as before. To restore the previous
  behaviour, use `layout_with_kk(g, coord=layout_in_circle(g))` in 2D or
  `layout_with_kk(g, dim=3, coord=layout_on_sphere(g))` in 3D.
- Indexing an `igraph.vs` object with `v[x, na_ok=T]` now correctly handles the
  `na_ok` argument in all cases; previous versions ignored it when `x` was
  a single number.

Other:

 - Documentation improvements and fixes.

# igraph 1.3.1

Fixed:

- `graph_from_adjacency_matrix()` now works with sparse matrices even if the
  cell values in the sparse matrix are unspecified.
- Fixed crash in `cluster_walktrap()` when `modularity=FALSE` and `membership=FALSE`.
- `cluster_walktrap()` no longer accepts invalid weight vectors.
- `cluster_walktrap()` no longer returns a modularity vector of invalid length for
  disconnected graphs. This also fixes some rare failures of this function on
  weighted disconnected graphs.
- `edge_attr()` does not ignore its `index=...` argument any more.
- `automorphisms()`, `automorphism_group()` and `canonical_permutation()` now
  allow all possible values supported by the C core in the `sh` argument.
  Earlier versions supported only `"fm"`.
- The `vertex.frame.width` plotting parameter now allows zero and negative
  values; these will simply remove the outline of the corresponding vertex.
- The documentation of the `sh` argument of the BLISS isomorphism algorithm in
  `isomorphic()` was fixed; earlier versions incorrectly referred to `sh1` and
  `sh2`.
- `dominator_tree()` now conforms to its documentation with respect to the
  `dom` component of the result: it contains the indices of the dominator
  vertices for each vertex and `-1` for the root of the dominator tree.
- Mentions of the `"power"` algorithm of `page_rank()` have been removed from
  the documentation, as this method is no longer available.
- Several other documentation fixes to bring the docs up to date with new behaviours
  in igraph 1.3.

# igraph 1.3.0

The C core is updated to 0.9.7, fixing a range of bugs and introducing a number
of new functions.

Added:

- `has_eulerian_path()` and `has_eulerian_cycle()` decides whether there is an
  Eulerian path or cycle in the graph.
- `eulerian_path()` and `eulerian_cycle()` returns the edges and vertices in an
  Eulerian path or cycle in the graph.
- `any_loop()` checks whether a graph contains at least one loop edge.
- `is_tree()` checks whether a graph is a tree and also finds a possible root
- `to_prufer()` converts a tree graph into its Prufer sequence
- `make_from_prufer()` creates a tree graph from its Prufer sequence
- `sample_tree()` to sample labelled trees uniformly at random
- `sample_spanning_tree()` to sample spanning trees of an undirected graph
  uniformly at random
- `automorphisms()` and `canonical_permutation()` now supports vertex colors
- `random_edge_walk()` to record the edges traversed during a random walk
- `harmonic_centrality()` calculates the harmonic centrality of vertices,
  optionally with a cutoff on path lengths
- `mean_distance()` now supports edge weights and it can also return the number
  of unconnected vertex pairs when `details=TRUE` is passed as an argument
- `greedy_vertex_coloring()` finds vertex colorings based on a simple greedy
  algorithm.
- `bridges()` finds the bridges (cut-edges) of a graph
- The frame width of circle, rectangle and square vertex shapes can now be
  adjusted on plots with the `frame.width` vertex attribute or the
  `vertex.frame.width` keyword argument, thanks to @simoncarrignon .
  See PR #500 for more details.
- `automorphism_group()` returns a possible (not necessarily minimal)
  generating set of the automorphism group of a graph.
- `global_efficiency()` calculates the global efficiency of the graph.
- `local_efficiency()` calculates the local efficiency of each vertex in a graph.
- `average_local_efficiency()` calculates the average local efficiency across
  the set of vertices in a graph.
- `rewire(each_edge(...))` now supports rewiring only one endpoint of each edge.
- `realize_degseq()` generates graphs from degree sequences in a deterministic
  manner. It is also available as `make_(degseq(..., deterministic=TRUE))`.
- `clique_size_counts()` counts cliques of different sizes without storing them all.
- `feedback_arc_set()` finds a minimum-weight feedback arc set in a graph, either
  with an exact integer programming algorithm or with a linear-time approximation.
- `make_bipartite_graph()` now handles vertices with names.
- `shortest_paths()` now supports graphs with negative edge weights.
- `min_cut()` now supports s-t mincuts even if `value.only=FALSE`.
- `as.matrix()` now supports converting an igraph graph to an adjacency or edge
  list matrix representation. See `as.matrix.igraph()` for more details. This
  function was migrated from `intergraph`; thanks to Michal Bojanowski.

Fixed:

- `is_connected()` now returns FALSE for the null graph
- Calling `length()` on a graph now returns the number of vertices to make it
  consistent with indexing the graph with `[[`.
- `diameter()` now corrently returns infinity for disconnected graphs when
  `unconnected=FALSE`. Previous versions returned the number of vertices plus
  one, which was clearly invalid for weighted graphs.
- `mean_distance()` now correctly treats the path length between disconnected
  vertices as infinite when `unconnected=FALSE`. Previous versions used the
  number of vertices plus one, adding a bias towards this number, even if the
  graph was weighted and the number of vertices plus one was not a path length
  that could safely have been considered as being longer than any "valid" path.
- `layout_with_sugiyama()` now handles the case of exactly one extra virtual
  node correctly; fixes #85
- `bfs()` and `dfs()` callback functions now correctly receive 1-based vertex
  indices and ranks; it used to be zero-based in earlier versions
- Accidentally returning a non-logical value from a `bfs()` or `dfs()` callback
  does not crash R any more
- Calling `print()` on a graph with a small `max.lines` value (smaller than the
  number of lines needed to print the attribute list and the header) does not
  raise an error any more; fixes #179
- `as_adjacency_matrix(edges=TRUE, sparse=TRUE)` now consistently returns the
  last edge ID for each cell in the matrix instead of summing them.
- Using the `+` and `-` operators with a `path()` object consisting of two
  vertices is now handled correctly; fixes #355
- `topo_sort()` now throws an error if the input graph is not acyclic instead
  of returning an incorrect partial ordering.
- Weighted transitivity calculations (i.e. `transitivity(mode="barrat")` now
  throw an error for multigraphs; the implementation does not work correctly
  for multigraphs and earlier versions did not warn about this.

Changed:

- The `neimode` argument of `bfs()` and `dfs()` was renamed to `mode` for sake
  of consistency with other functions. The old argument name is deprecated and
  will be removed in 1.4.0.
- `bfs()` and `dfs()` callback functions now correctly receive 1-based vertex
  indices and ranks; it used to be zero-based in earlier versions. (This is
  actually a bugfix so it's also mentioned in the "Fixed" section).
- `closeness()`, `betweenness()` and `edge_betweenness()` now all take a
  `cutoff` argument on their own. `estimate_closeness()`, `estimate_betweenness()`
  and `estimate_edge_betweenness()` became aliases, with identical signature.
  They are _not_ deprecated but their implementation might change in future
  versions to provide proper estimation schemes instead of a simple cutoff-based
  approximation. If you explicitly need cutoffs and you want your results to be
  reproducible with future versions, use `closeness()`, `betweenness()` and
  `edge_betweenness()` in your code with a `cutoff` argument.
- `closeness()` now only considers _reachable_ vertices during the calculation;
  in other words, closeness centrality is now calculated on a per-component
  basis for disconnected graphs. Earlier versions considered _all_ vertices.

Deprecated:

- Using `cutoff=0` for `closeness()`, `betweenness()` and `edge_betweenness()`
  is deprecated; if you want exact scores, use a negative cutoff. `cutoff=0`
  will be interpreted literally from igraph 1.4.0.
- `centr_degree_tmax()` now prints a warning when it is invoked without an
  explicit `loops` argument. `loops` will be mandatory from igraph 1.4.0.
- The `nexus_list()`, `nexus_info()`, `nexus_get()` and `nexus_search()`
  functions now return an error informing the user that the Nexus graph
  repository has been taken offline (actually, several years ago). These
  functions will be removed in 1.4.0.
- The `edges` argument of `as_adjacency_matrix()` is deprecated; it will be
  removed in igraph 1.4.0.

Removed:

- The deprecated `page_rank_old()` function and the deprecated `power` method of
  `page_rank()` were removed.

# igraph 1.2.11

Dec 27, 2021

No user visible changes.

# igraph 1.2.10

Dec 14, 2021

Fixed:

- The macOS versions of `igraph` were accidentally built without GraphML
  support on CRAN; this should now be fixed.

# igraph 1.2.9

Nov 22, 2021

No user visible changes.

# igraph 1.2.8

Oct 26, 2021

No user visible changes.

# igraph 1.2.7

Oct 15, 2021

The C core is updated to 0.8.5, fixing a range of bugs and introducing a number of new functions.

Added:

- cluster_leiden added (#399).
- cluster_fluid_communities added (#454)

Fixed:

- `make_lattice()` correctly rounds `length` to the nearest integer while
  printing a warning (#115).
- `make_empty_graph(NULL)` now prints an error instead of producing an
  invalid graph (#404).
- `make_graph(c())` now produces an empty graph instead of printing a
  misleading error message (#431).
- Printing a graph where some edges have NA as the names of both endpoints
  does not produce a misleading error message any more (#410).
- The `types` argument of functions related to bipartite graphs now prints
  a warning when the types are coerced to booleans (#476).
- Betweenness normalisation no longer overflows (#442).
- `layout_with_sugiyama()` returns a layout of type matrix even if there is
  only one vertex in the graph (#408).
- Plotting a null graph (i.e. a graph with no vertices) does not throw an error
  any more (#387).

Deprecated:

- The `membership` argument of `modularity.matrix()` is now deprecated as the
  function never needed it anyway.
- `modularity()` now prints a warning when it is applied on a directed graph
  because the implementation in igraph's C core does not support directed
  graphs as of version 0.8.5. The warning will be turned into an error in
  the next minor (1.3.0) version of the R interface; the error will be removed
  later when the C core is updated to a version that supports modularity for
  directed networks.
- `transitivity()` now prints a warning when its local variant (`type="local"`)
  is called on a directed graph or a graph with multiple edges beecause the
  implementation in the C core of igraph does not work reliably in these cases
  as of version 0.8.5. The warning will be turned into an error in the next
  minor (1.3.0) version of the R interface; the error will be removed later
  when the C core is updated to a version that supports transitivity for
  networks with multiple edges.

Misc:

- Documentation improvements.

# igraph 1.2.6

Oct 5, 2020

No user visible changes.

# igraph 1.2.5

Mar 27, 2020

No user visible changes.

# igraph 1.2.4

Feb 13, 2019

No user visible changes.

# igraph 1.2.3

Jan 27, 2019

No user visible changes.

# igraph 1.2.2

Jul  27, 2018

No user visible changes.

# igraph 1.2.1

- The GLPK library is optional, if it is not available, then the
  `cluster_optimal()` function does not work. Unfortunately we cannot
  bundle the GLPK library into igraph on CRAN any more, because CRAN
  maintainers forbid the pragmas in its source code.
- Removed the NMF package dependency, and related functions.
- Fix compilation without libxml2

# igraph 1.1.2

Jul 20, 2017

- Fix compilation on Solaris


# igraph 1.1.1

Jul 13, 2017

- Graph id is printed in the header, and a `graph_id` function was added
- Fix `edge_attr` for some index values
- Fix a `bfs()` bug, `restricted` argument was zero-based
- `match_vertices` is exported now
- `%>%` is re-exported in a better way, to avoid interference with other
  packages
- `ego_` functions default to `order = 1` now
- New function `igraph_with_opt` to run code with temporary igraph
  options settings
- Fix broken `sample_asym_pref` function
- Fix `curve_multiple` to avoid warnings for graphs with self-loops.
- The `NMF` package is only suggested now, it is not a hard
  dependency
- Fix gen_uid.c _SVID_SOURCE issues
- Avoid drawing straight lines as Bezier curves
- Use the `pkgconfig` package for options. This allows setting options
  on a per-package basis. E.g. a package using igraph can set `return.vs.es`
  to `FALSE` in its `.onLoad()` function, and then igraph will return
  plain numeric vectors instead of vertex/edge sequences
  *if called from this package*.
- `igraph_options()` returns the *old* values of the updated options,
  this is actually useful, returning the new values was not.
- `with_igraph_opt()` function to temporarily change values of
  igraph options.
- `get.edge()` is deprecated, use `ends()` instead. (This was already the case
  for igraph 1.0.0, but we forgot to add a NEWS point for it.)
- Do not redefine `.Call()`, to make native calls faster.
- Speed up special cases of indexing vertex sequences.
- Removed an `anyNA()` call, to be compatible with older R versions.
- Fixed a fast-greedy community finding bug,
  https://github.com/igraph/igraph/issues/836
- Fixed `head_of()` and `tail_of()`, they were mixed up.
- Plot: make `label.dist` independent of label lengths, fixes #63.
- Plot: no error for unknown graphical parameters.
- Import functions from base packages, to eliminate
  `R CMD check` `NOTE`s.
- Re-add support for edge weights in Fruchterman-Reingold layout
- Check membership vector in `modularity()`.
- Rename `str.igraph()` to `print_all()`.
- Use the igraph version in exported graphs, instead of @VERSION@ #75.
- Functions that can be used inside a `V()` or `E()` indexing
  now begin with a dot. Old names are deprecated.
  New names: `.nei()`, `.innei()`, `.outnei()`, `.inc()`, `.from()`,
  `.to()`. #22
- Fix packages that convert graphs to graph::graphNEL: they
  don't need to attach 'graph' manually any more.
- Fix a bugs in `layout_with_dh`, `layout_with_gem` and
  `layout_with_sugiyama`. They crashed in some cases.

# igraph 1.0.1

June 26, 2015

Some minor updates:

- Documentation fixes.
- Do not require a C++-11 compiler any more.
- Fedora, Solaris and Windows compilation fixes.

# igraph 1.0.0

June 21, 2015

## Release notes

This is a new major version of igraph, and then why not call
it 1.0.0. This does not mean that it is ready, it'll never be
ready.

The biggest changes in the release are
- the new function names. Most functions were renamed to
  make them more consistent and readable. (Relax, old names
  can still be used, no need to update any code.)
- Better operations for vertex and edge sequences. Most functions
  return proper vertex/edge sequences instead of numeric ids.
- The versatile `make_()` and `make_graph()` functions to
  create graphs.

## Major changes

- Many functions were renamed. Old names are not documented,
  but can still be used.
- A generic `make_graph()` function to create graphs.
- A generic `layout_()` (not the underscore!) function
  to create graph layouts, see also `add_layout_()`.
- The igraph data type has changed. You need to call
  `upgrade_graph()` on graphs created with previous igraph
  versions.
- Vertex and edge sequence operations: union, intersection, etc.
- Vertex and edge sequences can only be used with the graphs they
  belong to. This is now strictly checked.
- Most functions that return a (sub)set of vertices
  or edges return vertex or edge sequences instead.
- Vertex and edge sequences have a `[[` operator now,
  for easy viewing of vertex/edge metadata.
- Vertex and edge sequences are implemented as weak references.
  See also the `as_ids()` function to convert them to simple ids.
- Vertex order can be specified for the circle layout now.
- Davidson-Harel layout algorithm `layout_with_dh()`.
- GEM layout algorithm `layout_with_gem()`.
- Neighborhood functions have a `mindist` parameter for the
  smallest distance to consider.
- `all_simple_paths()` function to list all simple paths in a graph.
- `triangles()` lists all triangles in a graph.
- Fruchterman-Reingold and Kamada-Kawai layout algorithms
  rewritten from scratch. They are much faster and follow the
  original publications closely.
- Nicer printing of graphs, vertex and edge sequences.
- `local_scan()` function calculates scan statistics.
- Embeddings: `embed_adjacency_matrix()` and `embed_laplacian_matrix()`.
- Product operator: `*`, the same graph multiple times. Can be also
  used as `rep()`.
- Better default colors, color palettes for vertices.
- Random walk on a graph: `random_walk()`
- `adjacent_vertices()` and `incident_edges()` functions,
  they are vectorized, as opposed to `neighhors()` and `incident()`.
- Convert a graph to a _long_ data frame with `as_long_data_frame()`.

## Bug fixes

Too many to list. Please try if your issue was fixed and (re-)report
it if not. Thanks!

# igraph 0.7.1

April 21, 2014

## Release Notes

Some bug fixes, to make sure that the code included in
'Statistical Analysis of Network Data with R' works. See
https://github.com/kolaczyk/sand

## Detailed changes:

- Graph drawing: fix labels of curved edges, issue #181.
- Graph drawing: allow fixing edge labels at given positions,
  issue #181.
- Drop the 'type' vertex attribute after bipartite projection,
  the projections are not bipartite any more, issue #255.
- Print logical attributes in header properly (i.e. encoded by `l`,
  not `x`,  which is for complex attributes. Issue #578.
- Add a constructor for `communities` objects, see `create.communities()`.
  Issue #547.
- Better error handling in the GraphML parser.
- GraphML reader is a bit more lenient now; makes it possible to read
  GraphML files saved from yWorks apps.
- Fixed a bug in `constaint()`, issue #580.
- Bipartite projection now detects invalid edges instead of giving
  a cryptic error, issue #543.
- Fixed the `simplify` argument of `graph.formula()`, which was
  broken, issue #586.
- The function `crossing()` adds better names to the result,
  fixes issue #587.
- The `sir()` function gives an error if the input graph is
  not simple, fixes issue #582.
- Calling igraph functions from igraph callbacks is not allowed now,
  fixes issue #571.

# igraph 0.7.0

February 4, 2014

## Release Notes

There are a bunch of new features in the library itself, and
other important changes in the life of the project. Thanks everyone
for sending code and reporting bugs!

### igraph @ github

igraph's development has moved from Launchpad to github.
This has actually happened several month ago, but never
announced officially. The place for reporting bugs is
at https://github.com/igraph/igraph/issues.

### New homepage

igraph's homepage is now hosted at http://igraph.org, and it is
brand new. We wanted to make it easier to use and modern.

### Better nightly downloads

You can download nightly builds from igraph at
http://igraph.org/nightly. Source and binary R packages (for windows
and OSX), are all built.

## New features and bug fixes

- Added a demo for hierarchical random graphs, invoke it via
  `demo(hrg)`.
- Make attribute prefixes optional when writing a GraphML file.
- Added function `mod.matrix()`.
- Support edge weights in leading eigenvector community detection.
- Added the LAD library for checking (sub)graph isomorphism, version 1.
- Logical attributes.
- Added `layout.bipartite()` function, a simple two-column layout
  for bipartite graphs.
- Support incidence matrices in bipartite Pajek files.
- Pajek files in matrix format are now directed by default, unless they
  are bipartite.
- Support weighted (and signed) networks in Pajek when file is in
  matrix format.
- Fixed a bug in `barabasi.game()`, algorithm psumtree-multiple
  just froze.
- Function `layout.mds()` by default returns a layout matrix now.
- Added support for Boolean attributes in the GraphML and GML readers
  and writer.
- Change MDS layout coordinates, first dim is according to first
  eigenvalue, etc.
- `plot.communities()` (`plot.igraph()`, really) draws a border
  around the marked groups by default.
- printing graphs now converts the `name` graph attribute to character
- Convenience functions to query and set all attributes at once:
  `vertex.attriubutes()`, `graph.attributes()` and `edge.attributes()`.
- Function `graph.disjoint.union()` handles attributes now.
- Rewrite `graph.union()` to handle attributes properly.
- `rewire()`: now supports the generation and destruction of loops.
- Erdos-Renyi type bipartite random graphs: `bipartite.random.game()`.
- Support the new options (predecessors and inbound_edges) of
  `get_shortest_paths()`, reorganized the output of
  `get.shortest.paths()` completely.
- Added `graphlets()` and related functions.
- Fix modularity values of multilevel community if there are no merges
  at all.
- Fixed bug when deleting edges with FALSE in the matrix notation.
- Fix `bonpow()` and `alpha.centrality()` and make sure that the
  sparse solver is called.
- `tkplot()` news: enable setting coordinates from the command line
  via `tkplot.setcoords()` and access to the canvas via
  `tkplot.canvas()`.
- Fixed a potential crash in `igraph_edge_connectivity()`, because of an
  un-initialized variable in the C code.
- Avoiding overflow in `closeness()` and related functions.
- Check for NAs after converting 'type' to logical in
  `bipartite.projection()`.
- `graphNEL` conversion functions only load the 'graph' package if it was
  not loaded before and they load it at the end of the search path,
  to minimize conflicts.
- Fixed a bug when creating graphs from adjacency matrices, we now convert
  them to double, in case they are integers.
- Fixed an invalid memory read (and a potential crash) in the infomap
  community detection.
- Fixed a memory leak in the functions with attribute combinations.
- Removed some memory leaks from the SCG functions.
- Fixed some memory leaks in the ray tracer.
- Fixed memory leak in `graph.bfs()` and `graph.dfs()`.
- Fix a bug in triad census that set the first element of the result
  to NaN.
- Fixed a crash in `is.chordal()`.
- Fixed a bug in weighted modularity calculation, sum of the weights
  was truncated to an integer.
- Fixed a bug in weighted multilevel communtiies, the maximum weight
  was rounded to an integer.
- Fixed a bug in `centralization.closeness.tmax()`.
- Reimplement push-relabel maximum flow with gap heuristics.
- Maximum flow functions now return some statistics about the push
  relabel algorithm steps.
- Function `arpack()` now gives error message if unknown options are
  given.
- Fixed missing whitespace in Pajek writer when the ID attribute was
  numeric.
- Fixed a bug that caused the GML reader to crash when the ID
  attribute was non-numeric.
- Fixed issue #500, potential segfault if the two graphs in BLISS
  differ in the number of vertices or edges.
- Added `igraphtest()` function.
- Fix dyad census instability, sometimes incorrect results were
  reported.
- Dyad census detects integer overflow now and gives a warning.
- Function `add.edges()` does not allow now zeros in the vertex set.
- Added a function to count the number of adjacent triangles:
  `adjacent.triangles()`.
- Added `graph.eigen()` function, eigenproblems on adjacency matrices.
- Added some workarounds for functions that create a lot of
  graphs, `decompose.graph()` and `graph.neighborhood()` use it.
  Fixes issue #508.
- Added weights support for `optimal.community()`, closes #511.
- Faster maximal clique finding.
- Added a function to count maximum cliques.
- Set operations: union, intersection, disjoint, union, difference,
  compose now work based on vertex names (if they are present) and
  keep attributes, closes #20.
- Removed functions `graph.intersection.by.name()`,
  `graph.union.by.name()`, `graph.difference.by.name()`.
- The `+` operator on graphs now calls `graph.union()` if both
  argument graphs are named, and calls `graph.disjoint.union()`
  otherwise.
- Added function `igraph.version()`.
- Generate graphs from a stochastic block model: `sbm.game()`.
- Do not suggest the stats, XML, jpeg and png packages any more.
- Fixed a `set.vertex/edge.attribute` bug that changed both
  graph objects, after copying (#533)
- Fixed a bug in `barabasi.game` that caused crashes.
- We use PRPACK to calculate PageRank scores
  see https://github.com/dgleich/prpack
- Added`'which` argument to `bipartite.projection` (#307).
- Add `normalized` argument to closeness functions, fixes issue #3.
- R: better handling of complex attributes, `[[` on vertex/edge sets,
  fixes #231.
- Implement the `start` argument in `hrg.fit` (#225).
- Set root vertex in Reingold-Tilford layout, solves #473.
- Fix betweenness normalization for directed graphs.
- Fixed a bug in `graph.density` that resulted in incorrect values for
  undirected graphs with loops
- Fixed a bug when many graphs were created in one C call
  (e.g. by `graph.decompose`), causing #550.
- Fixed sparse `graph.adjacency` bugs for graphs with one edge,
  and graphs with zero edges.
- Fixed a bug that made Bellman-Ford shortest paths calculations fail.
- Fixed a `graph.adjacency` bug for undirected, weighted graphs and
  sparse matrices.
- `main`, `sub`, `xlab` and `ylab` are proper graphics parameters
  now (#555).
- `graph.data.frame` coerces arguments to data frame (#557).
- Fixed a minimum cut bug for weighted undirected graphs (#564).
- Functions for simulating epidemics (SIR model) on networks,
  see the `sir` function.
- Fixed argument ordering in `graph.mincut` and related functions.
- Avoid copying attributes in query functions and print (#573),
  these functions are much faster now for graphs with many
  vertices/edges and attributes.
- Speed up writing GML and GraphML files, if some attributes are
  integer. It was really-really slow.
- Fix multiple root vertices in `graph.bfs` (#575).

# igraph 0.6.6

Released Oct 28, 2013

Some bugs fixed:

- Fixed a potential crash in the infomap.community() function.
- Various fixed for the operators that work on vertex names (#136).
- Fixed an example in the arpack() manual page.
- arpack() now gives error message if unknown options
  are supplied (#492).
- Better arpack() error messages.
- Fixed missing whitespace in Pajek writer when ID attribute
  was numeric.
- Fixed dyad census instability, sometimes incorrect
  results were reported (#496).
- Fixed a bug that caused the GML reader to crash when the ID
  attribute was non-numeric
- Fixed a potential segfault if the two graphs in BLISS
  differ in the number of vertices or edges (#500).
- Added the igraphtest() function to run tests from R (#485).
- Dyad census detects integer overflow now and gives a warning (#497).
- R: add.edges() does not allow now zeros in the vertex set (#503).
- Add C++ namespace to the files that didn't have one.
  Fixes some incompatibility with other packages (e.g. rgl)
  and mysterious crashes (#523).
- Fixed a bug that caused a side effect in set.vertex.attributes(),
  set.edge.attributes() and set.graph.attributes() (#533).
- Fixed a bug in degree.distribution() and cluster.distribution()
  (#257).

# igraph 0.6.5-2

Released May 16, 2013

Worked two CRAN check problems, and a gfortran bug (string bound
checking does not work if code is called from C and without string
length arguments at the "right" place).

Otherwise identical to 0.6.5-1.

# igraph 0.6.5-1

Released February 27, 2013

Fixing an annoying bug, that broke two other packages on CRAN:

- Setting graph attributes failed sometimes, if the attributes were
  lists or other complex objects.

# igraph 0.6.5

Released February 24, 2013

This is a minor release, to fix some very annoying bugs in 0.6.4:

- igraph should now work well with older R versions.
- Eliminate gap between vertex and edge when plotting an edge without an arrow.
  Fixes #1118448.
- Fixed an out-of-bounds array indexing error in the DrL layout, that
  potentially caused crashes.
- Fixed a crash in weighted betweenness calculation.
- Plotting: fixed a bug that caused misplaced arrows at rectangle
  vertex shapes.

# igraph 0.6.4

Released February 2, 2013

The version number is not a mistake, we jump to 0.6.4 from 0.6,
for technical reasons. This version was actually never really
released, but some R packages of this version were uploaded to
CRAN, so we include this version in this NEW file.

## New features and bug fixes

- Added a vertex shape API for defining new vertex shapes, and also
  a couple of new vertex shapes.
- Added the get.data.frame() function, opposite of graph.data.frame().
- Added bipartite support to the Pajek reader and writer, closes bug
  #1042298.
- degree.sequence.game() has a new method now: "simple_no_multiple".
- Added the is.degree.sequence() and is.graphical.degree.sequence()
  functions.
- rewire() has a new method: "loops", that can create loop edges.
- Walktrap community detection now handles isolates.
- layout.mds() returns a layout matrix now.
- layout.mds() uses LAPACK instead of ARPACK.
- Handle the '~' character in write.graph and read.graph. Bug
  #1066986.
- Added k.regular.game().
- Use vertex names to plot if no labels are specified in the function
  call or as vertex attributes. Fixes issue #1085431.
- power.law.fit() can now use a C implementation.

- Fixed a bug in barabasi.game() when out.seq was an empty vector.
- Fixed a bug that made functions with a progress bar fail if called
  from another package.
- Fixed a bug when creating graphs from a weighted integer adjacency
  matrix via graph.adjacency(). Bug #1019624.
- Fixed overflow issues in centralization calculations.
- Fixed a minimal.st.separators() bug, some vertex sets were incorrectly
  reported as separators. Bug #1033045.
- Fixed a bug that mishandled vertex colors in VF2 isomorphism
  functions. Bug #1032819.
- Pajek exporter now always quotes strings, thanks to Elena Tea Russo.
- Fixed a bug with handling small edge weights in shortest paths
  calculation in shortest.paths() (Dijkstra's algorithm.) Thanks to
  Martin J Reed.
- Weighted transitivity uses V(graph) as 'vids' if it is NULL.
- Fixed a bug when 'pie' vertices were drawn together with other
  vertex shapes.
- Speed up printing graphs.
- Speed up attribute queries and other basic operations, by avoiding
  copying of the graph. Bug #1043616.
- Fixed a bug in the NCV setting for ARPACK functions. It cannot be
  bigger than the matrix size.
- layout.merge()'s DLA mode has better defaults now.
- Fixed a bug in layout.mds() that resulted vertices on top of each
  other.
- Fixed a bug in layout.spring(), it was not working properly.
- Fixed layout.svd(), which was completely defunct.
- Fixed a bug in layout.graphopt() that caused warnings and on
  some platforms crashes.
- Fixed community.to.membership(). Bug #1022850.
- Fixed a graph.incidence() crash if it was called with a non-matrix
  argument.
- Fixed a get.shortest.paths bug, when output was set to "both".
- Motif finding functions return NA for isomorphism classes that are
  not motifs (i.e. not connected). Fixes bug #1050859.
- Fixed get.adjacency() when attr is given, and the attribute has some
  complex type. Bug #1025799.
- Fixed attribute name in graph.adjacency() for dense matrices. Bug
  #1066952.
- Fixed erratic behavior of alpha.centrality().
- Fixed igraph indexing, when attr is given. Bug #1073705.
- Fixed a bug when calculating the largest cliques of a directed
  graph. Bug #1073800.
- Fixed a bug in the maximal clique search, closes #1074402.
- Warn for negative weights when calculating PageRank.
- Fixed dense, unweighted graph.adjacency when diag=FALSE. Closes
  issue #1077425.
- Fixed a bug in eccentricity() and radius(), the results were often
  simply wrong.
- Fixed a bug in get.all.shortest.paths() when some edges had zero weight.
- graph.data.frame() is more careful when vertex names are numbers, to
  avoid their scientific notation. Fixes issue #1082221.
- Better check for NAs in vertex names. Fixes issue #1087215
- Fixed a potential crash in the DrL layout generator.
- Fixed a bug in the Reingold-Tilford layout when the graph is
  directed and mode != ALL.

# igraph 0.6

Released June 11, 2012

See also the release notes at
http://igraph.sf.net/relnotes-0.6.html

## R: Major new features

- Vertices and edges are numbered from 1 instead of 0.
  Note that this makes most of the old R igraph code incompatible
  with igraph 0.6. If you want to use your old code, please use
  the igraph0 package. See more at http://igraph.sf.net/relnotes-0.6.html.
- The '[' and '[[' operators can now be used on igraph graphs,
  for '[' the graph behaves as an adjacency matrix, for '[[' is
  is treated as an adjacency list. It is also much simpler to
  manipulate the graph structure, i.e. add/remove edges and vertices,
  with some new operators. See more at ?graph.structure.
- In all functions that take a vector or list of vertices or edges,
  vertex/edge names can be given instead of the numeric ids.
- New package 'igraphdata', contains a number of data sets that can
  be used directly in igraph.
- Igraph now supports loading graphs from the Nexus online data
  repository, see nexus.get(), nexus.info(), nexus.list() and
  nexus.search().
- All the community structure finding algorithm return a 'communities'
  object now, which has a bunch of useful operations, see
  ?communities for details.
- Vertex and edge attributes are handled much better now. They
  are kept whenever possible, and can be combined via a flexible API.
  See ?attribute.combination.
- R now prints igraph graphs to the screen in a more structured and
  informative way. The output of summary() was also updated
  accordingly.

## R: Other new features

- It is possible to mark vertex groups on plots, via
  shading. Communities and cohesive blocks are plotted using this by
  default.
- Some igraph demos are now available, see a list via
  'demo(package="igraph")'.
- igraph now tries to select the optimal layout algorithm, when
  plotting a graph.
- Added a simple console, using Tcl/Tk. It contains a text area
  for status messages and also a status bar. See igraph.console().
- Reimplemented igraph options support, see igraph.options() and
  getIgraphOpt().
- Igraph functions can now print status messages.

## R: New or updated functions

### Community detection

- The multi-level modularity optimization community structure detection
  algorithm by Blondel et al. was added, see multilevel.community().
- Distance between two community structures: compare.communities().
- Community structure via exact modularity optimization,
  optimal.community().
- Hierarchical random graphs and community finding, porting the code
  from Aaron Clauset. See hrg.game(), hrg.fit(), etc.
- Added the InfoMAP community finding method, thanks to Emmanuel
  Navarro for the code. See infomap.community().

### Shortest paths

- Eccentricity (eccentricity()), and radius (radius()) calculations.
- Shortest path calculations with get.shortest.paths() can now
  return the edges along the shortest paths.
- get.all.shortest.paths() now supports edge weights.

### Centrality

- Centralization scores for degree, closeness, betweenness and
  eigenvector centrality. See centralization.scores().
- Personalized Page-Rank scores, see page.rank().
- Subgraph centrality, subgraph.centrality().
- Authority (authority.score()) and hub (hub.score()) scores support
  edge weights now.
- Support edge weights in betweenness and closeness calculations.
- bonpow(), Bonacich's power centrality and alpha.centrality(),
  Alpha centrality calculations now use sparse matrices by default.
- Eigenvector centrality calculation, evcent() now works for
  directed graphs.
- Betweenness calculation can now use arbitrarily large integers,
  this is required for some lattice-like graphs to avoid overflow.

### Input/output and file formats

- Support the DL file format in graph.read(). See
  http://www.analytictech.com/networks/dataentry.htm.
- Support writing the LEDA file format in write.graph().

### Plotting and layouts

- Star layout: layout.star().
- Layout based on multidimensional scaling, layout.mds().
- New layouts layout.grid() and layout.grid.3d().
- Sugiyama layout algorithm for layered directed acyclic graphs,
  layout.sugiyama().

### Graph generators

- New graph generators: static.fitness.game(), static.power.law.game().
- barabasi.game() was rewritten and it supports three algorithms now,
  the default algorithm does not generate multiple or loop edges.
  The graph generation process can now start from a supplied graph.
- The Watts-Strogatz graph generator, igraph_watts_strogatz() can
  now create graphs without loop edges.

### Others

- Added the Spectral Coarse Graining algorithm, see scg().
- The cohesive.blocks() function was rewritten in C, it is much faster
  now. It has a nicer API, too. See demo("cohesive").
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
  graph.difference.by.name(). Thanks to Magnus Torfason for
  contributing his code!
- Function to calculate a non-induced subgraph: subgraph.edges().
- More comprehensive maximum flow and minimum cut calculation,
  see functions graph.maxflow(), graph.mincut(), stCuts(), stMincuts().
- Check whether a directed graph is a DAG, is.dag().
- has.multiple() to decide whether a graph has multiple edges.
- Added a function to calculate a diversity score for the vertices,
  graph.diversity().
- Graph Laplacian calculation (graph.laplacian()) supports edge
  weights now.
- Biconnected component calculation, biconnected.components()
  now returns the components themselves.
- bipartite.projection() calculates multiplicity of edges.
- Maximum cardinality search: maximum.cardinality.search() and
  chordality test: is.chordal()
- Convex hull computation, convex.hull().
- Contract vertices, contract.vertices().

# igraph 0.5.3

Released November 22, 2009

## Bugs corrected in the R interface

- Some small changes to make 'R CMD check' clean
- Fixed a bug in graph.incidence, the 'directed' and 'mode' arguments
  were not handled correctly
- Betweenness and edge betweenness functions work for graphs with
  many shortest paths now (up to the limit of long long int)
- When compiling the package, the configure script fails if there is
  no C compiler available
- igraph.from.graphNEL creates the right number of loop edges now
- Fixed a bug in bipartite.projection() that caused occasional crashes
  on some systems

# igraph 0.5.2

Released April 10, 2009

See also the release notes at
http://igraph.sf.net/relnotes-0.5.2.html

## New in the R interface

- Added progress bar support to beweenness() and
  betweenness.estimate(), layout.drl()
- Speeded up betweenness estimation
- Speeded up are.connected()
- Johnson's shortest paths algorithm added
- shortest.paths() has now an 'algorithm' argument to choose from the
  various implementations manually
- Always quote symbolic vertex names when printing graphs or edges
- Average nearest neighbor degree calculation, graph.knn()
- Weighted degree (also called strength) calculation, graph.strength()
- Some new functions to support bipartite graphs: graph.bipartite(),
  is.bipartite(), get.incidence(), graph.incidence(),
  bipartite.projection(), bipartite.projection.size()
- Support for plotting curved edges with plot.igraph() and tkplot()
- Added support for weighted graphs in alpha.centrality()
- Added the label propagation community detection algorithm by
  Raghavan et al., label.propagation.community()
- cohesive.blocks() now has a 'cutsetHeuristic' argument to choose
  between two cutset algorithms
- Added a function to "unfold" a tree, unfold.tree()
- New tkplot() arguments to change the drawing area
- Added a minimal GUI, invoke it with tkigraph()
- The DrL layout generator, layout.drl() has a three dimensional mode
  now.

## Bugs corrected in the R interface

- Fixed a bug in VF2 graph isomorphism functions
- Fixed a bug when a sparse adjacency matrix was requested in
  get.adjacency() and the graph was named
- VL graph generator in degree.sequence.game() checks now that
  the sum of the degrees is even
- Many fixes for supporting various compilers, e.g. GCC 4.4 and Sun's
  C compiler
- Fixed memory leaks in graph.automorphisms(), Bellman-Ford
  shortest.paths(), independent.vertex.sets()
- Fix a bug when a graph was imported from LGL and exported to NCOL
  format (#289596)
- cohesive.blocks() creates its temporary file in the session
  temporary directory
- write.graph() and read.graph() now give error messages when unknown
  arguments are given
- The GraphML reader checks the name of the attributes to avoid adding
  a duplicate 'id' attribute
- It is possible to change the 'ncv' ARPACK parameter for
  leading.eigenvector.community()
- Fixed a bug in path.length.hist(), 'unconnected' was wrong
  for unconnected and undirected graphs
- Better handling of attribute assingment via iterators, this is now
  also clarified in the manual
- Better error messages for unknown vertex shapes
- Make R package unload cleanly if unloadNamespace() is used
- Fixed a bug in plotting square shaped vertices (#325244)
- Fixed a bug in graph.adjacency() when the matrix is a sparse matrix
  of class "dgTMatrix"

# igraph 0.5.1

Released July 14, 2008

See also the release notes at
http://igraph.sf.net/relnotes-0.5.1.html

## New in the R interface

- A new layout generator called DrL.
- Uniform sampling of random connected undirected graphs with a
  given degree sequence.
- Edge labels are plotted at 1/3 of the edge, this is better if
  the graph has mutual edges.
- Initial and experimental vertex shape support in 'plot'.
- New function, 'graph.adjlist' creates igraph graphs from
  adjacency lists.
- Conversion to/from graphNEL graphs, from the 'graph' R package.
- Fastgreedy community detection can utilize edge weights now, this
  was missing from the R interface.
- The 'arrow.width' graphical parameter was added.
- graph.data.frame has a new argument 'vertices'.
- graph.adjacency and get.adjacency support sparse matrices,
  the 'Matrix' package is required to use this functionality.
- graph.adjacency adds column/row names as 'name' attribute.
- Weighted shortest paths using Dijkstra's or the Belmann-Ford
  algorithm.
- Shortest path functions return 'Inf' for unreachable vertices.
- New function 'is.mutual' to find mutual edges in a directed graph.
- Added inverse log-weighted similarity measure (a.k.a. Adamic/Adar
  similarity).
- preference.game and asymmetric.preference.game were
  rewritten, they are O(|V|+|E|) now, instead of O(|V|^2).
- Edge weight support in function 'get.shortest.paths', it uses
  Dijkstra's algorithm.

## Bugs corrected in the R interface

- A bug was corrected in write.pajek.bgraph.
- Several bugs were corrected in graph.adjacency.
- Pajek reader bug corrected, used to segfault if '*Vertices'
  was missing.
- Directedness is handled correctly when writing GML files.
  (But note that 'correct' conflicts the standard here.)
- Corrected a bug when calculating weighted, directed PageRank on an
  undirected graph. (Which does not make sense anyway.)
- Several bugs were fixed in the Reingold-Tilford layout to avoid
  edge crossings.
- A bug was fixed in the GraphML reader, when the value of a graph
  attribute was not specified.
- Fixed a bug in the graph isomorphism routine for small (3-4 vertices)
  graphs.
- Corrected the random sampling implementation (igraph_random_sample),
  now it always generates unique numbers. This affects the
  Gnm Erdos-Renyi generator, it always generates simple graphs now.
- The basic igraph constructor (igraph_empty_attrs, all functions
  are expected to call this internally) now checks whether the number
  of vertices is finite.
- The LGL, NCOL and Pajek graph readers handle errors properly now.
- The non-symmetric ARPACK solver returns results in a consistent form
  now.
- The fast greedy community detection routine now checks that the graph
  is simple.
- The LGL and NCOL parsers were corrected to work with all
  kinds of end-of-line encodings.
- Hub & authority score calculations initialize ARPACK parameters now.
- Fixed a bug in the Walktrap community detection routine, when applied
  to unconnected graphs.
- Several small memory leaks were removed, and a big one from the Spinglass
  community structure detection function

# igraph 0.5

Released February 14, 2008

See also the release notes at http://igraph.sf.net/relnotes-0.5.html

## New in the R interface

- The 'rescale', 'asp' and 'frame' graphical parameters were added
- Create graphs from a formula notation (graph.formula)
- Handle graph attributes properly
- Calculate the actual minimum cut for undirected graphs
- Adjacency lists, get.adjlist and get.adjedgelist added
- Eigenvector centrality computation is much faster now
- Proper R warnings, instead of writing the warning to the terminal
- R checks graphical parameters now, the unknown ones are not just
  ignored, but an error message is given
- plot.igraph has an 'add' argument now to compose plots with multiple
  graphs
- plot.igraph supports the 'main' and 'sub' arguments
- layout.norm is public now, it can normalize a layout
- It is possible to supply startup positions to layout generators
- Always free memory when CTRL+C/ESC is pressed, in all operating
  systems
- plot.igraph can plot square vertices now, see the 'shape' parameter
- graph.adjacency rewritten when creating weighted graphs
- We use match.arg whenever possible. This means that character scalar
  options can be abbreviated and they are always case insensitive

- VF2 graph isomorphism routines can check subgraph isomorphism now,
  and they are able to return matching(s)
- The BLISS graph isomorphism algorithm is included in igraph now. See
  canonical.permutation, graph.isomorphic.bliss
- We use ARPACK for eigenvalue/eigenvector calculation. This means that the
  following functions were rewritten: page.rank,
  leading.eigenvector.community.*, evcent. New functions based on
  ARPACK: hub.score, authority.score, arpack.
- Edge weights for Fruchterman-Reingold layout (layout.fruchterman.reingold).
- Line graph calculation (line.graph)
- Kautz and de Bruijn graph generators (graph.kautz, graph.de.bruijn)
- Support for writing graphs in DOT format
- Jaccard and Dice similarity coefficients added (similarity.jaccard,
  similarity.dice)
- Counting the multiplicity of edges (count.multiple)
- The graphopt layout algorithm was added, layout.graphopt
- Generation of "famous" graphs (graph.famous).
- Create graphs from LCF notation (graph.cf).
- Dyad census and triad cencus functions (dyad.census, triad.census)
- Cheking for simple graphs (is.simple)
- Create full citation networks (graph.full.citation)
- Create a histogram of path lengths (path.length.hist)
- Forest fire model added (forest.fire.game)
- DIMACS reader can handle different file types now
- Biconnected components and articulation points (biconnected.components,
  articulation.points)
- Kleinberg's hub and authority scores (hub.score, authority.score)
- as.undirected handles attributes now
- Geometric random graph generator (grg.game) can return the
  coordinates of the vertices
- Function added to convert leading eigenvector community structure result to
  a membership vector (community.le.to.membership)
- Weighted fast greedy community detection
- Weighted page rank calculation
- Functions for estimating closeness, betweenness, edge betweenness by
  introducing a cutoff for path lengths (closeness.estimate,
  betweenness.estimate, edge.betweenness.estimate)
- Weighted modularity calculation
- Function for permuting vertices (permute.vertices)
- Betweenness and closeness calculations are speeded up
- read.graph can handle all possible line terminators now (\r, \n, \r\n, \n\r)
- Error handling was rewritten for walktrap community detection,
  the calculation can be interrupted now
- The maxflow/mincut functions allow to supply NULL pointer for edge
  capacities, implying unit capacities for all edges

## Bugs corrected in the R interface

- Fixed a bug in cohesive.blocks, cohesive blocks were sometimes not
  calculated correctly

# igraph 0.4.5

Released January 1, 2008

New:
- Cohesive block finding in the R interface, thanks to Peter McMahan
  for contributing his code. See James Moody and Douglas R. White,
  2003, in Structural Cohesion and Embeddedness: A Hierarchical
  Conception of Social Groups American Sociological Review 68(1):1-25
- Biconnected components and articulation points.
- R interface: better printing of attributes.
- R interface: graph attributes can be used via '$'.

Bug fixed:
- Erdos-Renyi random graph generators rewritten.

# igraph 0.4.4

Released October 3, 2007

This release should work seamlessly with the new R 2.6.0 version.
Some other bugs were also fixed:
- A bug was fixed in the Erdos-Renyi graph generator, which sometimes
  added an extra vertex.

# igraph 0.4.3

Released August 13, 2007

The next one in the sequence of bugfix releases. Thanks to many people
sending bug reports. Here are the changes:
- Some memory leaks removed when using attributes from R or Python.
- GraphML parser: entities and character data in multiple chunks are
  now handled correctly.
- A bug corrected in edge betweenness community structure detection,
  it failed if called many times from the same program/session.
- Edge betweeness community structure: handle unconnected graphs properly.
- Fixed bug related to fast greedy community detection in unconnected graphs.
- Use a different kind of parser (Push) for reading GraphML
  files. This is almost invisible for users but fixed a
  nondeterministic bug when reading in GraphML files.
- R interface: plot now handles properly if called with a vector as
  the edge.width argument for directed graphs.
- R interface: bug (typo) corrected for walktrap.community and
  weighted graphs.

# igraph 0.4.2

Released June 7, 2007

This is another bugfix release, as there was a serious bug in the
R package of the previous version: it could not read and write graphs
to files in any format under MS Windows.

Some other bits added:
- circular Reingold-Tilford layout generator for trees
- corrected a bug, Pajek files are written properly under MS Windows now.
- arrow.size graphical edge parameter added in the R interface.

# igraph 0.4.1

Released May 23, 2007

This is a minor release, it corrects a number of bugs, mostly in the
R package.

# igraph 0.4

Released May 21, 2007

The major new additions in this release is a bunch of community
detection algorithms and support for the GML file format. Here
is the complete list of changes:

## New in the R interface

- as the internal representation changed, graphs stored with 'save'
  with an older igraph version cannot be read back with the new
  version reliably.
- neighbors returns ordered lists
- is.loop and is.multiple were added

- topological sorting
- VF2 isomorphism algorithm
- support for reading graphs from the Graph Database for isomorphism
- graph.mincut can calculate the actual minimum cut
- girth calculation added, thanks to Keith Briggs
- support for reading and writing GML files

- Walktrap community detection algorithm added, thanks to Matthieu Latapy
  and Pascal Pons
- edge betweenness based community detection algorithm added
- fast greedy algorithm for community detection by Clauset et al. added
  thanks to Aaron Clauset for sharing his code
- leading eigenvector community detection algorithm by Mark Newman added
- functions for creating dendrograms from the output of the
  community detection algorithms added
- community.membership supporting function added, creates
  a membership vector from a community structure merge tree
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
- is.igraph rewritten to make it possible to inherit from the 'igraph' class
- somewhat better looking progress meter for functions which support it

## Others

- many functions benefit from the new internal representation and are
  faster now: transitivity, reciprocity, graph operator functions like
  intersection and union, etc.

## Bugs corrected

- corrected a bug when reading Pajek files: directed graphs were read
  as undirected

# igraph 0.3.2

Released Dec 19, 2006

This is a new major release, it contains many new things:

## Changes in the R interface

- bonpow function ported from SNA to calculate Bonacich power centrality
- get.adjacency supports attributes now, this means that it sets the
  colnames  and rownames attributes and can return attribute values in
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
- get.edgelist has now a 'names' argument and can return symbolic
  vertex names instead of vertex ids, by default id uses the 'name'
  vertex attribute is returned
- printing graphs on screen also prints symbolic symbolic names
  (the 'name' attribute if present)
- maximum flow and minimum cut functions: graph.maxflow, graph.mincut
- vertex and edge connectivity: edge.connectivity, vertex.connectivity
- edge and vertex disjoint paths: edge.disjoint.paths,
  vertex.disjoint.paths
- White's cohesion and adhesion measure: graph.adhesion, graph.cohesion
- dimacs file format added
- as.directed handles attributes now
- constraint corrected, it handles weighted graphs as well now
- weighted attribute to graph.adjacency
- spinglass-based community structure detection, the Joerg Reichardt --
  Stefan Bornholdt algorithm added: spinglass.community
- graph.extended.chordal.ring, extended chordal ring generation
- no.clusters calculates the number of clusters without calculating
  the clusters themselves
- minimum spanning tree functions updated to keep attributes
- transitivity can calculate local transitivity as well
- neighborhood related functions added: neighborhood,
  neighborhood.size, graph.neighborhood
- new graph generators based on vertex types: preference.game and
  asymmetric.preference.game

## Bugs corrected

- attribute handling bug when deleting edges corrected
- GraphML escaping and NaN handling corrected
- bug corrected to make it possible compile the R package without the
  libxml2 library
- a bug in Erdos-Renyi graph generation corrected: it had problems
  with generating large directed graphs
- bug in constraint calculation corrected, it works well now
- fixed memory leaks in the GraphML reader
- error handling bug corrected in the GraphML reader
- bug corrected in R version of graph.laplacian when normalized
  Laplacian is requested
- memory leak corrected in get.all.shortest.paths in the R package

# igraph 0.2.1

Released Aug 23, 2006

This is a bug-fix release. Bugs fixed:
- reciprocity corrected to avoid segfaults
- some docs updates
- various R package updates to make it conform to the CRAN rules

# igraph 0.2

Released Aug 18, 2006

Release time at last! There are many new things in igraph 0.2, the
most important ones:
- reading writing Pajek and GraphML formats with attributes
  (not all Pajek and GraphML files are supported, see documentation
  for details)
- the RANDEDU fast motif search algorithm is implemented
- many new graph generators, both games and regular graphs
- many new structural properties: transitivity, reciprocity, etc.
- graph operators: union, intersection, difference, structural holes, etc.
- conversion between directed and undirected graphs
- new layout algorithms for trees and large graphs, 3D layouts
and many more.

New things specifically in the R package:
- support for CTRL+C
- new functions: Graph Laplacian, Burt's constraint, etc.
- vertex/edge sequences totally rewritten, smart indexing (see manual)
- new R manual and tutorial: `Network Analysis with igraph', still
  under development but useful
- very basic 3D plotting using OpenGL

Although this release was somewhat tested on Linux, MS Windows, Mac
OSX, Solaris 8 and FreeBSD, no heavy testing was done, so it might
contain bugs, and we kindly ask you to send bug reports to make igraph
better.

# igraph 0.1

Released Jan 30, 2006

After about a year of development this is the first "official" release
of the igraph library. This release should be considered as beta
software, but it should be useful in general. Please send your
questions and comments.
