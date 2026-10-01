# glyrepr (1.1.0)

* GitHub: <https://github.com/glycoverse/glyrepr>
* Email: <mailto:23110220018@m.fudan.edu.cn>
* GitHub mirror: <https://github.com/cran/glyrepr>

Run `revdepcheck::revdep_details(, "glyrepr")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
         'test-floating-substituents.R:94:1', 'test-floating-substituents.R:133:1',
         'test-floating-substituents.R:173:1', 'test-floating-validation.R:37:1',
         'test-floating-validation.R:51:1', 'test-floating-validation.R:65:1',
         'test-floating-validation.R:79:1', 'test-floating-validation.R:109:1',
         'test-floating-validation.R:139:1', 'test-floating-validation.R:159:1',
         'test-floating-validation.R:203:1', 'test-low-level-structure.R:46:1',
         'test-low-level-structure.R:82:1', 'test-low-level-structure.R:159:1',
         'test-low-level-structure.R:222:1', 'test-low-level-structure.R:236:1',
         'test-smap.R:1041:1', 'test-structure-arrays.R:53:1',
         'test-structure-arrays.R:137:1', 'test-structure-tables.R:497:1',
         'test-structure.R:574:1', 'test-structure.R:593:1', 'test-structure.R:642:1',
         'test-structure.R:662:1', 'test-structure.R:722:1', 'test-structure.R:729:1',
         'test-structure.R:737:1', 'test-structure.R:778:1', 'test-structure.R:833:1'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-structure-to-iupac.R:124:3'): structure_to_iupac handles complex branched structures ──
       <purrr_error_indexed/rlang_error/error/condition>
       Error in `purrr::map(graphs, process_glycan_structure_element)`: i In index: 1.
       Caused by error in `validate_glycan_graph()`:
       ! Duplicated linkage positions.
       
       [ FAIL 1 | WARN 0 | SKIP 51 | PASS 2073 ]
       Error:
       ! Test failures.
       Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

