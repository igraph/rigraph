# glyrepr (1.0.0)

* GitHub: <https://github.com/glycoverse/glyrepr>
* Email: <mailto:23110220018@m.fudan.edu.cn>
* GitHub mirror: <https://github.com/cran/glyrepr>

Run `revdepcheck::revdep_details(, "glyrepr")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
         'test-floating-parts.R:480:1', 'test-floating-substituents.R:94:1',
         'test-floating-substituents.R:133:1', 'test-floating-substituents.R:173:1',
         'test-floating-validation.R:37:1', 'test-floating-validation.R:51:1',
         'test-floating-validation.R:65:1', 'test-floating-validation.R:79:1',
         'test-floating-validation.R:109:1', 'test-floating-validation.R:139:1',
         'test-floating-validation.R:159:1', 'test-floating-validation.R:203:1',
         'test-low-level-structure.R:46:1', 'test-low-level-structure.R:82:1',
         'test-low-level-structure.R:159:1', 'test-low-level-structure.R:222:1',
         'test-low-level-structure.R:236:1', 'test-smap.R:1041:1',
         'test-structure-tables.R:497:1', 'test-structure.R:520:1',
         'test-structure.R:539:1', 'test-structure.R:588:1', 'test-structure.R:608:1',
         'test-structure.R:668:1', 'test-structure.R:675:1', 'test-structure.R:683:1',
         'test-structure.R:724:1', 'test-structure.R:779:1'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-structure-to-iupac.R:124:3'): structure_to_iupac handles complex branched structures ──
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `purrr::map(valid_graphs, function(graph) {     checkmate::assert_class(graph, "igraph")     graph %>% validate_glycan_graph() %>% canonicalize_glycan_graph() })`: i In index: 1.
       Caused by error in `validate_glycan_graph()`:
       ! Duplicated linkage positions.
       
       [ FAIL 1 | WARN 0 | SKIP 46 | PASS 1885 ]
       Error:
       ! Test failures.
       Execution halted
     ```

