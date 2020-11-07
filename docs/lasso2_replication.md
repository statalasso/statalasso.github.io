---
layout: single
title: "Replication of Lassopack"
permalink: /docs/lasso2_replication/
sidebar:
  nav: "docs"
toc:  false
classes:  wide
---

<script type="text/javascript" async
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

## Replication of glmnet and StataCorp's lasso

Use Stata's auto dataset with missing data dropped.  The variable `price1000`
is used to illustrate scaling effects.
  
	. sysuse auto, clear
  	. drop if rep78==.
    . gen double price1000 = price/1000

### Replication of glmnet

To load the data into R for comparison with `glmnet`, use the following
commands.  The packages `haven` and `tidyr` need to be installed.

    > auto <- haven::read_dta("http://www.stata-press.com/data/r9/auto.dta")
    > auto <- tidyr::drop_na()
    > n <- nrow(auto)
    > price <- auto$price
    > X <- auto[, c("mpg", "rep78", "headroom", "trunk", "weight", "length",
    "turn", "displacement", "gear_ratio", "foreign")]
    > X$foreign <- as.integer(X$foreign)
    > X <- as.matrix(X)

### Replication of StataCorp's lasso

Replication of StataCorp's lasso and elasticnet requires only the rescaling
of lambda by 2N.  N=69 so the `lasso2` lambda becomes 138000/(2*69) = 1000

    . lasso2 price mpg-foreign, lambda(138000)
    . lasso linear price mpg-foreign, grid(1, min(1000))
    . lassoselect lambda = 1000
    . lassocoef, display(coef, penalized)

    . lasso2 price mpg-foreign, alpha(0.6) lambda(138000)
    . elasticnet linear price mpg-foreign, alphas(0.6) grid(1, min(1000))
    . lassoselect alpha = 0.6 lambda = 1000
    . lassocoef, display(coef, penalized)

### Notes on invariance and objective function

glmnet uses the same definition of the lasso L0 penalty as StataCorp's 
lasso, so `lasso2`'s default parameterization again requires only rescaling by
2N.  When the lglmnet option is used with the lglmnet option, the L0 penalty
should be provided using the glmnet definition.  To estimate in R, load
glmnet with library("glmnet") and use the following command:

	> r<-glmnet(X,price,alpha=1,lambda=1000,thresh=1e-15)

    . lasso2 price mpg-foreign, lambda(138000)
    . lasso2 price mpg-foreign, lambda(1000) lglmnet

The R code below uses glmnet to estimate an elastic net model.  `lasso2` with
the lglmnet option will replicate it.

    > r<-glmnet(X,price,alpha=0.6,lambda=1000,thresh=1e-15)

    . lasso2 price mpg-foreign, alpha(0.6) lambda(1000) lglmnet

`lasso2`'s default parameterization of the elastic net (like StataCorp's 
elasticnet) is not invariant to scaling:

	. lasso2 price mpg-foreign, alpha(0.6) lambda(138000)
    . lasso2 price1000 mpg-foreign, alpha(0.6) lambda(138)

When `lasso2` uses the glmnet parameterization of the elastic net via the
glmnet options, results are invariant to scaling:  the only difference is
that the coefficients change by the same factor of proportionality as the
dependent variable.

    . lasso2 price mpg-foreign, alpha(0.6) lambda(1000) lglmnet
    . lasso2 price1000 mpg-foreign, alpha(0.6) lambda(1) lglmnet

The reason that the default `lasso2`/StataCorp parameterization is not
invariant to scaling is because the penalty on L2 norm is influenced by
scaling, and this in turn affects the relative weights on the L1 and L2
penalties.  The example below shows how to reparameterize so that the
default `lasso2` parameterization for the elastic net replicates the glmnet
parameterization.  The example using the scaling above, where the dependent
variable is price1000 and the glmnet lambda=1.

The large-sample standard deviation of price1000 = 2.8912586.
	
	. qui sum price1000
    . di r(sd) * 1/sqrt( r(N)/(r(N)-1))

The `lasso2` alpha = alpha(lglmnet)*SD(y) / (1-alpha(glmnet) +
alpha(glmnet)*SD(y)).  In this example, alpha = (0.6*2.8912586)/( 1-0.6 +
0.6*2.89125856) = 0.81262488.

    . di (0.6*2.8912586)/( 1-0.6 + 0.6*2.8912586)

The `lasso2` lambda = 2N*lambda(lglmnet) * (alpha(lglmnet) +
(1-alpha(lglmnet))/SD(y)).  In this example, lambda = 2*69*1 * (0.6 +
(1-0.6)/2.8912586) = 101.89203.

    . di 2*69*( 0.6 + (1-0.6)/2.8912586)

`lasso2` using the glmnet and then replicated using the `lasso2`/StataCorp
parameterization:

    . lasso2 price1000 mpg-foreign, alpha(0.6) lambda(1) lglmnet
    . lasso2 price1000 mpg-foreign, alpha(.81262488) lambda(101.89203)