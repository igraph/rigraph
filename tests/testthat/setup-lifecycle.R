# Surface every lifecycle deprecation as a warning during tests -- including
# soft deprecations, which stay silent for indirect calls by default. This
# keeps the suite honest about internal callers of deprecated signatures:
# a positional call to a migrated function fails a snapshot or bubbles up as
# a test warning here, instead of going unnoticed until the hard-deprecation
# release. Intentional exercises of deprecated interfaces must assert the
# warning explicitly (expect_deprecated(), expect_snapshot(), ...).
options(lifecycle_verbosity = "warning")
