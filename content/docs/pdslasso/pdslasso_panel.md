---
title: "Panel FE"
weight: 6
bookToC: false
---

## Panel FE and Clustering

`pdslasso` and `ivlasso` can also be applied to fixed effect panel models using the methodology proposed in [Belloni et al., 2014](https://doi.org/10.1080/07350015.2015.1102733). There is one issue we have to take into account: Since the appropriate level of regularization depends on the error structure, we need to accommodate cluster dependence that is likely to be present in the context of panel data. 

For demonstation, we consider the `nlswork` example data set:

```
. webuse nlswork, clear
. xtset idcode year
. global controls age-south  
```

To estimate the effect of union membership on wages, we consider a large set of controls, including age, race, education, regional controls as well as industry and occupational codes. The total number of controls is 79. 

We also include individual fixed effect using the `fe` option. (Note that the data is `xtset` by `idcode`.) Lastly, we cluster by individual to account for dependence over time. 

```
. pdslasso ln_w union ( c.($controls)##c.($controls) i.ind_code i.occ_code ), ///
             cluster(idcode) fe

OLS using CHS lasso-orthogonalized vars
(Std. Err. adjusted for 4132 clusters in idcode)
------------------------------------------------------------------------------
             |               Robust
     ln_wage |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
       union |   .0978002   .0096037    10.18   0.000     .0789773    .1166231
------------------------------------------------------------------------------

OLS using CHS post-lasso-orthogonalized vars
(Std. Err. adjusted for 4132 clusters in idcode)
------------------------------------------------------------------------------
             |               Robust
     ln_wage |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
       union |   .0881405   .0092774     9.50   0.000     .0699571    .1063239
------------------------------------------------------------------------------

OLS with PDS-selected variables and full regressor set
(Std. Err. adjusted for 4132 clusters in idcode)
------------------------------------------------------------------------------
             |               Robust
     ln_wage |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
       union |   .0883666   .0092876     9.51   0.000     .0701633    .1065699
------------------------------------------------------------------------------
```

Note that the output above is abbreviated. In total, 16 controls are selected.