---
title: "Getting started with lasso2"
permalink: /docs/lasso2/
layout:  single
sidebar:
  nav: "docs"
toc:  true
---

<script type="text/javascript" async
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

For demonstration purposes we use the [prostate cancer data set](/docs/prostate_data/), 
which has been widely applied to demonstrate the lasso and related techniques. 

To load prostate cancer data:

	. insheet using
	    https://web.stanford.edu/~hastie/ElemStatLearn/datasets/prostate.data, 
	    clear tab

## General demonstration

By default, `lasso2` uses the lasso estimator (i.e., `alpha(1)`). Like Stata's `regress`, 
`lasso2` expects the dependent variable to be named first followed
by a list of predictors.

	. lasso2 lpsa lcavol lweight age lbph svi lcp gleason pgg45

	  Knot|  ID     Lambda    s      L1-Norm        EBIC     R-sq   | Entered/removed
	------+---------------------------------------------------------+----------------
	     1|   1  163.62492     1     0.00000     35.57115   0.0000  | Added _cons.
	     2|   2  149.08894     2     0.06390     34.98739   0.0043  | Added lcavol.
	     3|   9   77.73509     3     0.40800     -0.15868   0.1488  | Added svi.
	     4|  11   64.53704     4     0.60174     -1.67592   0.2001  | Added lweight.
	     5|  21   25.45474     5     1.35340    -21.40796   0.4268  | Added pgg45.
	     6|  22   23.19341     6     1.39138    -13.98342   0.4436  | Added lbph.
	     7|  29   12.09306     7     1.58269    -10.83200   0.5334  | Added age.
	     8|  35    6.92010     8     1.71689     -5.57543   0.5820  | Added gleason.
	     9|  41    3.95993     9     1.83346      1.73747   0.6130  | Added lcp.
	Use 'long' option for full output. Type e.g. 'lasso2, lic(ebic)' to run the model selected by EBIC.

`lasso2` obtains the solution for a list of $$\lambda$$ values (see third column). 
As $$\lambda$$ decreases, predictors are added to the model. The last column on the right 
indicates which predictors enter or leave the active set. 

## Plotting

We can plot the *coefficient path* using `plotpath()`. The option accepts `lnlambda`,
`lambda` and `norm`, which asks Stata to plot the coefficient estimates
against $$\ln\lambda$$, $$\lambda$$ or the $$\ell_1$$-norm, respectively.

For example, to plot the coefficients against $$\ln\lambda$$:

	. lasso2 lpsa lcavol lweight age lbph svi lcp gleason pgg45, ///
	         plotpath(lnlambda) ///
	         plotopt(legend(off)) ///
	         plotlabel

`plotopt()` allows to specify additional plotting options that are passed on to
Stata's `line` command. In the example, `legend(off)` is used to suppress the legend. 
`plotlabel` triggers the display of variable labels next to the line.

The resulting graph looks as follows:

![]({{ "/_img/plotpath.png" }}){:height="100%" width="100%"}

To plot the coefficients against the $$\ell_1$$-norm, we can use:

	. lasso2, plotpath(norm) ///
		  plotlabel ///
		  plotopt(legend(off))

By omitting the variable names (before the comma), 
we make use of the *replay syntax*. 
`lasso2` uses the previous `lasso2` results 
which avoids time-consuming re-estimation.
This only works if `lasso2` results are in memory.

This creates the following graph:

![]({{ "/_img/plotpath_norm.png" }}){:height="100%" width="100%"}

## The lambda() option

We can use the `lambda()` option to estimate the model that
corresponds to a specific value of $$\lambda$$. 

	. lasso2 lpsa lcavol lweight age lbph svi lcp gleason pgg45, ///
		 lambda(10)

	---------------------------------------------------
		 Selected |           Lasso   Post-est OLS
	------------------+--------------------------------
		   lcavol |       0.5000819      0.5234981
		  lweight |       0.5144276      0.6152349
		      age |      -0.0036627     -0.0190343
		     lbph |       0.0468469      0.0954908
		      svi |       0.5695171      0.6358643
		    pgg45 |       0.0017981      0.0035248
	------------------+--------------------------------
	   Partialled-out*|
	------------------+--------------------------------
		    _cons |      -0.0014767      0.5214696
	---------------------------------------------------

The output shows the lasso and post-estimation OLS estimates
corresponding to $$\lambda=10$$.
However, note that there is no justification for using $$\lambda=10$$
over any other positive value. To pick the "optimal" value for $$\lambda$$, 
we can use cross-validation (see `cvlasso`), theory-driven
penalization (`rlasso`) or information criteria as discussed below. 

## Estimators 

The default estimator of `lasso2` is the lasso, which corresponds to `alpha(1)`. 
The `alpha()` option controls the elastic net parameter, which determines
the relative contribution of $$\ell_1$$ (lasso-type) to $$\ell_2$$ (ridge-type) penalization.

For ridge regression, use `alpha(0)`:

	. lasso2 lpsa lcavol lweight age lbph svi lcp gleason pgg45, ///
	         alpha(0) ///
		 lambda(500)
	---------------------------------------------------
		 Selected |           Ridge   Post-est OLS
	------------------+--------------------------------
		   lcavol |       0.1497346      0.5643413
		  lweight |       0.2497274      0.6220198
		      age |       0.0016636     -0.0212482
		     lbph |       0.0294061      0.0967125
		      svi |       0.2913161      0.7616733
		      lcp |       0.0687956     -0.1060509
		  gleason |       0.0771692      0.0492279
		    pgg45 |       0.0023278      0.0044575
	------------------+--------------------------------
	   Partialled-out*|
	------------------+--------------------------------
		    _cons |       0.6322244      0.1815609
	---------------------------------------------------


In contrast to the lasso, the ridge includes all predictors in the model. 
It does not perform variable selection, even if $$\lambda$$ is large,
whereas the elastic net can 
yield sparse solutions even when $$\alpha$$ is small:

	. lasso2 lpsa lcavol lweight age lbph svi lcp gleason pgg45, ///
	         alpha(0.1) ///
		 lambda(500)
	---------------------------------------------------
		 Selected |     Elastic net   Post-est OLS
		          |   (alpha=0.100)
	------------------+--------------------------------
		   lcavol |       0.1222143      0.5378499
		  lweight |       0.1236962      0.6620155
		      svi |       0.1854247      0.6991923
		      lcp |       0.0424339     -0.0813594
		  gleason |       0.0116789      0.0322875
		    pgg45 |       0.0008686      0.0036868
	------------------+--------------------------------
	   Partialled-out*|
	------------------+--------------------------------
		    _cons |       1.7319371     -1.1240093
	---------------------------------------------------


Lastly, to employ square-root lasso, use the `sqrt` option:

	. lasso2 lpsa lcavol lweight age lbph svi lcp gleason pgg45, ///
	         sqrt ///
		 lambda(20)

Note that the `alpha()` and `sqrt` option are incompatible.

## Information criteria

To select the "best" value of lambda, 
`lasso2` offers four information criteria: 
- Akaike Information Criterion ($$AIC$$),
- Bayesian Information Criterion ($$BIC$$),
- Extended Bayesian Information Criterion ($$EBIC$$) 
- and Corrected Akaike Information Criterion ($$AICc$$)

By default, the $$EBIC$$ is shown in the output.

To estimate the model corresponding to the minimum information criterion, the 
`lic()` is used which accepts `aic`, `bic`, `ebic` and `aicc`. `lic()` can 
either be specified in the first `lasso2` call or using the replay syntax 
(to avoid re-estimation).

	. lasso2 lpsa lcavol lweight age lbph svi lcp gleason pgg45, ///
		 lic(aic)
	
The same can be achieved in two steps using the replay syntax:

	. lasso2 lpsa lcavol lweight age lbph svi lcp gleason pgg45
	. lasso2, lic(aic)

	Use lambda=7.594796178345335 (selected by AIC).

	---------------------------------------------------
		 Selected |           Lasso   Post-est OLS
	------------------+--------------------------------
		   lcavol |       0.5057140      0.5234981
		  lweight |       0.5386738      0.6152349
		      age |      -0.0073599     -0.0190343
		     lbph |       0.0585468      0.0954908
		      svi |       0.5854749      0.6358643
		    pgg45 |       0.0022134      0.0035248
	------------------+--------------------------------
	   Partialled-out*|
	------------------+--------------------------------
		    _cons |       0.1243026      0.5214696
	---------------------------------------------------

As indicated in the output, the AIC selects `lambda=7.59`.

## Predicted values

The `predict` post-estimation command allows to return residuals and predicted values. 
In the output below, `xbhat1` is generated by re-estimating the model for $$\lambda=10$$.
The `noisily` option triggers the display of the estimation results.
`xbhat2` is generated by linear approximation using the two beta estimates closest to `lambda=10`.

	. lasso2 lpsa lcavol lweight age lbph svi lcp gleason pgg45
	. cap drop xbhat1
	. predict double xbhat1, xb l(10) noisily
	. cap drop xbhat2
	. predict double xbhat2, xb l(10) approx

Alternatively, we can explicitly run the model using `lambda(10)`.  If `lasso2` is called with a scalar
$$\lambda$$ value, the subsequent `predict` command requires no `lambda()` option.

	. lasso2 lpsa lcavol lweight age lbph svi lcp gleason pgg45, ///
		 lambda(10)
	. cap drop xbhat3
	. predict double xbhat3, xb

All three methods yield the same results.  However note that the linear approximation
is only exact for the lasso which is piecewise linear.

## Adaptive lasso

The adaptive lasso relies on an initial estimator to calculate the penalty loadings.
 By default, `lasso2` uses OLS as the initial
estimator as originally suggested by Zou (2006).  If the number of parameters exceeds
the numbers of observations, univariate OLS is used; see Huang et al. (2008).

	. lasso2 lpsa lcavol lweight age lbph svi lcp gleason pgg45, ///
	         adaptive
	. mat list e(Ups)

See the OLS estimates for comparison.

	. reg lpsa lcavol lweight age lbph svi lcp gleason pgg45

Other initial estimators such as ridge regression are possible.

	. lasso2 lpsa lcavol lweight age lbph svi lcp gleason pgg45, ///
		 l(10) alpha(0)
	. mat bhat_ridge = e(b)
	. lasso2 lpsa lcavol lweight age lbph svi lcp gleason pgg45, 
		 adaptive adaloadings(bhat_ridge)
	. mat list e(Ups)

## More

Please check the help file for more information and examples.

	. help lasso2

