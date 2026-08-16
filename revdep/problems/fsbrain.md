# fsbrain (0.6.0)

* GitHub: <https://github.com/dfsp-spirit/fsbrain>
* Email: <mailto:ts+code@rcmd.org>
* GitHub mirror: <https://github.com/cran/fsbrain>

Run `revdepcheck::revdep_details(, "fsbrain")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
         'test-morph_concat.R:42:5', 'test-morph_concat.R:59:5',
         'test-r_vis_volume.R:2:5', 'test-r_vis_volume.R:36:5',
         'test-r_vis_volume.R:124:5', 'test-r_vis_volume.R:157:5',
         'test-r_vis_volume.R:212:5', 'test-rglactions.R:3:5',
         'test-rglactions.R:16:5', 'test-seg_stats.R:4:5', 'test-seg_stats.R:20:5',
         'test-smooth.R:3:5', 'test-smooth.R:36:5', 'test-u_vis_volume_3d.R:4:5',
         'test-u_vis_volume_3d.R:43:5', 'test-u_vis_volume_3d.R:56:5',
         'test-u_vis_volume_3d.R:64:5', 'test-u_vis_volume_3d.R:74:5',
         'test-u_vis_volume_3d.R:83:5', 'test-u_vis_volume_3d.R:125:5',
         'test-u_vis_volume_3d.R:169:5', 'test-u_vis_volume_3d.R:190:5',
         'test-u_vis_volume_3d.R:209:5'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-helpers.R:22:3'): The neigborhood of a vertex is computed correctly ──
       Error in `pkgfilecache::get_filepath(pkg_info, filename, mustWork = mustWork)`: File 'subjects_dir' (from 'subjects_dir') does not exist in local package cache at '~/.local/share/fsbrain/subjects_dir', and mustWork is TRUE.
       
       Backtrace:
           ▆
        1. └─fsbrain::get_optional_data_filepath("subjects_dir") at test-helpers.R:22:3
        2.   └─pkgfilecache::get_filepath(pkg_info, filename, mustWork = mustWork)
       
       [ FAIL 1 | WARN 86 | SKIP 91 | PASS 325 ]
       Error:
       ! Test failures.
       Execution halted
     ```

