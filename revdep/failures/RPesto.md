# RPesto (0.1.5)

* GitHub mirror: <https://github.com/cran/RPesto>

Run `revdepcheck::revdep_details(, "RPesto")` for more info

## In both

*   checking whether package ‘RPesto’ can be installed ... ERROR
     ```
     Installation failed.
     See ‘<lib>/RPesto.Rcheck/00install.out’ for details.
     ```

## Installation

### Devel

```
* installing *source* package ‘RPesto’ ...
** this is package ‘RPesto’ version ‘0.1.5’
** package ‘RPesto’ successfully unpacked and MD5 sums checked
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
ERROR: configuration failed for package ‘RPesto’
* removing ‘/revdepx/out/RPesto.Rcheck/RPesto’


```
### CRAN

```
* installing *source* package ‘RPesto’ ...
** this is package ‘RPesto’ version ‘0.1.5’
** package ‘RPesto’ successfully unpacked and MD5 sums checked
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
ERROR: configuration failed for package ‘RPesto’
* removing ‘/revdepx/out/RPesto.Rcheck/RPesto’


```
