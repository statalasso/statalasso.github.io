---
title: "Stata package: lassologit"
permalink: /docs/lassologit/
layout:  single
sidebar:
  nav: "docs"
toc:  false
classes:  wide
---

<script type="text/javascript" async
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

The Stata package **lassologit** 
is intended for classification tasks with binary outcomes.
**lassologit** maximizes the penalized log-likelihood:

$$\frac{1}{N}  \sum_{i=1}^N \left\{y_i (\beta_0 + \boldsymbol{x}_i'\boldsymbol{\beta})
- \log\left(1+e^{(\beta_0+\boldsymbol{x}_i'\boldsymbol{\beta})}\right)\right\}
- \frac{\lambda}{N} ||\boldsymbol{\beta}||_1$$

where $$y_i$$ is the binary outcome variable and 
$$\boldsymbol{x}_i$$ is the vector of predictors. 
$$\boldsymbol{\beta}$$ is the vector of parameters
to be estimated.
The last term in the objective function 
imposes a penalty on the absolute size of $$\boldsymbol{\beta}$$.
The intercept $$\beta_0$$
is (by default) not penalized.

**lassologit** implements the coordinate descent algorithm
of Friedman, Hastie & 
Tibshirani ([2010](http://www.jstatsoft.org/v33/i01/), Section 3).
For further speed improvements, we also utilize the 
strong rule proposed in Tibshirani et al. ([2012](http://www.jstor.org/stable/41430939)).

Like **lassopack**, **lassologit** consists of three programs
which correspond to three approaches for selecting the 
tuning parameter $$\lambda$$: 

- The base program `lassologit` allows to 
select the tuning parameter as the value of $$\lambda$$
that minimizes either $$AIC$$, $$BIC$$, $$AIC_c$$ or $$EBIC$$.
- `cvlassologit` supports $$K$$-fold cross-validation.
$$\lambda$$ may be selected as the value that minimizes the 
estimated deviance or miss-classification rate.
- `rlassologit` implements theory-driven penalization for the 
logistic lasso (see e.g. Belloni, Chernozhukov & Wei,
 [2016](https://doi.org/10.1080/07350015.2016.1166116)). 

	
 