# spopt (0.1.2)

* GitHub mirror: <https://github.com/cran/spopt>

Run `revdepcheck::revdep_details(, "spopt")` for more info

## In both

*   checking whether package ‘spopt’ can be installed ... ERROR
     ```
     Installation failed.
     See ‘<lib>/spopt.Rcheck/00install.out’ for details.
     ```

## Installation

### Devel

```
* installing *source* package ‘spopt’ ...
** this is package ‘spopt’ version ‘0.1.2’
** package ‘spopt’ successfully unpacked and MD5 sums checked
** using staged installation
sh: 1: rustc: not found
Error in value[[3L]](cond) : 
  ----------------------- [RUST NOT FOUND]---------------------------
The 'rustc' compiler was not found on the PATH. Please install
rustc >= 1.70 or higher from:
https://www.rust-lang.org/tools/install
...

Alternatively, you may install Rust from your OS package manager:
 - Debian/Ubuntu: apt-get install rustc
 - Fedora/CentOS: dnf install rustc
 - macOS: brew install rust
-------------------------------------------------------------------
Calls: source ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
Execution halted
ERROR: configuration failed for package ‘spopt’
* removing ‘/revdepx/out/spopt.Rcheck/spopt’


```
### CRAN

```
* installing *source* package ‘spopt’ ...
** this is package ‘spopt’ version ‘0.1.2’
** package ‘spopt’ successfully unpacked and MD5 sums checked
** using staged installation
sh: 1: rustc: not found
Error in value[[3L]](cond) : 
  ----------------------- [RUST NOT FOUND]---------------------------
The 'rustc' compiler was not found on the PATH. Please install
rustc >= 1.70 or higher from:
https://www.rust-lang.org/tools/install
...

Alternatively, you may install Rust from your OS package manager:
 - Debian/Ubuntu: apt-get install rustc
 - Fedora/CentOS: dnf install rustc
 - macOS: brew install rust
-------------------------------------------------------------------
Calls: source ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
Execution halted
ERROR: configuration failed for package ‘spopt’
* removing ‘/revdepx/out/spopt.Rcheck/spopt’


```
