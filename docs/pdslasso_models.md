---
layout: single
title: "Structural models"
permalink: /docs/pdslasso_models/
sidebar:
  nav: "docs"
toc:  true
---

<script type="text/javascript" async
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

## Many instruments

Belloni et al. ([2012, Econometrica](http://dx.doi.org/10.3982/ECTA9626)) consider the model

$$\begin{align*}
y_i &= \alpha d_i + \varepsilon_i\\
d_i &= z_i'\delta + u_i
\end{align*}$$

where $$y_i$$ is the dependent variable, $$d_i$$ is an endogenous regressors and $$z_i$$ is a $$p_z$$-dimensional vector of instruments. $$p_z$$ is allowed to be large and may even exceed the sample size. We refer to $$z_i$$ as high-dimensional. The interest lies in estimating the causal effect of endogenous variable $$d_i$$ on the outcome variable 
$$y_i$$. 

The choice and specification of instruments is crucial for the estimation of $$\alpha$$. However, 
often it is *a priori* not clear how to select or specify instruments. The situation of many instruments
can arise because there are simply many instruments available and/or because we need to consider a large
number of transformations of elementary variables to approximate the complex 
relationship between endogenous regressor $$d_i$$ and instruments $$z_i$$. 

Belloni et al. suggest to apply the lasso with theory-driven penalization to the equation $$d_i = z_i'\delta + u_i$$. Under the assumption of (approximate) sparsity, the rigorous lasso (or square-root lasso) can be applied to select appropriate instruments and to predict $$d_i$$. $$\hat{d}_i=z_i'\hat\delta$$ is then used as a as estimate of the optimal instrument, where $$\hat\delta$$ is either the lasso, square-root lasso, post-lasso or post square-root lasso estimator. Instrument selection using lasso and square-root lasso is implemented in `ivlasso`.

## Many controls

Next, we consider the case where $$d_i$$ is exogenous, but there 
are many control variables. 

$$y_i = \alpha d_i + x_i'\beta + \varepsilon_i$$

In this setting, we allow the $$p_x$$-dimensional vector of controls, $$x_i$$
to be high-dimensional. 
The problem the researcher faces is that the "right" set of controls is not
known.  In traditional practice, this presents her with a difficult choice:  use too
few controls, or the wrong ones, and omitted variable bias will be present; use too
many, and the model will suffer from overfitting.

The *post-double-selection* (PDS) methodology introduced in Belloni, Chernozhukov and Hansen ([2014](https://doi.org/10.1093/restud/rdt044)) uses the lasso estimator to select the controls.  Specifically,
the lasso is used twice: 

1. estimate a lasso regression with $$y_i$$ as the dependent
variable and the control variables $$x_i$$ as regressors; 

2. estimate a lasso regression with $$d_i$$ as the dependent variable 
and again the control variables $$x_i$$ as regressors. 
The lasso estimator achieves a sparse solution, i.e.,
most coefficients are set to zero.  The final choice of control variables to include
in the OLS regression of $$y_i$$ on $$d_i$$ is the union of the controls selected selected in
steps 1. and 2., hence the name *post-double selection* for the methodolgy.

The *post-regularization* or *CHS* methodology is closely related.  Instead of using the lasso-selected controls
 in a post-regularization OLS  estimation, the selected variables
are used to construct orthogonalized versions of the dependent variable and the
exogenous causal variables of interest.  The orthogonalized versions are based
either on the lasso or post-lasso estimated coefficients; the post-lasso is OLS
applied to lasso-selected variables.  See Chernozhukov, Hansen & Spindler
 ([2015](http://www.aeaweb.org/articles.php?doi=10.1257/aer.p20151022)) for details.

The *post-double-selection* and *post-regularization* approach
for many controls are implemented in `pdslasso`. 

## Many controls and many instruments

Chernozhukov, Hansen & Spindler ([2015](http://www.aeaweb.org/articles.php?doi=10.1257/aer.p20151022)) 
also consider the case where we have both many instruments and many controls:

$$\begin{align*}
y_i &= \alpha d_i +  x_i'\beta +\varepsilon_i\\
d_i &= x_i'\gamma + z_i'\delta + u_i
\end{align*}$$

where $$p_x\gg N$$ and/or $$p_z\gg N$$ are allowed. The above model can be estimated using 
`ivlasso`, which allows for low and/or high-dimensional sets of instruments.

**To summarise**, `ivlasso` and `pdslasso` implement methods for:
- endogenous and/or exogenous regressors, 
- low and high-dimensional instruments, 
- low and high-dimensional control variables.
