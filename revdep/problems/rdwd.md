# rdwd (1.9.17)

* GitHub: <https://github.com/brry/rdwd>
* Email: <mailto:berry-b@gmx.de>
* GitHub mirror: <https://github.com/cran/rdwd>

Run `revdepcheck::revdep_details(, "rdwd")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘rdwd-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: plotDWD
     > ### Title: Quickly plot time series
     > ### Aliases: plotDWD
     > ### Keywords: hplot
     > 
     > ### ** Examples
     > 
     > link <- selectDWD("Potsdam", res="daily", var="kl", per="r")
     > clim <- dataDWD(link, dir=locdir(), varnames=TRUE)
     dataDWD -> dirDWD: adding to directory '/home/runner/.cache/R/rdwd'
     dataDWD: 1 file already existing and not downloaded again:  'daily_kl_recent_tageswerte_KL_03987_akt.zip'
     Now downloading 0 files...
     Reading 1 file with readDWD.data() and fread=TRUE ...
     Error: dataDWD -> readDWD -> lapply -> FUN: failure reading file:
     /home/runner/.cache/R/rdwd/daily_kl_recent_tageswerte_KL_03987_akt.zip
     Error in unzip(file, list = TRUE) : 
       zip file '/home/runner/.cache/R/rdwd/daily_kl_recent_tageswerte_KL_03987_akt.zip' cannot be opened
     Execution halted
     ```

