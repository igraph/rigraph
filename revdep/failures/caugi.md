# caugi (1.2.0)

* GitHub mirror: <https://github.com/cran/caugi>

Run `revdepcheck::revdep_details(, "caugi")` for more info

## In both

*   checking whether package ‘caugi’ can be installed ... ERROR
     ```
     Installation failed.
     See ‘<lib>/caugi.Rcheck/00install.out’ for details.
     ```

## Installation

### Devel

```
* installing *source* package ‘caugi’ ...
** this is package ‘caugi’ version ‘1.2.0’
** package ‘caugi’ successfully unpacked and MD5 sums checked
** using staged installation
sh: 1: rustc: not found
Error in value[[3L]](cond) : 
  ----------------------- [RUST NOT FOUND]---------------------------
The 'rustc' compiler was not found on the PATH. Please install
rustc >= 1.80.0 or higher from:
https://www.rust-lang.org/tools/install
...

Alternatively, you may install Rust from your OS package manager:
 - Debian/Ubuntu: apt-get install rustc
 - Fedora/CentOS: dnf install rustc
 - macOS: brew install rust
-------------------------------------------------------------------
Calls: source ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
Execution halted
ERROR: configuration failed for package ‘caugi’
* removing ‘/revdepx/out/caugi.Rcheck/caugi’


```
### CRAN

```
* installing *source* package ‘caugi’ ...
** this is package ‘caugi’ version ‘1.2.0’
** package ‘caugi’ successfully unpacked and MD5 sums checked
** using staged installation
sh: 1: rustc: not found
Error in value[[3L]](cond) : 
  ----------------------- [RUST NOT FOUND]---------------------------
The 'rustc' compiler was not found on the PATH. Please install
rustc >= 1.80.0 or higher from:
https://www.rust-lang.org/tools/install
...

Alternatively, you may install Rust from your OS package manager:
 - Debian/Ubuntu: apt-get install rustc
 - Fedora/CentOS: dnf install rustc
 - macOS: brew install rust
-------------------------------------------------------------------
Calls: source ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
Execution halted
ERROR: configuration failed for package ‘caugi’
* removing ‘/revdepx/out/caugi.Rcheck/caugi’


```
