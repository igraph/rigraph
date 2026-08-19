# a5R (0.5.0)

* GitHub mirror: <https://github.com/cran/a5R>

Run `revdepcheck::revdep_details(, "a5R")` for more info

## In both

*   checking whether package ‘a5R’ can be installed ... ERROR
     ```
     Installation failed.
     See ‘<lib>/a5R.Rcheck/00install.out’ for details.
     ```

## Installation

### Devel

```
* installing *source* package ‘a5R’ ...
** this is package ‘a5R’ version ‘0.5.0’
** package ‘a5R’ successfully unpacked and MD5 sums checked
** using staged installation
sh: 1: rustc: not found
Error in value[[3L]](cond) : 
  ----------------------- [RUST NOT FOUND]---------------------------
The 'rustc' compiler was not found on the PATH. Please install
rustc or higher from:
https://www.rust-lang.org/tools/install
...

Alternatively, you may install Rust from your OS package manager:
 - Debian/Ubuntu: apt-get install rustc
 - Fedora/CentOS: dnf install rustc
 - macOS: brew install rust
-------------------------------------------------------------------
Calls: source ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
Execution halted
ERROR: configuration failed for package ‘a5R’
* removing ‘/revdepx/out/a5R.Rcheck/a5R’


```
### CRAN

```
* installing *source* package ‘a5R’ ...
** this is package ‘a5R’ version ‘0.5.0’
** package ‘a5R’ successfully unpacked and MD5 sums checked
** using staged installation
sh: 1: rustc: not found
Error in value[[3L]](cond) : 
  ----------------------- [RUST NOT FOUND]---------------------------
The 'rustc' compiler was not found on the PATH. Please install
rustc or higher from:
https://www.rust-lang.org/tools/install
...

Alternatively, you may install Rust from your OS package manager:
 - Debian/Ubuntu: apt-get install rustc
 - Fedora/CentOS: dnf install rustc
 - macOS: brew install rust
-------------------------------------------------------------------
Calls: source ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
Execution halted
ERROR: configuration failed for package ‘a5R’
* removing ‘/revdepx/out/a5R.Rcheck/a5R’


```
