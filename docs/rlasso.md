---
title: "Rigorous lasso"
permalink: /docs/rlasso/
layout:  single
sidebar:
  nav: "docs"
toc:  false
classes:  wide
---


<script type="text/javascript" async
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

`rlasso` provides routines for estimating the coefficients of a lasso or square-root lasso
   regression with data-dependent, theory-driven penalization.
The number of regressors, $$p$$, may be large and possibly greater than the number of
    observations, $$N$$.
`rlasso` implements a version of the lasso that allows for heteroskedastic and clustered
    errors; see Belloni et al. ([2012](https://doi.org/10.3982/ECTA9626), [2016](https://doi.org/10.1080/07350015.2015.1102733)).

We start again with the prostate cancer data for demonstration.

	. clear
	. insheet using
	    https://web.stanford.edu/~hastie/ElemStatLearn/datasets/prostate.data, tab

## Homoskedastic lasso

The optimal penalization depends on whether the errors
are homoskedastic, heteroskedastic or cluster-dependent.

Similar to `regress`, `rlasso` assumes homoskedasticity by default. 
Under homoskedasticity, the optimal penalty level is given by

$$\lambda=\sigma2c\sqrt{N}\Phi^{-1}(1-\gamma/(2p)), $$

which guarantees that the "rigorous" lasso is well-behaved. 
The unobserved $$\sigma$$ is estimated using an iterative algorithm.

To run the lasso with theory-driven penalization, type:

	. rlasso lpsa lcavol lweight age lbph svi lcp gleason pgg45

	---------------------------------------------------
	         Selected |           Lasso   Post-est OLS
	------------------+--------------------------------
	           lcavol |       0.4400059      0.5258519
	          lweight |       0.2385063      0.6617699
	              svi |       0.3024128      0.6656665
	            _cons |*      0.9533782     -0.7771568
	---------------------------------------------------
	*Not penalized


`e(lambda)` returns $$\lambda$$, and `e(lambda0)` stores $$\lambda_0=\lambda/\hat{\sigma}$$, i.e.,
the penalty level excluding the standard deviation of the error.

	. di e(lambda)
	44.984163

	. di e(lambda0)
	64.923165


## Heteroskedastic lasso

To allow for heteroskedasticity, we specify the `robust` option.

	. rlasso lpsa lcavol lweight age lbph svi lcp gleason pgg45, robust

	---------------------------------------------------
	         Selected |           Lasso   Post-est OLS
	------------------+--------------------------------
	           lcavol |       0.4518205      0.5258519
	          lweight |       0.2047086      0.6617699
	              svi |       0.1995573      0.6656665
	            _cons |*      1.0823460     -0.7771568
	---------------------------------------------------
	*Not penalized


The names of selected predictors are stored in `e(selected)` (without constant) and `e(selected0)` (with constant):

	. di e(selected0)
	lcavol lweight svi _cons

	. di e(selected)
	lcavol lweight svi


## Square-root lasso
	
With the sqrt-lasso of 
Belloni et al. (2011, 2014), the default penalty level is

$$\lambda=c \sqrt{N} \Phi^{-1}(1-\gamma/(2p))$$.

Note the difference by a factor of 2 compared to the standard lasso. More importantly,
the optimal penalty level of the square-root lasso is independent of $$\sigma$$, 
leading to a practical advantage.

The square-root lasso is available through the `sqrt` option.

	. rlasso lpsa lcavol lweight age lbph svi lcp gleason pgg45, sqrt

	---------------------------------------------------
		 Selected |      Sqrt-lasso   Post-est OLS
	------------------+--------------------------------
		   lcavol |       0.4293894      0.5258519
		  lweight |       0.1861616      0.6617699
	              svi |       0.2574895      0.6656665
	            _cons |*      1.1673922     -0.7771568
	---------------------------------------------------
	*Not penalized

In this example, lasso and square-root lasso select the same variables. 
Thus the post-estimation OLS estimator, which
is OLS using the variables selected, is the same in both cases.

The estimated penalty level is:

	. di e(lambda)
	32.461583

The square-root lasso also allows for heteroskedastic errors:

	. rlasso lpsa lcavol lweight age lbph svi lcp gleason pgg45, sqrt robust

	---------------------------------------------------
		 Selected |      Sqrt-lasso   Post-est OLS
	------------------+--------------------------------
		   lcavol |       0.4402037      0.5258519
		  lweight |       0.1329878      0.6617699
	              svi |       0.1264166      0.6656665
	            _cons |*      1.3741342     -0.7771568
	---------------------------------------------------
	*Not penalized

## Cluster-dependent errors

Both rigorous lasso and rigorous square-root lasso allow 
for within-panel correlation (based on [Belloni et al., 2016, *JBES*](https://doi.org/10.1080/07350015.2015.1102733)).
The `fe` option applies the within-transformation and `cluster()` specifies
the cluster variable.

NB: The two regressions below take a few minutes to run, 
and you might need to increase the maximum matsize
using `set matsize`.

In this example, we interact the variable `grade` and `age` using 
Stata's factor variable notation (see `help factor variables`). 

	. webuse nlswork
	. xtset idcode
	. rlasso ln_w i.grade#i.age ttl_exp tenure not_smsa south, ///
		      fe cluster(idcode)

	---------------------------------------------------
	         Selected |           Lasso   Post-est OLS
	------------------+--------------------------------
	        grade#age |
	           12 18  |      -0.1226071     -0.2087164
	           12 19  |      -0.0481608     -0.1109979
	           12 20  |      -0.0088640     -0.0627530
	                  |
	          ttl_exp |       0.0206773      0.0226526
	           tenure |       0.0107726      0.0123681
	         not_smsa |      -0.0305386     -0.0957148
	---------------------------------------------------


The results of cluster lasso and cluster square-root lasso are again similar:

	. rlasso ln_w i.grade#i.age ttl_exp tenure not_smsa south, ///
	              sqrt fe cluster(idcode)

	         Selected |      Sqrt-lasso   Post-est OLS
	------------------+--------------------------------
	        grade#age |
	           12 18  |      -0.1223057     -0.2087164
	           12 19  |      -0.0479408     -0.1109979
	           12 20  |      -0.0086753     -0.0627530
	                  |
	          ttl_exp |       0.0206704      0.0226526
	           tenure |       0.0107671      0.0123681
	         not_smsa |      -0.0303104     -0.0957148
	---------------------------------------------------


## More

More information can be found in the help file:

	help rlasso

