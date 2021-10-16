. clear all 


. adopath ++ /Users/kahrens/MyProjects/pystacked/ 
  [1]              "/Users/kahrens/MyProjects/pystacked/"
  [2]  (BASE)      "/Applications/Stata 16/ado/base/"
  [3]  (SITE)      "/Applications/Stata 16/ado/site/"
  [4]              "."
  [5]  (PERSONAL)  "/Users/kahrens/Documents/Stata/ado/personal/"
  [6]  (PLUS)      "/Users/kahrens/Library/Application Support/Stata/ado/plus/"
  [7]  (OLDPLACE)  "~/ado/"

. insheet using ///
         https://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.data, ///
     clear comma

(58 vars, 4,601 obs)

. set seed 42

. gen u = runiform()

. sort u

. pystacked v58 v1-v57 if _n<=3000                || ///
                         m(logit) pipe(poly2)    || ///
                         m(rf) opt(n_estimators(1000)) || ///
                         m(gradboost) opt(n_estimators(1000)) || ///
                         m(nnet)                                 || ///
                         m(nnet) opt(hidden_layer_sizes(50 50 50)) || ///
                         m(nnet) opt(hidden_layer_sizes(200)) || ///
                         , type(class) pyseed(123) njobs(-1) 

---------------------------------------
  Method         |      Weight
-----------------+---------------------
  logit          |      0.0000000
  rf             |      0.2479815
  gradboost      |      0.6318673
  nnet           |      0.0317621
  nnet           |      0.0038639
  nnet           |      0.0845252

. predict spam, class

. tab spam v58 if _n<=3000, cell

+-----------------+
| Key             |
|-----------------|
|    frequency    |
| cell percentage |
+-----------------+

           |          v58
      spam |         0          1 |     Total
-----------+----------------------+----------
         0 |     1,792          2 |     1,794 
           |     59.73       0.07 |     59.80 
-----------+----------------------+----------
         1 |         1      1,205 |     1,206 
           |      0.03      40.17 |     40.20 
-----------+----------------------+----------
     Total |     1,793      1,207 |     3,000 
           |     59.77      40.23 |    100.00 

. tab spam v58 if _n>3000, cell

+-----------------+
| Key             |
|-----------------|
|    frequency    |
| cell percentage |
+-----------------+

           |          v58
      spam |         0          1 |     Total
-----------+----------------------+----------
         0 |       964         43 |     1,007 
           |     60.21       2.69 |     62.90 
-----------+----------------------+----------
         1 |        31        563 |       594 
           |      1.94      35.17 |     37.10 
-----------+----------------------+----------
     Total |       995        606 |     1,601 
           |     62.15      37.85 |    100.00 



