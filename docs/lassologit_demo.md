---
layout: single
title: "Example using Spam data"
permalink: /docs/lassologit_demo/
sidebar:
  nav: "docs"
toc:  false
classes:  wide
---

<script type="text/javascript" async
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

For demonstration we consider the [Spambase Data Set](https://archive.ics.uci.edu/ml/datasets/spambase)
from the Machine Learning Repository.  The data set
includes 4,601 observations and 57 variables.  The aim is
to predict if an email is spam (i.e., unsolicited commercial e-mail) or
not.  Each observation corresponds to one email.

    Predictors    
      v1-v48    percentage of words in the e-mail that match a specific word, i.e.
                  100 * (number of times the word appears in the e-mail) divided by
                  total number of words in e-mail.  To see which word each predictor
                  corresponds to, see link below.
      v49-v54   percentage of characters in the e-mail that match a specific
                  character, i.e. 100 * (number of times the character appears in
                  the e-mail) divided by total number of characters in e-mail.  To
                  see which character each predictor corresponds to, see link below.
      v55       average length of uninterrupted sequences of capital letters
      v56       length of longest uninterrupted sequence of capital letters
      v57       total number of capital letters in the e-mail

    Outcome       
      v58       denotes whether the e-mail was considered spam (1) or not (0).

## Load spam data

	. insheet using https://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.data, clear comma

## Introduction to lassologit

The basic syntax for lassologit is to specify the dependent variable followed by
a list of predictors:

	. lassologit v58 v1-v57

The output of lassologit shows the penalty levels (`lambda`), the number of
predictors included (`s`), the $$\ell_1$$ norm, one information criterion ($$EBIC$$ by
default), McFadden's Pseudo-$$R^2$$ and, in the last column,
 which predictors are included/removed
from the model.

By default, one line per *knot* is shown. Knots are points at which predictors
enter or leave the model. 

To obtain the logistic lasso estimate for a user-specified
 scalar lambda or a list of lambdas,
the `lambda(numlist)` option can be used.
Note that output and the objects stored in `e()` depend on whether lambda is only
one value or a list of more than one value.

## Information criteria

To estimate the model selected by one of the information criteria, use the `lic()`
option:

	. lassologit v58 v1-v57
	. lassologit, lic(ebic)
	. lassologit, lic(aicc)

In the above example, we use the replay syntax that works similar to a
post-estimation command.  `lassologit` reports the logistic lasso estimates and the
post-logit estimates (from applying logit estimation to the model selected by
the logitistic lasso) for the value of lambda selected by the specified
information criterion.

**NB:** `lic()` does not change the estimation results in memory. The advantage
is that this way `lic()` can be used multiple times to compare results without
that we need to re-estimate the model.

To store the model selected by one of the information criteria, 
add `postresults`:

	. lassologit, lic(ebic) postresults

## Cross-validation with cvlassologit

`cvlassologit` implements $$K$$-fold cross-validation where the data is by default
randomly partitioned.

Here, we use $$K=3$$ and `seed(123)` to set the seed for reproducibility.  (Be
patient, this takes a minute.)

	. cvlassologit v58 v1-v57, nfolds(3) seed(123)

The output shows the prediction performance measured by deviance for each $$\lambda$$
value.  To estimate the model selected by cross-validation we can specify `lopt`
or `lse` using the replay syntax.

	. cvlassologit, lopt
	. cvlassologit, lse

## Rigorous penalization with rlassologit

Lastly, we consider the logistic lasso with rigorous penalization:

	. rlassologit v58 v1-v57

`rlassologit` displays the logistic lasso solution and the post-logit solution.

The rigorous lambda is returned in `e(lambda)` and, in this example, is equal to `79.207801`.

	. di e(lambda)

We get the same result when specifying the rigorous lambda manually using the
`lambda()` option of lassologit:

    . lassologit v58 v1-v57, lambda(79.207801)

## Prediction

After selecting a model, we can use predict to obtain predicted probabilities or
linear predictions.

First, we select a model using `lic()` in combination with `postresults` as above:

	. lassologit v58 v1-v57
	. lassologit, lic(ebic) postresults

Then, we use `predict`:

	. predict double phat, pr
	. predict double xbhat, xb

`pr` saves the predicted probability of success and `xb` saves the linear predicted
values.

Note that the use of `postresults` is required.  Without `postresults` the results
of the estimation with the selected penalty level are not stored.

The approach for `cvlassologit` is very similar:

	. cvlassologit v58 v1-v57
	. cvlassologit, lopt postresults
	. predict double phat, pr

In the case of `rlassologit`, we don't need to select a specific penalty level and
we also don't need to specify `postresults`.

	. rlassologit v58 v1-v57
	. predict double phat, pr

## Assessing prediction accuracy with holdout()

We can leave one partition of the data out of the estimation sample and check
the accuracy of prediction using the `holdout(varname)` option.

We first define a binary holdout variable:

	. gen myholdout = (_n>4500)

There are 4,601 observations in the sample, and we exclude observations 4,501 to
4,601 from the estimation. 
These observations are used to assess classification accuracy.
The holdout variable should be set to 1 for all
observations that we want to use for assessing classification accuracy.

	. lassologit v58 v1-v57, holdout(myholdout)
	. mat list e(loss)

	. rlassologit v58 v1-v57, holdout(myholdout)
	. mat list e(loss)

The loss measure is returned in `e(loss)`.  As with cross-validation, deviance is
used by default.  `lossmeasure(class)` will return the average number of
miss-classifications.

## Plotting with lassologit

`lassologit` supports plotting of the coefficient path over $$\lambda$$.  Here, we
create the plot using the replay syntax, but the same can be achieved in one
line:

	. lassologit v58 v1-v57
	. lassologit, plotpath(lambda) plotvar(v1-v5) plotlabel plotopt(legend(off))

In the above example, we use the following settings:  `plotpath(lambda)` plots
estimates against lambda.  `plotvar(v1-v5)` restricts the set of variables plotted
to `v1-v5` (to avoid that the graph is too cluttered).  `plotlabel` puts variable
labels next to the lines.  `plotopt(legend(off))` turns the legend off.

## Plotting with cvlassologit

The `plotcv` option creates a graph of the estimates loss a function of lambda:

	. cvlassologit v58 v1-v57, nfolds(3) seed(123)
	. cvlassologit v58 v1-v57, plotcv

The vertical solid red line indicates the value of lambda that minimizes the
loss function.  The dashed red line corresponds to the largest lambda for which
MSPE is within one standard error of the minimum loss.

## More

More information can be found in the help file:

	help lassologit
