---
title: Regression
weight: 9
---

## Stacking regression

First load the Boston housing data and split the data randomly in training and test sample: 

```
. insheet using ///
	https://statalasso.github.io/dta/housing.csv,  ///
	clear comma
. set seed 789
. gen train=rnormal()
. replace train=train>.75
```

We now consider a more complicated `pystacked` application with 
4 base learners: linear regression, lasso with AIC-chosen 
penalty, random forest and gradient boosting:

```
. pystacked medv crim-lstat if train,				///
	type(regress) pyseed(123)					///
	methods(ols lassoic lassoic rf gradboost)			///
	pipe1(poly2) pipe3(poly2) cmdopt5(learning_rate(0.01)		///
	n_estimators(1000))

---------------------------------------
  Method         |      Weight
-----------------+---------------------
  ols            |      0.0009770
  lassoic        |      0.0000000
  lassoic        |      0.2865443
  rf             |      0.2629368
  gradboost      |      0.4495419
```

In this example, we use the lasso twice---once with and once without the `poly2` pipeline. Indeed, nothing keeps us from using base learners multiple times. This way we can compare and combine different sets of options. 

Note the numbering of the `pipe*()` and `cmdopt*()` options: We apply the `poly2` pipe to the first and third method (*ols* and *lassoic*). We also change the default learning rate and number of estimators for gradient boosting (the 5th estimator).

The weights determine how much each method contributes to the final stacking contribution. *lassoic* without `poly2` receives a weight of 0, while *lassoic* with `poly2` gets a positive weight.

{{< hint warning >}} 
You can verify that options are being passed on to scikit-learn correctly using, e.g., 
`di e(pyopt1)` after estimation.
{{< /hint >}}

### Alternative Syntax

The above syntax becomes, admittedly, a bit difficult to read, especially with many methods and many options. We offer an alternative syntax for easier use with many base learners. Another advantage of this alternative syntax is that it doesn't impose a limit on the number of base learners, whereas the previous syntax only works with up to 10 base learners. 

```
. pystacked medv crim-lstat if train                                     || ///
                 m(ols) pipe(poly2)                                      || ///
                 m(lassoic)                                              || ///
                 m(lassoic) pipe(poly2)                                  || ///
                 m(rf)                                                   || ///
                 m(gradboost) opt(learning_rate(0.01) n_estimators(1000))   ///
                 , type(regress) pyseed(123) 
```

### Changing the final estimator

The default final learner of `pystacked`
is non-negative least squares (NNLS) where the weights are standardized to sum to 1. The following example demonstrates why using NNLS is a good idea. Here we change the final estimator to ridge:

```
. pystacked medv crim-lstat if train                                      || ///
                 m(ols) pipe(poly2)                                       || ///
                 m(lassoic)                                               || ///
                 m(lassoic) pipe(poly2)                                   || ///
                 m(rf)                                                    || ///
                 m(gradboost) opt(learning_rate(0.01) n_estimators(1000)) 	 ///
                 , type(regress) pyseed(123) finalest(ridge)

---------------------------------------
  Method         |      Weight
-----------------+---------------------
  ols            |      0.0024167
  lassoic        |     -0.2479425
  lassoic        |      0.7035482
  rf             |      0.5091350
  gradboost      |      0.2330788

```

The second base learner (`lassoic` without `poly2`) receives a negative weight and the total sum of weights is greater than 1. Thus, we might end up with more "extreme" predictions.

### Predictions

In addition to the stacking predicted values, we can also get the predicted values of each base learner using the `transform` option:

```
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
```