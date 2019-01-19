---
layout: single
title: "Demonstration using AJR"
permalink: /docs/pdslasso_demo/
sidebar:
  nav: "docs"
toc:  false
classes:  wide
---

<script type="text/javascript" async
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

We demonstrate the use of `pdslasso`
and `ivlasso` using the famous data set of 
Acemoglu, Robinson & Johnson ([2001](https://economics.mit.edu/files/4123)). 

	. clear
	. use https://statalasso.github.io/dta/AJR.dta


## Basic OLS

We are interested in the effect of institutions (measured by `avexpr`)
on income (`logpgp95`). We ignore endogeneity issues for now
and begin with a simple regression of `logpgp95`
against `avexpr`:

	. reg logpgp95 avexpr

	      Source |       SS           df       MS      Number of obs   =        64
	-------------+----------------------------------   F(1, 62)        =     72.82
	       Model |  37.0420118         1  37.0420118   Prob > F        =    0.0000
	    Residual |  31.5397067        62  .508704946   R-squared       =    0.5401
	-------------+----------------------------------   Adj R-squared   =    0.5327
	       Total |  68.5817185        63  1.08859871   Root MSE        =    .71324

	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |    .522107    .061185     8.53   0.000     .3997999    .6444142
	       _cons |   4.660383   .4085062    11.41   0.000     3.843791    5.476976
	------------------------------------------------------------------------------

## Exogenous regressors and many controls

We have 24 control variables that control for
geography (latitude, continent dummies). This doesn't seem a lot, but 
we only have 64 observations! At the same time, we are only interested in 
`avexpr`. The problem is that the "right" set of controls is not known -- 
use too few controls, or the wrong ones, and omitted variable bias will be present;
use too many, and the model will suffer from overfitting.
So, we treat the remaining variables as high-dimensional controls by
placing them into parentheses and let the lasso decide which controls are important.

	. pdslasso logpgp95 avexpr (lat_abst edes1975 avelf temp* humid* steplow-oilres)
	
	OLS using CHS lasso-orthogonalized vars
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .4262511   .0540552     7.89   0.000     .3203049    .5321974
	------------------------------------------------------------------------------
	
	OLS using CHS post-lasso-orthogonalized vars
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |    .391257   .0574894     6.81   0.000     .2785799     .503934
	------------------------------------------------------------------------------
	
	OLS with PDS-selected variables and full regressor set
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .3913455   .0561862     6.97   0.000     .2812225    .5014684
	    edes1975 |   .0091289    .003184     2.87   0.004     .0028883    .0153694
	       avelf |  -.9974943   .2474453    -4.03   0.000    -1.482478   -.5125104
	        zinc |  -.0079226   .0280604    -0.28   0.778    -.0629201    .0470748
	       _cons |   5.764133   .3773706    15.27   0.000     5.024501    6.503766
	------------------------------------------------------------------------------

Three different estimation results are presented, which correspond to three different approaches:

- *post-regularization with the lasso:* (1) we obtain the lasso residuals from regressing `logpgp95`
 against the set of controls; (2) we obtain the lasso residuals from regressing `avexpr`
 against the set of controls; (3) OLS regression using the orthogonalized versions
 of `logpgp95` and `avexpr`.
- *post-regularization with the post-lasso:* same as above but using post-lasso residuals
instead lasso residuals.
- *post-double-selection:* OLS of `logpgp95` against `avexpr` and the set of controls
selected in regression (1) and (2).

All three approaches are valid. 

## Endogenous regressor and all controls

Since the relationship between income and institutions suffers from reverse causality, 
we use settler mortality (`logem4`) as an instrument as suggested by Acemoglu et al.
The rationale for using `logem4` is that disease environment
(malaria, yellow fever, etc.) is exogenous because diseases were
almost always fatal to settlers (no immunity), but less serious
for natives (some degree of immunity).

We also need to control for other highly persistent factors
that are related to institutions & GDP. 
For now, we include *all* control variables:

	.  pdslasso logpgp95 lat_abst edes1975 avelf temp* humid* steplow-oilres (avexpr=logem4)
	
	IV using CHS lasso-orthogonalized vars
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   1.174461   .3166948     3.71   0.000     .5537506    1.795172
	... (output omitted)
	------------------------------------------------------------------------------

	IV using CHS post-lasso-orthogonalized vars
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   1.065556   .2492286     4.28   0.000     .5770768    1.554035
	... (output omitted)
	------------------------------------------------------------------------------

	IV with PDS-selected variables and full regressor set
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .7126678   .1649034     4.32   0.000      .389463    1.035873
	... (output omitted)
	------------------------------------------------------------------------------

## Selected instruments and selected controls:

Inclusing all controls seems inefficient. Thus, we use the lasso to select
controls in the IV regression. To this end, we place our high-dimensional controls
in parantheses as above.

	. ivlasso logpgp95  (lat_abst edes1975 avelf temp* humid* steplow-oilres) (avexpr=logem4)
	
	IV using CHS lasso-orthogonalized vars
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .7710621   .1502209     5.13   0.000     .4766344     1.06549
	------------------------------------------------------------------------------

	IV using CHS post-lasso-orthogonalized vars
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .8798503   .2727401     3.23   0.001     .3452896    1.414411
	------------------------------------------------------------------------------

	IV with PDS-selected variables and full regressor set
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .8413527   .2487658     3.38   0.001     .3537807    1.328925
	    edes1975 |   .0019949   .0058535     0.34   0.733    -.0094777    .0134675
	       avelf |  -.8777934   .3557117    -2.47   0.014    -1.574975   -.1806113
	        zinc |  -.0739391   .0526534    -1.40   0.160    -.1771378    .0292597
	       _cons |   2.975816   1.555107     1.91   0.056    -.0721371     6.02377
	------------------------------------------------------------------------------
	
## More

More information can be found in the help file:

	help ivlasso
	help pdslasso
