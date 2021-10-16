---
title: "Estimation methods"
weight:  2
---

<script type="text/javascript" async
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

## Ridge regression

The ridge estimator (Hoerl & Kennard, 1970) can be written as

{{< katex display >}}
\hat{\beta}_{Ridge} = (X'X+\lambda I_p)^{-1}X'y.
{{< /katex >}}

Thus, even if the regressor matrix is not full rank (e.g. because {{< katex >}}p>N{{< /katex >}}), the problem becomes
nonsingular by adding a constant to the diagonal of {{< katex >}}X'X{{< /katex >}}.  Another advantage of the
ridge estimator over least squares stems from the *variance-bias trade-off*.  Ridge
regression may improve over ordinary least squares by inducing a mild bias while
decreasing the variance.  For this reason, ridge regression is a popular method in
the context of multicollinearity.  In contrast to estimators relying on
{{< katex >}}\ell_1{{< /katex >}}-penalization, the ridge does not yield sparse solutions and keeps all predictors
in the model.

## Lasso estimator 

The lasso minimizes the residual sum of squares (RSS) subject to a constraint on the
absolute size of coefficient estimates.  Tibshirani (1996) motivates the lasso with
two major advantages over least squares.  First, due to the nature of the {{< katex >}}\ell_1{{< /katex >}}-penalty,
the lasso tends to produce sparse solutions and thus facilitates model
interpretation.  Secondly, similar to ridge regression, lasso can outperform least
squares in terms of prediction due to lower variance.  Another advantage is that the
lasso is computationally attractive due to its convex form.  This is in contrast to
model selection based on AIC or BIC (which employ {{< katex >}}\ell_0{{< /katex >}} penalization) where each
possible sub-model has to be estimated.

## Elastic net 

The elastic net applies a mix of {{< katex >}}\ell_1{{< /katex >}} (lasso-type) and {{< katex >}}\ell_2{{< /katex >}} (ridge-type) penalization.
It combines some of the strengths of lasso and ridge regression.  In the presence of
groups of correlated regressors, the lasso selects typically only one variable from
each group, whereas the ridge tends to produce similar coefficient estimates for
groups of correlated variables.  On the other hand, the ridge does not yield sparse
solutions impeding model interpretation.  The elastic net is able to produce sparse
solutions (for some {{< katex >}}\alpha{{< /katex >}} greater than zero) and retains (or drops) correlated
variables jointly. (Zou & Hastie, 2005)

## Adaptive lasso 

The lasso is only variable selection consistent under the rather strong
*irrepresentable condition*, which imposes constraints on the degree of correlation
between predictors in the true model and predictors outside of the model (see Zhao &
Yu, 2006; Meinshausen & Bühlmann, 2006).  Zou (2006) proposes the adaptive lasso
which uses penalty loadings

{{< katex >}}
\hat\beta_{0,j}|^{-\theta}
{{< /katex >}}

for {{< katex >}}j=1,...,p{{< /katex >}} where {{< katex >}}\hat\beta_{0,j}{{< /katex >}} is an initial estimator.  The adaptive lasso is variable-selection consistent for fixed {{< katex >}}p{{< /katex >}} under
weaker assumptions than the standard lasso.  If {{< katex >}}p<N{{< /katex >}}, OLS can be used as the initial
estimator.  Huang et al. (2008) suggest to use univariate OLS if {{< katex >}}p>N{{< /katex >}}.  Other initial
estimators are possible. (Zou, 2006)

## Square-root lasso 

The sqrt-lasso is a modification of the lasso that minimizes sqrt(RSS) instead of
RSS, while also imposing an {{< katex >}}\ell_1{{< /katex >}}-penalty.  The main advantage of the sqrt-lasso over
the standard lasso is that the theoretically grounded, data-driven optimal {{< katex >}}\lambda{{< /katex >}} is
independent of the unknown error variance under homoskedasticity.  (Belloni et al., 2011, 2014)

## Post-estimation OLS

Penalized regression methods induce a bias that can be alleviated by post-estimation
OLS, which applies OLS to the predictors selected by the first-stage variable
selection method.  For the case of the lasso, Belloni and Chernozhukov (2013) have
shown that the post-lasso OLS performs at least as well as the lasso under mild
additional assumptions.

For further information on the lasso and related methods, see for example the
textbooks by Hastie et al. ([2009](https://web.stanford.edu/~hastie/ElemStatLearn/), [2015](http://www-bcf.usc.edu/~gareth/ISL/); both available for free) and Bühlmann & Van
de Geer (2011).

