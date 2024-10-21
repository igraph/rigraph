SOURCES=cpp11.o cpprinterface.o init.o rinterface.o rinterface_extra.o rrandom.o simpleraytracer.o vendor/arpack/dgetv0.o vendor/arpack/dmout.o vendor/arpack/dnaitr.o vendor/arpack/dnapps.o vendor/arpack/dnaup2.o vendor/arpack/dnaupd.o vendor/arpack/dnconv.o vendor/arpack/dneigh.o vendor/arpack/dneupd.o vendor/arpack/dngets.o vendor/arpack/dsaitr.o vendor/arpack/dsapps.o vendor/arpack/dsaup2.o vendor/arpack/dsaupd.o vendor/arpack/dsconv.o vendor/arpack/dseigt.o vendor/arpack/dsesrt.o vendor/arpack/dseupd.o vendor/arpack/dsgets.o vendor/arpack/dsortc.o vendor/arpack/dsortr.o vendor/arpack/dstatn.o vendor/arpack/dstats.o vendor/arpack/dstqrb.o vendor/arpack/dvout.o vendor/arpack/ivout.o vendor/arpack/second.o vendor/arpack/wrap.o vendor/cigraph/src/centrality/betweenness.o vendor/cigraph/src/centrality/centrality_other.o vendor/cigraph/src/centrality/centralization.o vendor/cigraph/src/centrality/closeness.o vendor/cigraph/src/centrality/coreness.o vendor/cigraph/src/centrality/eigenvector.o vendor/cigraph/src/centrality/hub_authority.o vendor/cigraph/src/centrality/pagerank.o vendor/cigraph/src/centrality/prpack.o vendor/cigraph/src/centrality/prpack/prpack_base_graph.o vendor/cigraph/src/centrality/prpack/prpack_igraph_graph.o vendor/cigraph/src/centrality/prpack/prpack_preprocessed_ge_graph.o vendor/cigraph/src/centrality/prpack/prpack_preprocessed_gs_graph.o vendor/cigraph/src/centrality/prpack/prpack_preprocessed_scc_graph.o vendor/cigraph/src/centrality/prpack/prpack_preprocessed_schur_graph.o vendor/cigraph/src/centrality/prpack/prpack_result.o vendor/cigraph/src/centrality/prpack/prpack_solver.o vendor/cigraph/src/centrality/prpack/prpack_utils.o vendor/cigraph/src/centrality/truss.o vendor/cigraph/src/cliques/cliquer/cliquer.o vendor/cigraph/src/cliques/cliquer/cliquer_graph.o vendor/cigraph/src/cliques/cliquer/reorder.o vendor/cigraph/src/cliques/cliquer_wrapper.o vendor/cigraph/src/cliques/cliques.o vendor/cigraph/src/cliques/glet.o vendor/cigraph/src/cliques/maximal_cliques.o vendor/cigraph/src/community/community_misc.o vendor/cigraph/src/community/edge_betweenness.o vendor/cigraph/src/community/fast_modularity.o vendor/cigraph/src/community/fluid.o vendor/cigraph/src/community/infomap/infomap.o vendor/cigraph/src/community/infomap/infomap_FlowGraph.o vendor/cigraph/src/community/infomap/infomap_Greedy.o vendor/cigraph/src/community/label_propagation.o vendor/cigraph/src/community/leading_eigenvector.o vendor/cigraph/src/community/leiden.o vendor/cigraph/src/community/louvain.o vendor/cigraph/src/community/modularity.o vendor/cigraph/src/community/optimal_modularity.o vendor/cigraph/src/community/spinglass/NetDataTypes.o vendor/cigraph/src/community/spinglass/NetRoutines.o vendor/cigraph/src/community/spinglass/clustertool.o vendor/cigraph/src/community/spinglass/pottsmodel_2.o vendor/cigraph/src/community/voronoi.o vendor/cigraph/src/community/walktrap/walktrap.o vendor/cigraph/src/community/walktrap/walktrap_communities.o vendor/cigraph/src/community/walktrap/walktrap_graph.o vendor/cigraph/src/community/walktrap/walktrap_heap.o vendor/cigraph/src/connectivity/cohesive_blocks.o vendor/cigraph/src/connectivity/components.o vendor/cigraph/src/connectivity/reachability.o vendor/cigraph/src/connectivity/separators.o vendor/cigraph/src/constructors/adjacency.o vendor/cigraph/src/constructors/atlas.o vendor/cigraph/src/constructors/basic_constructors.o vendor/cigraph/src/constructors/circulant.o vendor/cigraph/src/constructors/de_bruijn.o vendor/cigraph/src/constructors/famous.o vendor/cigraph/src/constructors/full.o vendor/cigraph/src/constructors/generalized_petersen.o vendor/cigraph/src/constructors/kautz.o vendor/cigraph/src/constructors/lattices.o vendor/cigraph/src/constructors/lcf.o vendor/cigraph/src/constructors/linegraph.o vendor/cigraph/src/constructors/prufer.o vendor/cigraph/src/constructors/regular.o vendor/cigraph/src/constructors/trees.o vendor/cigraph/src/core/array.o vendor/cigraph/src/core/bitset.o vendor/cigraph/src/core/bitset_list.o vendor/cigraph/src/core/buckets.o vendor/cigraph/src/core/cutheap.o vendor/cigraph/src/core/dqueue.o vendor/cigraph/src/core/error.o vendor/cigraph/src/core/estack.o vendor/cigraph/src/core/fixed_vectorlist.o vendor/cigraph/src/core/genheap.o vendor/cigraph/src/core/grid.o vendor/cigraph/src/core/heap.o vendor/cigraph/src/core/indheap.o vendor/cigraph/src/core/interruption.o vendor/cigraph/src/core/marked_queue.o vendor/cigraph/src/core/matrix.o vendor/cigraph/src/core/matrix_list.o vendor/cigraph/src/core/memory.o vendor/cigraph/src/core/printing.o vendor/cigraph/src/core/progress.o vendor/cigraph/src/core/psumtree.o vendor/cigraph/src/core/set.o vendor/cigraph/src/core/sparsemat.o vendor/cigraph/src/core/stack.o vendor/cigraph/src/core/statusbar.o vendor/cigraph/src/core/strvector.o vendor/cigraph/src/core/trie.o vendor/cigraph/src/core/vector.o vendor/cigraph/src/core/vector_list.o vendor/cigraph/src/core/vector_ptr.o vendor/cigraph/src/cycles/simple_cycles.o vendor/cigraph/src/flow/flow.o vendor/cigraph/src/flow/flow_conversion.o vendor/cigraph/src/flow/st-cuts.o vendor/cigraph/src/games/barabasi.o vendor/cigraph/src/games/callaway_traits.o vendor/cigraph/src/games/chung_lu.o vendor/cigraph/src/games/citations.o vendor/cigraph/src/games/correlated.o vendor/cigraph/src/games/degree_sequence.o vendor/cigraph/src/games/degree_sequence_vl/gengraph_degree_sequence.o vendor/cigraph/src/games/degree_sequence_vl/gengraph_graph_molloy_hash.o vendor/cigraph/src/games/degree_sequence_vl/gengraph_graph_molloy_optimized.o vendor/cigraph/src/games/degree_sequence_vl/gengraph_mr-connected.o vendor/cigraph/src/games/degree_sequence_vl/gengraph_random.o vendor/cigraph/src/games/dotproduct.o vendor/cigraph/src/games/erdos_renyi.o vendor/cigraph/src/games/establishment.o vendor/cigraph/src/games/forestfire.o vendor/cigraph/src/games/grg.o vendor/cigraph/src/games/growing_random.o vendor/cigraph/src/games/islands.o vendor/cigraph/src/games/k_regular.o vendor/cigraph/src/games/preference.o vendor/cigraph/src/games/recent_degree.o vendor/cigraph/src/games/sbm.o vendor/cigraph/src/games/static_fitness.o vendor/cigraph/src/games/tree.o vendor/cigraph/src/games/watts_strogatz.o vendor/cigraph/src/graph/adjlist.o vendor/cigraph/src/graph/attributes.o vendor/cigraph/src/graph/basic_query.o vendor/cigraph/src/graph/caching.o vendor/cigraph/src/graph/cattributes.o vendor/cigraph/src/graph/graph_list.o vendor/cigraph/src/graph/iterators.o vendor/cigraph/src/graph/type_common.o vendor/cigraph/src/graph/type_indexededgelist.o vendor/cigraph/src/graph/visitors.o vendor/cigraph/src/hrg/hrg.o vendor/cigraph/src/hrg/hrg_types.o vendor/cigraph/src/internal/glpk_support.o vendor/cigraph/src/internal/hacks.o vendor/cigraph/src/internal/lsap.o vendor/cigraph/src/internal/qsort.o vendor/cigraph/src/internal/qsort_r.o vendor/cigraph/src/internal/utils.o vendor/cigraph/src/internal/zeroin.o vendor/cigraph/src/io/dimacs.o vendor/cigraph/src/io/dl.o vendor/cigraph/src/io/dot.o vendor/cigraph/src/io/edgelist.o vendor/cigraph/src/io/gml-tree.o vendor/cigraph/src/io/gml.o vendor/cigraph/src/io/graphdb.o vendor/cigraph/src/io/graphml.o vendor/cigraph/src/io/leda.o vendor/cigraph/src/io/lgl.o vendor/cigraph/src/io/ncol.o vendor/cigraph/src/io/pajek.o vendor/cigraph/src/io/parse_utils.o vendor/cigraph/src/isomorphism/bliss.o vendor/cigraph/src/isomorphism/bliss/defs.o vendor/cigraph/src/isomorphism/bliss/graph.o vendor/cigraph/src/isomorphism/bliss/heap.o vendor/cigraph/src/isomorphism/bliss/orbit.o vendor/cigraph/src/isomorphism/bliss/partition.o vendor/cigraph/src/isomorphism/bliss/uintseqhash.o vendor/cigraph/src/isomorphism/bliss/utils.o vendor/cigraph/src/isomorphism/isoclasses.o vendor/cigraph/src/isomorphism/isomorphism_misc.o vendor/cigraph/src/isomorphism/lad.o vendor/cigraph/src/isomorphism/queries.o vendor/cigraph/src/isomorphism/vf2.o vendor/cigraph/src/layout/circular.o vendor/cigraph/src/layout/davidson_harel.o vendor/cigraph/src/layout/drl/DensityGrid.o vendor/cigraph/src/layout/drl/DensityGrid_3d.o vendor/cigraph/src/layout/drl/drl_graph.o vendor/cigraph/src/layout/drl/drl_graph_3d.o vendor/cigraph/src/layout/drl/drl_layout.o vendor/cigraph/src/layout/drl/drl_layout_3d.o vendor/cigraph/src/layout/drl/drl_parse.o vendor/cigraph/src/layout/fruchterman_reingold.o vendor/cigraph/src/layout/gem.o vendor/cigraph/src/layout/graphopt.o vendor/cigraph/src/layout/kamada_kawai.o vendor/cigraph/src/layout/large_graph.o vendor/cigraph/src/layout/layout_bipartite.o vendor/cigraph/src/layout/layout_grid.o vendor/cigraph/src/layout/layout_random.o vendor/cigraph/src/layout/mds.o vendor/cigraph/src/layout/merge_dla.o vendor/cigraph/src/layout/merge_grid.o vendor/cigraph/src/layout/reingold_tilford.o vendor/cigraph/src/layout/sugiyama.o vendor/cigraph/src/layout/umap.o vendor/cigraph/src/linalg/arpack.o vendor/cigraph/src/linalg/blas.o vendor/cigraph/src/linalg/eigen.o vendor/cigraph/src/linalg/lapack.o vendor/cigraph/src/math/complex.o vendor/cigraph/src/math/safe_intop.o vendor/cigraph/src/math/utils.o vendor/cigraph/src/misc/bipartite.o vendor/cigraph/src/misc/chordality.o vendor/cigraph/src/misc/cocitation.o vendor/cigraph/src/misc/coloring.o vendor/cigraph/src/misc/conversion.o vendor/cigraph/src/misc/cycle_bases.o vendor/cigraph/src/misc/degree_sequence.o vendor/cigraph/src/misc/embedding.o vendor/cigraph/src/misc/feedback_arc_set.o vendor/cigraph/src/misc/graphicality.o vendor/cigraph/src/misc/matching.o vendor/cigraph/src/misc/microscopic_update.o vendor/cigraph/src/misc/mixing.o vendor/cigraph/src/misc/motifs.o vendor/cigraph/src/misc/order_cycle.o vendor/cigraph/src/misc/other.o vendor/cigraph/src/misc/power_law_fit.o vendor/cigraph/src/misc/scan.o vendor/cigraph/src/misc/sir.o vendor/cigraph/src/misc/spanning_trees.o vendor/cigraph/src/operators/add_edge.o vendor/cigraph/src/operators/complementer.o vendor/cigraph/src/operators/compose.o vendor/cigraph/src/operators/connect_neighborhood.o vendor/cigraph/src/operators/contract.o vendor/cigraph/src/operators/difference.o vendor/cigraph/src/operators/disjoint_union.o vendor/cigraph/src/operators/intersection.o vendor/cigraph/src/operators/join.o vendor/cigraph/src/operators/misc_internal.o vendor/cigraph/src/operators/permute.o vendor/cigraph/src/operators/reverse.o vendor/cigraph/src/operators/rewire.o vendor/cigraph/src/operators/rewire_edges.o vendor/cigraph/src/operators/simplify.o vendor/cigraph/src/operators/subgraph.o vendor/cigraph/src/operators/union.o vendor/cigraph/src/paths/all_shortest_paths.o vendor/cigraph/src/paths/astar.o vendor/cigraph/src/paths/bellman_ford.o vendor/cigraph/src/paths/dijkstra.o vendor/cigraph/src/paths/distances.o vendor/cigraph/src/paths/eulerian.o vendor/cigraph/src/paths/floyd_warshall.o vendor/cigraph/src/paths/histogram.o vendor/cigraph/src/paths/johnson.o vendor/cigraph/src/paths/random_walk.o vendor/cigraph/src/paths/shortest_paths.o vendor/cigraph/src/paths/simple_paths.o vendor/cigraph/src/paths/sparsifier.o vendor/cigraph/src/paths/unweighted.o vendor/cigraph/src/paths/voronoi.o vendor/cigraph/src/paths/widest_paths.o vendor/cigraph/src/properties/basic_properties.o vendor/cigraph/src/properties/complete.o vendor/cigraph/src/properties/constraint.o vendor/cigraph/src/properties/convergence_degree.o vendor/cigraph/src/properties/dag.o vendor/cigraph/src/properties/degrees.o vendor/cigraph/src/properties/ecc.o vendor/cigraph/src/properties/girth.o vendor/cigraph/src/properties/loops.o vendor/cigraph/src/properties/multiplicity.o vendor/cigraph/src/properties/neighborhood.o vendor/cigraph/src/properties/perfect.o vendor/cigraph/src/properties/spectral.o vendor/cigraph/src/properties/trees.o vendor/cigraph/src/properties/triangles.o vendor/cigraph/src/random/random.o vendor/cigraph/src/random/rng_glibc2.o vendor/cigraph/src/random/rng_mt19937.o vendor/cigraph/src/random/rng_pcg32.o vendor/cigraph/src/random/rng_pcg64.o vendor/cigraph/src/version.o vendor/cigraph/vendor/cs/cs_add.o vendor/cigraph/vendor/cs/cs_amd.o vendor/cigraph/vendor/cs/cs_chol.o vendor/cigraph/vendor/cs/cs_cholsol.o vendor/cigraph/vendor/cs/cs_compress.o vendor/cigraph/vendor/cs/cs_counts.o vendor/cigraph/vendor/cs/cs_cumsum.o vendor/cigraph/vendor/cs/cs_dfs.o vendor/cigraph/vendor/cs/cs_dmperm.o vendor/cigraph/vendor/cs/cs_droptol.o vendor/cigraph/vendor/cs/cs_dropzeros.o vendor/cigraph/vendor/cs/cs_dupl.o vendor/cigraph/vendor/cs/cs_entry.o vendor/cigraph/vendor/cs/cs_ereach.o vendor/cigraph/vendor/cs/cs_etree.o vendor/cigraph/vendor/cs/cs_fkeep.o vendor/cigraph/vendor/cs/cs_gaxpy.o vendor/cigraph/vendor/cs/cs_happly.o vendor/cigraph/vendor/cs/cs_house.o vendor/cigraph/vendor/cs/cs_ipvec.o vendor/cigraph/vendor/cs/cs_leaf.o vendor/cigraph/vendor/cs/cs_load.o vendor/cigraph/vendor/cs/cs_lsolve.o vendor/cigraph/vendor/cs/cs_ltsolve.o vendor/cigraph/vendor/cs/cs_lu.o vendor/cigraph/vendor/cs/cs_lusol.o vendor/cigraph/vendor/cs/cs_malloc.o vendor/cigraph/vendor/cs/cs_maxtrans.o vendor/cigraph/vendor/cs/cs_multiply.o vendor/cigraph/vendor/cs/cs_norm.o vendor/cigraph/vendor/cs/cs_permute.o vendor/cigraph/vendor/cs/cs_pinv.o vendor/cigraph/vendor/cs/cs_post.o vendor/cigraph/vendor/cs/cs_print.o vendor/cigraph/vendor/cs/cs_pvec.o vendor/cigraph/vendor/cs/cs_qr.o vendor/cigraph/vendor/cs/cs_qrsol.o vendor/cigraph/vendor/cs/cs_randperm.o vendor/cigraph/vendor/cs/cs_reach.o vendor/cigraph/vendor/cs/cs_scatter.o vendor/cigraph/vendor/cs/cs_scc.o vendor/cigraph/vendor/cs/cs_schol.o vendor/cigraph/vendor/cs/cs_spsolve.o vendor/cigraph/vendor/cs/cs_sqr.o vendor/cigraph/vendor/cs/cs_symperm.o vendor/cigraph/vendor/cs/cs_tdfs.o vendor/cigraph/vendor/cs/cs_transpose.o vendor/cigraph/vendor/cs/cs_updown.o vendor/cigraph/vendor/cs/cs_usolve.o vendor/cigraph/vendor/cs/cs_util.o vendor/cigraph/vendor/cs/cs_utsolve.o vendor/cigraph/vendor/pcg/pcg-advance-128.o vendor/cigraph/vendor/pcg/pcg-advance-64.o vendor/cigraph/vendor/pcg/pcg-output-128.o vendor/cigraph/vendor/pcg/pcg-output-32.o vendor/cigraph/vendor/pcg/pcg-output-64.o vendor/cigraph/vendor/pcg/pcg-rngs-128.o vendor/cigraph/vendor/pcg/pcg-rngs-64.o vendor/cigraph/vendor/plfit/gss.o vendor/cigraph/vendor/plfit/hzeta.o vendor/cigraph/vendor/plfit/kolmogorov.o vendor/cigraph/vendor/plfit/lbfgs.o vendor/cigraph/vendor/plfit/mt.o vendor/cigraph/vendor/plfit/options.o vendor/cigraph/vendor/plfit/plfit.o vendor/cigraph/vendor/plfit/plfit_error.o vendor/cigraph/vendor/plfit/rbinom.o vendor/cigraph/vendor/plfit/sampling.o vendor/io/dl-lexer.o vendor/io/dl-parser.o vendor/io/gml-lexer.o vendor/io/gml-parser.o vendor/io/lgl-lexer.o vendor/io/lgl-parser.o vendor/io/ncol-lexer.o vendor/io/ncol-parser.o vendor/io/pajek-lexer.o vendor/io/pajek-parser.o vendor/simpleraytracer/Color.o vendor/simpleraytracer/Light.o vendor/simpleraytracer/Point.o vendor/simpleraytracer/Ray.o vendor/simpleraytracer/RayTracer.o vendor/simpleraytracer/RayVector.o vendor/simpleraytracer/Shape.o vendor/simpleraytracer/Sphere.o vendor/simpleraytracer/Triangle.o vendor/simpleraytracer/unit_limiter.o vendor/uuid/R.o vendor/uuid/clear.o vendor/uuid/compare.o vendor/uuid/copy.o vendor/uuid/gen_uuid.o vendor/uuid/isnull.o vendor/uuid/pack.o vendor/uuid/parse.o vendor/uuid/unpack.o vendor/uuid/unparse.o
