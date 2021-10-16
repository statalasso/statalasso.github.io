---
bookCollapseSection: true
weight: 12
bookToC: false
---

## Logistic lasso

**lassologit** 
is intended for classification tasks with binary outcomes.
**lassologit** maximizes the penalized log-likelihood:

{{< katex display >}}
\frac{1}{N}  \sum_{i=1}^N \left\{y_i (\beta_0 + \boldsymbol{x}_i'\boldsymbol{\beta})
- \log\left(1+e^{(\beta_0+\boldsymbol{x}_i'\boldsymbol{\beta})}\right)\right\}
- \frac{\lambda}{N} ||\boldsymbol{\beta}||_1
{{< /katex >}}

where {{< katex >}}y_i{{< /katex >}} is the binary outcome variable and 
{{< katex >}}\boldsymbol{x}_i{{< /katex >}} is the vector of predictors. 
{{< katex >}}\boldsymbol{\beta}{{< /katex >}} is the vector of parameters
to be estimated.
The last term in the objective function 
imposes a penalty on the absolute size of {{< katex >}}\boldsymbol{\beta}{{< /katex >}}.
The intercept {{< katex >}}\beta_0{{< /katex >}}
is (by default) not penalized.

**lassologit** implements the coordinate descent algorithm
of Friedman, Hastie & 
Tibshirani ([2010](http://www.jstatsoft.org/v33/i01/), Section 3).
For further speed improvements, we also utilize the 
strong rule proposed in Tibshirani et al. ([2012](http://www.jstor.org/stable/41430939)).

Like **lassopack**, **lassologit** consists of three programs
which correspond to three approaches for selecting the 
tuning parameter {{< katex >}}\lambda{{< /katex >}}: 

- The base program `lassologit` allows to 
select the tuning parameter as the value of {{< katex >}}\lambda{{< /katex >}}
that minimizes either {{< katex >}}AIC{{< /katex >}}, {{< katex >}}BIC{{< /katex >}}, {{< katex >}}AIC_c{{< /katex >}} or {{< katex >}}EBIC{{< /katex >}}.
- `cvlassologit` supports {{< katex >}}K{{< /katex >}}-fold cross-validation.
{{< katex >}}\lambda{{< /katex >}} may be selected as the value that minimizes the 
estimated deviance or miss-classification rate.
- `rlassologit` implements theory-driven penalization for the 
logistic lasso (see e.g. Belloni, Chernozhukov & Wei,
 [2016](https://doi.org/10.1080/07350015.2016.1166116)). 

{{< hint warning >}}
*Installation*  
**Lassologit** has been integrated into **lassopack** after the first release. To get the latest lassologit version, simply install **lassopack**.
{{< /hint >}}