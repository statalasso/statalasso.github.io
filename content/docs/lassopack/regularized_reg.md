---
title: "Regularized regression"
weight: 2
---

## Regularized regression

`lasso2` solves the elastic net problem

{{< katex display >}}
\frac{1}{N} (y_i - x_i'\beta)^2 + \frac{\lambda}{N} \alpha ||\Psi\beta ||_1 + 	\frac{\lambda}{2N}(1-\alpha)||\Psi\beta||_2
{{< /katex >}}

where
- {{< katex >}}(y_i - x_i'\beta)^2{{< /katex >}} is the residual sum of squares (RSS),
- {{< katex >}}\beta{{< /katex >}} is a {{< katex >}}p{{< /katex >}}-dimensional parameter vector,
- {{< katex >}}\lambda{{< /katex >}} is the overall penalty level, which controls the general degree of penalization,
- {{< katex >}}\alpha{{< /katex >}} is the elastic net parameter, which determines the relative contribution of {{< katex >}}\ell_1{{< /katex >}} (lasso-type) to {{< katex >}}\ell_2{{< /katex >}}  (ridge-type) penalization. {{< katex >}}\alpha=1{{< /katex >}} corresponds to the lasso; {{< katex >}}\alpha=0{{< /katex >}} is ridge regression.
- {{< katex >}}\Psi{{< /katex >}} is a {{< katex >}}p{{< /katex >}} by {{< katex >}}p{{< /katex >}} diagonal matrix of predictor-specific penalty loadings. 
- {{< katex >}}N{{< /katex >}} is the number of observations

In addition, `lasso2` estimates the square-root lasso (sqrt-lasso) estimator,
which is defined as the solution to the following objective function:

{{< katex display >}}
\sqrt{\frac{1}{N} (y_i - x_i'\beta)^2} + \frac{\lambda}{N} \alpha ||\Psi\beta ||_1
{{< /katex >}}

`lasso2` implements the elastic net and sqrt-lasso using coordinate descent algorithms.  The algorithm (then
referred to as "shooting") was first proposed by [Fu (1998)](https://doi.org/10.2307/1390712) for the lasso, and by [Van der Kooij (2007)](http://hdl.handle.net/1887/12096) for the elastic net.  [Belloni et al. (2011)](https://doi.org/10.1093/biomet/asr043) implement the coordinate descent for the sqrt-lasso, and have kindly provided  Matlab code.

Penalized regression methods, such as the elastic net and the sqrt-lasso, rely on tuning parameters that control
the degree and type of penalization.  The estimation methods implemented in `lasso2` use two tuning parameters:
{{< katex >}}\lambda{{< /katex >}} and {{< katex >}}\alpha{{< /katex >}}.   

## How to select lambda

**lassopack** offers three approaches for selecting the "optimal" {{< katex >}}\lambda{{< /katex >}} and {{< katex >}}\alpha{{< /katex >}} value, which are implemented in `lasso2`, `cvlasso` and `rlasso`, respectively.

1. _Cross-validation:_ The penalty level {{< katex >}}\lambda{{< /katex >}} may be chosen by cross-validation in order to optimize out-of-sample prediction
    performance.  {{< katex >}}K{{< /katex >}}-fold cross-validation and rolling cross-validation (for panel and time-series data) are
    implemented in cvlasso.  `cvlasso` also supports cross-validation across {{< katex >}}\alpha{{< /katex >}}. 
2. _Theory-driven:_ Theoretically justified and feasible penalty levels and loadings are available for the lasso and sqrt-lasso via the separate command `rlasso`.  The penalization is chosen to dominate the noise of the data-generating process
    (represented by the score vector), which allows derivation of theoretical results with regard to consistent
    prediction and parameter estimation.  Since the error variance is in practice unknown, Belloni et al. ([2012](https://doi.org/10.3982/ECTA9626))
    introduce the rigorous (or feasible) lasso that relies on an iterative algorithm for estimating the optimal
    penalization and is valid in the presence of non-Gaussian and heteroskedastic errors.  Belloni et al. ([2016](https://doi.org/10.1080/07350015.2015.1102733)) extend the framework to the panel data setting.  In the case of the sqrt-lasso under homoskedasticity, the optimal penalty level is independent of the unknown error variance, leading to a practical advantage and better performance in finite samples (see Belloni et al., [2011](https://doi.org/10.1214/14-AOS1204), [2014](https://doi.org/10.1093/restud/rdt044)). 
3. _Information criteria:_ {{< katex >}}\lambda{{< /katex >}} can also be selected using information criteria.  `lasso2` calculates four information criteria:  Akaike
    Information Criterion (AIC; [Akaike, 1974](https://doi.org/10.1109/TAC.1974.1100705)), Bayesian Information Criterion (BIC; [Schwarz, 1978](https://doi.org/10.1214/aos/1176344136)), Extended Bayesian
    information criterion (EBIC; [Chen & Chen, 2008](https://doi.org/10.1093/biomet/asn034)) and the corrected AIC (AICc; [Sugiura, 1978](http://doi.org/10.1080/03610927808827599), and [Hurvich, 1989](http://doi.org/10.1093/biomet/76.2.297)).

