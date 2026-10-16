# bitriad (0.4)

* Email: <mailto:cornelioid@gmail.com>
* GitHub mirror: <https://github.com/cran/bitriad>

Run `revdepcheck::revdep_details(, "bitriad")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     Running examples in ‘bitriad-Ex.R’ failed
     The error most likely occurred in:
     
     > base::assign(".ptime", proc.time(), pos = "CheckExEnv")
     > ### Name: modes
     > ### Title: Actor and event node iteration and attribute querying and
     > ###   assignment
     > ### Aliases: modes V1 V2 actor_attr event_attr set_actor_attr
     > ###   set_event_attr V1<- V2<-
     > 
     > ### ** Examples
     > 
     > data(women_clique)
     > print(V1(women_clique))
     ── <vertex sequence> 5/10 · named · from bb1857e ───────────────────────────────
     [1] Miss A Miss B Miss C Miss D Miss E
     > print(V2(women_clique))
     ── <vertex sequence> 5/10 · named · from bb1857e ───────────────────────────────
     [1] Bridge   Dinner   Movies   Dance    Visiting
     > V1(women_clique)$label <- LETTERS[1:5]
     Error in `V1<-`(`*tmp*`, value = 1:5) : invalid indexing
     Execution halted
     ```

## In both

*   checking compilation flags used ... NOTE
     ```
     Compilation used the following non-portable flag(s):
       ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’
     ```

