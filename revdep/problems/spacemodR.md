# spacemodR (0.1.3)

* Email: <mailto:virgile.baudrot@qonfluens.com>
* GitHub mirror: <https://github.com/cran/spacemodR>

Run `revdepcheck::revdep_details(, "spacemodR")` for more info

## Newly broken

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     17: withRestartList(expr, restarts)
     18: withRestarts(with_handlers({    for (expr in tle$exprs) {        ev <- withVisible(eval(expr, envir))        watcher$capture_plot_and_output()        watcher$print_value(ev$value, ev$visible, envir)    }    TRUE}, handlers), eval_continue = function() TRUE, eval_stop = function() FALSE)
     19: evaluate::evaluate(...)
     20: evaluate(code, envir = env, new_device = FALSE, keep_warning = if (is.numeric(options$warning)) TRUE else options$warning,     keep_message = if (is.numeric(options$message)) TRUE else options$message,     stop_on_error = if (is.numeric(options$error)) options$error else {        if (options$error && options$include)             0L        else 2L    }, output_handler = knit_handlers(options$render, options))
     21: in_dir(input_dir(), expr)
     22: in_input_dir(evaluate(code, envir = env, new_device = FALSE,     keep_warning = if (is.numeric(options$warning)) TRUE else options$warning,     keep_message = if (is.numeric(options$message)) TRUE else options$message,     stop_on_error = if (is.numeric(options$error)) options$error else {        if (options$error && options$include)             0L        else 2L    }, output_handler = knit_handlers(options$render, options)))
     23: eng_r(options)
     24: block_exec(params)
     25: call_block(x)
     26: process_group(group)
     27: withCallingHandlers(if (tangle) process_tangle(group) else process_group(group),     error = function(e) {        if (progress && is.function(pb$interrupt))             pb$interrupt()        if (is_R_CMD_build() || is_R_CMD_check())             error <<- format(e)    })
     28: with_options(withCallingHandlers(if (tangle) process_tangle(group) else process_group(group),     error = function(e) {        if (progress && is.function(pb$interrupt))             pb$interrupt()        if (is_R_CMD_build() || is_R_CMD_check())             error <<- format(e)    }), list(rlang_trace_top_env = knit_global()))
     29: xfun:::handle_error(with_options(withCallingHandlers(if (tangle) process_tangle(group) else process_group(group),     error = function(e) {        if (progress && is.function(pb$interrupt))             pb$interrupt()        if (is_R_CMD_build() || is_R_CMD_check())             error <<- format(e)    }), list(rlang_trace_top_env = knit_global())), function(loc) {    setwd(wd)    write_utf8(res, output %n% stdout())    paste0("\nQuitting from ", loc, if (!is.null(error))         paste0("\n", rule(), error, "\n", rule()))}, if (labels[i] != "") sprintf(" [%s]", labels[i]), get_loc)
     30: process_file(text, output)
     31: knitr::knit(knit_input, knit_output, envir = envir, quiet = quiet)
     32: rmarkdown::render(file, encoding = encoding, quiet = quiet, envir = globalenv(),     output_dir = getwd(), ...)
     33: vweave_rmarkdown(...)
     34: engine$weave(file, quiet = quiet, encoding = enc)
     35: doTryCatch(return(expr), name, parentenv, handler)
     36: tryCatchOne(expr, names, parentenv, handlers[[1L]])
     37: tryCatchList(expr, classes, parentenv, handlers)
     38: tryCatch({    engine$weave(file, quiet = quiet, encoding = enc)    setwd(startdir)    output <- find_vignette_product(name, by = "weave", engine = engine)    if (!have.makefile && vignette_is_tex(output)) {        texi2pdf(file = output, clean = FALSE, quiet = quiet)        output <- find_vignette_product(name, by = "texi2pdf",             engine = engine)    }    outputs <- c(outputs, output)}, error = function(e) {    thisOK <<- FALSE    fails <<- c(fails, file)    message(gettextf("Error: processing vignette '%s' failed with diagnostics:\n%s",         file, conditionMessage(e)))})
     39: tools::buildVignettes(dir = "<lib>/spacemodR.Rcheck/vign_test/spacemodR",     skip = TRUE, ser_elibs = "/tmp/RtmpwcJdfw/filee3b3058d6.rds")
     An irrecoverable exception occurred. R is aborting now ...
     Segmentation fault (core dumped)
     ```

