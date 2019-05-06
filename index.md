---
layout: single
author_profile: false
sidebar:
  nav: "docs"
toc:  true
---

<script type="text/javascript" async
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

<div markdown="1">
## Welcome to the **Stata Lasso Page**

On this website we introduce three packages for regularized regression in Stata: 
**lassopack**, **lassologit** and **pdslasso**. The packages include features intended for *prediction*,
*model selection* and *causal inference*. Thus, the routines are applicable in a wide range of settings. 

- The package **lassopack** implements lasso ([Tibshirani 1996](http://www.jstor.org/stable/2346178)), 
square-root lasso ([Belloni et al. 2011](https://doi.org/10.1093/biomet/asr043)), 
elastic net ([Zou & Hastie 2005](https://doi.org/10.1214/009053607000000127)), 
ridge regression ([Hoerl & Kennard 1970](https://doi.org/10.1080/00401706.1970.10488635)), 
adaptive lasso ([Zou 2006](https://doi.org/10.1198/016214506000000735)) and post-estimation OLS.
- **lassologit** implements the logistic lasso for binary outcome models. 
- **pdslasso** offers methods to facilitate causal inference in structural models. The package allows to select control variables and/or instruments from a large set of variables in a setting where the researcher is interested in estimating the causal impact of one or more (possibly endogenous) causal variables of interest.


## When would you want to use **lassopack** & **lassologit**?

### High-dimensional models

The regularized regression methods implemented in **lassopack** can deal with situations where the number of regressors is large or may even exceed the number of observations under the assumption of sparsity. 

High-dimensionality can arise when (see [Belloni et al., 2014](https://dx.doi.org/10.1257/jep.28.2.29)):
- There are many variables available for each unit of observation. For example, in cross-country regressions the number of observations is naturally limited by the number of countries, whereas the number of potentially relevant explanatory variables is often large.
- There are only few observed variables, but the functional form through which these regressors enter the model is unknown. We can then use a large set of transformations (e.g. dummy variables, interaction terms and polynomials) to approximate the true functional form. 

### Model selection

Identifying the true model is a common problem is applied econometrics. A standard approach is to use hypothesis testing to identify the correct model (e.g. *general-to-specific* approach). However, this is problematic if the number of regressors is large due to many false positives. Furthermore, sequential hypothesis testing induces a pre-test bias.

Lasso, elastic net and square-root lasso set some coefficient estimates to exactly zero, and thus allow for simultaneous estimation and model selection. The adaptive lasso is known to exhibit good properties as a model selector as shown by [Zou (2006)](https://doi.org/10.1198/016214506000000735). 

### Prediction

If there are many predictors, OLS is likely to suffer from overfitting: good in-sample fit (large $$R^2$$), but poor *out-of-sample* prediction performance. Regularized regression methods tend to outperform OLS in terms of *out-of-sample* prediction. 

Regularization techniques exploit the *variance-bias-tradeoff*: they reduce the complexity of the model (through shrinkage or by dropping variables). In doing so, they introduce a bias, but also reduce the variance of the prediction, which can result in improved prediction performance.

### Forecasting with time-series or panel data

**lassopack** can also applied to time-series or panel data. For example, [Medeiros & Mendes (2016)](https://doi.org/10.1016/j.jeconom.2015.10.011) prove model selection consistency of the adaptive lasso when applied to time-series data with non-Gaussian, heteroskedastic errors.

## When would you want to use **pdslasso**?

The purpose of **pdslasso** is to improve causal inference when the aim is to assess the effect of one or a few (possibly endogenous) regressors on the outcome variable. **pdslasso** allows to select control variables and/or instruments.
 
### Many control variables

The primary interest in an econometric analysis often lies in one or a few regressors, for which we want to estimate the causal effect on an outcome variable. However, to allow for a causal interpretation we need to control for confounding factors. Lasso-type techniques can be employed to appropriately select controls and thus improve the robustness of causal inference. 

### Many instruments

High-dimensional instruments can arise when there is inherently large number of potentially relevant instruments or when it's unclear how these instruments should be specified (e.g. dummy variables, interaction effects). 

<div>
