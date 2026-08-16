# glyrepr (0.14.0)

* GitHub: <https://github.com/glycoverse/glyrepr>
* Email: <mailto:23110220018@m.fudan.edu.cn>
* GitHub mirror: <https://github.com/cran/glyrepr>

Run `revdepcheck::revdep_details(, "glyrepr")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       [ FAIL 1 | WARN 0 | SKIP 21 | PASS 1300 ]
       
       ══ Skipped tests (21) ══════════════════════════════════════════════════════════
       • On CRAN (21): 'test-composition.R:298:1', 'test-composition.R:325:1',
         'test-example-glycans.R:1:1', 'test-example-glycans.R:9:1',
         'test-example-glycans.R:16:1', 'test-example-glycans.R:23:1',
         'test-example-glycans.R:30:1', 'test-low-level-structure.R:40:1',
         'test-low-level-structure.R:67:1', 'test-low-level-structure.R:81:1',
         'test-low-level-structure.R:95:1', 'test-structure-level.R:71:1',
         'test-structure-level.R:152:1', 'test-structure.R:495:1',
         'test-structure.R:514:1', 'test-structure.R:563:1', 'test-structure.R:573:1',
         'test-structure.R:582:1', 'test-structure.R:642:1', 'test-structure.R:649:1',
         'test-structure.R:657:1'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-structure-to-iupac.R:95:3'): structure_to_iupac handles complex branched structures ──
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `purrr::map(valid_graphs, function(graph) {     checkmate::assert_class(graph, "igraph")     graph %>% validate_glycan_graph() %>% canonicalize_glycan_graph() })`: i In index: 1.
       Caused by error in `validate_glycan_graph()`:
       ! Duplicated linkage positions.
       
       [ FAIL 1 | WARN 0 | SKIP 21 | PASS 1300 ]
       Error:
       ! Test failures.
       Execution halted
     ```

