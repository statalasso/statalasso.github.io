---
weight: 10
bookFlatSection: false
title: "Paper"
---

## Stata Journal paper

A SJ Paper entitled *lassopack: Model selection and prediction with regularized regression in Stata*
is now available. 

### Abstract

In this article, we introduce **lassopack**, a suite of programs for regularized regression in Stata. **lassopack** implements lasso, square-root lasso, elastic net, ridge regression, adaptive lasso, and postestimation ordinary least squares. The methods are suitable for the high-dimensional setting, where the number of predictors *p* may be large and possibly greater than the number of observations, *n*. We offer three approaches for selecting the penalization (“tuning”) parameters: information criteria (implemented in `lasso2`), *K*-fold cross-validation and *h*-step-ahead rolling cross-validation for cross-section, panel, and time-series data (`cvlasso`), and theory-driven (“rigorous” or plugin) penalization for the lasso and square-root lasso for cross-section and panel data (`rlasso`). We discuss the theoretical framework and practical considerations for each approach. We also present Monte Carlo results to compare the performances of the penalization approaches.

[Download earlier arXiv-Version](https://arxiv.org/abs/1901.05397)
[Stata Journal](https://doi.org/10.1177%2F1536867X20909697) 

Feel free to contact me (AA) if you have trouble accessing the SJ version.

### Suggested citation

Ahrens A, Hansen CB, Schaffer ME (2020). 
lassopack: Model selection and prediction with regularized regression in Stata. *The Stata Journal*. 
20(1):176-235. doi:[10.1177/1536867X20909697](https://doi.org/10.1177%2F1536867X20909697)

[Bibtex file](/dta/AHS2018.bib)

## Slides

- Presentation slides from our presentation at the [2018 London Stata Conference](https://www.stata.com/meeting/uk18/)
are available [here](https://statalasso.github.io/pdf/StataConference2018_AhrensSchaffer.pdf).