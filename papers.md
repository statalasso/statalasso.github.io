---
layout: single
author_profile: false
sidebar:
  nav: "docs"
toc:  false
classes:  wide
---

<script type="text/javascript" async
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

<div markdown="1">
## Working Paper

A Working Paper entitled *lassopack: Model selection and prediction with regularized regression in Stata*
is now available. 

### Abstract:

 This article introduces **lassopack**, a suite of programs for regularized regression in Stata.
 **lassopack** implements  lasso, square-root lasso, elastic net, ridge regression, adaptive lasso and 
 post-estimation OLS. The methods are suitable for the high-dimensional setting where the number of 
 predictors $$p$$ may be large and possibly greater than the number of observations, $$n$$. 
We offer three different approaches for selecting the penalization ('tuning') parameters: 
information criteria (implemented in `lasso2`), $$K$$-fold cross-validation and $$h$$-step ahead 
rolling cross-validation for cross-section, panel and time-series data (`cvlasso`), and theory-driven 
('rigorous') penalization for the lasso and square-root lasso for cross-section and panel data (`rlasso`). 
We discuss the theoretical framework and practical considerations for each approach. 
We also present Monte Carlo results to compare the performance of the penalization approaches.

[Download (arXiv)](https://arxiv.org/abs/1901.05397)

### Suggested citation:

Ahrens, A., Hansen, C.B., & Schaffer, M.E. (2019). 
*lassopack: Model selection and prediction with regularized regression in Stata.* 
arXiv:1901.05397.