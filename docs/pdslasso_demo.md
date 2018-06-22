---
layout: single
title: "Demonstration using AJR"
permalink: /docs/pdslasso_demo/
sidebar:
  nav: "docs"
toc:  true
---

<script type="text/javascript" async
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

We demonstrate the use of `pdslasso`
and `ivlasso` using the famous data set of 
Acemoglu, Robinson & Johnson ([2001](https://economics.mit.edu/files/4123)). 

First, download the two data file into your working directory.

[Download maketable6.zip](https://economics.mit.edu/files/5138)  
[Download maketable8.zip](https://economics.mit.edu/files/5140)

Second, merge the two data files using the code below.

	. clear
	. cd "/your-download-folder/"
	. unzipfile maketable6
	. unzipfile maketable8
	. use maketable6
	. merge 1:1 shortnam using maketable8
	. keep if baseco==1
	. order shortnam logpgp95 avexpr lat_abst logem4 edes1975 avelf, first
	. order indtime euro1900 democ1 cons1 democ00a cons00a, last

## Exogenous regressors and many controls

For reference, we start with replicating the OLS results in Table 6, Panel C, column 9.

	. reg logpgp95 avexpr lat_abst edes1975 avelf temp* humid* steplow-oilres

	      Source |       SS           df       MS      Number of obs   =        64
	-------------+----------------------------------   F(25, 38)       =      8.56
	       Model |  58.2413524        25  2.32965409   Prob > F        =    0.0000
	    Residual |  10.3403661        38  .272114898   R-squared       =    0.8492
	-------------+----------------------------------   Adj R-squared   =    0.7500
	       Total |  68.5817185        63  1.08859871   Root MSE        =    .52165

	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .3720903    .064387     5.78   0.000     .2417456     .502435
	...
	(omitted)
	...
	------------------------------------------------------------------------------

Basic usage: select from high-dim controls. We use the `robust`
option to allow for heteroskedastic errors.

	. pdslasso logpgp95 avexpr (lat_abst edes1975 avelf temp* humid* steplow-oilres), ///
        	   robust
	1.  (PDS/CHS) Selecting HD controls for dep var logpgp95...
	Selected: edes1975 avelf drystep landlock silv
	2.  (PDS/CHS) Selecting HD controls for exog regressor avexpr...
	Selected: edes1975 stepmid landlock iron zinc


	Estimation results:

	Specification:
	Regularization method:                 lasso
	Penalty loadings:                      heteroskedastic
	Number of observations:                64
	Exogenous (1):                         avexpr
	High-dim controls (24):                lat_abst edes1975 avelf temp1 temp2 temp3 temp4 temp5 humid1 humid2 humid3
		                               humid4 steplow deslow stepmid desmid drystep drywint landlock goldm iron
		                               silv zinc oilres
	Selected controls (8):                 edes1975 avelf stepmid drystep landlock iron silv zinc
	Unpenalized controls (1):              _cons

	Structural equation:

	OLS using CHS lasso-orthogonalized vars
	------------------------------------------------------------------------------
		     |               Robust
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .3877013   .0609796     6.36   0.000     .2681836    .5072191
	------------------------------------------------------------------------------

	OLS using CHS post-lasso-orthogonalized vars
	------------------------------------------------------------------------------
		     |               Robust
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .3786846   .0745483     5.08   0.000     .2325726    .5247966
	------------------------------------------------------------------------------

	OLS with PDS-selected variables and full regressor set
	------------------------------------------------------------------------------
		     |               Robust
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .3941882   .0775025     5.09   0.000     .2422862    .5460903
	    edes1975 |   .0090592   .0028737     3.15   0.002     .0034269    .0146915
	       avelf |  -.9536871   .3248062    -2.94   0.003    -1.590296   -.3170787
	     stepmid |   .1397762     .13014     1.07   0.283    -.1152934    .3948459
	     drystep |     .00409    .209989     0.02   0.984     -.407481     .415661
	    landlock |   .0223137   .1595841     0.14   0.889    -.2904654    .3350929
		iron |   .0115941    .044112     0.26   0.793     -.074864    .0980521
		silv |   .0573208    .035967     1.59   0.111    -.0131733    .1278149
		zinc |  -.0666105   .0614861    -1.08   0.279    -.1871209       .0539
	       _cons |   5.722393   .4621069    12.38   0.000      4.81668    6.628106
	------------------------------------------------------------------------------

Suppose we want to specify that latitute is always included
as a control variable. This can be achieved using `partial(lat_abst)`
which ask `pdslasso` to partial out latitude.

	. pdslasso logpgp95 avexpr (lat_abst edes1975 avelf temp* humid* steplow-oilres), ///
        	   partial(lat_abst)
	Partialling out unpenalized controls...
	1.  (PDS/CHS) Selecting HD controls for dep var logpgp95...
	Selected: edes1975 avelf temp3 humid3 landlock silv
	2.  (PDS/CHS) Selecting HD controls for exog regressor avexpr...
	Selected: edes1975 stepmid drystep landlock iron


	Estimation results:

	Specification:
	Regularization method:                 lasso
	Penalty loadings:                      heteroskedastic
	Number of observations:                64
	Exogenous (1):                         avexpr
	High-dim controls (23):                edes1975 avelf temp1 temp2 temp3 temp4 temp5 humid1 humid2 humid3 humid4
		                               steplow deslow stepmid desmid drystep drywint landlock goldm iron silv zinc
		                               oilres
	Selected controls (9):                 edes1975 avelf temp3 humid3 stepmid drystep landlock iron silv
	Partialled-out controls (2):           lat_abst _cons

	Structural equation:

	OLS using CHS lasso-orthogonalized vars
	------------------------------------------------------------------------------
		     |               Robust
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .3802873   .0616614     6.17   0.000     .2594332    .5011415
	------------------------------------------------------------------------------

	OLS using CHS post-lasso-orthogonalized vars
	------------------------------------------------------------------------------
		     |               Robust
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .3381078   .0682242     4.96   0.000     .2043908    .4718248
	------------------------------------------------------------------------------

	OLS with PDS-selected variables and full regressor set
	------------------------------------------------------------------------------
		     |               Robust
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .3623732    .068639     5.28   0.000     .2278433    .4969032
	    edes1975 |   .0066883   .0035324     1.89   0.058    -.0002351    .0136117
	       avelf |  -1.112673   .3064484    -3.63   0.000    -1.713301   -.5120457
	       temp3 |  -.0001327   .0165814    -0.01   0.994    -.0326316    .0323662
	      humid3 |   .0131159    .005407     2.43   0.015     .0025183    .0237135
	     stepmid |   .2023438   .2177564     0.93   0.353     -.224451    .6291385
	     drystep |   .0685483    .244327     0.28   0.779    -.4103238    .5474204
	    landlock |   .2639737   .1861263     1.42   0.156    -.1008272    .6287745
		iron |  -.0023239   .0311626    -0.07   0.941    -.0634015    .0587537
		silv |   .0297219   .0213627     1.39   0.164    -.0121482     .071592
	    lat_abst |   .0940599    .966084     0.10   0.922     -1.79943     1.98755
	       _cons |   5.302259   .7890319     6.72   0.000     3.755785    6.848733
	------------------------------------------------------------------------------

Alternatively, we can specify that latitute is not penalized using `pnotpen(lat_abst)`,
 which leads to numerically the same results. A third option is
to specify that latitude is in the amelioration set using `aset(lat_abst)`.
See the help file for more information.

## Endogenous regressor and many controls

For reference, we first replicate IV results in Panels Table 6, Panels A & B, col. 9.

	. ivreg logpgp95 (avexpr=logem4) lat_abst edes1975 avelf temp* humid* ///
                steplow-oilres

	Instrumental variables (2SLS) regression

	      Source |       SS           df       MS      Number of obs   =        64
	-------------+----------------------------------   F(25, 38)       =      4.60
	       Model |   50.627792        25  2.02511168   Prob > F        =    0.0000
	    Residual |  17.9539265        38  .472471751   R-squared       =    0.7382
	-------------+----------------------------------   Adj R-squared   =    0.5660
	       Total |  68.5817185        63  1.08859871   Root MSE        =    .68737

	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .7126678   .2140069     3.33   0.002     .2794334    1.145902
	...
	(output omitted)
	...
	------------------------------------------------------------------------------
	Instrumented:  avexpr
	Instruments:   lat_abst edes1975 avelf temp1 temp2 temp3 temp4 temp5 humid1
		       humid2 humid3 humid4 steplow deslow stepmid desmid drystep
		       drywint landlock goldm iron silv zinc oilres logem4
	------------------------------------------------------------------------------


Select controls; specify that logem4 is an unpenalized instrument to be partialled
out.

	.  ivlasso logpgp95 (avexpr=logem4) (lat_abst edes1975 avelf temp* humid* ///
	           steplow-oilres), partial(logem4)
	1.  (PDS/CHS) Selecting HD controls for dep var logpgp95...
	Selected: edes1975 avelf
	3.  (PDS) Selecting HD controls for endog regressor avexpr...
	Selected: edes1975 zinc
	4.  (PDS) Selecting HD controls for IV logem4...
	Selected: edes1975 avelf temp2 humid2 drystep iron
	5.  (CHS) Selecting HD controls and IVs for endog regressor avexpr...
	Selected: 
	Also inc: logem4
	6a. (CHS) Selecting lasso HD controls and creating optimal IV for endog regressor avexpr...
	Selected: edes1975 avelf temp2 humid2 drystep
	6b. (CHS) Selecting post-lasso HD controls and creating optimal IV for endog regressor avexpr...
	Selected: edes1975 avelf temp2 humid2 drystep
	7.  (CHS) Creating orthogonalized endogenous regressor avexpr...


	Estimation results:

	Specification:
	Regularization method:                 lasso
	Penalty loadings:                      homoskedastic
	Number of observations:                64
	Endogenous (1):                        avexpr
	High-dim controls (24):                lat_abst edes1975 avelf temp1 temp2 temp3 temp4 temp5 humid1 humid2 humid3
		                               humid4 steplow deslow stepmid desmid drystep drywint landlock goldm iron
		                               silv zinc oilres
	Selected controls, PDS (7):            edes1975 avelf temp2 humid2 drystep iron zinc
	Selected controls, CHS-L (5):          edes1975 avelf temp2 humid2 drystep
	Selected controls, CHS-PL (5):         edes1975 avelf temp2 humid2 drystep
	Unpenalized controls (1):              _cons
	Partialled-out instruments (1):        logem4

	Structural equation:

	IV using CHS lasso-orthogonalized vars
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .8033374   .1746851     4.60   0.000      .460961    1.145714
	------------------------------------------------------------------------------

	IV using CHS post-lasso-orthogonalized vars
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .9364431   .2889264     3.24   0.001     .3701578    1.502728
	------------------------------------------------------------------------------

	IV with PDS-selected variables and full regressor set
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   1.062569    .341272     3.11   0.002     .3936878     1.73145
	    edes1975 |  -.0017166   .0077529    -0.22   0.825     -.016912    .0134789
	       avelf |  -1.124356   .4759001    -2.36   0.018    -2.057103   -.1916084
	       temp2 |  -.0046889   .0283976    -0.17   0.869    -.0603472    .0509695
	      humid2 |    .007492   .0155144     0.48   0.629    -.0229155    .0378996
	     drystep |   .7911822   .5811852     1.36   0.173    -.3479199    1.930284
		iron |  -.0752171   .0940799    -0.80   0.424    -.2596103     .109176
		zinc |  -.0510953   .0791958    -0.65   0.519    -.2063162    .1041257
	       _cons |   1.137331    2.50636     0.45   0.650    -3.775045    6.049707
	------------------------------------------------------------------------------

## Endogenous regressor, many instruments and many controls:

Select controls and instruments; specify that logem4 is an unpenalized instrument and
lat_abst is an unpenalized control; request weak identification stats and first-stage
results.

	. ivlasso logpgp95 (lat_abst edes1975 avelf temp* humid* steplow-oilres) ///
			   (avexpr=logem4 euro1900-cons00a), partial(logem4 lat_abst) ///
			   idstats first
	Partialling out unpenalized controls...
	1.  (PDS/CHS) Selecting HD controls for dep var logpgp95...
	Selected: edes1975 humid3
	3.  (PDS) Selecting HD controls for endog regressor avexpr...
	Selected: edes1975
	5.  (PDS/CHS) Selecting HD controls/IVs for endog regressor avexpr...
	Selected: 
	Also inc: logem4
	6a. (CHS) Selecting lasso HD controls and creating optimal IV for endog regressor avexpr...
	Selected: edes1975 avelf temp2 drystep
	6b. (CHS) Selecting post-lasso HD controls and creating optimal IV for endog regressor avexpr...
	Selected: edes1975 avelf temp2 drystep
	7.  (CHS) Creating orthogonalized endogenous regressor avexpr...


	Estimation results:

	Specification:
	Regularization method:                 lasso
	Penalty loadings:                      homoskedastic
	Number of observations:                59
	Endogenous (1):                        avexpr
	High-dim controls (23):                edes1975 avelf temp1 temp2 temp3 temp4 temp5 humid1 humid2 humid3 humid4
		                               steplow deslow stepmid desmid drystep drywint landlock goldm iron silv zinc
		                               oilres
	Selected controls, PDS (2):            edes1975 humid3
	Selected controls, CHS-L (5):          edes1975 avelf temp2 humid3 drystep
	Selected controls, CHS-PL (5):         edes1975 avelf temp2 humid3 drystep
	Partialled-out controls (1):           lat_abst _cons
	High-dim instruments (5):              euro1900 democ1 cons1 democ00a cons00a
	Selected instruments (1):              logem4
	Partialled-out instruments (1):        logem4

	First-stage estimation(s):
	------------------------------------------------------------------------------
	      avexpr |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	    edes1975 |   .0156071   .0074681     2.09   0.037       .00097    .0302442
	      humid3 |    .016044   .0096802     1.66   0.097    -.0029289    .0350168
	      logem4 |  -.3705068   .1450972    -2.55   0.011     -.654892   -.0861216
	------------------------------------------------------------------------------

	Weak identification F stats (i.i.d.):
	  Optimal Lasso IV(s):        19.48
	  Optimal Post-Lasso IV(s):   12.99
	  Full IV set:                 5.97

	Structural equation:

	IV using CHS lasso-orthogonalized vars
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .7667961   .1914687     4.00   0.000     .3915242    1.142068
	------------------------------------------------------------------------------

	IV using CHS post-lasso-orthogonalized vars
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .8394174    .362614     2.31   0.021      .128707    1.550128
	------------------------------------------------------------------------------

	IV with PDS-selected variables and full regressor set
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .8735301   .2929925     2.98   0.003     .2992753    1.447785
	    edes1975 |   .0013051   .0083678     0.16   0.876    -.0150955    .0177057
	      humid3 |   .0031166   .0087269     0.36   0.721    -.0139878     .020221
	    lat_abst |  -.5020038   1.254352    -0.40   0.689    -2.960489    1.956482
	       _cons |   2.253524   1.528477     1.47   0.140    -.7422353    5.249283
	------------------------------------------------------------------------------

Select controls and instruments; specify that lat_abst is an unpenalized control;
request weak identification stats and sup-score confidence sets.

	. ivlasso logpgp95 (lat_abst edes1975 avelf temp* humid* steplow-oilres) ///
			   (avexpr=logem4 euro1900-cons00a), partial(lat_abst) ///
			   idstats sscset
	Partialling out unpenalized controls...
	1.  (PDS/CHS) Selecting HD controls for dep var logpgp95...
	Selected: edes1975 humid3
	3.  (PDS) Selecting HD controls for endog regressor avexpr...
	Selected: edes1975
	5.  (PDS/CHS) Selecting HD controls/IVs for endog regressor avexpr...
	Selected: logem4 euro1900
	6a. (CHS) Selecting lasso HD controls and creating optimal IV for endog regressor avexpr...
	Selected: edes1975 temp3 iron zinc
	6b. (CHS) Selecting post-lasso HD controls and creating optimal IV for endog regressor avexpr...
	Selected: edes1975 temp3 drystep iron
	7.  (CHS) Creating orthogonalized endogenous regressor avexpr...
	8.  (PDS/CHS) Performing sup-score test(s)
	Estimating sup-score confidence set over 100 grid points
	----+--- 1 ---+--- 2 ---+--- 3 ---+--- 4 ---+--- 5 
	..................................................    50
	..................................................   100


	Estimation results:

	Specification:
	Regularization method:                 lasso
	Penalty loadings:                      homoskedastic
	Number of observations:                59
	Endogenous (1):                        avexpr
	High-dim controls (23):                edes1975 avelf temp1 temp2 temp3 temp4 temp5 humid1 humid2 humid3 humid4
		                               steplow deslow stepmid desmid drystep drywint landlock goldm iron silv zinc
		                               oilres
	Selected controls, PDS (2):            edes1975 humid3
	Selected controls, CHS-L (5):          edes1975 temp3 humid3 iron zinc
	Selected controls, CHS-PL (5):         edes1975 temp3 humid3 drystep iron
	Partialled-out controls (1):           lat_abst _cons
	High-dim instruments (6):              logem4 euro1900 democ1 cons1 democ00a cons00a
	Selected instruments (2):              logem4 euro1900

	Weak identification F stats (i.i.d.):
	  Optimal Lasso IV(s):        14.12
	  Optimal Post-Lasso IV(s):   14.96
	  Full IV set:                 3.61

	Sup-score weak-identification-robust tests (method=abound)
	H0: b(avexpr)=0   (5% significance level)
	  Lasso-orthogonalized:      reject
	  Post-lasso-orthogonalized: reject
	  No orthogonalization:      n.a.
	95% confidence set (grid min=-0.77, max=1.68, points=100):
	  Lasso-orthogonalized:      [ .393885,   ...  ]
	  Post-lasso-orthogonalized: [ .319881,   ...  ]
	  No orthogonalization:      n.a.

	Structural equation:

	IV using CHS lasso-orthogonalized vars
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .7953799   .2096509     3.79   0.000     .3844716    1.206288
	------------------------------------------------------------------------------

	IV using CHS post-lasso-orthogonalized vars
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   1.208319   .6336821     1.91   0.057    -.0336749    2.450313
	------------------------------------------------------------------------------

	IV with PDS-selected variables and full regressor set
	------------------------------------------------------------------------------
	    logpgp95 |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
	-------------+----------------------------------------------------------------
	      avexpr |   .8149497   .2499039     3.26   0.001      .325147    1.304752
	    edes1975 |   .0026105    .007416     0.35   0.725    -.0119247    .0171457
	      humid3 |   .0040908   .0079481     0.51   0.607    -.0114872    .0196688
	    lat_abst |  -.4028061   1.158143    -0.35   0.728    -2.672724    1.867112
	       _cons |    2.54553    1.31519     1.94   0.053    -.0321958    5.123256
	------------------------------------------------------------------------------

