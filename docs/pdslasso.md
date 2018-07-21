---
layout: single
title: "Stata package: pdslasso"
permalink: /docs/pdslasso/
sidebar:
  nav: "docs"
toc:  false
classes:  wide
---

`pdslasso` and `ivlasso` are routines for estimating structural parameters in linear models with many controls 
and/or many instruments. The routines use methods for estimating sparse high-dimensional models, specifically the lasso 
(Least Absolute Shrinkage and Selection Operator, [Tibshirani 1996](https://doi.org/10.2307/2346178)) and the square-root-lasso 
(Belloni et al. [2011](https://doi.org/10.1214/14-AOS1204), [2014](https://doi.org/10.1093/restud/rdt044)). 

These estimators are used to select controls (`pdslasso`) and/or instruments (`ivlasso`) 
from a large set of variables (possibly numbering more than the number of observations), in a setting where the 
researcher is interested in estimating the causal impact of one or more (possibly endogenous) causal variables 
of interest. 

Two approaches are implemented in `pdslasso` and `ivlasso`:
1. The *post-double-selection* methodology of Belloni et al. ([2012](https://doi.org/10.3982/ECTA9626), [2013](http://arxiv.org/abs/1201.0220), [2014](http://arxiv.org/abs/1201.0220), [2015](http://www.aeaweb.org/articles.php?doi=10.1257/jep.28.2.29), [2016](https://doi.org/10.1080/07350015.2015.1102733)). 
2. The *post-regularization* methodology of [Chernozhukov, Hansen and Spindler (2015)](https://www.aeaweb.org/articles?id=10.1257/aer.p20151022). 

For instrumental variable estimation, `ivlasso` implements weak-identification-robust hypothesis tests and confidence sets
using the [Chernozhukov et al. (2013)](https://projecteuclid.org/euclid.aos/1387313390) sup-score test. 

The implemention of these methods in `pdslasso` and `ivlasso` require the Stata program `rlasso` (available in the
separate Stata module [lassopack](https://github.com/aahr1/lassopack)), which provides lasso and square root-lasso estimation with data-driven penalization.
