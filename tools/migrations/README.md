# Per-topic migration registries

Each `<topic>.R` file in this directory declares argument-signature
migrations for one group of related functions,
mirroring the R source files (e.g. `conversion.R`, `games.R`).
The files are read by `tools/generate-migrations.R`,
which splices an ARG_HANDLE block into each migrated function;
see [Argument-migration blocks](../README.md#argument-migration-blocks)
for the mechanics.

A function may be declared in only one registry file;
the generator stops with an error on duplicates.

Regenerate the spliced blocks after editing any registry file:

```sh
Rscript tools/generate-migrations.R
```

## Constant defaults

Defaults in migrated (`new`) signatures must be **constant expressions**:
literals, `NULL`/`TRUE`/`FALSE`/`NA*`/`Inf`/`NaN`,
`c()`/`list()` of constants,
a typed empty vector (`integer()`, `numeric()`, ...),
a unary sign,
or the `deprecated()` sentinel.
An empty-sequence default must be spelled as a typed empty vector,
never as `c()`:
`c()` evaluates to `NULL`,
and `NULL` is reserved as the resolve-in-body sentinel.
Anything else -- option lookups, `V(graph)`,
references to other arguments, RNG draws --
is evaluated lazily at an unpredictable time,
invites forcing hazards in the recovery machinery,
and hides the real default from the signature.
The generator stops with an error on any non-constant default;
there is no escape hatch.
Express a complex default as `NULL`
and resolve it in the body
after all arguments are available:

```r
some_fun <- function(graph, ..., vids = NULL) {
  # (generated ARG_HANDLE block)
  if (is.null(vids)) {
    vids <- V(graph)
  }
  ...
}
```

## Entry schema

Every registry file defines a `migrations` list named by function.
Each entry declares the function's signature *before* and *after*
the migration as literal R function objects --
renames and defaults are read straight off their formals:

```r
migrations <- list(
  <fn> = list(
    old  = function(<old positional signature>) {},
    new  = function(<new signature, including `...`>) {},
    when = "<lifecycle version>"
  )
)
```

- `old` --- The pre-migration signature. Only its formal *names* and *order*
  are read -- old default *values* are ignored. A formal whose default is a
  **bare symbol** is the one exception: it declares a rename to that name,
  e.g. `c = c_renamed` means the old `c` argument is the new `c_renamed`.
  Formals without a symbol default keep their name.

- `new` --- The post-migration signature. Must contain exactly one `...`. The
  non-`...` formals are the new-API arguments, in order; their defaults
  become the function's defaults and the values the conflict check compares
  against.

- `when` --- The version string passed to `lifecycle::deprecate_soft(when = )`.

Changing a default as part of a migration is fine: the new default lives in
`new` and is what the recovery uses; the old default is never consulted. The
only caveat is the bare-symbol convention above -- an old argument whose
genuine default is itself a bare symbol would be misread as a rename (rare;
wrap it, e.g. `(sym)`, or reintroduce an explicit rename field if it ever
bites).

## How recovery maps old calls onto the new signature

- Arguments *before* `...` in `new` ("head" args) bind positionally as
  before; they must keep their relative order and names.
- Old positional slots *beyond* the head are recovered from `...`: an
  unnamed value is mapped by position, a (possibly abbreviated) name by
  partial match. Renamed-away old names and abbreviations of the new names
  are both recovered, all under one soft-deprecation.

To reorder or drop an argument, place it *after* `...` in `new`. It then
becomes keyword-only and is recovered by (partial) name rather than by
position, side-stepping the position math entirely.
