---
title: Introduction
type: docs
bookToC: false
---

## Welcome to the **Stata Lasso Page**

On this website we introduce packages for machine learning in Stata. 
The packages include features intended for *prediction*,
*model selection* and *causal inference*. 

- The package **lassopack** implements lasso ([Tibshirani 1996](http://www.jstor.org/stable/2346178)), 
square-root lasso ([Belloni et al. 2011](https://doi.org/10.1093/biomet/asr043)), 
elastic net ([Zou & Hastie 2005](https://doi.org/10.1214/009053607000000127)), 
ridge regression ([Hoerl & Kennard 1970](https://doi.org/10.1080/00401706.1970.10488635)), 
adaptive lasso ([Zou 2006](https://doi.org/10.1198/016214506000000735)) and post-estimation OLS.
**lassopack** also supports logistic lasso.

- **pdslasso** offers methods to facilitate causal inference in structural models. The package allows to select control variables and/or instruments from a large set of variables in a setting where the researcher is interested in estimating the causal impact of one or more (possibly endogenous) causal variables of interest.
  
- **pystacked** implements stacking regression ([Wolpert, 1992](https://doi.org/10.1016/S0893-6080(05)80023-1)) via [scikit-learn](https://scikit-learn.org/stable/)'s
[sklearn.ensemble.StackingRegressor](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.StackingRegressor.html) and 
[sklearn.ensemble.StackingClassifier](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.StackingClassifier.html). Stacking is a
way of combining predictions from multiple supervised machine learners (the "base learners")
into a final prediction to improve performance. 
