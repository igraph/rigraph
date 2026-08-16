# beastier (2.5.2)

* GitHub: <https://github.com/ropensci/beastier>
* Email: <mailto:rjcbilderbeek@gmail.com>
* GitHub mirror: <https://github.com/cran/beastier>

Run `revdepcheck::revdep_details(, "beastier")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     +           filename = tracelog_filename
     +         )
     +       )
     +     )
     +   )
     +   extract_tracelog_filename_from_beast2_input_file(
     +     input_filename = beast2_input_filename
     +   )
     +   file.remove(beast2_input_filename)
     + 
     +   remove_beaustier_folders()
     + }
     Error:
     ! '/home/runner/.cache/beastier/file28625282cbbbf' does not exist.
     Backtrace:
         ▆
      1. ├─beastier::extract_tracelog_filename_from_beast2_input_file(input_filename = beast2_input_filename)
      2. │ └─readr::read_lines(input_filename, progress = FALSE)
      3. │   └─vroom::vroom_lines(...)
      4. │     └─vroom:::vroom_(...)
      5. └─vroom (local) `<fn>`("/home/runner/.cache/beastier/file28625282cbbbf")
      6.   └─vroom:::check_path(path)
      7.     └─cli::cli_abort(msg, call = call)
      8.       └─rlang::abort(...)
     Execution halted
     ```

