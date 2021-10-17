---
weight: 1
bookFlatSection: true
bookCollapseSection: true
title: "PYSTACKED"
bookToc: false
---

## Stacking regression with **pystacked**

`pystacked` implements stacking regression ([Wolpert, 1992](https://doi.org/10.1016/S0893-6080(05)80023-1)) via [scikit-learn](https://scikit-learn.org/stable/)'s
[sklearn.ensemble.StackingRegressor](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.StackingRegressor.html) and 
[sklearn.ensemble.StackingClassifier](https://scikit-learn.org/stable/modules/generated/sklearn.ensemble.StackingClassifier.html).  Stacking is a
way of combining predictions from multiple supervised machine learners (the "base learners")
into a final prediction to improve performance.  The currently-supported base learners are:

 - Linear regression 
 - Logistic regression
 - Lasso, ridge and elastic net
 - Support vector machines
 - Gradient boosted trees
 - Random forest
 - Multi-layer Perceptron 

`pystacked` can also be used with a single base learner and, thus, provides an easy-to-use API
for [scikit-learn](https://scikit-learn.org/stable/)'s machine learning algorithms.

![](/_img/stacking.png)	

{{< hint warning >}} 
`pystacked` has just been released (October 2021). Please try it out and let us know if you run into problems. Feedback welcome and appreciated.
{{< /hint >}}
