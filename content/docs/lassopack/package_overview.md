---
weight: 1
title: "Package overview"
bookToC: false
---

## The package consists of the following programs: 

- `lasso2` implements lasso, square-root lasso, elastic net, ridge regression, adaptive lasso and post-estimation OLS. The lasso (Least Absolute Shrinkage and Selection Operator, [Tibshirani 1996](http://www.jstor.org/stable/2346178)), the square-root-lasso ([Belloni et al. 2011](https://doi.org/10.1093/biomet/asr043)) and the adaptive lasso ([Zou 2006](https://doi.org/10.1198/016214506000000735)) are regularization methods that use {{< katex >}}\ell_1{{< /katex >}} norm penalization to achieve sparse solutions: of the full set of {{< katex >}}p{{< /katex >}} predictors, typically most will have coefficients set to zero. Ridge regression ([Hoerl & Kennard 1970](https://doi.org/10.1080/00401706.1970.10488635)) relies on {{< katex >}}\ell_2{{< /katex >}} norm penalization; the elastic net ([Zou & Hastie 2005](https://doi.org/10.1214/009053607000000127)) uses a mix of {{< katex >}}\ell_1{{< /katex >}} and {{< katex >}}\ell_2{{< /katex >}} penalization.

- `cvlasso` supports {{< katex >}}K{{< /katex >}}-fold cross-validation and [*h*-step ahead rolling cross-validation](https://robjhyndman.com/hyndsight/tscv/) (for time-series and panel data) to choose the penalization parameters for all the implemented estimators.

- `rlasso` implements theory-driven penalization for the lasso and square-root lasso that can be applied to cross-section and panel data. `rlasso` uses the theory-driven penalization methodology of Belloni et al. ([2012](https://doi.org/10.3982/ECTA9626), [2013](http://arxiv.org/abs/1201.0220), [2014](https://doi.org/10.1093/restud/rdt044), [2016](https://doi.org/10.1080/07350015.2015.1102733)) for the lasso and square-root lasso.  In addition, `rlasso` implements the [Chernozhukov et al. (2013)](https://projecteuclid.org/euclid.aos/1387313390) sup-score test of joint significance of the regressors that is suitable for the high-dimensional setting.

- `lassologit`, `cvlassologit` and `rlassologit` for logistic regression. 