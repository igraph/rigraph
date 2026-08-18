# BeeBDC (1.3.4)

* GitHub: <https://github.com/jbdorey/BeeBDC>
* Email: <mailto:jbdorey@me.com>
* GitHub mirror: <https://github.com/cran/BeeBDC>

Run `revdepcheck::revdep_details(, "BeeBDC")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       are planar
        - Downloading taxonomy...
       Saving _problems/test-taxadbToBeeBDC-18.R
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 248 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-taxadbToBeeBDC.R:10:2'): (code run outside of `test_that()`) ───
       <EEXIST/fs_error/error/condition>
       Error: [EEXIST] Failed to copy '/home/runner/work/_temp/tmp/RtmpBlJICk/working_dir/RtmpI0P6Zm/file48e41257ae826parquet' to '/home/runner/.local/share/R/contentid/sha256/e4/a6/e4a60b68c986c27eeee0318a876f9a86cd8f452a6a77db3bf38b934862b7ce27': file already exists
       Backtrace:
           ▆
        1. └─BeeBDC::taxadbToBeeBDC(...) at test-taxadbToBeeBDC.R:10:2
        2.   └─taxadb::td_create(...)
        3.     └─taxadb:::cache_urls(meta$url, meta$id)
        4.       └─base::vapply(...)
        5.         └─contentid (local) FUN(X[[i]], ...)
        6.           └─contentid::store(path, dir = dir, algos = algo)
        7.             └─base::vapply(...)
        8.               └─contentid (local) FUN(X[[i]], ...)
        9.                 └─fs::file_copy(filepath, dest)
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 248 ]
       Error:
       ! Test failures.
       Execution halted
     ```

