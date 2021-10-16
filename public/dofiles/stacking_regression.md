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
                 https://statalasso.github.io/dta/housing.csv,  ///
                 clear comma

(14 vars, 506 obs)

. set seed 789

. gen train=rnormal()

. replace train=train>.75
(506 real changes made)

. pystacked medv crim-lstat if train, ///
                 type(regress) pyseed(123) methods(ols lassoic lassoic rf gradboost) ///
                 pipe1(poly2) pipe3(poly2) cmdopt5(learning_rate(0.01) n_estimators(1000))

---------------------------------------
  Method         |      Weight
-----------------+---------------------
  ols            |      0.0009770
  lassoic        |      0.0000000
  lassoic        |      0.2865443
  rf             |      0.2629368
  gradboost      |      0.4495419

. pystacked medv crim-lstat if train                                              || ///
                 m(ols) pipe(poly2)                                                              || ///
                 m(lassoic)                                                                      || ///
                 m(lassoic) pipe(poly2)                                                  || ///
                 m(rf)                                                                                   || ///
                 m(gradboost) opt(learning_rate(0.01) n_estimators(1000)) ///
                 , type(regress) pyseed(123) 

---------------------------------------
  Method         |      Weight
-----------------+---------------------
  ols            |      0.0009770
  lassoic        |      0.0000000
  lassoic        |      0.2865443
  rf             |      0.2629368
  gradboost      |      0.4495419

. pystacked medv crim-lstat if train                                              || ///
                 m(ols) pipe(poly2)                                                              || ///
                 m(lassoic)                                                                      || ///
                 m(lassoic) pipe(poly2)                                                  || ///
                 m(rf)                                                                                   || ///
                 m(gradboost) opt(learning_rate(0.01) n_estimators(1000)) ///
                 , type(regress) pyseed(123) finalest(ridge)

---------------------------------------
  Method         |      Weight
-----------------+---------------------
  ols            |      0.0024167
  lassoic        |     -0.2479425
  lassoic        |      0.7035482
  rf             |      0.5091350
  gradboost      |      0.2330788

. predict double yh, xb

. predict double ytrans, transf

. list yh ytrans* if _n <= 5

     +---------------------------------------------------------------------+
     |        yh     ytrans1     ytrans2     ytrans3   ytrans4     ytrans5 |
     |---------------------------------------------------------------------|
  1. | 28.224864    24.16234   30.418286    30.14668    25.676   24.230348 |
  2. | 23.247924   22.962887   25.708668   25.059641    22.454   20.273125 |
  3. | 33.321977   31.672703    31.20616   31.444894    31.136    31.01379 |
  4. | 33.348748   36.276995   29.749546   30.880321    31.214   31.065185 |
  5. | 34.001815   36.277167   29.699732   30.733921    32.471   31.510242 |
     +---------------------------------------------------------------------+



