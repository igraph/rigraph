# BCT

<details>

* Version: 1.2
* GitHub: NA
* Source code: https://github.com/cran/BCT
* Date/Publication: 2022-05-12 14:00:05 UTC
* Number of recursive dependencies: 13

Run `revdepcheck::cloud_details(, "BCT")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘BCT-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: draw_models
    > ### Title: Plot the results of the BCT and kBCT functions
    > ### Aliases: draw_models
    > 
    > ### ** Examples
    > 
    > 
    > # Use the pewee dataset as an example:
    > q <- BCT(pewee, 5) # maximum depth of 5
    > 
    > draw_models(q)
    Error in igraph::graph.lattice(length(subwords) + 1, directed = TRUE) : 
      argument "circular" is missing, with no default
    Calls: draw_models -> show_tree -> <Anonymous>
    Execution halted
    ```

## In both

*   checking C++ specification ... NOTE
    ```
      Specified C++11: please drop specification unless essential
    ```

# netropy

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/netropy
* Date/Publication: 2022-02-02 08:20:02 UTC
* Number of recursive dependencies: 85

Run `revdepcheck::cloud_details(, "netropy")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘netropy-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: assoc_graph
    > ### Title: Association Graphs
    > ### Aliases: assoc_graph
    > 
    > ### ** Examples
    > 
    > library(ggraph)
    Loading required package: ggplot2
    > # use internal data set
    > data(lawdata)
    > df.att <- lawdata[[4]]
    > 
    > # three steps of data editing:
    > # 1. categorize variables 'years' and 'age' based on
    > # approximately three equally size groups (values based on cdf)
    > # 2. make sure all outcomes start from the value 0 (optional)
    > # 3. remove variable 'senior' as it consists of only unique values (thus redundant)
    > df.att.ed <- data.frame(
    +    status   = df.att$status,
    +    gender   = df.att$gender,
    +    office   = df.att$office-1,
    +    years    = ifelse(df.att$years<=3,0,
    +               ifelse(df.att$years<=13,1,2)),
    +    age      = ifelse(df.att$age<=35,0,
    +                 ifelse(df.att$age<=45,1,2)),
    +    practice = df.att$practice,
    +    lawschool= df.att$lawschool-1)
    > 
    > # association graph based on cutoff 0.15
    > assoc_graph(df.att.ed, 0.15)
    Error in igraph::distances(g) : 
      At vendor/cigraph/src/paths/dijkstra.c:128 : Weights must not contain NaN values. Invalid value
    Calls: assoc_graph ... layout_with_stress -> .layout_with_stress_dim -> <Anonymous>
    Execution halted
    ```

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘joint_entropies.Rmd’
      ...
    21    0         4        45
    
    > library(ggraph)
    Loading required package: ggplot2
    
    > assoc_graph(dyad.var, 0.15)
    
      When sourcing ‘joint_entropies.R’:
    Error: At vendor/cigraph/src/paths/dijkstra.c:128 : Weights must not contain NaN values. Invalid value
    Execution halted
    
      ‘joint_entropies.Rmd’ using ‘UTF-8’... failed
      ‘prediction_power.Rmd’ using ‘UTF-8’... OK
      ‘univariate_bivariate_trivariate.Rmd’ using ‘UTF-8’... OK
      ‘variable_domains.Rmd’ using ‘UTF-8’... OK
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘joint_entropies.Rmd’ using rmarkdown
    
    Quitting from lines 96-98 [assoc_g] (joint_entropies.Rmd)
    Error: processing vignette 'joint_entropies.Rmd' failed with diagnostics:
    At vendor/cigraph/src/paths/dijkstra.c:128 : Weights must not contain NaN values. Invalid value
    --- failed re-building ‘joint_entropies.Rmd’
    
    --- re-building ‘prediction_power.Rmd’ using rmarkdown
    --- finished re-building ‘prediction_power.Rmd’
    
    --- re-building ‘univariate_bivariate_trivariate.Rmd’ using rmarkdown
    --- finished re-building ‘univariate_bivariate_trivariate.Rmd’
    
    --- re-building ‘variable_domains.Rmd’ using rmarkdown
    --- finished re-building ‘variable_domains.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘joint_entropies.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# rmcfs

<details>

* Version: 1.3.5
* GitHub: NA
* Source code: https://github.com/cran/rmcfs
* Date/Publication: 2021-09-18 13:30:02 UTC
* Number of recursive dependencies: 65

Run `revdepcheck::cloud_details(, "rmcfs")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Complete output:
      > library(testthat)
      > library(rmcfs)
      Loading required package: rJava
      
        #######################
        # rmcfs version 1.3.5 #
        #######################
        If used please cite the following paper: 
        M. Draminski, J. Koronacki (2018), 
        rmcfs: An R Package for Monte Carlo Feature Selection and Interdependency Discovery,
        Journal of Statistical Software, vol 85(12), 1-28, doi:10.18637/jss.v085.i12.
      > test_check("rmcfs")
                X1        X2        X3         X4         X5         X6         X7
      1  0.3390729 0.6827881 0.9614099 0.02778712 0.48614910 0.43471764 0.02274122
      2  0.8394404 0.6015412 0.1001408 0.52731078 0.06380247 0.51473265 0.93913671
      3  0.3466835 0.2388687 0.7632227 0.88031907 0.78454623 0.66301097 0.29294872
      4  0.3337749 0.2581659 0.9479664 0.37306337 0.41832164 0.14316659 0.16432657
      5  0.4763512 0.7293096 0.8186347 0.04795913 0.98101808 0.34448739 0.39910256
      6  0.8921983 0.4525708 0.3082923 0.13862825 0.28288396 0.40576358 0.45957541
      7  0.8643395 0.1751268 0.6495795 0.32149212 0.84788215 0.08531101 0.43403085
      8  0.3899895 0.7466983 0.9533555 0.15483161 0.08223923 0.93257193 0.51700983
      9  0.7773207 0.1049876 0.9537327 0.13222817 0.88645875 0.83838407 0.84624575
      10 0.9606180 0.8645449 0.3399792 0.22130593 0.47193073 0.87943330 0.05516429
                X8         X9        X10
      1  0.6547329 0.85750154 0.92974321
      2  0.1328278 0.37088354 0.90093927
      3  0.3418099 0.31420183 0.75088219
      4  0.7313716 0.82853436 0.67656877
      5  0.9072914 0.45184151 0.64801345
      6  0.6961970 0.31587841 0.07324687
      7  0.2415792 0.09780854 0.42355842
      8  0.6441072 0.06490054 0.53082436
      9  0.2807502 0.68945737 0.94270476
      10 0.9576365 0.66805060 0.71222456
      
      
                X27        X28        X29       X30 A1 A2 B1 B2 C1 C2 class
      60 0.22730045 0.32639993 0.53409931 0.3797047  0  0  B  B  0  0     B
      61 0.16826293 0.29429765 0.81091625 0.7799683  0  0  0  0  C  C     C
      62 0.14976251 0.82289798 0.65090651 0.9615772  0  0  0  0  0  0     C
      63 0.64809716 0.41434742 0.77098111 0.4439984  0  0  0  0  C  C     C
      64 0.48557255 0.01017122 0.03455832 0.2765765  0  0  0  0  0  0     C
      65 0.69324432 0.05240839 0.55866028 0.6528749  0  0  0  0  C  C     C
      66 0.28966946 0.73037038 0.12008737 0.7547240  0  0  0  0  0  0     C
      67 0.97867166 0.07339495 0.68629963 0.5887064  0  0  0  0  C  C     C
      68 0.28812633 0.07035663 0.91412566 0.3668981  0  0  0  0  C  C     C
      69 0.52576452 0.63717197 0.56034976 0.5093910  0  0  0  0  0  0     C
      70 0.07782227 0.41330587 0.57557604 0.1442291  0  0  0  0  C  C     C
      class: 'data.frame' size: 70 x 37           X1        X2         X3         X4         X5         X6         X7
      1  0.53509718 0.7440799 0.70465551 0.58037379 0.62995162 0.45447665 0.33625348
      2  0.24689369 0.8384462 0.91905136 0.09076585 0.45587724 0.49380877 0.14465036
      3  0.92234682 0.7993568 0.61013655 0.65609916 0.25400483 0.52620712 0.86807104
      4  0.75348962 0.8936403 0.05585486 0.35750658 0.05748599 0.38301289 0.05432263
      5  0.90350731 0.8311370 0.73615214 0.23402548 0.43530320 0.92889790 0.61388308
      6  0.65154816 0.3707501 0.90396792 0.91643034 0.77113498 0.43341785 0.78563030
      7  0.02077916 0.8719798 0.70181488 0.03055500 0.12915545 0.24476248 0.57944665
      8  0.09587903 0.8007616 0.57769951 0.43907404 0.98391626 0.87625727 0.52716948
      9  0.94958696 0.1772845 0.56583925 0.97369032 0.81417693 0.18265992 0.41051341
      10 0.88817659 0.1632777 0.36717551 0.39914081 0.98168090 0.09032375 0.73052316
                 X8        X9       X10
      1  0.74771232 0.9503260 0.6835156
      2  0.71771862 0.9001683 0.5493564
      3  0.09516487 0.6939464 0.6202255
      4  0.47922473 0.8362239 0.2962362
      5  0.12714205 0.4631887 0.2844997
      6  0.26423701 0.6290997 0.6019828
      7  0.22704179 0.4391008 0.1676721
      8  0.18450321 0.9699211 0.9173871
      9  0.01725596 0.2795489 0.9909104
      10 0.93482027 0.9794688 0.7476684
      
      
                 X7          X8        X9        X10 A1 A2 B1 B2 C1 C2 class
      60 0.82457067 0.748439821 0.5923369 0.53276926  0  0  B  B  0  0     B
      61 0.52929045 0.952518457 0.9101575 0.11142191  0  0  0  0  C  C     C
      62 0.43723560 0.362614568 0.3939510 0.77589348  0  0  0  0  0  0     C
      63 0.05642579 0.346293530 0.9642003 0.06293980  0  0  0  0  C  C     C
      64 0.24777458 0.454230331 0.2550940 0.70528527  0  0  0  0  C  C     C
      65 0.39808635 0.668704697 0.1407718 0.04925588  0  0  0  0  C  C     C
      66 0.11121328 0.529091748 0.5252544 0.78131666  0  0  0  0  0  0     C
      67 0.42162257 0.002821188 0.4540667 0.78413926  0  0  0  0  0  0     C
      68 0.23918923 0.861873356 0.5217224 0.55257574  0  0  0  0  0  0     C
      69 0.85053229 0.556885670 0.0856974 0.85510841  0  0  0  0  C  C     C
      70 0.22702517 0.901919867 0.5975495 0.20987204  0  0  0  0  C  C     C
      class: 'data.frame' size: 70 x 17Checking input data...
      Exporting params...
      Exporting input data...
      Running MCFS-ID...
      ##################################################
      #####        dmLab 2.3.4 [2021.07.08]        #####
      ##################################################
      Created by Michal Draminski [michal.draminski@ipipan.waw.pl]
      http://www.ipipan.eu/staff/m.draminski/
      Polish Academy of Sciences - Institute of Computer Science
      ##################################################
      
      Warning! Value of cutoffPermutations = 0 and cutoffMethod = 'permutations'. Using cutoffMethod = 'mean'.
      
      **************************
      *** MCFS-ID Experiment ***
      **************************
      Loading header: 'input.adh'...
      Loading data: 'input.csv'...
      70 objects and 17 attributes to load... Done
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 4, projections(s) = 200, splits(t) = 5
      Start time: Tue Jul 02 07:40:39 UTC 2024
      Running: 2 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [======>                                                               ]  10% Time: 00:00 ETA: --:--    
      [=============>                                                        ]  20% Time: 00:00 ETA: --:--    
      [====================>                                                 ]  30% Time: 00:00 ETA: --:--    
      [===========================>                                          ]  40% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  50% Time: 00:00 ETA: --:--    
      [=========================================>                            ]  60% Time: 00:00 ETA: --:--    
      [================================================>                     ]  70% Time: 00:00 ETA: --:--    
      [=======================================================>              ]  80% Time: 00:00 ETA: --:--    
      [==============================================================>       ]  90% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00               
      1000 trees built within 1.0 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 80.46%
      WeightedAccuracy = 70.92%
      
      Cutoff RI (based on linear regression angle) = 0.0451185
      Cutoff RI (based on k-means clustering) = 0.3971068
      Cutoff RI (based on mean cutoff value) = 0.0451185
      Important attributes (based on mean cutoff value) = 6
      *** MCFS-ID Processing is done. Time: 1.1 s. ***
      
      Reading results...
      Done.
      Selected 6 nodes and 12 edges.
                  X1         X2          X3         X4         X5          X6
      1  0.212941627 0.32259978 0.068299279 0.49303546 0.08453311 0.197323455
      2  0.946402830 0.61844805 0.130542241 0.10290711 0.33361065 0.792430558
      3  0.345473791 0.59392818 0.146773063 0.40479039 0.07040867 0.947512934
      4  0.405422623 0.04812483 0.860316695 0.05246878 0.70507985 0.071240221
      5  0.536541352 0.39381200 0.949276015 0.03656734 0.07419950 0.371038995
      6  0.275828688 0.31159812 0.896443296 0.23109615 0.32501378 0.669765127
      7  0.405671409 0.43268042 0.113651731 0.97980273 0.35894192 0.009998357
      8  0.435509188 0.35949101 0.793385952 0.04629398 0.38833262 0.749893881
      9  0.322054159 0.74693284 0.004317772 0.13195064 0.78544337 0.985846242
      10 0.003435689 0.95245622 0.698139910 0.92844045 0.60434824 0.273909658
                  X7          X8        X9       X10
      1  0.755911492 0.621500159 0.3899180 0.2825466
      2  0.899729525 0.715610913 0.1276254 0.0551484
      3  0.308047227 0.006459725 0.9787065 0.9982455
      4  0.556854023 0.150810371 0.1611711 0.9606097
      5  0.999194679 0.390337652 0.1158990 0.1403129
      6  0.202094245 0.714161876 0.7860697 0.9566023
      7  0.005399961 0.290325600 0.9052935 0.8806996
      8  0.304086372 0.837331551 0.5998701 0.2326705
      9  0.496753415 0.809496423 0.3001367 0.8077412
      10 0.028377163 0.181867694 0.2260461 0.9273090
      
      
                 X7         X8        X9        X10 A1 A2 B1 B2 C1 C2 class
      60 0.99415022 0.52001874 0.7344113 0.14549320  0  0  0  0  0  0     B
      61 0.83573589 0.22437866 0.2762943 0.42770355  0  0  0  0  C  C     C
      62 0.72685534 0.42713241 0.3515303 0.28976193  0  0  0  0  C  C     C
      63 0.40742995 0.76241285 0.8684239 0.33320559  0  0  0  0  0  0     C
      64 0.95852635 0.59382830 0.7705493 0.38924415  0  0  0  0  C  C     C
      65 0.80196490 0.71950937 0.9914391 0.33556065  0  0  0  0  C  C     C
      66 0.70485195 0.28409134 0.9776807 0.10902903  0  0  0  0  C  C     C
      67 0.74343472 0.44167497 0.3433687 0.08789696  0  0  0  0  C  C     C
      68 0.04116168 0.75138835 0.8932992 0.90448572  0  0  0  0  0  0     C
      69 0.05585319 0.93409234 0.6443492 0.42207226  0  0  0  0  0  0     C
      70 0.89679041 0.07141334 0.2940574 0.03089679  0  0  0  0  0  0     C
      class: 'data.frame' size: 70 x 17Checking input data...
      Exporting params...
      Exporting input data...
      Running MCFS-ID...
      ##################################################
      #####        dmLab 2.3.4 [2021.07.08]        #####
      ##################################################
      Created by Michal Draminski [michal.draminski@ipipan.waw.pl]
      http://www.ipipan.eu/staff/m.draminski/
      Polish Academy of Sciences - Institute of Computer Science
      ##################################################
      
      ***************************************************
      *** MCFS-ID Cutoff Permutation Experiment #1/3 ***
      ***************************************************
      Loading header: 'input.adh'...
      Loading data: 'input.csv'...
      70 objects and 17 attributes to load... Done
      Pearson's correlation of shuffled decision: -0.0199
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 4, projections(s) = 200, splits(t) = 5
      Start time: Tue Jul 02 07:40:40 UTC 2024
      Running: 2 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [======>                                                               ]  10% Time: 00:00 ETA: --:--    
      [=============>                                                        ]  20% Time: 00:00 ETA: --:--    
      [====================>                                                 ]  30% Time: 00:00 ETA: --:--    
      [===========================>                                          ]  40% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  50% Time: 00:00 ETA: --:--    
      [=========================================>                            ]  60% Time: 00:00 ETA: --:--    
      [================================================>                     ]  70% Time: 00:00 ETA: --:--    
      [=======================================================>              ]  80% Time: 00:00 ETA: --:--    
      [==============================================================>       ]  90% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00               
      1000 trees built within 0.558 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 49.52%
      WeightedAccuracy = 32.57%
      
      Cutoff RI (based on linear regression angle) = 0.0215044
      Cutoff RI (based on k-means clustering) = 0.0188137
      Cutoff RI (based on mean cutoff value) = 0.0188137
      Important attributes (based on mean cutoff value) = 6
      
      ***************************************************
      *** MCFS-ID Cutoff Permutation Experiment #2/3 ***
      ***************************************************
      Loading header: 'input.adh'...
      Loading data: 'input.csv'...
      70 objects and 17 attributes to load... Done
      Pearson's correlation of shuffled decision: -0.1199
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 4, projections(s) = 200, splits(t) = 5
      Start time: Tue Jul 02 07:40:41 UTC 2024
      Running: 2 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [======>                                                               ]  10% Time: 00:00 ETA: --:--    
      [=============>                                                        ]  20% Time: 00:00 ETA: --:--    
      [====================>                                                 ]  30% Time: 00:00 ETA: --:--    
      [===========================>                                          ]  40% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  50% Time: 00:00 ETA: --:--    
      [=========================================>                            ]  60% Time: 00:00 ETA: --:--    
      [================================================>                     ]  70% Time: 00:00 ETA: --:--    
      [=======================================================>              ]  80% Time: 00:00 ETA: --:--    
      [==============================================================>       ]  90% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00               
      1000 trees built within 0.477 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 50.85%
      WeightedAccuracy = 32.23%
      
      Cutoff RI (based on linear regression angle) = 0.0088045
      Cutoff RI (based on k-means clustering) = 0.0167241
      Cutoff RI (based on mean cutoff value) = 0.0088045
      Important attributes (based on mean cutoff value) = 6
      
      ***************************************************
      *** MCFS-ID Cutoff Permutation Experiment #3/3 ***
      ***************************************************
      Loading header: 'input.adh'...
      Loading data: 'input.csv'...
      70 objects and 17 attributes to load... Done
      Pearson's correlation of shuffled decision: 0.2000
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 4, projections(s) = 200, splits(t) = 5
      Start time: Tue Jul 02 07:40:41 UTC 2024
      Running: 2 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [======>                                                               ]  10% Time: 00:00 ETA: --:--    
      [=============>                                                        ]  20% Time: 00:00 ETA: --:--    
      [====================>                                                 ]  30% Time: 00:00 ETA: --:--    
      [===========================>                                          ]  40% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  50% Time: 00:00 ETA: --:--    
      [=========================================>                            ]  60% Time: 00:00 ETA: --:--    
      [================================================>                     ]  70% Time: 00:00 ETA: --:--    
      [=======================================================>              ]  80% Time: 00:00 ETA: --:--    
      [==============================================================>       ]  90% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00               
      1000 trees built within 0.426 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 50.74%
      WeightedAccuracy = 33.26%
      
      Cutoff RI (based on linear regression angle) = 0.0138890
      Cutoff RI (based on k-means clustering) = 0.0206007
      Cutoff RI (based on mean cutoff value) = 0.0138890
      Important attributes (based on mean cutoff value) = 6
      
      **************************
      *** MCFS-ID Experiment ***
      **************************
      Loading header: 'input.adh'...
      Loading data: 'input.csv'...
      70 objects and 17 attributes to load... Done
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 4, projections(s) = 200, splits(t) = 5
      Start time: Tue Jul 02 07:40:42 UTC 2024
      Running: 2 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [======>                                                               ]  10% Time: 00:00 ETA: --:--    
      [=============>                                                        ]  20% Time: 00:00 ETA: --:--    
      [====================>                                                 ]  30% Time: 00:00 ETA: --:--    
      [===========================>                                          ]  40% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  50% Time: 00:00 ETA: --:--    
      [=========================================>                            ]  60% Time: 00:00 ETA: --:--    
      [================================================>                     ]  70% Time: 00:00 ETA: --:--    
      [=======================================================>              ]  80% Time: 00:00 ETA: --:--    
      [==============================================================>       ]  90% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00               
      1000 trees built within 0.337 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 81.93%
      WeightedAccuracy = 71.54%
      
      Cutoff RI (based on linear regression angle) = 0.0234060
      Cutoff RI (based on k-means clustering) = 0.4045024
      Cutoff RI (based on mean cutoff value) = 0.0234060
      Important attributes (based on mean cutoff value) = 6
      *** Calculation of cutoff RI (based on permutations) ***
      Max RI (raw data) = 0.73927444
      Max RI (after permutations) = [0.028411873, 0.026256735, 0.030712826]
      Anderson-Darling normality test p-value = 0.6288263
      Confidence Interval: 0.0229247 ; 0.0339962
      Cutoff RI (based on permutations) = 0.0339962
      Important attributes (based on permutations) = 6
      *** Calculation of cutoff ID ***
      Anderson-Darling normality test p-value = 0.4382706
      Confidence Interval: 6.1791203 ; 8.0145139
      Cutoff ID (based on permutations)  = 8.0145139
      *** Final Important attributes (based on permutations) = 6
      *** MCFS-ID Processing is done. Time: 1.8 s. ***
      
      Reading results...
      Done.
      ##### MCFS-ID result (s = auto, t = 5, m = auto) #####
      Target feature: 'class'
      
      Top 6 features:
       position attribute        RI
              1        A2 0.7392744
              2        A1 0.7040163
              3        B1 0.4270796
              4        B2 0.4045025
              5        C1 0.2748785
              6        C2 0.2224798
      
      #################################
      Cutoff values:
              method      minRI size    minID
       criticalAngle 0.02340608    7       NA
              kmeans 0.40450248    4       NA
        permutations 0.03399624    6 8.014514
                mean 0.02340608    6       NA
      
      #################################
      Confusion matrix obtained on randomly selected (st) datasets:
      Confusion Matrix:
      
            A    B    C
      A 13588  366  186
      B  1352 5395  323
      C  1416  918 1706
      
      TPR (sensitivity/recall):
      
           TPR
      1 96.1 %
      2 76.3 %
      3 42.2 %
      
      Accuracy: 81.9 %
      wAccuracy: 71.5 %
      
      #################################
      MCFS-ID execution time: 2 secs
               method      minRI size    minID
      1 criticalAngle 0.02340608    7       NA
      2        kmeans 0.40450248    4       NA
      3  permutations 0.03399624    6 8.014514
      4          mean 0.02340608    6       NA
      [1] 6
         projection distance commonPart mAvg beta1
      1          30    1.000          1    0     0
      2          40    0.750          1    0     0
      3          50    0.500          1    0     0
      4          60    0.750          1    0     0
      5          70    0.625          1    0     0
      6          80    0.750          1    0     0
      7          90    0.125          1    0     0
      8         100    0.250          1    0     0
      9         110    0.250          1    0     0
      10        120    0.375          1    0     0
      11        130    0.250          1    0     0
      12        140    0.000          1    0     0
      13        150    0.000          1    0     0
      14        160    0.000          1    0     0
      15        170    0.000          1    0     0
      16        180    0.125          1    0     0
      17        190    0.000          1    0     0
      18        200    0.250          1    0     0
         position attribute projections classifiers     nodes          RI
      12        1        A2          59  0.90508470 0.9050847 0.739274440
      11        2        A1          54  0.84444445 0.8444445 0.704016270
      13        3        B1          54  0.89629630 0.8962963 0.427079650
      14        4        B2          60  0.86333334 0.8633333 0.404502480
      15        5        C1          51  0.86274510 0.8627451 0.274878470
      16        6        C2          39  0.73846155 0.7384616 0.222479780
      2         7        X2          45  0.36888888 0.5911111 0.023406085
      8         8        X8          46  0.32173914 0.5173913 0.020704733
      3         9        X3          40  0.20500000 0.4050000 0.011209555
      5        10        X5          58  0.24482758 0.3275862 0.010157373
      7        11        X7          52  0.20769231 0.2653846 0.010091832
      10       12       X10          59  0.20677966 0.3864407 0.010027862
      9        13        X9          35  0.14857143 0.2514286 0.007577793
      1        14        X1          61  0.18032786 0.2688525 0.007436589
      6        15        X6          50  0.17200000 0.2520000 0.006043765
      4        16        X4          45  0.08888889 0.1288889 0.003236524
         position edge_a edge_b     weight
      1         1     A2     B1 21.0645540
      2         2     A1     B2 16.8582150
      3         3     B1     C2 16.0082470
      4         4     B1     C1 14.6665200
      5         5     A1     C2 10.5145670
      6         6     A1     C1  9.9006460
      7         7     A2     B2  9.0048310
      8         8     A2     C1  8.7795830
      9         9     B2     C1  8.5823240
      10       10     A1     B1  5.9749546
      11       11     A2     C2  5.4840190
      12       12     B2     C2  4.2234870
      13       13     C1     X8  3.3031990
      14       14     B2     X2  3.1769930
      15       15    X10     X5  3.1326427
      16       16     B2     A2  2.8444445
      17       17     B1     X2  2.3783865
      18       18     X3     X5  2.2166020
      19       19     C2     X8  2.0978599
      20       20     X8     X1  1.7968507
      21       21     X2     X7  1.7524443
      22       22     X5     X7  1.6569053
      23       23     A2     X2  1.6558274
      24       24     X1    X10  1.6187991
      25       25     X6     X3  1.5199533
      26       26     B2     X1  1.5082688
      27       27     B1     X7  1.4785967
      28       28    X10     X1  1.4690706
      29       29     X2     X5  1.4619606
      30       30     X5     X3  1.4528583
      31       31    X10     X9  1.4481974
      32       32     B1     X1  1.4239199
      33       33     C1     X7  1.4212025
      34       34    X10     X6  1.4188985
      35       35     X8    X10  1.4081683
      36       36     B2    X10  1.3209305
      37       37     C1     X2  1.3117471
      38       38     X2     X9  1.3068573
      39       39    X10     X3  1.2095273
      40       40     X5    X10  1.2058706
      41       41    X10     X7  1.2030488
      42       42     X2     X3  1.1794013
      43       43     B2     X5  1.1487597
      44       44     X7    X10  1.1431442
      45       45     X3     X6  1.0868700
      46       46     B1     X5  1.0511171
      47       47     B1    X10  1.0388901
      48       48     X2     X4  1.0143764
      49       49     X1     X9  0.9942785
      50       50     X1     X7  0.9924656
      Selected 6 nodes and 18 edges.
                 X1         X2         X3          X4         X5         X6        X7
      1  0.98902563 0.23116906 0.78483548 0.821803022 0.71088721 0.58821497 0.7953894
      2  0.61944825 0.35058203 0.15437349 0.901695312 0.94776216 0.16505500 0.2390703
      3  0.23737288 0.45833595 0.01229192 0.982507341 0.98118909 0.04182482 0.1220222
      4  0.36166464 0.07219098 0.08223544 0.265951080 0.05589952 0.46236715 0.3614041
      5  0.74262232 0.24336907 0.51909300 0.787098370 0.24540161 0.16827440 0.9249142
      6  0.19731734 0.51825450 0.06829250 0.190747030 0.27093381 0.28979740 0.9916906
      7  0.02621423 0.50125444 0.81059233 0.003749102 0.90914956 0.33389940 0.5886450
      8  0.07198397 0.67452979 0.07985544 0.556995859 0.37703354 0.40293417 0.7091866
      9  0.58183258 0.19954013 0.15471898 0.409749276 0.27505538 0.58770520 0.9662458
      10 0.60420706 0.52295278 0.06729615 0.922948800 0.17823044 0.25630289 0.8941283
                 X8         X9        X10
      1  0.26332041 0.65081538 0.67427900
      2  0.38240303 0.90531400 0.33779017
      3  0.54840561 0.74012889 0.93212196
      4  0.48009363 0.84171712 0.48498619
      5  0.17678015 0.04423991 0.48679400
      6  0.19423089 0.42327280 0.88244506
      7  0.19061488 0.87393955 0.48127444
      8  0.30924269 0.17536434 0.45792697
      9  0.39395822 0.34876159 0.02776961
      10 0.08136956 0.62184478 0.58021427
      
      
                X7         X8        X9         X10 A1 A2 B1 B2 C1 C2 class
      60 0.4571018 0.65831274 0.9851356 0.097424099  0  0  B  B  0  0     B
      61 0.3793650 0.82178514 0.6029888 0.008888587  0  0  0  0  C  C     C
      62 0.3447140 0.77345445 0.9146233 0.335543330  0  0  0  0  0  0     C
      63 0.2475398 0.03647023 0.2361436 0.951405642  0  0  0  0  C  C     C
      64 0.9009008 0.04317233 0.3525739 0.344889228  0  0  0  0  0  0     C
      65 0.6683702 0.05624382 0.9630998 0.969437987  0  0  0  0  C  C     C
      66 0.4350037 0.57622864 0.2180650 0.523872372  0  0  0  0  C  C     C
      67 0.5990060 0.48291037 0.8727669 0.013034772  0  0  0  0  C  C     C
      68 0.8610901 0.12267192 0.8969003 0.751962328  0  0  0  0  0  0     C
      69 0.9639909 0.39747332 0.3908880 0.088308024  0  0  0  0  0  0     C
      70 0.7672535 0.26049222 0.6209638 0.941725152  0  0  0  0  C  C     C
      class: 'data.frame' size: 70 x 17Checking input data...
      Exporting params...
      Exporting input data...
      Running MCFS-ID...
      ##################################################
      #####        dmLab 2.3.4 [2021.07.08]        #####
      ##################################################
      Created by Michal Draminski [michal.draminski@ipipan.waw.pl]
      http://www.ipipan.eu/staff/m.draminski/
      Polish Academy of Sciences - Institute of Computer Science
      ##################################################
      
      Warning! Value of cutoffPermutations = 0 and cutoffMethod = 'permutations'. Using cutoffMethod = 'mean'.
      
      **************************
      *** MCFS-ID Experiment ***
      **************************
      Loading header: 'input.adh'...
      Loading data: 'input.csv'...
      70 objects and 17 attributes to load... Done
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 4, projections(s) = 200, splits(t) = 5
      Start time: Tue Jul 02 07:40:44 UTC 2024
      Running: 2 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [======>                                                               ]  10% Time: 00:00 ETA: --:--    
      [=============>                                                        ]  20% Time: 00:00 ETA: --:--    
      [====================>                                                 ]  30% Time: 00:00 ETA: --:--    
      [===========================>                                          ]  40% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  50% Time: 00:00 ETA: --:--    
      [=========================================>                            ]  60% Time: 00:00 ETA: --:--    
      [================================================>                     ]  70% Time: 00:00 ETA: --:--    
      [=======================================================>              ]  80% Time: 00:00 ETA: --:--    
      [==============================================================>       ]  90% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00               
      1000 trees built within 0.319 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 79.57%
      WeightedAccuracy = 69.14%
      
      Cutoff RI (based on linear regression angle) = 0.0179749
      Cutoff RI (based on k-means clustering) = 0.4421820
      Cutoff RI (based on mean cutoff value) = 0.0179749
      Important attributes (based on mean cutoff value) = 6
      *** MCFS-ID Processing is done. Time: 0.331 s. ***
      
      Reading results...
      Done.
      Selected 6 nodes and 12 edges.
                X1        X2        X3         X4         X5         X6         X7
      1  0.3390729 0.6827881 0.9614099 0.02778712 0.48614910 0.43471764 0.02274122
      2  0.8394404 0.6015412 0.1001408 0.52731078 0.06380247 0.51473265 0.93913671
      3  0.3466835 0.2388687 0.7632227 0.88031907 0.78454623 0.66301097 0.29294872
      4  0.3337749 0.2581659 0.9479664 0.37306337 0.41832164 0.14316659 0.16432657
      5  0.4763512 0.7293096 0.8186347 0.04795913 0.98101808 0.34448739 0.39910256
      6  0.8921983 0.4525708 0.3082923 0.13862825 0.28288396 0.40576358 0.45957541
      7  0.8643395 0.1751268 0.6495795 0.32149212 0.84788215 0.08531101 0.43403085
      8  0.3899895 0.7466983 0.9533555 0.15483161 0.08223923 0.93257193 0.51700983
      9  0.7773207 0.1049876 0.9537327 0.13222817 0.88645875 0.83838407 0.84624575
      10 0.9606180 0.8645449 0.3399792 0.22130593 0.47193073 0.87943330 0.05516429
                X8         X9        X10
      1  0.6547329 0.85750154 0.92974321
      2  0.1328278 0.37088354 0.90093927
      3  0.3418099 0.31420183 0.75088219
      4  0.7313716 0.82853436 0.67656877
      5  0.9072914 0.45184151 0.64801345
      6  0.6961970 0.31587841 0.07324687
      7  0.2415792 0.09780854 0.42355842
      8  0.6441072 0.06490054 0.53082436
      9  0.2807502 0.68945737 0.94270476
      10 0.9576365 0.66805060 0.71222456
      
      
                X97        X98       X99       X100 A1 A2 B1 B2 C1 C2 class
      60 0.22378404 0.51307358 0.3994570 0.02202729  0  0  B  B  0  0     B
      61 0.69587201 0.77525486 0.9689147 0.55346841  0  0  0  0  C  C     C
      62 0.14077874 0.86028153 0.9072225 0.07312673  0  0  0  0  0  0     C
      63 0.03859708 0.15871952 0.8472281 0.86110955  0  0  0  0  C  C     C
      64 0.63851974 0.05270203 0.2219598 0.63500276  0  0  0  0  0  0     C
      65 0.25135768 0.17265011 0.4159029 0.90253739  0  0  0  0  C  C     C
      66 0.33987375 0.18344931 0.9690545 0.04770292  0  0  0  0  0  0     C
      67 0.60909188 0.48718376 0.5835705 0.90106259  0  0  0  0  C  C     C
      68 0.55731016 0.83232775 0.4722076 0.51572658  0  0  0  0  C  C     C
      69 0.66711758 0.06494922 0.6722287 0.36741652  0  0  0  0  0  0     C
      70 0.31903838 0.79192239 0.3533426 0.35998763  0  0  0  0  C  C     C
      class: 'data.frame' size: 70 x 107Checking input data...
      Exporting params...
      Exporting input data...
      Running MCFS-ID...
      ##################################################
      #####        dmLab 2.3.4 [2021.07.08]        #####
      ##################################################
      Created by Michal Draminski [michal.draminski@ipipan.waw.pl]
      http://www.ipipan.eu/staff/m.draminski/
      Polish Academy of Sciences - Institute of Computer Science
      ##################################################
      
      Warning! Value of cutoffPermutations = 0 and cutoffMethod = 'permutations'. Using cutoffMethod = 'mean'.
      
      **************************
      *** MCFS-ID Experiment ***
      **************************
      Loading header: 'input.adh'...
      Loading data: 'input.csv'...
      70 objects and 107 attributes to load... Done
      Numeric target detected - using M5 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: finalCV is ON
      Starting MCFS-ID Procedure: projectionSize(m) = 10, projections(s) = 212, splits(t) = 5
      Start time: Tue Jul 02 07:40:44 UTC 2024
      Running: 1 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [=====>                                                                ]  9% Time: 00:01 ETA: --:--    
      [============>                                                         ]  19% Time: 00:01 ETA: --:--    
      [======================>                                               ]  33% Time: 00:01 ETA: --:--    
      [================================>                                     ]  47% Time: 00:02 ETA: 00:04    
      [======================================>                               ]  57% Time: 00:02 ETA: 00:02    
      [================================================>                     ]  71% Time: 00:03 ETA: 00:03    
      [==========================================================>           ]  85% Time: 00:03 ETA: 00:03    
      [====================================================================> ]  99% Time: 00:03 ETA: 00:03    
      [=====================================================================>]  100% Time: 00:03               
      1060 trees built within 3.9 s.
      
      Prediction Summary on a Random Subsample (st):
      pearson: mean = 0.19714685679046492 median = 0.0 stdev = 0.3785735601222462 
      MAE: mean = 0.5822268205674695 median = 0.6394927501678467 stdev = 0.16084495727069972 
      RMSE: mean = 0.6723319524165355 median = 0.707329511642456 stdev = 0.1559868227285496 
      SMAPE: mean = 0.18326054566350333 median = 0.20413188636302948 stdev = 0.049676804451907905 
      
      Cutoff RI (based on linear regression angle) = 0.0061645
      Cutoff RI (based on k-means clustering) = 0.4609433
      Cutoff RI (based on mean cutoff value) = 0.0082593
      Important attributes (based on mean cutoff value) = 9
      
      *** Running CV experiment on input data limited to the top [2, 5, 7, 9, 11, 14, 18] attributes ***
      Evaluating model performance using 10 fold CV. Model: m5
      Evaluating model performance using 10 fold CV. Model: m5
      Evaluating model performance using 10 fold CV. Model: m5
      Evaluating model performance using 10 fold CV. Model: m5
      Evaluating model performance using 10 fold CV. Model: m5
      Evaluating model performance using 10 fold CV. Model: m5
      Evaluating model performance using 10 fold CV. Model: m5
      *** MCFS-ID Processing is done. Time: 4.2 s. ***
      
      Reading results...
      Done.
                X1        X2        X3         X4         X5         X6         X7
      1  0.3390729 0.6827881 0.9614099 0.02778712 0.48614910 0.43471764 0.02274122
      2  0.8394404 0.6015412 0.1001408 0.52731078 0.06380247 0.51473265 0.93913671
      3  0.3466835 0.2388687 0.7632227 0.88031907 0.78454623 0.66301097 0.29294872
      4  0.3337749 0.2581659 0.9479664 0.37306337 0.41832164 0.14316659 0.16432657
      5  0.4763512 0.7293096 0.8186347 0.04795913 0.98101808 0.34448739 0.39910256
      6  0.8921983 0.4525708 0.3082923 0.13862825 0.28288396 0.40576358 0.45957541
      7  0.8643395 0.1751268 0.6495795 0.32149212 0.84788215 0.08531101 0.43403085
      8  0.3899895 0.7466983 0.9533555 0.15483161 0.08223923 0.93257193 0.51700983
      9  0.7773207 0.1049876 0.9537327 0.13222817 0.88645875 0.83838407 0.84624575
      10 0.9606180 0.8645449 0.3399792 0.22130593 0.47193073 0.87943330 0.05516429
                X8         X9        X10
      1  0.6547329 0.85750154 0.92974321
      2  0.1328278 0.37088354 0.90093927
      3  0.3418099 0.31420183 0.75088219
      4  0.7313716 0.82853436 0.67656877
      5  0.9072914 0.45184151 0.64801345
      6  0.6961970 0.31587841 0.07324687
      7  0.2415792 0.09780854 0.42355842
      8  0.6441072 0.06490054 0.53082436
      9  0.2807502 0.68945737 0.94270476
      10 0.9576365 0.66805060 0.71222456
      
      
                 X7         X8         X9       X10 A1 A2 B1 B2 C1 C2 class
      60 0.73271802 0.05737268 0.91933177 0.4484275  0  0  B  B  0  0     B
      61 0.87080555 0.85166764 0.07943969 0.7771450  0  0  0  0  C  C     C
      62 0.57217026 0.21264535 0.50737425 0.1582198  0  0  0  0  0  0     C
      63 0.01103607 0.53946203 0.82017162 0.8668086  0  0  0  0  C  C     C
      64 0.90631526 0.13648759 0.59839542 0.2061456  0  0  0  0  0  0     C
      65 0.77065363 0.32486514 0.42415353 0.1779497  0  0  0  0  C  C     C
      66 0.38250462 0.62107629 0.55931027 0.1648911  0  0  0  0  0  0     C
      67 0.09404589 0.25598225 0.78909447 0.5652690  0  0  0  0  C  C     C
      68 0.04965358 0.63487580 0.16771526 0.7271810  0  0  0  0  C  C     C
      69 0.82116232 0.48567211 0.97045173 0.8759190  0  0  0  0  0  0     C
      70 0.82932430 0.93817692 0.47350310 0.7084244  0  0  0  0  C  C     C
      class: 'data.frame' size: 70 x 17Checking input data...
      Exporting params...
      Exporting input data...
      Running MCFS-ID...
      ##################################################
      #####        dmLab 2.3.4 [2021.07.08]        #####
      ##################################################
      Created by Michal Draminski [michal.draminski@ipipan.waw.pl]
      http://www.ipipan.eu/staff/m.draminski/
      Polish Academy of Sciences - Institute of Computer Science
      ##################################################
      
      ***************************************************
      *** MCFS-ID Cutoff Permutation Experiment #1/3 ***
      ***************************************************
      Loading header: 'input.adh'...
      Loading data: 'input.csv'...
      70 objects and 17 attributes to load... Done
      Pearson's correlation of shuffled decision: -0.0399
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 4, projections(s) = 200, splits(t) = 5
      Start time: Tue Jul 02 07:40:48 UTC 2024
      Running: 1 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [======>                                                               ]  10% Time: 00:00 ETA: --:--    
      [=============>                                                        ]  20% Time: 00:00 ETA: --:--    
      [====================>                                                 ]  30% Time: 00:00 ETA: --:--    
      [===========================>                                          ]  40% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  50% Time: 00:00 ETA: --:--    
      [=========================================>                            ]  60% Time: 00:00 ETA: --:--    
      [================================================>                     ]  70% Time: 00:00 ETA: --:--    
      [=======================================================>              ]  80% Time: 00:00 ETA: --:--    
      [==============================================================>       ]  90% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00               
      1000 trees built within 0.873 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 50.94%
      WeightedAccuracy = 35.38%
      
      Cutoff RI (based on linear regression angle) = 0.0177116
      Cutoff RI (based on k-means clustering) = 0.0365365
      Cutoff RI (based on mean cutoff value) = 0.0211711
      Important attributes (based on mean cutoff value) = 5
      
      ***************************************************
      *** MCFS-ID Cutoff Permutation Experiment #2/3 ***
      ***************************************************
      Loading header: 'input.adh'...
      Loading data: 'input.csv'...
      70 objects and 17 attributes to load... Done
      Pearson's correlation of shuffled decision: 0.2599
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 4, projections(s) = 200, splits(t) = 5
      Start time: Tue Jul 02 07:40:49 UTC 2024
      Running: 1 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [======>                                                               ]  10% Time: 00:00 ETA: --:--    
      [=============>                                                        ]  20% Time: 00:00 ETA: --:--    
      [====================>                                                 ]  30% Time: 00:00 ETA: --:--    
      [===========================>                                          ]  40% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  50% Time: 00:00 ETA: --:--    
      [=========================================>                            ]  60% Time: 00:00 ETA: --:--    
      [================================================>                     ]  70% Time: 00:00 ETA: --:--    
      [=======================================================>              ]  80% Time: 00:00 ETA: --:--    
      [==============================================================>       ]  90% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00               
      1000 trees built within 0.379 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 51.68%
      WeightedAccuracy = 35.42%
      
      Cutoff RI (based on linear regression angle) = 0.0213335
      Cutoff RI (based on k-means clustering) = 0.0320616
      Cutoff RI (based on mean cutoff value) = 0.0213335
      Important attributes (based on mean cutoff value) = 6
      
      ***************************************************
      *** MCFS-ID Cutoff Permutation Experiment #3/3 ***
      ***************************************************
      Loading header: 'input.adh'...
      Loading data: 'input.csv'...
      70 objects and 17 attributes to load... Done
      Pearson's correlation of shuffled decision: 0.0
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 4, projections(s) = 200, splits(t) = 5
      Start time: Tue Jul 02 07:40:50 UTC 2024
      Running: 1 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [======>                                                               ]  10% Time: 00:00 ETA: --:--    
      [=============>                                                        ]  20% Time: 00:00 ETA: --:--    
      [====================>                                                 ]  30% Time: 00:00 ETA: --:--    
      [===========================>                                          ]  40% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  50% Time: 00:00 ETA: --:--    
      [=========================================>                            ]  60% Time: 00:00 ETA: --:--    
      [================================================>                     ]  70% Time: 00:00 ETA: --:--    
      [=======================================================>              ]  80% Time: 00:00 ETA: --:--    
      [==============================================================>       ]  90% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00               
      1000 trees built within 0.365 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 50.35%
      WeightedAccuracy = 34.41%
      
      Cutoff RI (based on linear regression angle) = 0.0273366
      Cutoff RI (based on k-means clustering) = 0.0199981
      Cutoff RI (based on mean cutoff value) = 0.0165373
      Important attributes (based on mean cutoff value) = 6
      
      **************************
      *** MCFS-ID Experiment ***
      **************************
      Loading header: 'input.adh'...
      Loading data: 'input.csv'...
      70 objects and 17 attributes to load... Done
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: finalCV is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 4, projections(s) = 200, splits(t) = 5
      Start time: Tue Jul 02 07:40:50 UTC 2024
      Running: 1 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [======>                                                               ]  10% Time: 00:00 ETA: --:--    
      [=============>                                                        ]  20% Time: 00:00 ETA: --:--    
      [====================>                                                 ]  30% Time: 00:00 ETA: --:--    
      [===========================>                                          ]  40% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  50% Time: 00:00 ETA: --:--    
      [=========================================>                            ]  60% Time: 00:00 ETA: --:--    
      [================================================>                     ]  70% Time: 00:00 ETA: --:--    
      [=======================================================>              ]  80% Time: 00:00 ETA: --:--    
      [==============================================================>       ]  90% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00               
      1000 trees built within 0.237 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 79.01%
      WeightedAccuracy = 69.00%
      
      Cutoff RI (based on linear regression angle) = 0.0181059
      Cutoff RI (based on k-means clustering) = 0.4120377
      Cutoff RI (based on mean cutoff value) = 0.0181059
      Important attributes (based on mean cutoff value) = 6
      *** Calculation of cutoff RI (based on permutations) ***
      Max RI (raw data) = 0.72376907
      Max RI (after permutations) = [0.055015575, 0.05414359, 0.035604194]
      Anderson-Darling normality test p-value = 0.0813281
      Confidence Interval: 0.0210180 ; 0.0754908
      Cutoff RI (based on permutations) = 0.0754908
      Important attributes (based on permutations) = 6
      *** Calculation of cutoff ID ***
      Anderson-Darling normality test p-value = 0.6287300
      Confidence Interval: 9.7308185 ; 12.8343097
      Cutoff ID (based on permutations)  = 12.8343097
      *** Final Important attributes (based on permutations) = 6
      
      *** Running CV experiment on input data limited to the top [2, 3, 5, 6, 8, 9, 12] attributes ***
      Evaluating model performance using 10 fold CV. Model: j48, rf, nb, svm, knn, logistic, ripper
      Evaluating model performance using 10 fold CV. Model: j48, rf, nb, svm, knn, logistic, ripper
      Evaluating model performance using 10 fold CV. Model: j48, rf, nb, svm, knn, logistic, ripper
      Evaluating model performance using 10 fold CV. Model: j48, rf, nb, svm, knn, logistic, ripper
      Evaluating model performance using 10 fold CV. Model: j48, rf, nb, svm, knn, logistic, ripper
      Evaluating model performance using 10 fold CV. Model: j48, rf, nb, svm, knn, logistic, ripper
      Evaluating model performance using 10 fold CV. Model: j48, rf, nb, svm, knn, logistic, ripper
      *** MCFS-ID Processing is done. Time: 7.7 s. ***
      
      Reading results...
      Done.
      Checking input data...
      Error: The names of the following attributes: 
      MCFS,contrast_1attr_abds,
       MCFS'contrast_2attr_abds,
       MCFS#contrast_3attr_abds,
       MCFS()contrast_attr_abds,
       MCFS[]contrast_attr_abds,
       MCFS{}contrast_attr_abds,
       MCFS{}'#contrast,attr.abds
       contain forbidden characters. Please run fix.data() function before running mcfs().
      Fixing names...
      Fixing values...
      Fixing types...
      Checking input data...
      Exporting params...
      Exporting input data...
      Running MCFS-ID...
      ##################################################
      #####        dmLab 2.3.4 [2021.07.08]        #####
      ##################################################
      Created by Michal Draminski [michal.draminski@ipipan.waw.pl]
      http://www.ipipan.eu/staff/m.draminski/
      Polish Academy of Sciences - Institute of Computer Science
      ##################################################
      
      ***************************************************
      *** MCFS-ID Cutoff Permutation Experiment #1/3 ***
      ***************************************************
      Loading header: 'input.adh'...
      Loading data: 'input.csv'...
      70 objects and 1007 attributes to load... Done
      Pearson's correlation of shuffled decision: 0.0799
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 32, projections(s) = 314, splits(t) = 5
      Start time: Tue Jul 02 07:40:57 UTC 2024
      Running: 6 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [===>                                                                  ]  6% Time: 00:00 ETA: --:--    
      [==========>                                                           ]  16% Time: 00:00 ETA: --:--    
      [===================>                                                  ]  29% Time: 00:01 ETA: --:--    
      [===========================>                                          ]  41% Time: 00:01 ETA: --:--    
      [==================================>                                   ]  51% Time: 00:01 ETA: --:--    
      [=========================================>                            ]  61% Time: 00:01 ETA: --:--    
      [==================================================>                   ]  73% Time: 00:01 ETA: --:--    
      [========================================================>             ]  83% Time: 00:01 ETA: --:--    
      [=================================================================>    ]  96% Time: 00:01 ETA: --:--    
      [=====================================================================>]  100% Time: 00:02               
      1570 trees built within 2.2 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 42.61%
      WeightedAccuracy = 33.71%
      
      Cutoff RI (based on linear regression angle) = 0.0327596
      Cutoff RI (based on k-means clustering) = 0.0167396
      Cutoff RI (based on mean cutoff value) = 0.0214019
      Important attributes (based on mean cutoff value) = 50
      
      ***************************************************
      *** MCFS-ID Cutoff Permutation Experiment #2/3 ***
      ***************************************************
      Loading header: 'input.adh'...
      Loading data: 'input.csv'...
      70 objects and 1007 attributes to load... Done
      Pearson's correlation of shuffled decision: 0.2199
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 32, projections(s) = 314, splits(t) = 5
      Start time: Tue Jul 02 07:40:59 UTC 2024
      Running: 6 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [===>                                                                  ]  6% Time: 00:00 ETA: --:--    
      [==========>                                                           ]  16% Time: 00:00 ETA: --:--    
      [===================>                                                  ]  29% Time: 00:00 ETA: --:--    
      [===========================>                                          ]  41% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  51% Time: 00:00 ETA: --:--    
      [=========================================>                            ]  61% Time: 00:01 ETA: --:--    
      [==================================================>                   ]  73% Time: 00:01 ETA: --:--    
      [========================================================>             ]  83% Time: 00:01 ETA: --:--    
      [=================================================================>    ]  96% Time: 00:01 ETA: --:--    
      [=====================================================================>]  100% Time: 00:01               
      1570 trees built within 1.9 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 42.75%
      WeightedAccuracy = 33.58%
      
      Cutoff RI (based on linear regression angle) = 0.0319500
      Cutoff RI (based on k-means clustering) = 0.0137845
      Cutoff RI (based on mean cutoff value) = 0.0176380
      Important attributes (based on mean cutoff value) = 75
      
      ***************************************************
      *** MCFS-ID Cutoff Permutation Experiment #3/3 ***
      ***************************************************
      Loading header: 'input.adh'...
      Loading data: 'input.csv'...
      70 objects and 1007 attributes to load... Done
      Pearson's correlation of shuffled decision: -0.1199
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 32, projections(s) = 314, splits(t) = 5
      Start time: Tue Jul 02 07:41:01 UTC 2024
      Running: 6 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [===>                                                                  ]  6% Time: 00:00 ETA: --:--    
      [==========>                                                           ]  16% Time: 00:00 ETA: --:--    
      [===================>                                                  ]  29% Time: 00:00 ETA: --:--    
      [===========================>                                          ]  41% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  51% Time: 00:00 ETA: --:--    
      [=========================================>                            ]  61% Time: 00:01 ETA: --:--    
      [==================================================>                   ]  73% Time: 00:01 ETA: --:--    
      [========================================================>             ]  83% Time: 00:01 ETA: --:--    
      [=================================================================>    ]  96% Time: 00:01 ETA: --:--    
      [=====================================================================>]  100% Time: 00:01               
      1570 trees built within 1.7 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 42.02%
      WeightedAccuracy = 33.01%
      
      Cutoff RI (based on linear regression angle) = 0.0264251
      Cutoff RI (based on k-means clustering) = 0.0134330
      Cutoff RI (based on mean cutoff value) = 0.0173313
      Important attributes (based on mean cutoff value) = 73
      
      **************************
      *** MCFS-ID Experiment ***
      **************************
      Loading header: 'input.adh'...
      Loading data: 'input.csv'...
      70 objects and 1007 attributes to load... Done
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 32, projections(s) = 314, splits(t) = 5
      Start time: Tue Jul 02 07:41:03 UTC 2024
      Running: 6 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [===>                                                                  ]  6% Time: 00:00 ETA: --:--    
      [==========>                                                           ]  16% Time: 00:00 ETA: --:--    
      [===================>                                                  ]  29% Time: 00:00 ETA: --:--    
      [===========================>                                          ]  41% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  51% Time: 00:00 ETA: --:--    
      [=========================================>                            ]  61% Time: 00:00 ETA: --:--    
      [==================================================>                   ]  73% Time: 00:01 ETA: --:--    
      [========================================================>             ]  83% Time: 00:01 ETA: --:--    
      [=================================================================>    ]  96% Time: 00:01 ETA: --:--    
      [=====================================================================>]  100% Time: 00:01               
      1570 trees built within 1.5 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 47.16%
      WeightedAccuracy = 38.15%
      
      Cutoff RI (based on linear regression angle) = 0.0308217
      Cutoff RI (based on k-means clustering) = 0.3458383
      Cutoff RI (based on mean cutoff value) = 0.0394586
      Important attributes (based on mean cutoff value) = 14
      *** Calculation of cutoff RI (based on permutations) ***
      Max RI (raw data) = 0.669697
      Max RI (after permutations) = [0.06497993, 0.068991475, 0.05791443]
      Anderson-Darling normality test p-value = 0.5215663
      Confidence Interval: 0.0500302 ; 0.0778936
      Cutoff RI (based on permutations) = 0.0778936
      Important attributes (based on permutations) = 6
      *** Calculation of cutoff ID ***
      Anderson-Darling normality test p-value = 0.1113444
      Confidence Interval: 0.2776522 ; 2.4266361
      Cutoff ID (based on permutations)  = 2.4266361
      *** Final Important attributes (based on permutations) = 6
      *** MCFS-ID Processing is done. Time: 7.8 s. ***
      
      Reading results...
      Done.
                X1        X2        X3         X4         X5         X6         X7
      1  0.3390729 0.6827881 0.9614099 0.02778712 0.48614910 0.43471764 0.02274122
      2  0.8394404 0.6015412 0.1001408 0.52731078 0.06380247 0.51473265 0.93913671
      3  0.3466835 0.2388687 0.7632227 0.88031907 0.78454623 0.66301097 0.29294872
      4  0.3337749 0.2581659 0.9479664 0.37306337 0.41832164 0.14316659 0.16432657
      5  0.4763512 0.7293096 0.8186347 0.04795913 0.98101808 0.34448739 0.39910256
      6  0.8921983 0.4525708 0.3082923 0.13862825 0.28288396 0.40576358 0.45957541
      7  0.8643395 0.1751268 0.6495795 0.32149212 0.84788215 0.08531101 0.43403085
      8  0.3899895 0.7466983 0.9533555 0.15483161 0.08223923 0.93257193 0.51700983
      9  0.7773207 0.1049876 0.9537327 0.13222817 0.88645875 0.83838407 0.84624575
      10 0.9606180 0.8645449 0.3399792 0.22130593 0.47193073 0.87943330 0.05516429
                X8         X9        X10
      1  0.6547329 0.85750154 0.92974321
      2  0.1328278 0.37088354 0.90093927
      3  0.3418099 0.31420183 0.75088219
      4  0.7313716 0.82853436 0.67656877
      5  0.9072914 0.45184151 0.64801345
      6  0.6961970 0.31587841 0.07324687
      7  0.2415792 0.09780854 0.42355842
      8  0.6441072 0.06490054 0.53082436
      9  0.2807502 0.68945737 0.94270476
      10 0.9576365 0.66805060 0.71222456
      
      
                X97        X98       X99       X100 A1 A2 B1 B2 C1 C2 class
      60 0.22378404 0.51307358 0.3994570 0.02202729  0  0  B  B  0  0     B
      61 0.69587201 0.77525486 0.9689147 0.55346841  0  0  0  0  C  C     C
      62 0.14077874 0.86028153 0.9072225 0.07312673  0  0  0  0  0  0     C
      63 0.03859708 0.15871952 0.8472281 0.86110955  0  0  0  0  C  C     C
      64 0.63851974 0.05270203 0.2219598 0.63500276  0  0  0  0  0  0     C
      65 0.25135768 0.17265011 0.4159029 0.90253739  0  0  0  0  C  C     C
      66 0.33987375 0.18344931 0.9690545 0.04770292  0  0  0  0  0  0     C
      67 0.60909188 0.48718376 0.5835705 0.90106259  0  0  0  0  C  C     C
      68 0.55731016 0.83232775 0.4722076 0.51572658  0  0  0  0  C  C     C
      69 0.66711758 0.06494922 0.6722287 0.36741652  0  0  0  0  0  0     C
      70 0.31903838 0.79192239 0.3533426 0.35998763  0  0  0  0  C  C     C
      class: 'data.frame' size: 70 x 107Checking input data...
      Exporting params...
      Exporting input data...
      Running MCFS-ID...
      ##################################################
      #####        dmLab 2.3.4 [2021.07.08]        #####
      ##################################################
      Created by Michal Draminski [michal.draminski@ipipan.waw.pl]
      http://www.ipipan.eu/staff/m.draminski/
      Polish Academy of Sciences - Institute of Computer Science
      ##################################################
      
      ****************************************************
      *** Running Phase I - Initial MCFS-ID filtering  ***
      **************************
      *** MCFS-ID Experiment ***
      **************************
      Loading header: 'input.adh'...
      Loading data: 'input.csv'...
      70 objects and 107 attributes to load... Done
      Nominal target detected - using J48 model
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Adding Contrast Attributes...
      Data size: attributes: 118 objects: 70
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 10, projections(s) = 530, splits(t) = 5
      Start time: Tue Jul 02 07:41:05 UTC 2024
      Running: 1 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [=>                                                                    ]  4% Time: 00:00 ETA: --:--    
      [=========>                                                            ]  15% Time: 00:00 ETA: --:--    
      [================>                                                     ]  25% Time: 00:00 ETA: --:--    
      [========================>                                             ]  36% Time: 00:00 ETA: --:--    
      [================================>                                     ]  47% Time: 00:00 ETA: --:--    
      [======================================>                               ]  57% Time: 00:00 ETA: --:--    
      [==============================================>                       ]  68% Time: 00:01 ETA: --:--    
      [======================================================>               ]  79% Time: 00:01 ETA: --:--    
      [=============================================================>        ]  89% Time: 00:01 ETA: --:--    
      [=====================================================================>]  100% Time: 00:01 ETA: --:--    
      [=====================================================================>]  100% Time: 00:01               
      2650 trees built within 1.6 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 56.27%
      WeightedAccuracy = 45.74%
      
      Cutoff RI (based on linear regression angle) = 0.0224421
      Cutoff RI (based on k-means clustering) = 0.4909142
      Cutoff RI (based on contrast attributes) = 0.0496330
      Cutoff RI (based on mean cutoff value) = 0.0307687
      Important attributes (based on mean cutoff value) = 10
      *** MCFS-ID Processing is done. Time: 1.6 s. ***
      
      ***************************************************
      *** Running Phase II - Final MCFS-ID filtering  ***
      ***************************************************
      *** MCFS-ID Cutoff Permutation Experiment #1/3 ***
      ***************************************************
      Loading data: 'input.adx'...
      70 objects and 8 attributes to load... Done
      Pearson's correlation of shuffled decision: -0.1307
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 3, projections(s) = 117, splits(t) = 5
      Start time: Tue Jul 02 07:41:06 UTC 2024
      Running: 1 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [==========>                                                           ]  17% Time: 00:00 ETA: --:--    
      [======================>                                               ]  34% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  51% Time: 00:00 ETA: --:--    
      [==============================================>                       ]  68% Time: 00:00 ETA: --:--    
      [==========================================================>           ]  85% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00               
      585 trees built within 0.076 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 54.80%
      WeightedAccuracy = 32.93%
      
      Cutoff RI (based on linear regression angle) = 0.0
      Cutoff RI (based on k-means clustering) = 0.0074842
      Cutoff RI (based on mean cutoff value) = 0.0027860
      Important attributes (based on mean cutoff value) = 1
      
      ***************************************************
      *** MCFS-ID Cutoff Permutation Experiment #2/3 ***
      ***************************************************
      Loading data: 'input.adx'...
      70 objects and 8 attributes to load... Done
      Pearson's correlation of shuffled decision: -0.0230
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 3, projections(s) = 117, splits(t) = 5
      Start time: Tue Jul 02 07:41:06 UTC 2024
      Running: 1 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [==========>                                                           ]  17% Time: 00:00 ETA: --:--    
      [======================>                                               ]  34% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  51% Time: 00:00 ETA: --:--    
      [==============================================>                       ]  68% Time: 00:00 ETA: --:--    
      [==========================================================>           ]  85% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00               
      585 trees built within 0.074 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 54.59%
      WeightedAccuracy = 34.01%
      
      Cutoff RI (based on linear regression angle) = 0.0015211
      Cutoff RI (based on k-means clustering) = 0.0205929
      Cutoff RI (based on mean cutoff value) = 0.0019787
      Important attributes (based on mean cutoff value) = 4
      
      ***************************************************
      *** MCFS-ID Cutoff Permutation Experiment #3/3 ***
      ***************************************************
      Loading data: 'input.adx'...
      70 objects and 8 attributes to load... Done
      Pearson's correlation of shuffled decision: 0.1923
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 3, projections(s) = 117, splits(t) = 5
      Start time: Tue Jul 02 07:41:06 UTC 2024
      Running: 1 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [==========>                                                           ]  17% Time: 00:00 ETA: --:--    
      [======================>                                               ]  34% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  51% Time: 00:00 ETA: --:--    
      [==============================================>                       ]  68% Time: 00:00 ETA: --:--    
      [==========================================================>           ]  85% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00               
      585 trees built within 0.082 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 54.75%
      WeightedAccuracy = 32.94%
      
      Cutoff RI (based on linear regression angle) = 9.9394610E-4
      Cutoff RI (based on k-means clustering) = 0.0089482
      Cutoff RI (based on mean cutoff value) = 0.0012263
      Important attributes (based on mean cutoff value) = 4
      
      **************************
      *** MCFS-ID Experiment ***
      **************************
      Loading data: 'input.adx'...
      70 objects and 8 attributes to load... Done
      Nominal target detected - using J48 model
      MCFS-ID param: ID-Graph is ON
      MCFS-ID param: finalCV is ON
      MCFS-ID param: balance classes is AUTO
      Classes = ["A", "B", "C"], Sizes = [40, 20, 10], classSizeRatio = 0.25, balanceValue = 1.0
      Calculation of DecisionValuesTable...
      Starting MCFS-ID Procedure: projectionSize(m) = 3, projections(s) = 117, splits(t) = 5
      Start time: Tue Jul 02 07:41:06 UTC 2024
      Running: 1 threads...
      [                                                                      ]  0% Time: 00:00 ETA: --:--    
      [==========>                                                           ]  17% Time: 00:00 ETA: --:--    
      [======================>                                               ]  34% Time: 00:00 ETA: --:--    
      [==================================>                                   ]  51% Time: 00:00 ETA: --:--    
      [==============================================>                       ]  68% Time: 00:00 ETA: --:--    
      [==========================================================>           ]  85% Time: 00:00 ETA: --:--    
      [=====================================================================>]  100% Time: 00:00               
      585 trees built within 0.09 s.
      
      Prediction Summary on a Random Subsample (st):
      Accuracy = 92.98%
      WeightedAccuracy = 88.30%
      
      Cutoff RI (based on linear regression angle) = 0.0
      Cutoff RI (based on k-means clustering) = 0.8115311
      Cutoff RI (based on mean cutoff value) = 0.3738543
      Important attributes (based on mean cutoff value) = 2
      *** Calculation of cutoff RI (based on permutations) ***
      Max RI (raw data) = 0.8293386
      Max RI (after permutations) = [0.0074842107, 0.020592976, 0.008948237]
      Anderson-Darling normality test p-value = 0.1341751
      Confidence Interval: -0.0055020 ; 0.0301856
      Cutoff RI (based on permutations) = 0.0301856
      Important attributes (based on permutations) = 6
      *** Calculation of cutoff ID ***
      Anderson-Darling normality test p-value = 0.2128468
      Confidence Interval: 0.0466354 ; 4.8436817
      Cutoff ID (based on permutations)  = 4.8436817
      *** Final Important attributes (based on permutations) = 6
      
      *** Running CV experiment on input data limited to the top [2, 3, 5, 6, 8, 9, 12] attributes ***
      Evaluating model performance using 10 fold CV. Model: j48, rf, nb, svm, knn, logistic, ripper
      Evaluating model performance using 10 fold CV. Model: j48, rf, nb, svm, knn, logistic, ripper
      Evaluating model performance using 10 fold CV. Model: j48, rf, nb, svm, knn, logistic, ripper
      Evaluating model performance using 10 fold CV. Model: j48, rf, nb, svm, knn, logistic, ripper
      *** MCFS-ID Processing is done. Time: 3.1 s. ***
      
      Reading results...
      Done.
      [ FAIL 3 | WARN 6 | SKIP 0 | PASS 35 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-man.build.idgraph.R:21:3'): man build.idgraph ──────────────────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: `from()` was deprecated in igraph 2.0.4 and is now defunct.
      ℹ Please use `.from()` instead.
      Backtrace:
           ▆
        1. └─rmcfs::build.idgraph(result, size = 6, size_ID = 12, orphan_nodes = TRUE) at test-man.build.idgraph.R:21:3
        2.   └─base::sapply(m, function(x) length(igraph::E(g)[from(x)]))
        3.     └─base::lapply(X = X, FUN = FUN, ...)
        4.       └─rmcfs (local) FUN(X[[i]], ...)
        5.         ├─igraph::E(g)[from(x)]
        6.         └─igraph:::`[.igraph.es`(igraph::E(g), from(x))
        7.           └─igraph:::lazy_eval(...)
        8.             └─base::lapply(x, lazy_eval, data = data)
        9.               └─igraph (local) FUN(X[[i]], ...)
       10.                 └─base::eval(x$expr, data, x$env)
       11.                   └─base::eval(x$expr, data, x$env)
       12.                     └─igraph (local) from(x)
       13.                       └─lifecycle::deprecate_stop("2.0.4", "from()", ".from()")
       14.                         └─lifecycle:::deprecate_stop0(msg)
       15.                           └─rlang::cnd_signal(...)
      ── Error ('test-man.mcfs.R:57:3'): man mcfs artificial ─────────────────────────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: `from()` was deprecated in igraph 2.0.4 and is now defunct.
      ℹ Please use `.from()` instead.
      Backtrace:
           ▆
        1. └─rmcfs::build.idgraph(result) at test-man.mcfs.R:57:3
        2.   └─base::sapply(m, function(x) length(igraph::E(g)[from(x)]))
        3.     └─base::lapply(X = X, FUN = FUN, ...)
        4.       └─rmcfs (local) FUN(X[[i]], ...)
        5.         ├─igraph::E(g)[from(x)]
        6.         └─igraph:::`[.igraph.es`(igraph::E(g), from(x))
        7.           └─igraph:::lazy_eval(...)
        8.             └─base::lapply(x, lazy_eval, data = data)
        9.               └─igraph (local) FUN(X[[i]], ...)
       10.                 └─base::eval(x$expr, data, x$env)
       11.                   └─base::eval(x$expr, data, x$env)
       12.                     └─igraph (local) from(x)
       13.                       └─lifecycle::deprecate_stop("2.0.4", "from()", ".from()")
       14.                         └─lifecycle:::deprecate_stop0(msg)
       15.                           └─rlang::cnd_signal(...)
      ── Error ('test-man.plot.idgraph.R:19:3'): man build.idgraph ───────────────────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: `from()` was deprecated in igraph 2.0.4 and is now defunct.
      ℹ Please use `.from()` instead.
      Backtrace:
           ▆
        1. └─rmcfs::build.idgraph(result, size = 6, size_ID = 12, orphan_nodes = TRUE) at test-man.plot.idgraph.R:19:3
        2.   └─base::sapply(m, function(x) length(igraph::E(g)[from(x)]))
        3.     └─base::lapply(X = X, FUN = FUN, ...)
        4.       └─rmcfs (local) FUN(X[[i]], ...)
        5.         ├─igraph::E(g)[from(x)]
        6.         └─igraph:::`[.igraph.es`(igraph::E(g), from(x))
        7.           └─igraph:::lazy_eval(...)
        8.             └─base::lapply(x, lazy_eval, data = data)
        9.               └─igraph (local) FUN(X[[i]], ...)
       10.                 └─base::eval(x$expr, data, x$env)
       11.                   └─base::eval(x$expr, data, x$env)
       12.                     └─igraph (local) from(x)
       13.                       └─lifecycle::deprecate_stop("2.0.4", "from()", ".from()")
       14.                         └─lifecycle:::deprecate_stop0(msg)
       15.                           └─rlang::cnd_signal(...)
      
      [ FAIL 3 | WARN 6 | SKIP 0 | PASS 35 ]
      Error: Test failures
      Execution halted
    ```

# simcausal

<details>

* Version: 0.5.6
* GitHub: https://github.com/osofr/simcausal
* Source code: https://github.com/cran/simcausal
* Date/Publication: 2022-10-28 11:52:27 UTC
* Number of recursive dependencies: 83

Run `revdepcheck::cloud_details(, "simcausal")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Complete output:
      > ## unit tests will not be done if RUnit is not available
      > # setwd("..")
      > # getwd()
      > # library(RUnit)
      > if(require("RUnit", quietly=TRUE)) {
      +     ## --- Setup ---
      + 
      +     pkg <- "simcausal" # <-- Tested package name
      + 
      +     if(Sys.getenv("RCMDCHECK") == "FALSE") {
      +     ## Path to unit tests for standalone running under Makefile (not R CMD check)
      +     ## PKG/tests/../inst/unitTests
      +     # path <- file.path(getwd(), "..", "inst", "unitTests")
      +     } else {
      +     ## Path to unit tests for R CMD check
      +     ## PKG.Rcheck/tests/../PKG/unitTests        
      +     # path <- system.file(package=pkg, "RUnit")
      + 
      +     # REPLACED WITH:
      +     path <- file.path(getwd(), "RUnit")
      +     }
      + 
      +     cat("\nRunning unit tests\n")
      +     print(list(pkg=pkg, getwd=getwd(), pathToUnitTests=path))
      + 
      +     library(package=pkg, character.only=TRUE)
      + 
      +     ## If desired, load the name space to allow testing of private functions
      +     ## if (is.element(pkg, loadedNamespaces()))
      +     ##     attach(loadNamespace(pkg), name=paste("namespace", pkg, sep=":"), pos=3)
      +     ##
      +     ## or simply call PKG:::myPrivateFunction() in tests
      + 
      +     ## --- Testing ---
      + 
      +     ## Define tests
      +     test.suite <- defineTestSuite(name=paste(pkg, "unit testing"),
      +                                         # dirs="./RUnit",
      +                                         dirs=path,
      +                                         testFileRegexp = "^RUnit_tests_+",
      +                                         testFuncRegexp = "^test.+",
      +                                         rngKind = "Marsaglia-Multicarry",
      +                                         rngNormalKind = "Kinderman-Ramage")
      +     ## Run
      +     tests <- runTestSuite(test.suite)
      + 
      +     ## Default report name
      +     pathReport <- file.path(path, "report")
      + 
      +     ## Report to stdout and text files
      +     cat("------------------- UNIT TEST SUMMARY ---------------------\n\n")
      +     printTextProtocol(tests, showDetails=FALSE)
      +     printTextProtocol(tests, showDetails=FALSE,
      +                         fileName=paste0(pathReport, "Summary.txt"))
      +     printTextProtocol(tests, showDetails=TRUE,
      +                         fileName=paste0(pathReport, ".txt")) 
      +     ## Report to HTML file
      +     printHTMLProtocol(tests, fileName=paste0(pathReport, ".html"))
      +  
      +     ## Return stop() to cause R CMD check stop in case of
      +     ##  - failures i.e. FALSE to unit tests or
      +     ##  - errors i.e. R errors
      +     tmp <- getErrors(tests)
      +     if(tmp$nFail > 0 | tmp$nErr > 0) {
      +         stop(paste("\n\nunit testing failed (#test failures: ", tmp$nFail,
      +                ", #R errors: ",  tmp$nErr, ")\n\n", sep=""))
      +     }
      +     } else {
      +         warning("cannot run unit tests -- package RUnit is not available")
      + }
      
      Running unit tests
      $pkg
      [1] "simcausal"
      
      $getwd
      [1] "/tmp/workdir/simcausal/new/simcausal.Rcheck/tests"
      
      $pathToUnitTests
      [1] "/tmp/workdir/simcausal/new/simcausal.Rcheck/tests/RUnit"
      
      
      
      Executing test function test.EFUeval  ... ...automatically assigning order attribute to some nodes...
      node C.time_0, order:1
      node Y_0, order:2
      node D_0, order:3
      node C.time_1, order:4
      node Y_1, order:5
      node D_1, order:6
      node C.time_2, order:7
      node Y_2, order:8
      node D_2, order:9
      node C.time_3, order:10
      node Y_3, order:11
      node D_3, order:12
      node C.time_4, order:13
      node Y_4, order:14
      node D_4, order:15
      node C.time_5, order:16
      node Y_5, order:17
      node D_5, order:18
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node C.time_0, order:1
      node Y_0, order:2
      node D_0, order:3
      node C.time_1, order:4
      node Y_1, order:5
      node D_1, order:6
      node C.time_2, order:7
      node Y_2, order:8
      node D_2, order:9
      node C.time_3, order:10
      node Y_3, order:11
      node D_3, order:12
      node C.time_4, order:13
      node Y_4, order:14
      node D_4, order:15
      node C.time_5, order:16
      node Y_5, order:17
      node D_5, order:18
      using the following vertex attributes: 
      NAdarkbluenone70.50
      using the following edge attributes: 
      black0.210.30.2
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
       done successfully.
      
      
      
      Executing test function test.Nsamp.n.test  ... ...automatically assigning order attribute to some nodes...
      node A, order:1
      node N, order:2
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node A, order:1
      node N, order:2
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node A, order:1
      node N, order:2
       done successfully.
      
      
      
      Executing test function test.bugfixes  ... ...automatically assigning order attribute to some nodes...
      node const, order:1
      node W1, order:2
      node W2, order:3
      node W3, order:4
      node A, order:5
      node Y, order:6
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node L2_0, order:1
      node L1_0, order:2
      node A1_0, order:3
      node L2_1, order:5
      node L2_2, order:6
      node L2_3, order:7
      node L2_4, order:8
      node L2_5, order:9
      node L2_6, order:10
      node L2_7, order:11
      node L2_8, order:12
      node L2_9, order:13
      node L2_10, order:14
      node L2_11, order:15
      node L2_12, order:16
      node L2_13, order:17
      node L2_14, order:18
      node L2_15, order:19
      node L2_16, order:20
      ...automatically assigning order attribute to some nodes...
      node L2_0, order:1
      node L1_0, order:2
      node L2_1, order:3
      node L1_1, order:4
      node L2_2, order:5
      node L1_2, order:6
      node L2_3, order:7
      node L1_3, order:8
      node L2_4, order:9
      node L1_4, order:10
      node L2_5, order:11
      node L1_5, order:12
      node L2_6, order:13
      node L1_6, order:14
      node L2_7, order:15
      node L1_7, order:16
      node L2_8, order:17
      node L1_8, order:18
      node L2_9, order:19
      node L1_9, order:20
      node L2_10, order:21
      node L1_10, order:22
      node L2_11, order:23
      node L1_11, order:24
      node L2_12, order:25
      node L1_12, order:26
      node L2_13, order:27
      node L1_13, order:28
      node L2_14, order:29
      node L1_14, order:30
      node L2_15, order:31
      node L1_15, order:32
      node L2_16, order:33
      node L1_16, order:34
      Error in add.nodes(DAG = obj1, nodes = obj2) : 
        DAG object is locked: nodes in this DAG cannot be modified or added after set.DAG()
      In addition: Warning messages:
      1: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: Marsaglia-Multicarry has poor statistical properties
      2: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: severe deviations from normality for Kinderman-Ramage + Marsaglia-Multicarry
      3: In add.nodes(DAG = obj1, nodes = obj2) :
        existing non-time-varying node L2 was overwritten with a time-varying node
      4: In add.nodes(DAG = obj1, nodes = obj2) :
        existing non-time-varying node L2 was overwritten with a time-varying node
      5: In set.DAG(D) :
        trying to lock an empty DAG, add nodes before calling set.DAG()
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node L0, order:1
      node L1, order:2
      node L2, order:3
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node L0, order:1
      node L1, order:2
      node L2, order:3
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node L0, order:1
      node L1, order:2
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node L0, order:1
      node L1, order:2
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
       done successfully.
      
      
      
      Executing test function test.condrcat.factor  ... ...automatically assigning order attribute to some nodes...
      node W, order:1
      node Cat3, order:2
      ...automatically assigning order attribute to some nodes...
      node W, order:1
      node Cat3, order:2
      ...automatically assigning order attribute to some nodes...
      node W, order:1
      node Cat3, order:2
      Error in eval(x[[2]], envir = data.env, enclos = user.env) : 
        dims [product 3] do not match the length of object [10]
      In addition: Warning messages:
      1: In rcat.b1(n = n, probs = probs) :
        some categorical probabilities add up to more than 1, normalizing to add to 1
      2: In rcat.b1(n = n, probs = probs) :
        some categorical probabilities add up to more than 1, normalizing to add to 1
      3: In rcat.b1(n = n, probs = probs) :
        some categorical probabilities add up to more than 1, normalizing to add to 1
      4: In rcat.b1(n = n, probs = probs) :
        some categorical probabilities add up to more than 1, normalizing to add to 1
      5: In (W == 0) * catprob.W0 :
        longer object length is not a multiple of shorter object length
      Error in set.DAG(D) : 
      ...attempt to simulate data from DAG failed...
      ...automatically assigning order attribute to some nodes...
      node W, order:1
      node Cat3, order:2
      ...automatically assigning order attribute to some nodes...
      node W, order:1
      node Cat3, order:2
      simulating observed dataset from the DAG object
       done successfully.
      
      
      
      Executing test function test.distr  ... All custom distributions defined in SimCausal:
      
      [1] "rbern"           "rcat.b0"         "rcat.b1"         "rcat.factor"    
      [5] "rcategor"        "rcategor.int"    "rconst"          "rdistr.template"
      Error in rdistr.template(n = 100, arg1 = rep(0.5, 100), arg2 = rep(0.3,  : 
        inputs arguments should all have the same length
       done successfully.
      
      
      
      Executing test function test.experimental_parsingMSMs  ... Error in simcausal:::parse.MSMform(msm.form = msm.form_3_error, t_vec = t_vec,  : 
        unable to map some of S() expressions in MSM formula, check that all of the summary measure expressions have been previously defined
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 100 simulated samples per action
      evaluating MSM summary measures and converting full data to long format for MSM target parameter
      MSM: fitting glm to full data
      simulating action-specific datasets for action(s): A1_th0 A1_th1
      simulating action-specific datasets for action(s): A1_th0 A1_th1
      evaluating MSM summary measures and converting full data to long format for MSM target parameter
      MSM: fitting glm to full data
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 100 simulated samples per action
      evaluating MSM summary measures and converting full data to long format for MSM target parameter
      MSM: fitting glm to full data
      simulating action-specific datasets for action(s): A1_th0 A1_th1
      evaluating MSM summary measures and converting full data to long format for MSM target parameter
      MSM: fitting glm to full data
      simulating action-specific datasets for action(s): A1_th0 A1_th1
      evaluating MSM summary measures and converting full data to long format for MSM target parameter
      MSM: fitting glm to full data
      for df_full in long format new summary measures cannot be calculated, using whatever summary measures already exist in df_full
      for df_full in long format outcome is pooled over the same t vector as defined in the first MSM that generated the long format data, changing pooling t requires re-generating the full data
      assuming the data is based on the following map of MSM terms to variable names
              S_exprs_vec  XMSMterms
      1 A1[max(0, t - 2)] XMSMterm.4
      MSM: fitting glm to full data
      for df_full in long format new summary measures cannot be calculated, using whatever summary measures already exist in df_full
      for df_full in long format outcome is pooled over the same t vector as defined in the first MSM that generated the long format data, changing pooling t requires re-generating the full data
      assuming the data is based on the following map of MSM terms to variable names
              S_exprs_vec  XMSMterms
      1 A1[max(0, t - 2)] XMSMterm.4
      2 A1[max(0, t - 1)] XMSMterm.1
      MSM: fitting glm to full data
      Error in parse.MSMform(msm.form = form, t_vec = t_vec, old.DAG = DAG,  : 
        unable to map some of S() expressions in MSM formula, check that all of the summary measure expressions have been previously defined
       done successfully.
      
      
      
      Executing test function test.faster_tolongdata  ... simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
       done successfully.
      
      
      
      Executing test function test.latent  ... ...automatically assigning order attribute to some nodes...
      node I, order:1
      node W1, order:2
      node W2, order:3
      node W3, order:4
      node A, order:5
      node U.Y, order:6
      node Y, order:7
      using the following vertex attributes: 
      NAdarkbluenone100.50
      using the following edge attributes: 
      black0.210.60.5
      Timing stopped at: 0.07 0 0.07
      Error : `from()` was deprecated in igraph 2.0.4 and is now defunct.
      ℹ Please use `.from()` instead.
       done successfully.
      
      
      
      Executing test function test.longparse  ... ...automatically assigning order attribute to some nodes...
      node group, order:1
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node group, order:1
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node A, order:1
      node group, order:2
      evaluating node group expression(s): rep(A, 3).
       One of the distribution parameters evaluated to non-standard vector length (its neither 1 nor n), make sure the distribution function knows how to handle it.
      simulating observed dataset from the DAG object
      evaluating node group expression(s): rep(A, 3).
       One of the distribution parameters evaluated to non-standard vector length (its neither 1 nor n), make sure the distribution function knows how to handle it.
      ...automatically assigning order attribute to some nodes...
      node A, order:1
      node group, order:2
      simulating observed dataset from the DAG object
       done successfully.
      
      
      
      Executing test function test.node  ... ...automatically assigning order attribute to some nodes...
      node L0, order:1
      node L1, order:2
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node L0, order:1
      node L1, order:2
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node L0, order:1
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node L0, order:1
      node L1, order:2
      node L2, order:3
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node W1, order:1
      node W2, order:2
      node W3, order:3
      simulating observed dataset from the DAG object
      existing node W1 was modified
      existing node W2 was modified
      existing node W3 was modified
      ...automatically assigning order attribute to some nodes...
      node W1, order:1
      node W2, order:2
      node W3, order:3
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node W1, order:1
      node W2, order:2
      node W3, order:3
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node L1_0, order:1
      node L2_0, order:2
      Error in add.nodes(DAG = obj1, nodes = obj2) : 
        cannot define nodes with missing t after nodes with t non-missing were already defined
      In addition: Warning messages:
      1: In (function (n, probs)  :
        some categorical probabilities add up to more than 1, normalizing to add to 1
      2: In (function (n, probs)  :
        some categorical probabilities add up to more than 1, normalizing to add to 1
      3: In rcat.b1(n = n, probs = probs) :
        some categorical probabilities add up to more than 1, normalizing to add to 1
      4: In rcat.b1(n = n, probs = probs) :
        some categorical probabilities add up to more than 1, normalizing to add to 1
      existing node L1_3 was modified
      existing node L1_4 was modified
      existing node L1_5 was modified
      existing node L1_4 was modified
      existing node L1_5 was modified
      ...automatically assigning order attribute to some nodes...
      node L1_0, order:1
      node L2_0, order:2
      node L1_1, order:3
      node L2_1, order:4
      node L1_2, order:5
      node L2_2, order:6
      node L1_3, order:7
      node L2_3, order:8
      node L1_4, order:9
      node L2_4, order:10
      node L1_5, order:11
      node L2_5, order:12
      simulating observed dataset from the DAG object
      existing node L1_2 was modified
      existing node L1_3 was modified
      existing node L1_4 was modified
      existing node L1_5 was modified
      ...automatically assigning order attribute to some nodes...
      node L3_0, order:1
      node L3_1, order:2
      node L1_2, order:3
      node L2_2, order:4
      node L3_2, order:5
      node L1_3, order:6
      node L2_3, order:7
      node L3_3, order:8
      node L1_4, order:9
      node L2_4, order:10
      node L3_4, order:11
      node L1_5, order:12
      node L2_5, order:13
      node L3_5, order:14
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node L3_0, order:1
      node L3_1, order:2
      node L1_2, order:3
      node L2_2, order:4
      node L3_2, order:5
      node L1_3, order:6
      node L2_3, order:7
      node L3_3, order:8
      node L1_4, order:9
      node L2_4, order:10
      node L3_4, order:11
      node L1_5, order:12
      node L2_5, order:13
      node L3_5, order:14
      simulating observed dataset from the DAG object
      ...automatically assigning order attribute to some nodes...
      node L2_0, order:1
      node L1_0, order:2
      node A1_0, order:3
      node A2_0, order:4
      node Y_0, order:5
      node L2_1, order:6
      node A1_1, order:7
      node A2_1, order:8
      node Y_1, order:9
      node L2_2, order:10
      node A1_2, order:11
      node A2_2, order:12
      node Y_2, order:13
      node L2_3, order:14
      node A1_3, order:15
      node A2_3, order:16
      node Y_3, order:17
      node L2_4, order:18
      node A1_4, order:19
      node A2_4, order:20
      node Y_4, order:21
      node L2_5, order:22
      node A1_5, order:23
      node A2_5, order:24
      node Y_5, order:25
      node L2_6, order:26
      node A1_6, order:27
      node A2_6, order:28
      node Y_6, order:29
      node L2_7, order:30
      node A1_7, order:31
      node A2_7, order:32
      node Y_7, order:33
      node L2_8, order:34
      node A1_8, order:35
      node A2_8, order:36
      node Y_8, order:37
      node L2_9, order:38
      node A1_9, order:39
      node A2_9, order:40
      node Y_9, order:41
      node L2_10, order:42
      node A1_10, order:43
      node A2_10, order:44
      node Y_10, order:45
      node L2_11, order:46
      node A1_11, order:47
      node A2_11, order:48
      node Y_11, order:49
      node L2_12, order:50
      node A1_12, order:51
      node A2_12, order:52
      node Y_12, order:53
      node L2_13, order:54
      node A1_13, order:55
      node A2_13, order:56
      node Y_13, order:57
      node L2_14, order:58
      node A1_14, order:59
      node A2_14, order:60
      node Y_14, order:61
      node L2_15, order:62
      node A1_15, order:63
      node A2_15, order:64
      node Y_15, order:65
      node L2_16, order:66
      node A1_16, order:67
      node A2_16, order:68
      node Y_16, order:69
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
       done successfully.
      
      
      
      Executing test function test.noexistdistr  ... ...automatically assigning order attribute to some nodes...
      node W1, order:1
      rbinom2: note this distribution could not be located in package namespace, simulating from user-defined distribution found under the same name
      ...automatically assigning order attribute to some nodes...
      node W1, order:1
      rbinom2: note this distribution could not be located in package namespace, simulating from user-defined distribution found under the same name
      Error in loadNamespace(name) : there is no package called 'rbinom3'
      Error in network("net", netfun = "rbinom3", Kmax = 5, size = 4, prob = c(0.4,  : 
        rbinom3: this network generator function could not be located
      ...automatically assigning order attribute to some nodes...
      node W1, order:1
      simulating observed dataset from the DAG object
       done successfully.
      
      
      
      Executing test function test.plotting  ... ...automatically assigning order attribute to some nodes...
      node L2_0, order:1
      node L1_0, order:2
      node A1_0, order:3
      node A2_0, order:4
      node Y_0, order:5
      node L2_1, order:6
      node A1_1, order:7
      node A2_1, order:8
      node Y_1, order:9
      node L2_2, order:10
      node A1_2, order:11
      node A2_2, order:12
      node Y_2, order:13
      node L2_3, order:14
      node A1_3, order:15
      node A2_3, order:16
      node Y_3, order:17
      node L2_4, order:18
      node A1_4, order:19
      node A2_4, order:20
      node Y_4, order:21
      node L2_5, order:22
      node A1_5, order:23
      node A2_5, order:24
      node Y_5, order:25
      node L2_6, order:26
      node A1_6, order:27
      node A2_6, order:28
      node Y_6, order:29
      node L2_7, order:30
      node A1_7, order:31
      node A2_7, order:32
      node Y_7, order:33
      node L2_8, order:34
      node A1_8, order:35
      node A2_8, order:36
      node Y_8, order:37
      node L2_9, order:38
      node A1_9, order:39
      node A2_9, order:40
      node Y_9, order:41
      node L2_10, order:42
      node A1_10, order:43
      node A2_10, order:44
      node Y_10, order:45
      node L2_11, order:46
      node A1_11, order:47
      node A2_11, order:48
      node Y_11, order:49
      node L2_12, order:50
      node A1_12, order:51
      node A2_12, order:52
      node Y_12, order:53
      node L2_13, order:54
      node A1_13, order:55
      node A2_13, order:56
      node Y_13, order:57
      node L2_14, order:58
      node A1_14, order:59
      node A2_14, order:60
      node Y_14, order:61
      node L2_15, order:62
      node A1_15, order:63
      node A2_15, order:64
      node Y_15, order:65
      node L2_16, order:66
      node A1_16, order:67
      node A2_16, order:68
      node Y_16, order:69
       done successfully.
      
      
      
      Executing test function test.set.DAG_DAG1  ... simulating observed dataset from the DAG object
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
       done successfully.
      
      
      
      Executing test function test.set.DAG_DAG2_errors  ... Error in node("A_2", distr = "rbern", prob = 0.5, order = 1) : 
        node names with underscore character '_' are not allowed
      Error in L2[0] : undefined time-dependent variable(s): L2_0
      Error : error while evaluating node L2_0 formula: 
      ifelse(L2[0] == 1, 0.5, 0.1).
      Check syntax specification.
      Error in set.DAG(c(L2_0, L1_0)) : 
      ...attempt to simulate data from DAG failed...
      ...automatically assigning order attribute to some nodes...
      node , order:1
      node , order:2
      node , order:3
      node , order:4
      Error in strsplit(cur.node$name, "_") : non-character argument
      Error in set.DAG(testDAG_2_err1a) : 
      ...attempt to simulate data from DAG failed...
      ...automatically assigning order attribute to some nodes...
      node , order:1
      node , order:2
      node , order:3
      node , order:4
      node , order:5
      Error in set.DAG(testDAG_2_err1b) : 
        All DAG nodes must have unique name attributes
       done successfully.
      
      
      
      Executing test function test.set.DAG_DAG2b_newactions  ... ...automatically assigning order attribute to some nodes...
      node W1, order:1
      node W2, order:2
      node W3, order:3
      node A, order:4
      node Y, order:5
      ...automatically assigning order attribute to some nodes...
      node W1, order:1
      node W2, order:2
      node W3, order:3
      node A, order:4
      node Y, order:5
      ...automatically assigning order attribute to some nodes...
      node W1_0, order:1
      node W2_0, order:2
      node W3_0, order:3
      node A_0, order:4
      node Y_0, order:5
      node W1_1, order:6
      node W2_1, order:7
      node W3_1, order:8
      node A_1, order:9
      node Y_1, order:10
      ...automatically assigning order attribute to some nodes...
      node W1_0, order:1
      node W2_0, order:2
      node W3_0, order:3
      node A_0, order:4
      node Y_0, order:5
      node W1_1, order:6
      node W2_1, order:7
      node W3_1, order:8
      node A_1, order:9
      node Y_1, order:10
      simulating observed dataset from the DAG object
      using the following vertex attributes: 
      NAdarkbluenone100.50
      using the following edge attributes: 
      black0.210.60.5
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
      simulating action-specific datasets for action(s): A1 A0
      simulating action-specific datasets for action(s): A1 A0
      simulating action-specific datasets for action(s): A1
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      Error : n is not a count (a single positive integer)
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
      simulating action-specific datasets for action(s): A1 A0
      simulating action-specific datasets for action(s): A1 A0
      simulating action-specific datasets for action(s): A1 A0
      Error in getactions(DAG, actions) : 
        Couldn't locate action: A4 , first define action by adding it to the DAG object with DAG+action
      In addition: There were 13 warnings (use warnings() to see them)
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
      simulating action-specific datasets for action(s): A1 A0
      simulating action-specific datasets for action(s): A1 A0
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
         user  system elapsed 
        0.186   0.000   0.188 
      simulating observed dataset from the DAG object
         user  system elapsed 
        0.206   0.000   0.206 
      simulating observed dataset from the DAG object
         user  system elapsed 
        0.213   0.000   0.214 
      Error in X_dat_th0[[2]] : subscript out of bounds
      In addition: There were 11 warnings (use warnings() to see them)
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      data not specified, simulating full data
      evaluating the target on 500 simulated samples per action
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      data not specified, simulating full data
      evaluating the target on 500 simulated samples per action
      Error in eval.target(D, n = 500, actions = "A1_th1", rndseed = 123) : 
        some of the actions in param argument could not be found in the simulated full data
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      MSM: fitting glm to full data
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      MSM: fitting glm to full data
      data not specified, simulating full data
      evaluating the target on 500 simulated samples per action
      MSM: fitting glm to full data
      MSM: fitting glm to full data
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      MSM: fitting glm to full data
      simulating observed dataset from the DAG object
       done successfully.
      
      
      
      Executing test function test.set.DAG_DAG3_wlong  ... simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
       done successfully.
      
      
      
      Executing test function test.set.DAG_DAG_informcens  ... simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 100 simulated samples per action
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 100 simulated samples per action
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      some outcome nodes have EFU=TRUE, applying Last Time Point Carry Forward function: doLTCF()
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      MSM: fitting glm to full data
      MSM: fitting glm to full data
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      MSM: fitting glm to full data
      MSM: fitting glm to full data
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      evaluating MSM summary measures and converting full data to long format for MSM target parameter
      MSM: fitting glm to full data
      simulating observed dataset from the DAG object
      simulating observed dataset from the DAG object
       done successfully.
      
      
      
      Executing test function test.set.DAG_general  ... Error in set.DAG(testDAG_listobj1) : DAG must be a list
      In addition: Warning message:
      In predict.lm(object, newdata, se.fit, scale = 1, type = if (type ==  :
        prediction from rank-deficient fit; attr(*, "non-estim") has doubtful cases
      Error in set.DAG(testDAG_listobj2) : 
        each of DAG items must be a list specifying DAG node(s)
      ...automatically assigning order attribute to some nodes...
      node nm, order:1
      node nm, order:2
      node nm, order:3
      Error : !is.null(user.env) is not TRUE
      Error in set.DAG(testDAG_names1) : 
      ...attempt to simulate data from DAG failed...
      ...automatically assigning order attribute to some nodes...
      node nm, order:2
      node nm, order:3
      Error : !is.null(user.env) is not TRUE
      Error in set.DAG(testDAG_names2) : 
      ...attempt to simulate data from DAG failed...
      Error in set.DAG(testDAG_dist) : 
        All DAG nodes must have unique name attributes
       done successfully.
      
      
      
      Executing test function test.substitute  ... ...automatically assigning order attribute to some nodes...
      node I, order:1
      node W1, order:2
      node W2, order:3
      node W3, order:4
      node A, order:5
      simulating observed dataset from the DAG object
       done successfully.
      
      
      
      Executing test function test.t.error  ... Error in add.nodes(DAG = obj1, nodes = obj2) : 
        cannot define nodes with missing t after nodes with t non-missing were already defined
       done successfully.
      
      
      
      Executing test function test.tswitch_2MSMs  ... [1] 0
      [1] "abar"
       [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
      [1] 3
      [1] "abar"
       [1] 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1
      [1] 6
      [1] "abar"
       [1] 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1
      [1] 10
      [1] "abar"
       [1] 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1
      [1] 13
      [1] "abar"
       [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1
      [1] 17
      [1] "abar"
       [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      [1] "tswitch_i"
      [1] 0
      [1] "meanExposureVec"
       [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
      [1] "tswitch_i"
      [1] 3
      [1] "meanExposureVec"
       [1] 0.000 0.000 0.000 0.250 0.400 0.500 0.571 0.625 0.667 0.700 0.727 0.750
      [13] 0.769 0.786 0.800 0.812 0.824
      [1] "tswitch_i"
      [1] 6
      [1] "meanExposureVec"
       [1] 0.000 0.000 0.000 0.000 0.000 0.000 0.143 0.250 0.333 0.400 0.455 0.500
      [13] 0.538 0.571 0.600 0.625 0.647
      [1] "tswitch_i"
      [1] 10
      [1] "meanExposureVec"
       [1] 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.091 0.167
      [13] 0.231 0.286 0.333 0.375 0.412
      [1] "tswitch_i"
      [1] 13
      [1] "meanExposureVec"
       [1] 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
      [13] 0.000 0.071 0.133 0.188 0.235
      [1] "tswitch_i"
      [1] 17
      [1] "meanExposureVec"
       [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      evaluating MSM summary measures and converting full data to long format for MSM target parameter
      MSM: fitting glm to full data
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      evaluating MSM summary measures and converting full data to long format for MSM target parameter
      MSM: fitting glm to full data
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      evaluating MSM summary measures and converting full data to long format for MSM target parameter
      MSM: fitting glm to full data
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      evaluating MSM summary measures and converting full data to long format for MSM target parameter
      MSM: fitting glm to full data
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      MSM: fitting glm to full data
      [1] "MSMtermName used"
      [1] "XMSMterm.1"
      [1] "MSMterm_vals last"
       [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
      [1] "MSMterm_vals last"
       [1] 0.0000000 0.0000000 0.0000000 0.2500000 0.4000000 0.5000000 0.5714286
       [8] 0.6250000 0.6666667 0.7000000 0.7272727 0.7500000 0.7692308 0.7857143
      [15] 0.8000000 0.8125000 0.8235294
      [1] "MSMterm_vals last"
       [1] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.1428571
       [8] 0.2500000 0.3333333 0.4000000 0.4545455 0.5000000 0.5384615 0.5714286
      [15] 0.6000000 0.6250000 0.6470588
      [1] "MSMterm_vals last"
       [1] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
       [7] 0.00000000 0.00000000 0.00000000 0.00000000 0.09090909 0.16666667
      [13] 0.23076923 0.28571429 0.33333333 0.37500000 0.41176471
      [1] "MSMterm_vals last"
       [1] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
       [7] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
      [13] 0.00000000 0.07142857 0.13333333 0.18750000 0.23529412
      [1] "MSMterm_vals last"
       [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      [1] "MSMtermName used"
      [1] "meanExposure"
      [1] "MSMterm_vals last"
       [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
      [1] "MSMterm_vals last"
       [1] 0.0000000 0.0000000 0.0000000 0.2500000 0.4000000 0.5000000 0.5714286
       [8] 0.6250000 0.6666667 0.7000000 0.7272727 0.7500000 0.7692308 0.7857143
      [15] 0.8000000 0.8125000 0.8235294
      [1] "MSMterm_vals last"
       [1] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.1428571
       [8] 0.2500000 0.3333333 0.4000000 0.4545455 0.5000000 0.5384615 0.5714286
      [15] 0.6000000 0.6250000 0.6470588
      [1] "MSMterm_vals last"
       [1] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
       [7] 0.00000000 0.00000000 0.00000000 0.00000000 0.09090909 0.16666667
      [13] 0.23076923 0.28571429 0.33333333 0.37500000 0.41176471
      [1] "MSMterm_vals last"
       [1] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
       [7] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
      [13] 0.00000000 0.07142857 0.13333333 0.18750000 0.23529412
      [1] "MSMterm_vals last"
       [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      evaluating MSM summary measures and converting full data to long format for MSM target parameter
      MSM: fitting glm to full data
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      evaluating MSM summary measures and converting full data to long format for MSM target parameter
      MSM: fitting glm to full data
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 500 simulated samples per action
      MSM: fitting glm to full data
      [1] "MSMtermName used"
      [1] "XMSMterm.1"
      [1] "MSMterm_vals last"
       [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
      [1] "MSMterm_vals last"
       [1] 0.0000000 0.0000000 0.0000000 0.2500000 0.4000000 0.5000000 0.5714286
       [8] 0.6250000 0.6666667 0.7000000 0.7272727 0.7500000 0.7692308 0.7857143
      [15] 0.8000000 0.8125000 0.8235294
      [1] "MSMterm_vals last"
       [1] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.1428571
       [8] 0.2500000 0.3333333 0.4000000 0.4545455 0.5000000 0.5384615 0.5714286
      [15] 0.6000000 0.6250000 0.6470588
      [1] "MSMterm_vals last"
       [1] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
       [7] 0.00000000 0.00000000 0.00000000 0.00000000 0.09090909 0.16666667
      [13] 0.23076923 0.28571429 0.33333333 0.37500000 0.41176471
      [1] "MSMterm_vals last"
       [1] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
       [7] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
      [13] 0.00000000 0.07142857 0.13333333 0.18750000 0.23529412
      [1] "MSMterm_vals last"
       [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      [1] "MSMtermName used"
      [1] "XMSMterm.1"
      [1] "MSMterm_vals last"
       [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
      [1] "MSMterm_vals last"
       [1] 0.0000000 0.0000000 0.0000000 0.2500000 0.4000000 0.5000000 0.5714286
       [8] 0.6250000 0.6666667 0.7000000 0.7272727 0.7500000 0.7692308 0.7857143
      [15] 0.8000000 0.8125000 0.8235294
      [1] "MSMterm_vals last"
       [1] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.1428571
       [8] 0.2500000 0.3333333 0.4000000 0.4545455 0.5000000 0.5384615 0.5714286
      [15] 0.6000000 0.6250000 0.6470588
      [1] "MSMterm_vals last"
       [1] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
       [7] 0.00000000 0.00000000 0.00000000 0.00000000 0.09090909 0.16666667
      [13] 0.23076923 0.28571429 0.33333333 0.37500000 0.41176471
      [1] "MSMterm_vals last"
       [1] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
       [7] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
      [13] 0.00000000 0.07142857 0.13333333 0.18750000 0.23529412
      [1] "MSMterm_vals last"
       [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      [1] "MSMtermName used"
      [1] "meanExposure"
      [1] "MSMterm_vals last"
       [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
      [1] "MSMterm_vals last"
       [1] 0.0000000 0.0000000 0.0000000 0.2500000 0.4000000 0.5000000 0.5714286
       [8] 0.6250000 0.6666667 0.7000000 0.7272727 0.7500000 0.7692308 0.7857143
      [15] 0.8000000 0.8125000 0.8235294
      [1] "MSMterm_vals last"
       [1] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.1428571
       [8] 0.2500000 0.3333333 0.4000000 0.4545455 0.5000000 0.5384615 0.5714286
      [15] 0.6000000 0.6250000 0.6470588
      [1] "MSMterm_vals last"
       [1] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
       [7] 0.00000000 0.00000000 0.00000000 0.00000000 0.09090909 0.16666667
      [13] 0.23076923 0.28571429 0.33333333 0.37500000 0.41176471
      [1] "MSMterm_vals last"
       [1] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
       [7] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
      [13] 0.00000000 0.07142857 0.13333333 0.18750000 0.23529412
      [1] "MSMterm_vals last"
       [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      [1] 0
       [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
      [1] 5
       [1] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.1666667 0.2857143
       [8] 0.3750000 0.4444444 0.5000000 0.5454545 0.5833333 0.6153846 0.6428571
      [15] 0.6666667 0.6875000 0.7058824
      [1] 10
       [1] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
       [7] 0.00000000 0.00000000 0.00000000 0.00000000 0.09090909 0.16666667
      [13] 0.23076923 0.28571429 0.33333333 0.37500000 0.41176471
      [1] 17
       [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      data not specified, simulating full data
      no actions specified, sampling full data for ALL actions from the DAG
      evaluating the target on 200 simulated samples per action
      MSM: fitting glm to full data
      [1] "MSMtermName used"
      [1] "meanExposure"
      [1] "MSMterm_vals last"
       [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
      [1] "MSMterm_vals last"
       [1] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.1666667 0.2857143
       [8] 0.3750000 0.4444444 0.5000000 0.5454545 0.5833333 0.6153846 0.6428571
      [15] 0.6666667 0.6875000 0.7058824
      [1] "MSMterm_vals last"
       [1] 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000
       [7] 0.00000000 0.00000000 0.00000000 0.00000000 0.09090909 0.16666667
      [13] 0.23076923 0.28571429 0.33333333 0.37500000 0.41176471
      [1] "MSMterm_vals last"
       [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       done successfully.
      
      
      
      Executing test function test.long.wide.simobs  ...  done successfully.
      
      
      
      Executing test function test.networkgen1  ... [1] "automatic Kmax: "
      [1] 2
      [1] "NetInd_k"
           [,1] [,2]
      [1,]   NA   NA
      [2,]    6    9
      [3,]    8   NA
      [4,]   NA   NA
      [5,]    7   NA
      [6,]   10   NA
      existing node Net.sample was modified
      simulating network with ER model using m: 10
      [1] "automatic Kmax: "
      [1] 2
      [1] "NetInd_k"
           [,1] [,2]
      [1,]    4   10
      [2,]   NA   NA
      [3,]    6   NA
      [4,]    3   NA
      [5,]    2    8
      [6,]    1   NA
      existing node Net.sample was modified
      simulating network with ER model using m: 10
      [1] "automatic Kmax: "
      [1] 2
      [1] "NetInd_k"
           [,1] [,2]
      [1,]    7   NA
      [2,]    7   NA
      [3,]    2   NA
      [4,]    9   NA
      [5,]    3   NA
      [6,]    7   NA
      simulating network with ER model using m: 10
      [1] "automatic Kmax: "
      [1] 3
      [1] "NetInd_k"
           [,1] [,2] [,3]
      [1,]   NA   NA   NA
      [2,]   NA   NA   NA
      [3,]   NA   NA   NA
      [4,]    1   NA   NA
      [5,]    6   NA   NA
      [6,]    2   10   NA
      simulating network with ER model using m: 500000
      [1] "automatic Kmax: "
      [1] 551
      [1] "NetInd_k"
           [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13] [,14]
      [1,]    2    3    8   10   14   16   17   18   19    20    21    22    23    24
      [2,]    1    3    5    7    8    9   10   11   12    16    17    18    21    22
      [3,]    1    2    7    8    9   11   12   14   15    17    22    23    25    26
      [4,]    5    6    8    9   10   12   13   15   17    18    20    22    24    25
      [5,]    1    6    7    9   11   15   18   20   23    26    27    28    30    33
      [6,]    9   12   13   15   16   18   21   23   24    26    27    28    29    30
           [,15] [,16] [,17] [,18] [,19] [,20] [,21] [,22] [,23] [,24] [,25] [,26]
      [1,]    28    33    35    38    40    43    44    45    47    49    51    53
      [2,]    27    28    34    37    40    42    43    45    46    48    51    52
      [3,]    27    32    35    36    37    41    44    45    47    49    50    53
      [4,]    26    29    31    36    38    39    41    42    45    49    51    52
      [5,]    35    36    43    44    45    46    48    50    58    60    61    62
      [6,]    34    38    39    40    41    42    43    45    46    49    50    53
           [,27] [,28] [,29] [,30] [,31] [,32] [,33] [,34] [,35] [,36] [,37] [,38]
      [1,]    56    57    58    59    62    63    66    67    68    69    72    75
      [2,]    55    56    57    63    64    66    67    69    70    72    75    76
      [3,]    56    57    58    59    61    63    64    65    67    69    71    74
      [4,]    54    56    59    60    61    65    67    70    73    75    76    77
      [5,]    63    66    72    76    77    81    84    85    86    87    89    90
      [6,]    54    57    60    61    64    65    66    67    68    69    73    75
           [,39] [,40] [,41] [,42] [,43] [,44] [,45] [,46] [,47] [,48] [,49] [,50]
      [1,]    77    78    79    81    83    84    88    89    91    92    93    95
      [2,]    78    79    80    81    83    87    88    90    96   101   107   110
      [3,]    75    76    77    82    83    84    86    87    89    94    95    96
      [4,]    78    80    81    82    84    87    91    92    95    97    98   102
      [5,]    91    94    95    99   100   101   103   105   106   108   109   111
      [6,]    76    77    81    83    84    85    86    88    89   100   102   105
           [,51] [,52] [,53] [,54] [,55] [,56] [,57] [,58] [,59] [,60] [,61] [,62]
      [1,]    97    98    99   100   101   105   106   107   109   110   111   115
      [2,]   113   114   115   116   117   123   124   125   127   135   136   138
      [3,]    97   100   101   102   106   107   112   113   117   119   120   121
      [4,]   103   105   107   108   110   112   114   120   121   124   125   126
      [5,]   114   117   118   120   121   123   124   125   128   129   130   131
      [6,]   106   108   110   111   114   115   116   118   119   121   122   123
           [,63] [,64] [,65] [,66] [,67] [,68] [,69] [,70] [,71] [,72] [,73] [,74]
      [1,]   118   119   120   122   127   128   131   136   137   138   141   145
      [2,]   139   141   142   143   144   145   147   148   149   150   151   153
      [3,]   122   124   127   128   130   132   133   134   137   138   140   141
      [4,]   129   131   132   133   134   135   136   137   138   140   141   142
      [5,]   133   134   135   137   139   144   145   147   148   149   151   152
      [6,]   125   127   128   131   137   138   139   142   144   148   149   150
           [,75] [,76] [,77] [,78] [,79] [,80] [,81] [,82] [,83] [,84] [,85] [,86]
      [1,]   146   148   150   151   152   153   154   155   156   159   160   161
      [2,]   154   156   157   159   160   161   164   165   168   171   173   175
      [3,]   143   144   146   150   153   156   157   158   159   162   163   165
      [4,]   153   154   156   157   158   162   163   164   165   166   168   170
      [5,]   155   157   158   159   161   164   167   168   169   171   172   173
      [6,]   151   153   156   157   158   159   163   165   166   167   168   169
           [,87] [,88] [,89] [,90] [,91] [,92] [,93] [,94] [,95] [,96] [,97] [,98]
      [1,]   163   164   165   167   168   170   171   177   180   182   184   186
      [2,]   176   182   183   184   185   189   191   192   194   195   197   198
      [3,]   167   169   171   173   175   179   180   183   184   185   186   187
      [4,]   175   178   179   180   181   182   183   184   185   187   188   190
      [5,]   179   182   183   187   189   190   192   194   199   203   204   205
      [6,]   170   174   176   177   179   185   188   190   194   196   197   199
           [,99] [,100] [,101] [,102] [,103] [,104] [,105] [,106] [,107] [,108]
      [1,]   187    188    189    191    192    196    197    198    200    201
      [2,]   200    202    203    205    206    209    211    214    217    218
      [3,]   188    189    190    194    195    198    199    200    201    202
      [4,]   192    193    194    195    199    200    201    203    204    208
      [5,]   206    207    209    211    212    214    217    219    220    221
      [6,]   200    201    204    208    209    216    217    218    222    223
           [,109] [,110] [,111] [,112] [,113] [,114] [,115] [,116] [,117] [,118]
      [1,]    202    203    204    206    209    212    213    215    216    219
      [2,]    219    220    222    223    224    225    226    227    231    232
      [3,]    203    204    205    209    211    212    213    215    216    220
      [4,]    211    212    217    220    221    224    226    230    232    233
      [5,]    222    223    224    225    227    228    234    235    236    238
      [6,]    224    225    227    228    229    233    236    237    238    239
           [,119] [,120] [,121] [,122] [,123] [,124] [,125] [,126] [,127] [,128]
      [1,]    220    227    228    230    232    236    237    239    242    244
      [2,]    233    234    235    236    238    239    240    241    242    243
      [3,]    221    224    225    227    228    229    231    232    235    239
      [4,]    235    241    242    246    247    248    249    251    253    254
      [5,]    240    241    243    247    248    249    251    252    254    255
      [6,]    241    242    246    247    252    253    254    260    261    262
           [,129] [,130] [,131] [,132] [,133] [,134] [,135] [,136] [,137] [,138]
      [1,]    246    247    250    251    252    253    254    255    258    260
      [2,]    244    245    247    249    250    254    255    256    262    264
      [3,]    241    243    245    246    247    251    252    255    256    258
      [4,]    256    258    259    260    266    269    270    272    273    274
      [5,]    259    261    263    264    266    267    268    269    270    271
      [6,]    266    268    269    271    273    276    281    283    284    285
           [,139] [,140] [,141] [,142] [,143] [,144] [,145] [,146] [,147] [,148]
      [1,]    261    262    264    265    269    272    276    279    280    281
      [2,]    265    266    267    269    271    272    275    279    281    282
      [3,]    261    263    265    266    267    270    271    272    273    274
      [4,]    277    281    283    286    287    289    293    294    295    296
      [5,]    273    274    280    281    282    285    289    291    294    295
      [6,]    287    288    289    290    291    293    294    295    298    300
           [,149] [,150] [,151] [,152] [,153] [,154] [,155] [,156] [,157] [,158]
      [1,]    283    286    289    290    292    293    298    299    301    302
      [2,]    285    287    292    294    297    299    300    301    302    304
      [3,]    275    277    279    280    281    282    283    284    286    287
      [4,]    298    300    301    302    304    305    306    307    308    309
      [5,]    296    297    298    300    301    303    305    306    307    308
      [6,]    302    307    311    312    314    315    318    319    320    323
           [,159] [,160] [,161] [,162] [,163] [,164] [,165] [,166] [,167] [,168]
      [1,]    304    305    306    308    311    313    315    316    319    322
      [2,]    308    316    318    320    326    327    329    330    331    334
      [3,]    288    289    290    291    292    294    295    301    302    303
      [4,]    313    318    320    321    322    325    327    328    329    330
      [5,]    309    312    313    317    319    320    321    322    323    324
      [6,]    326    328    332    335    336    338    342    343    344    346
           [,169] [,170] [,171] [,172] [,173] [,174] [,175] [,176] [,177] [,178]
      [1,]    324    325    327    329    331    332    335    336    343    345
      [2,]    335    337    340    341    343    344    345    347    348    349
      [3,]    306    307    308    310    312    316    317    320    324    327
      [4,]    331    332    336    337    341    342    344    345    346    348
      [5,]    325    326    327    329    331    333    334    335    337    338
      [6,]    347    348    349    351    352    353    354    355    358    361
           [,179] [,180] [,181] [,182] [,183] [,184] [,185] [,186] [,187] [,188]
      [1,]    347    349    350    352    354    356    357    358    359    360
      [2,]    350    351    352    353    354    355    356    359    360    362
      [3,]    330    331    332    334    338    339    340    341    344    345
      [4,]    351    352    356    360    361    365    366    367    368    372
      [5,]    339    341    343    344    346    348    349    353    354    356
      [6,]    362    364    368    371    372    374    375    376    378    381
           [,189] [,190] [,191] [,192] [,193] [,194] [,195] [,196] [,197] [,198]
      [1,]    362    365    367    369    372    374    375    380    383    385
      [2,]    364    367    372    373    379    380    381    383    385    386
      [3,]    346    348    353    354    355    357    359    360    362    364
      [4,]    375    376    377    378    379    380    383    389    390    391
      [5,]    359    360    361    362    365    371    373    374    375    376
      [6,]    382    384    385    387    388    390    391    392    393    394
           [,199] [,200] [,201] [,202] [,203] [,204] [,205] [,206] [,207] [,208]
      [1,]    389    391    397    399    400    401    404    405    418    420
      [2,]    389    391    396    397    398    399    402    403    405    407
      [3,]    366    367    369    371    372    373    376    381    385    386
      [4,]    395    397    399    400    402    403    405    406    407    408
      [5,]    379    380    381    382    383    384    385    388    389    390
      [6,]    395    396    397    398    400    402    403    404    405    407
           [,209] [,210] [,211] [,212] [,213] [,214] [,215] [,216] [,217] [,218]
      [1,]    421    423    427    431    432    435    436    437    438    439
      [2,]    409    411    414    421    422    424    425    426    429    430
      [3,]    388    390    391    395    399    400    401    403    404    405
      [4,]    412    415    416    417    422    423    424    425    429    430
      [5,]    397    399    400    401    402    405    406    407    408    409
      [6,]    408    409    412    414    415    416    419    420    421    425
           [,219] [,220] [,221] [,222] [,223] [,224] [,225] [,226] [,227] [,228]
      [1,]    440    442    444    448    449    450    451    455    460    462
      [2,]    432    436    438    439    440    445    449    452    454    455
      [3,]    406    407    408    411    412    413    414    416    418    419
      [4,]    442    443    444    448    449    450    451    454    455    457
      [5,]    411    412    416    418    420    421    422    426    429    430
      [6,]    426    428    430    431    432    435    438    439    443    446
           [,229] [,230] [,231] [,232] [,233] [,234] [,235] [,236] [,237] [,238]
      [1,]    469    472    477    478    479    481    486    491    494    495
      [2,]    457    458    462    463    464    466    468    469    470    471
      [3,]    422    424    425    429    430    431    433    435    440    441
      [4,]    458    461    463    468    469    475    476    477    482    487
      [5,]    433    435    439    441    443    446    449    450    451    462
      [6,]    447    448    451    453    455    457    458    460    463    464
           [,239] [,240] [,241] [,242] [,243] [,244] [,245] [,246] [,247] [,248]
      [1,]    496    497    499    500    501    503    504    505    506    508
      [2,]    472    473    474    475    478    481    485    488    489    490
      [3,]    443    445    447    448    451    453    455    457    458    459
      [4,]    489    490    491    492    494    497    498    501    502    503
      [5,]    463    468    469    472    473    474    477    479    480    483
      [6,]    466    468    470    473    475    479    481    484    487    489
           [,249] [,250] [,251] [,252] [,253] [,254] [,255] [,256] [,257] [,258]
      [1,]    509    510    511    512    515    518    522    523    524    526
      [2,]    491    492    493    494    496    497    500    503    505    508
      [3,]    461    463    468    469    470    471    472    474    479    480
      [4,]    509    512    513    517    520    521    523    524    526    527
      [5,]    484    486    487    488    489    490    491    492    494    496
      [6,]    491    492    494    495    497    498    500    504    505    508
           [,259] [,260] [,261] [,262] [,263] [,264] [,265] [,266] [,267] [,268]
      [1,]    529    531    534    535    537    539    542    543    545    546
      [2,]    510    511    516    517    519    520    521    522    523    524
      [3,]    486    488    491    492    494    496    497    499    500    501
      [4,]    528    529    530    531    536    537    539    540    542    544
      [5,]    497    500    501    502    505    507    508    513    514    517
      [6,]    510    511    512    513    515    519    520    521    523    524
           [,269] [,270] [,271] [,272] [,273] [,274] [,275] [,276] [,277] [,278]
      [1,]    551    553    554    555    556    560    562    564    568    569
      [2,]    526    528    531    533    534    535    540    541    543    544
      [3,]    502    503    506    509    511    512    514    515    516    518
      [4,]    545    546    549    550    556    557    559    560    563    565
      [5,]    518    520    522    529    530    531    532    536    537    540
      [6,]    526    529    530    531    533    534    536    539    540    542
           [,279] [,280] [,281] [,282] [,283] [,284] [,285] [,286] [,287] [,288]
      [1,]    570    571    574    576    578    581    582    583    585    588
      [2,]    545    549    550    552    558    559    561    562    563    564
      [3,]    520    521    523    525    530    532    533    535    541    542
      [4,]    567    569    571    573    578    579    580    582    583    586
      [5,]    542    545    547    550    557    558    559    560    561    563
      [6,]    543    545    546    547    548    549    550    552    553    554
           [,289] [,290] [,291] [,292] [,293] [,294] [,295] [,296] [,297] [,298]
      [1,]    589    590    596    599    600    602    604    607    608    609
      [2,]    565    569    570    573    574    575    578    579    580    583
      [3,]    543    546    548    550    554    555    557    558    559    560
      [4,]    587    588    589    595    596    597    599    600    601    603
      [5,]    566    568    570    571    573    575    576    579    584    586
      [6,]    556    560    561    562    566    567    571    572    573    574
           [,299] [,300] [,301] [,302] [,303] [,304] [,305] [,306] [,307] [,308]
      [1,]    615    616    618    621    623    624    627    629    631    633
      [2,]    584    588    593    594    595    597    600    601    602    605
      [3,]    561    562    563    564    565    567    568    577    578    579
      [4,]    605    606    610    611    612    613    615    616    617    618
      [5,]    588    589    592    594    598    599    602    603    604    605
      [6,]    575    576    577    581    583    589    593    594    595    596
           [,309] [,310] [,311] [,312] [,313] [,314] [,315] [,316] [,317] [,318]
      [1,]    634    635    636    637    639    640    642    645    646    647
      [2,]    610    611    613    618    619    621    624    629    631    633
      [3,]    581    582    583    585    587    588    589    591    594    596
      [4,]    619    620    623    624    625    626    629    634    637    640
      [5,]    608    611    613    616    617    620    624    625    627    632
      [6,]    598    600    601    602    604    609    610    611    614    615
           [,319] [,320] [,321] [,322] [,323] [,324] [,325] [,326] [,327] [,328]
      [1,]    648    649    652    653    655    656    657    659    663    666
      [2,]    634    636    637    638    640    643    644    645    650    651
      [3,]    597    599    601    602    603    604    605    606    608    611
      [4,]    642    649    654    655    656    657    658    660    661    664
      [5,]    634    639    642    646    647    650    653    662    663    665
      [6,]    616    618    619    620    622    624    628    630    631    634
           [,329] [,330] [,331] [,332] [,333] [,334] [,335] [,336] [,337] [,338]
      [1,]    668    669    672    674    675    677    678    679    685    689
      [2,]    653    656    660    664    666    667    668    670    671    673
      [3,]    613    614    622    623    624    628    629    630    631    632
      [4,]    665    666    668    669    670    673    674    675    676    677
      [5,]    666    667    669    672    673    674    675    678    679    681
      [6,]    636    638    641    644    646    647    648    649    650    652
           [,339] [,340] [,341] [,342] [,343] [,344] [,345] [,346] [,347] [,348]
      [1,]    691    694    697    698    701    705    707    708    709    710
      [2,]    674    675    678    679    680    681    685    686    687    688
      [3,]    633    636    637    641    644    646    651    652    653    654
      [4,]    678    679    680    682    685    686    688    689    690    691
      [5,]    682    687    690    691    694    698    701    705    708    711
      [6,]    653    654    656    658    659    661    662    668    669    671
           [,349] [,350] [,351] [,352] [,353] [,354] [,355] [,356] [,357] [,358]
      [1,]    711    714    715    717    719    721    726    728    730    731
      [2,]    693    694    697    699    700    704    706    708    709    712
      [3,]    655    657    658    659    660    661    663    668    670    671
      [4,]    693    695    696    699    700    701    702    703    704    706
      [5,]    712    713    714    715    716    717    718    719    720    721
      [6,]    672    674    675    678    680    681    683    684    689    691
           [,359] [,360] [,361] [,362] [,363] [,364] [,365] [,366] [,367] [,368]
      [1,]    732    733    734    735    738    739    740    745    749    750
      [2,]    714    715    716    719    721    722    726    727    730    731
      [3,]    673    678    679    680    681    682    684    685    686    689
      [4,]    707    710    711    715    717    718    720    721    722    723
      [5,]    722    725    726    730    731    732    733    734    735    738
      [6,]    693    697    698    701    703    705    706    710    712    713
           [,369] [,370] [,371] [,372] [,373] [,374] [,375] [,376] [,377] [,378]
      [1,]    751    752    753    757    758    760    762    765    768    769
      [2,]    733    734    735    737    738    739    740    742    743    744
      [3,]    692    693    695    701    706    710    711    715    716    718
      [4,]    724    725    726    727    728    729    731    733    734    735
      [5,]    739    740    741    742    744    746    749    750    751    753
      [6,]    717    720    721    722    724    725    726    729    730    734
           [,379] [,380] [,381] [,382] [,383] [,384] [,385] [,386] [,387] [,388]
      [1,]    771    774    775    778    779    780    781    782    784    785
      [2,]    745    747    748    749    750    751    752    755    756    757
      [3,]    719    721    724    725    728    730    732    734    739    741
      [4,]    739    744    745    747    749    751    753    754    759    760
      [5,]    757    760    763    765    766    769    771    772    776    779
      [6,]    735    736    738    739    740    741    744    745    747    748
           [,389] [,390] [,391] [,392] [,393] [,394] [,395] [,396] [,397] [,398]
      [1,]    786    787    788    792    794    795    796    797    803    804
      [2,]    758    759    760    762    763    764    766    767    769    770
      [3,]    742    744    745    748    750    753    758    759    763    766
      [4,]    762    767    769    770    772    774    775    776    777    780
      [5,]    780    781    783    786    787    788    789    792    794    795
      [6,]    751    752    755    756    758    759    760    761    763    765
           [,399] [,400] [,401] [,402] [,403] [,404] [,405] [,406] [,407] [,408]
      [1,]    806    808    812    814    815    819    820    823    826    830
      [2,]    772    773    778    781    782    783    784    785    788    789
      [3,]    768    769    771    772    773    776    777    778    780    783
      [4,]    786    787    792    793    794    796    798    799    800    803
      [5,]    798    801    802    804    805    806    807    808    810    812
      [6,]    766    767    769    774    775    779    782    783    784    786
           [,409] [,410] [,411] [,412] [,413] [,414] [,415] [,416] [,417] [,418]
      [1,]    831    833    835    836    838    843    845    847    848    849
      [2,]    791    792    793    794    795    797    799    801    803    804
      [3,]    784    785    786    788    789    792    793    794    795    799
      [4,]    808    809    810    811    814    816    818    819    820    821
      [5,]    814    816    822    824    825    826    828    830    836    838
      [6,]    787    789    792    793    794    795    798    803    804    806
           [,419] [,420] [,421] [,422] [,423] [,424] [,425] [,426] [,427] [,428]
      [1,]    851    852    854    855    857    858    859    860    861    863
      [2,]    805    807    809    810    811    814    815    817    819    820
      [3,]    802    804    806    807    808    810    811    815    816    818
      [4,]    824    825    826    827    830    831    832    835    836    837
      [5,]    839    840    841    842    843    848    850    851    852    857
      [6,]    807    808    809    812    813    814    815    816    817    821
           [,429] [,430] [,431] [,432] [,433] [,434] [,435] [,436] [,437] [,438]
      [1,]    865    866    867    868    870    874    876    878    879    883
      [2,]    821    822    825    826    827    828    829    830    832    833
      [3,]    819    823    824    827    828    831    833    837    839    840
      [4,]    840    842    843    844    845    846    849    850    851    852
      [5,]    859    863    864    866    867    868    871    873    878    879
      [6,]    824    827    833    834    835    838    840    841    843    844
           [,439] [,440] [,441] [,442] [,443] [,444] [,445] [,446] [,447] [,448]
      [1,]    885    886    888    889    890    892    893    894    896    897
      [2,]    834    837    839    840    842    843    845    848    849    850
      [3,]    844    845    846    847    849    853    855    858    859    860
      [4,]    854    863    864    868    872    874    877    879    881    885
      [5,]    880    881    882    886    887    889    890    891    892    893
      [6,]    845    849    850    851    855    857    863    864    866    869
           [,449] [,450] [,451] [,452] [,453] [,454] [,455] [,456] [,457] [,458]
      [1,]    898    899    901    902    908    909    912    916    918    920
      [2,]    851    852    855    856    857    858    859    864    865    866
      [3,]    861    862    864    866    871    872    876    877    879    880
      [4,]    888    890    891    899    900    901    903    904    906    907
      [5,]    895    896    898    904    905    907    909    914    916    918
      [6,]    870    871    873    874    877    878    879    881    882    885
           [,459] [,460] [,461] [,462] [,463] [,464] [,465] [,466] [,467] [,468]
      [1,]    921    922    923    930    931    933    934    935    938    939
      [2,]    868    875    876    878    879    881    882    883    884    885
      [3,]    882    886    887    888    889    890    891    897    898    900
      [4,]    911    912    913    915    916    918    920    921    922    924
      [5,]    920    921    922    923    924    926    928    932    933    934
      [6,]    887    888    890    892    899    900    901    903    905    909
           [,469] [,470] [,471] [,472] [,473] [,474] [,475] [,476] [,477] [,478]
      [1,]    945    946    949    952    953    954    955    956    961    962
      [2,]    886    887    888    892    893    895    898    900    901    902
      [3,]    902    903    906    907    909    911    912    913    917    918
      [4,]    926    927    929    931    933    936    937    939    946    947
      [5,]    936    937    938    939    941    944    946    947    951    953
      [6,]    910    911    912    914    916    921    922    923    926    930
           [,479] [,480] [,481] [,482] [,483] [,484] [,485] [,486] [,487] [,488]
      [1,]    963    965    969    972    974    975    976    977    979    981
      [2,]    903    905    908    910    911    912    920    921    922    924
      [3,]    922    924    929    930    932    933    934    935    937    939
      [4,]    950    951    952    953    954    956    957    959    960    964
      [5,]    954    961    962    963    965    970    974    976    979    980
      [6,]    931    932    935    937    940    941    942    943    944    947
           [,489] [,490] [,491] [,492] [,493] [,494] [,495] [,496] [,497] [,498]
      [1,]    986    989    990    992    994    997   1000     NA     NA     NA
      [2,]    925    926    929    931    932    934    936    937    938    939
      [3,]    940    941    945    946    947    951    954    955    956    957
      [4,]    965    966    969    971    973    978    983    984    985    986
      [5,]    981    982    985    986    990    991    992    995    997    998
      [6,]    948    951    953    954    956    958    961    962    963    964
           [,499] [,500] [,501] [,502] [,503] [,504] [,505] [,506] [,507] [,508]
      [1,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
      [2,]    940    943    945    948    950    953    956    957    960    961
      [3,]    958    960    962    963    966    967    968    970    972    973
      [4,]    987    991    992    993    997    999     NA     NA     NA     NA
      [5,]    999   1000     NA     NA     NA     NA     NA     NA     NA     NA
      [6,]    965    967    968    970    973    974    977    978    981    982
           [,509] [,510] [,511] [,512] [,513] [,514] [,515] [,516] [,517] [,518]
      [1,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
      [2,]    963    965    968    969    970    971    972    973    974    977
      [3,]    974    975    978    980    983    984    985    986    990    991
      [4,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
      [5,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
      [6,]    983    986    987    988    992    993    994    995    998    999
           [,519] [,520] [,521] [,522] [,523] [,524] [,525] [,526] [,527] [,528]
      [1,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
      [2,]    978    982    983    984    985    986    987    988    989    991
      [3,]    992    993    994    995    998   1000     NA     NA     NA     NA
      [4,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
      [5,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
      [6,]   1000     NA     NA     NA     NA     NA     NA     NA     NA     NA
           [,529] [,530] [,531] [,532] [,533] [,534] [,535] [,536] [,537] [,538]
      [1,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
      [2,]    992    994   1000     NA     NA     NA     NA     NA     NA     NA
      [3,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
      [4,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
      [5,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
      [6,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
           [,539] [,540] [,541] [,542] [,543] [,544] [,545] [,546] [,547] [,548]
      [1,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
      [2,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
      [3,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
      [4,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
      [5,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
      [6,]     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA
           [,549] [,550] [,551]
      [1,]     NA     NA     NA
      [2,]     NA     NA     NA
      [3,]     NA     NA     NA
      [4,]     NA     NA     NA
      [5,]     NA     NA     NA
      [6,]     NA     NA     NA
       done successfully.
      
      
      
      Executing test function test.networkgen2  ... [1] "K in genNET: 6"
      [1] "K in genNET: 6"
       done successfully.
      
      
      
      Executing test function test.networkgen_time  ... Error in W2[[0]] : variable W2 doesn't exist
      In addition: Warning messages:
      1: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: Marsaglia-Multicarry has poor statistical properties
      2: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: severe deviations from normality for Kinderman-Ramage + Marsaglia-Multicarry
      3: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: Marsaglia-Multicarry has poor statistical properties
      4: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: severe deviations from normality for Kinderman-Ramage + Marsaglia-Multicarry
      5: In (function (n, probs)  :
        This function is deprecated, please use rcat.b1() instead.
      6: In (function (n, probs)  :
        This function is deprecated, please use rcat.b1() instead.
      Error : error while evaluating node F.W2_0 formula: 
      W2[[0]].
      Check syntax specification.
      Error in set.DAG(D) : 
      ...attempt to simulate data from DAG failed...
      Error in F.W1[0:1][[0]] : 
      ...network indexing variable evaluated to more than one column ...
      Error : error while evaluating node F.W1_2 formula: 
      F.W1[0:1][[0]].
      Check syntax specification.
      Error in set.DAG(D) : 
      ...attempt to simulate data from DAG failed...
      Error : Undefined variable: F.A
      Error in set.DAG(D) : 
      ...attempt to simulate data from DAG failed...
       done successfully.
      
      
      
      Executing test function test.tKmaxnet  ... Error in eval.nodeform.full(expr_call = expr_call, expr_str = expr_str,  : 
        reference A[...] at node B is not allowed; node A was defined as time-invariant
      Error in set.DAG(D.t) : 
      ...attempt to simulate data from DAG failed...
      Error : Undefined variable: xyz
      Error in set.DAG(D.t) : 
      ...attempt to simulate data from DAG failed...
      Error in eval.nodeform.full(expr_call = expr_call, expr_str = expr_str,  : 
        reference A[...] at node B is not allowed; node A was defined as time-invariant
      In addition: Warning message:
      In FUN(X[[i]], ...) : the argument inside [...] cannot be parsed: A[rnorm]
      Error in set.DAG(D.t) : 
      ...attempt to simulate data from DAG failed...
       done successfully.
      
      
      
      Executing test function test.MV  ... Loading required package: mvtnorm
      ...automatically assigning order attribute to some nodes...
      node X1.X2.X3, order:1
      node Y1.Y2, order:2
      node A, order:3
      Loading required package: copula
      
      Attaching package: 'copula'
      
      The following object is masked from 'package:simcausal':
      
          A
      
      Don't know the expression result type S4FALSE
      Don't know the expression result type S4FALSE
      Don't know the expression result type S4FALSE
      Don't know the expression result type S4FALSE
      Don't know the expression result type S4FALSE
      Don't know the expression result type S4FALSE
      Don't know the expression result type S4FALSE
      Don't know the expression result type S4FALSE
      Don't know the expression result type S4FALSE
      Don't know the expression result type S4FALSE
      [1] "current list of user-defined vectorized functions: qbinom"
      Loading required package: bindata
       done successfully.
      
      
      
      Executing test function test.NSEbug  ... [1] "s"
      [1] 1
      [1] "t"
      [1] 0
      [1] "variable"
      [1] "(Intercept)"
      [1] "s"
      [1] 1
      [1] "t"
      [1] 0
      [1] "variable"
      [1] "mse"
      [1] "s"
      [1] 2
      [1] "t"
      [1] 0
      [1] "variable"
      [1] "(Intercept)"
      [1] "s"
      [1] 2
      [1] "t"
      [1] 0
      [1] "variable"
      [1] "mse"
      existing node L1_0 was modified
      [1] "s"
      [1] 3
      [1] "t"
      [1] 0
      [1] "variable"
      [1] "(Intercept)"
      [1] "s"
      [1] 3
      [1] "t"
      [1] 0
      [1] "variable"
      [1] "mse"
      existing node L1_0 was modified
      [1] "s"
      [1] 1
      [1] "t"
      [1] 1
      [1] "variable"
      [1] "(Intercept)"
      [1] "s"
      [1] 1
      [1] "t"
      [1] 1
      [1] "variable"
      [1] "mse"
      [1] "s"
      [1] 2
      [1] "t"
      [1] 1
      [1] "variable"
      [1] "(Intercept)"
      [1] "s"
      [1] 2
      [1] "t"
      [1] 1
      [1] "variable"
      [1] "mse"
      [1] "s"
      [1] 3
      [1] "t"
      [1] 1
      [1] "variable"
      [1] "(Intercept)"
      [1] "s"
      [1] 3
      [1] "t"
      [1] 1
      [1] "variable"
      [1] "mse"
      [1] "s"
      [1] 1
      [1] "t"
      [1] 2
      [1] "variable"
      [1] "(Intercept)"
      [1] "s"
      [1] 1
      [1] "t"
      [1] 2
      [1] "variable"
      [1] "mse"
      existing node L1_2 was modified
      [1] "s"
      [1] 2
      [1] "t"
      [1] 2
      [1] "variable"
      [1] "(Intercept)"
      [1] "s"
      [1] 2
      [1] "t"
      [1] 2
      [1] "variable"
      [1] "mse"
      [1] "s"
      [1] 3
      [1] "t"
      [1] 2
      [1] "variable"
      [1] "(Intercept)"
      [1] "s"
      [1] 3
      [1] "t"
      [1] 2
      [1] "variable"
      [1] "mse"
       done successfully.
      
      ------------------- UNIT TEST SUMMARY ---------------------
      
      RUNIT TEST PROTOCOL -- Tue Jul  2 07:40:44 2024 
      *********************************************** 
      Number of test functions: 28 
      Number of errors: 1 
      Number of failures: 0 
      
       
      1 Test Suite : 
      simcausal unit testing - 28 test functions, 1 error, 0 failures
      ERROR in test.latent: Error : `from()` was deprecated in igraph 2.0.4 and is now defunct.
      ℹ Please use `.from()` instead.
      Error: 
      
      unit testing failed (#test failures: 0, #R errors: 1)
      
      In addition: Warning messages:
      1: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: Marsaglia-Multicarry has poor statistical properties
      2: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: severe deviations from normality for Kinderman-Ramage + Marsaglia-Multicarry
      3: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: Marsaglia-Multicarry has poor statistical properties
      4: In RNGkind(kind = testSuite$rngKind, normal.kind = testSuite$rngNormalKind) :
        RNGkind: severe deviations from normality for Kinderman-Ramage + Marsaglia-Multicarry
      Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘simcausal_vignette.Rnw’ using knitr
    Error: processing vignette 'simcausal_vignette.Rnw' failed with diagnostics:
    Running 'texi2dvi' on 'simcausal_vignette.tex' failed.
    LaTeX errors:
    ! LaTeX Error: File `colortbl.sty' not found.
    
    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)
    
    ! Emergency stop.
    <read *> 
             
    l.55 \RequirePackage
                        [T1]{fontenc}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘simcausal_vignette.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘simcausal_vignette.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# skynet

<details>

* Version: 1.4.3
* GitHub: https://github.com/ropensci/skynet
* Source code: https://github.com/cran/skynet
* Date/Publication: 2022-06-17 13:00:02 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::cloud_details(, "skynet")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(skynet)
      > 
      > test_check("skynet")
      [ FAIL 1 | WARN 24 | SKIP 4 | PASS 69 ]
      
      ══ Skipped tests (4) ═══════════════════════════════════════════════════════════
      • On CRAN (4): 'test_download_db1b.R:6:3', 'test_download_ontime.R:6:3',
        'test_download_t100.R:6:3', 'test_download_t100.R:13:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_smallerfunctions.R:16:3'): From To function ────────────────────
      <lifecycle_error_deprecated/defunctError/rlang_error/error/condition>
      Error: `from()` was deprecated in igraph 2.0.4 and is now defunct.
      ℹ Please use `.from()` instead.
      Backtrace:
           ▆
        1. ├─testthat::expect_output(...) at test_smallerfunctions.R:16:3
        2. │ └─testthat:::quasi_capture(...)
        3. │   ├─testthat (local) .capture(...)
        4. │   │ └─testthat::capture_output_lines(code, print, width = width)
        5. │   │   └─testthat:::eval_with_output(code, print = print, width = width)
        6. │   │     ├─withr::with_output_sink(path, withVisible(code))
        7. │   │     │ └─base::force(code)
        8. │   │     └─base::withVisible(code)
        9. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       10. ├─base::print(from_to_stats(test$gDir, "JFK", orig = "from"))
       11. └─skynet::from_to_stats(test$gDir, "JFK", orig = "from")
       12.   ├─E(x)[from(V(x)[y])]
       13.   └─igraph:::`[.igraph.es`(E(x), from(V(x)[y]))
       14.     └─igraph:::lazy_eval(...)
       15.       └─base::lapply(x, lazy_eval, data = data)
       16.         └─igraph (local) FUN(X[[i]], ...)
       17.           └─base::eval(x$expr, data, x$env)
       18.             └─base::eval(x$expr, data, x$env)
       19.               └─igraph (local) from(V(x)[y])
       20.                 └─lifecycle::deprecate_stop("2.0.4", "from()", ".from()")
       21.                   └─lifecycle:::deprecate_stop0(msg)
       22.                     └─rlang::cnd_signal(...)
      
      [ FAIL 1 | WARN 24 | SKIP 4 | PASS 69 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘maps’
      All declared Imports should be used.
    ```

# tidygraph

<details>

* Version: 1.3.1
* GitHub: https://github.com/thomasp85/tidygraph
* Source code: https://github.com/cran/tidygraph
* Date/Publication: 2024-01-30 13:40:02 UTC
* Number of recursive dependencies: 80

Run `revdepcheck::cloud_details(, "tidygraph")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > # This file is part of the standard setup for testthat.
      > # It is recommended that you do not modify it.
      > #
      > # Where should you do additional test configuration?
      > # Learn more about the roles of various files in:
      > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
      > # * https://testthat.r-lib.org/articles/special-files.html
      > 
      > library(testthat)
      > library(tidygraph)
      
      Attaching package: 'tidygraph'
      
      The following object is masked from 'package:testthat':
      
          matches
      
      The following object is masked from 'package:stats':
      
          filter
      
      > 
      > test_check("tidygraph")
      Ungrouping `.data`...
      Splitting by nodes
      Unfocusing graph...
      `focus()` selected all nodes. Returning unfocused graph
      `focus()` didn't select any nodes. Returning unfocused graph
      Unfocusing graph...
      Unfocusing prior to grouping
      Unfocusing prior to morphing
      Unfocusing graph...
      Joining with `by = join_by(from, to)`
      Joining with `by = join_by(from, to)`
      Joining with `by = join_by(from, to)`
      Joining with `by = join_by(from, to)`
      Joining with `by = join_by(from, to)`
      Joining with `by = join_by(from, to)`
      Ungrouping `.data`...
      Subsetting by nodes
      Splitting by nodes
      Unfocusing prior to morphing
      [ FAIL 13 | WARN 9 | SKIP 1 | PASS 426 ]
      
      ══ Skipped tests (1) ═══════════════════════════════════════════════════════════
      • On CRAN (1): 'test-random-walk.R:19:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-graph_measures.R:17:3'): graph measures returns scalars ────────
      Error in `radius_dijkstra_impl(graph, weights = weights, mode = mode)`: At vendor/cigraph/src/paths/distances.c:328 : Weight vector length (1) does not match number of edges (8). Invalid value
      Backtrace:
          ▆
       1. ├─testthat::expect_length(graph_radius(), 1) at test-graph_measures.R:17:3
       2. │ └─testthat::quasi_label(enquo(object), arg = "object")
       3. │   └─rlang::eval_bare(expr, quo_get_env(quo))
       4. └─tidygraph::graph_radius()
       5.   └─igraph::radius(graph, mode)
       6.     └─igraph:::radius_dijkstra_impl(graph, weights = weights, mode = mode)
      ── Failure ('test-graph_measures.R:32:1'): graph context is empty after test ───
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-group.R:92:1'): graph context is empty after test ────────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-group_by.R:15:1'): graph context is empty after test ─────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-local.R:37:1'): graph context is empty after test ────────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-morph.R:135:1'): graph context is empty after test ───────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-mutate.R:15:1'): graph context is empty after test ───────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-node_measures.R:78:1'): graph context is empty after test ────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-node_types.R:58:1'): graph context is empty after test ───────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-pair_measures.R:58:1'): graph context is empty after test ────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-search.R:58:1'): graph context is empty after test ───────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-slice.R:27:1'): graph context is empty after test ────────────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      ── Failure ('test-tidyr-utils.R:18:1'): graph context is empty after test ──────
      environment(.graph_context$free)$private$context has length 1, not length 0.
      
      [ FAIL 13 | WARN 9 | SKIP 1 | PASS 426 ]
      Error: Test failures
      Execution halted
    ```

