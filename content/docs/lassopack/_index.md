---
weight: 1
bookFlatSection: true
bookCollapseSection: true
title: "LASSOPACK"
---

## When would you want to use **lassopack**?

**lassopack** is a suite of programs for regularized regression methods suitable for the high-dimensional setting where the number of predictors, {{< katex >}}p{{< /katex >}}, may be large and possibly greater than the number of observations, {{< katex >}}N{{< /katex >}}.  

### High-dimensional models

The regularized regression methods implemented in **lassopack** can deal with situations where the number of regressors is large or may even exceed the number of observations under the assumption of sparsity. 

High-dimensionality can arise when (see [Belloni et al., 2014](https://dx.doi.org/10.1257/jep.28.2.29)):
- There are many variables available for each unit of observation. For example, in cross-country regressions the number of observations is naturally limited by the number of countries, whereas the number of potentially relevant explanatory variables is often large.
- There are only few observed variables, but the functional form through which these regressors enter the model is unknown. We can then use a large set of transformations (e.g. dummy variables, interaction terms and polynomials) to approximate the true functional form. 

### Model selection

Identifying the true model is a fundamental problem in applied econometrics. A standard approach is to use hypothesis testing to identify the correct model (e.g. *general-to-specific* approach). However, this is problematic if the number of regressors is large due to many false positives. Furthermore, sequential hypothesis testing induces a pre-test bias.

Lasso, elastic net and square-root lasso set some coefficient estimates to exactly zero, and thus allow for simultaneous estimation and model selection. The adaptive lasso is known to exhibit good properties as a model selector as shown by [Zou (2006)](https://doi.org/10.1198/016214506000000735). 

### Prediction

If there are many predictors, OLS is likely to suffer from overfitting: good in-sample fit (large {{< katex >}}R^2{{< /katex >}}), but poor *out-of-sample* prediction performance. Regularized regression methods tend to outperform OLS in terms of *out-of-sample* prediction. 

Regularization techniques exploit the *variance-bias-tradeoff*: they reduce the complexity of the model (through shrinkage or by dropping variables). In doing so, they introduce a bias, but also reduce the variance of the prediction, which can result in improved prediction performance.

### Forecasting with time-series or panel data

**lassopack** can also applied to time-series or panel data. For example, [Medeiros & Mendes (2016)](https://doi.org/10.1016/j.jeconom.2015.10.011) prove model selection consistency of the adaptive lasso when applied to time-series data with non-Gaussian, heteroskedastic errors.