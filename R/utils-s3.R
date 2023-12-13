s3_register <- function(generic, class, method = NULL) {
  stopifnot(is.character(generic), length(generic) == 1)
  stopifnot(is.character(class), length(class) == 1)

  pieces <- strsplit(generic, "::")[[1]]
  stopifnot(length(pieces) == 2)
  package <- pieces[[1]]
  generic <- pieces[[2]]

  caller <- parent.frame()

  get_method_env <- function() {
    top <- topenv(caller)
    if (isNamespace(top)) {
      asNamespace(environmentName(top))
    } else {
      caller
    }
  }
  get_method <- function(method) {
    if (is.null(method)) {
      get(paste0(generic, ".", class), envir = get_method_env())
    } else {
      method
    }
  }

  register <- function(...) {
    envir <- asNamespace(package)

    # Refresh the method each time, it might have been updated by
    # `devtools::load_all()`
    method_fn <- get_method(method)
    stopifnot(is.function(method_fn))


    # Only register if generic can be accessed
    if (exists(generic, envir)) {
      registerS3method(generic, class, method_fn, envir = envir)
    } else if (identical(Sys.getenv("NOT_CRAN"), "true")) {
      warn <- .rlang_s3_register_compat("warn")

      warn(c(
        sprintf(
          "Can't find generic `%s` in package %s to register S3 method.",
          generic,
          package
        ),
        "i" = "This message is only shown to developers using devtools.",
        "i" = sprintf("Do you need to update %s to the latest version?", package)
      ))
    }
  }

  # Always register hook in case package is later unloaded & reloaded
  setHook(packageEvent(package, "onLoad"), function(...) {
    register()
  })

  # For compatibility with R < 4.1.0 where base isn't locked
  is_sealed <- function(pkg) {
    identical(pkg, "base") || environmentIsLocked(asNamespace(pkg))
  }

  # Avoid registration failures during loading (pkgload or regular).
  # Check that environment is locked because the registering package
  # might be a dependency of the package that exports the generic. In
  # that case, the exports (and the generic) might not be populated
  # yet (#1225).
  if (isNamespaceLoaded(package) && is_sealed(package)) {
    register()
  }

  invisible()
}

.rlang_s3_register_compat <- function(fn, try_rlang = TRUE) {
  # Compats that behave the same independently of rlang's presence
  out <- switch(
    fn,
    is_installed = return(function(pkg) requireNamespace(pkg, quietly = TRUE))
  )

  # Only use rlang if it is fully loaded (#1482)
  if (try_rlang &&
        requireNamespace("rlang", quietly = TRUE) &&
        environmentIsLocked(asNamespace("rlang"))) {
    switch(
      fn,
      is_interactive = return(rlang::is_interactive)
    )

    # Make sure rlang knows about "x" and "i" bullets
    if (utils::packageVersion("rlang") >= "0.4.2") {
      switch(
        fn,
        abort = return(rlang::abort),
        warn = return((rlang::warn)),
        inform = return(rlang::inform)
      )
    }
  }

  # Fall back to base compats

  is_interactive_compat <- function() {
    opt <- getOption("rlang_interactive")
    if (!is.null(opt)) {
      opt
    } else {
      interactive()
    }
  }

  format_msg <- function(x) paste(x, collapse = "\n")
  switch(
    fn,
    is_interactive = return(is_interactive_compat),
    abort = return(function(msg) stop(format_msg(msg), call. = FALSE)),
    warn = return(function(msg) warning(format_msg(msg), call. = FALSE)),
    inform = return(function(msg) message(format_msg(msg)))
  )

  stop(sprintf("Internal error in rlang shims: Unknown function `%s()`.", fn))
}

