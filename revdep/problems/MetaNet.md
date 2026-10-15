# MetaNet (0.3.2)

* GitHub: <https://github.com/Asa12138/MetaNet>
* Email: <mailto:bfzede@gmail.com>
* GitHub mirror: <https://github.com/cran/MetaNet>

Run `revdepcheck::revdep_details(, "MetaNet")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘MetaNet-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: zp_analyse
     > ### Title: Zi-Pi calculate
     > ### Aliases: zp_analyse zp_plot
     > 
     > ### ** Examples
     > 
     > data("c_net")
     > module_detect(co_net) -> co_net_modu
     > zp_analyse(co_net_modu) -> co_net_modu
     Error in deter_role(x["Pi"], x["Zi"], backs) : object 'role' not found
     Calls: zp_analyse -> apply -> FUN -> deter_role
     Execution halted
     ```

