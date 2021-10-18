. webuse nlswork, clear
(National Longitudinal Survey.  Young Women 14-26 years of age in 1968)

. xtset idcode year
       panel variable:  idcode (unbalanced)
        time variable:  year, 68 to 88, but with gaps
                delta:  1 unit

. global controls age-south  

. pdslasso ln_w union ( c.($controls)##c.($controls) i.ind_code i.occ_code ), ///
             cluster(idcode) fe

Fixed effects transformation...
1.  (PDS/CHS) Selecting HD controls for dep var ln_wage...
Selected: age c.age#c.race c.age#c.grade c.race#c.south c.not_smsa#c.not_smsa 4.ind_code 5.ind_code 6.ind_code 9.ind_code
          2.occ_code 7.occ_code 8.occ_code
2.  (PDS/CHS) Selecting HD controls for exog regressor union...
Selected: c.race#c.south c.south#c.south 5.ind_code 6.ind_code 7.ind_code 6.occ_code 7.occ_code 13.occ_code


Estimation results:

Specification:
Regularization method:                 lasso
Penalty loadings:                      cluster-lasso
Number of observations:                19,072
Number of clusters:                     4,132
Number of fixed effects:                4,132
Exogenous (1):                         union
High-dim controls (79):                age race msp nev_mar grade collgrad not_smsa c_city south c.age#c.age c.age#c.race
                                       c.age#c.msp c.age#c.nev_mar c.age#c.grade c.age#c.collgrad c.age#c.not_smsa c.age#c.c_city
                                       c.age#c.south c.race#c.race c.race#c.msp c.race#c.nev_mar c.race#c.grade c.race#c.collgrad
                                       c.race#c.not_smsa c.race#c.c_city c.race#c.south c.msp#c.msp c.msp#c.nev_mar c.msp#c.grade
                                       c.msp#c.collgrad c.msp#c.not_smsa c.msp#c.c_city c.msp#c.south c.nev_mar#c.nev_mar
                                       c.nev_mar#c.grade c.nev_mar#c.collgrad c.nev_mar#c.not_smsa c.nev_mar#c.c_city
                                       c.nev_mar#c.south c.grade#c.grade c.grade#c.collgrad c.grade#c.not_smsa c.grade#c.c_city
                                       c.grade#c.south c.collgrad#c.collgrad c.collgrad#c.not_smsa c.collgrad#c.c_city
                                       c.collgrad#c.south c.not_smsa#c.not_smsa c.not_smsa#c.c_city c.not_smsa#c.south
                                       c.c_city#c.c_city c.c_city#c.south c.south#c.south 1b.ind_code 2.ind_code 3.ind_code
                                       4.ind_code 5.ind_code 6.ind_code 7.ind_code 8.ind_code 9.ind_code 10.ind_code 11.ind_code
                                       12.ind_code 1b.occ_code 2.occ_code 3.occ_code 4.occ_code 5.occ_code 6.occ_code 7.occ_code
                                       8.occ_code 9.occ_code 10.occ_code 11.occ_code 12.occ_code 13.occ_code
Selected controls (16):                age c.age#c.race c.age#c.grade c.race#c.south c.not_smsa#c.not_smsa c.south#c.south
                                       4.ind_code 5.ind_code 6.ind_code 7.ind_code 9.ind_code 2.occ_code 6.occ_code 7.occ_code
                                       8.occ_code 13.occ_code

Structural equation (fixed effects, #groups=4132):

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
---------------------------------------------------------------------------------------
                      |               Robust
              ln_wage |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
----------------------+----------------------------------------------------------------
                union |   .0883666   .0092876     9.51   0.000     .0701633    .1065699
                  age |   .0005778   .0045053     0.13   0.898    -.0082524     .009408
                      |
         c.age#c.race |   .0003404   .0013207     0.26   0.797    -.0022481    .0029289
                      |
        c.age#c.grade |   .0010927   .0003139     3.48   0.000     .0004774    .0017079
                      |
       c.race#c.south |  -.0637385   .0402354    -1.58   0.113    -.1425985    .0151216
                      |
c.not_smsa#c.not_smsa |  -.0964628   .0185173    -5.21   0.000    -.1327561   -.0601696
                      |
      c.south#c.south |   .0146051    .059868     0.24   0.807     -.102734    .1319441
                      |
             ind_code |
                   4  |   .0962413    .016391     5.87   0.000     .0641156     .128367
                   5  |    .148541   .0274879     5.40   0.000     .0946658    .2024162
                   6  |   -.075053   .0147128    -5.10   0.000    -.1038896   -.0462164
                   7  |   .0233832   .0217133     1.08   0.282    -.0191741    .0659405
                   9  |  -.0598608   .0254534    -2.35   0.019    -.1097486   -.0099731
                      |
             occ_code |
                   2  |   .0857556   .0138057     6.21   0.000      .058697    .1128143
                   6  |   -.015796   .0159902    -0.99   0.323    -.0471361    .0155442
                   7  |  -.3234734   .0510609    -6.34   0.000    -.4235508   -.2233959
                   8  |  -.0785501   .0163891    -4.79   0.000    -.1106722   -.0464279
                  13  |    .010294   .0328577     0.31   0.754     -.054106     .074694
---------------------------------------------------------------------------------------
Standard errors and test statistics valid for the following variables only:
    union
------------------------------------------------------------------------------



