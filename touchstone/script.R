# see `help(run_script, package = 'touchstone')` on how to run this
# interactively

# TODO OPTIONAL Add directories you want to be available in this file or during the
# benchmarks.
# touchstone::pin_assets("some/dir")

# installs branches to benchmark
touchstone::branch_install()

# benchmark a function call from your package (two calls per branch)
touchstone::benchmark_run(
  # expr_before_benchmark = source("dir/data.R"), #<-- TODO OTPIONAL setup before benchmark
  random_test = yourpkg::f(), #<- TODO put the call you want to benchmark here
  n = 2
)

# TODO OPTIONAL benchmark any R expression (six calls per branch)
# touchstone::benchmark_run(
#   more = {
#     if (TRUE) {
#       y <- yourpkg::f2(x = 3)
#     }
#   }, #<- TODO put the call you want to benchmark here
#   n = 6
# )


# create artifacts used downstream in the GitHub Action
touchstone::benchmark_analyze()
