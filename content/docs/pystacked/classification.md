---
title: Classification
weight: 10
---

## Stacking classifier

Stacking can be applied in a similar way to classification problems. For demonstration, we consider the [Spambase Data Set](https://archive.ics.uci.edu/ml/datasets/spambase) from the Machine Learning Repository. We load the data and shuffle the observations around since they are ordered by outcome. 

```
. insheet using ///
    https://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.data, ///
    clear comma
. set seed 42
. gen u = runiform()
. sort u
```

Stacking classification works very similar to stacking regression. 
The example below is somewhat more complicated. Let's go through it step-by-step:

- We use 6 base learners: logit, random forest, gradient boosting and 3x neural nets. 
- We apply the `poly2` pipeline to the logistic regressor, which creates squares and interaction terms of the predictors.
- For both gradient boosting and random forest, we increase the number of classification trees to 1000.
- We consider three types of neural nets: (1) with one layer of 100 neurons (the default), (2) three layers with 50 neurons each, (3) one layer of 200 neurons.
- Finally, we use `type(class)` to specify that we consider a classification task and `njobs(-1)` switches parallelization on with all available CPUs.

Please note that this might take a while to run.

```
. pystacked v58 v1-v57 if _n<=3000                			|| ///
                         m(logit) pipe(poly2)    			|| ///
                         m(rf) opt(n_estimators(1000)) 		|| ///
                         m(gradboost) opt(n_estimators(1000)) 		|| ///
                         m(nnet)                                	|| ///
                         m(nnet) opt(hidden_layer_sizes(50 50 50)) 	|| ///
                         m(nnet) opt(hidden_layer_sizes(200)) 		|| ///
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
```

### Confusion matrix

After estimation, we can obtain the predicted class using `predict`. The predicted classes allow us to construct in-sample and out-of-sample confusion matrices:

```
. predict spam, class
. tab spam v58 if _n<=3000, cell

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
```
