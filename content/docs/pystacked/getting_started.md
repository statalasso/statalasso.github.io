---
title: "Getting started"
weight: 3
---

## Getting started

Before we get into stacking, let's first use `pystacked` as a "regular"
program for machine learning. 

### Gradient boosting

We load the example data set and split the data in training/test sample. 
```
. clear all
. insheet using ///
                 https://statalasso.github.io/dta/housing.csv,  ///
                 clear comma
. set seed 789
. gen train=rnormal()
. replace train=train>.75
```

As an example, we run `pystacked` with gradient boosting: 

```
. pystacked medv crim-lstat if train, ///
         type(regress) pyseed(243) method(gradboost)

Single base learner: no stacking done.
---------------------------------------
  Method         |      Weight
-----------------+---------------------
  gradboost      |      1.0000000
```

{{< hint warning >}}
*Setting the seed*  
Since the estimation runs in the background in Python, not in Stata, `set seed 42` will have not effect. We
need to use the option `pyseed(42)`.
{{< /hint >}}

We use the `type` option to indicate that we consider a regression task rather than a classification task. `method(gradboost)` selects gradient boosting with regression trees. We will later see that we can specify more than one learner in `method()`. 

The output isn't particularly informative since we only consider one method. Yet, we have fitted 100 boosted trees in the background. We can use `predict` in the Stata-typical way to obtain predicted values: 

```
. predict double ygb if !train
```

### Options

We pass on options to scitkit-learn and fine-tune our gradient booster. For this, we use the 
`cmdopt1()` option. The options are listed in the help file and on the scikit-learn documentation 
[here](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.GradientBoostingRegressor.html).
We need to use `cmdopt1()` because *gradboost* is the first (and only) method we are using with 
`pystacked`.

{{< hint warning >}}
*scikit-learn documentation*  
Please study the scikit-learn documentation carefully when using `pystacked`.
{{< /hint >}}

For demonstation, we try two things: first, we reduce the learning rate
from 0.1 to 0.01, and secondly we in addition increase the number of trees to 1000. 

```
. pystacked medv crim-lstat if train, ///
       type(regress) pyseed(243) method(gradboost) ///
       cmdopt1(learning_rate(.01))
. predict double ygb2 if !train

. pystacked medv crim-lstat if train, ///
       type(regress) pyseed(243) method(gradboost) ///
       cmdopt1(learning_rate(.01) n_estimators(1000))
. predict double ygb3 if !train
```

We can then compare the performance across the three models:

```
. gen double rgb_sq=(medv-ygb)^2
. gen double rgb2_sq=(medv-ygb2)^2
. gen double rgb3_sq=(medv-ygb3)^2

. sum rgb* if!train
  Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
    rgb_sq |        394    20.08567    83.25935   8.54e-06   830.1214
   rgb2_sq |        394    32.50195    87.89791   .0010292   780.5784
   rgb3_sq |        394    19.92709    83.60578   .0000584   828.6569
```

Reducing the learning rate without increasing the number of trees deteriorate prediction performance; yet, if we also increase the number of trees, we might be able to improve performance. 

### Pipelines

We can make use of pipelines to pre-process our predictors. This will become especially useful in the context of stacking when we want to pass 2nd-order polynomials to one method, but not the other. Here, we use lasso with and without the `poly2` pipeline.

```
. pystacked medv crim-lstat if train, ///
       type(regress) pyseed(243) method(lassocv)  
. predict double ylasso1 if !train

. pystacked medv crim-lstat if train, ///
       type(regress) pyseed(243) method(lassocv) ///
       pipe1(poly2)
. predict double ylasso2 if !train

. gen double rlasso1_sq=(medv-ylasso1)^2
. gen double rlasso2_sq=(medv-ylasso2)^2

. sum *sq if !train
  Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
    rgb_sq |        394    20.08567    83.25935   8.54e-06   830.1214
   rgb2_sq |        394    32.50195    87.89791   .0010292   780.5784
   rgb3_sq |        394    19.92709    83.60578   .0000584   828.6569
rlasso1_sq |        394     29.7029    91.87267   .0000137   1025.592
rlasso2_sq |        394     21.2016    72.14927   .0000444   790.9036

```

The interactions and squared terms improve the performance of the lasso. 