
clear all
 
if ("`c(username)'"=="kahrens") {
	adopath + "/Users/kahrens/MyProjects/ddml"
	adopath + "/Users/kahrens/MyProjects/pystacked"
	cd "/Users/kahrens/MyProjects/ddml/cert"
}

cap cd /Users/kahrens/MyProjects/statalasso_website/static/dofiles/

cap log close
log using ddml, replace tex


global tol = 0.0001
which ddml
which pystacked
   
* The code below is equivalent to the code from "helpb ddml"
	
**** Partially linear model.

use https://github.com/aahrens1/ddml/raw/master/data/sipp1991.dta, clear
global Y net_tfa
global D e401
global X tw age inc fsize educ db marr twoearn pira hown
set seed 42

ddml init partial, kfolds(2)

ddml E[Y|X]: reg $Y $X

ddml E[Y|X]: pystacked $Y $X, type(reg) method(rf)

ddml E[D|X]: reg $D $X
ddml E[D|X]: pystacked $D $X, type(reg) method(rf)

ddml desc

ddml crossfit

ddml estimate, robust

ddml estimate, robust spec(1) allcombos

reg Y1_reg D1_reg, nocons robust

ddml describe, all

**** Partially linear model II

set seed 42
ddml init partial, kfolds(2) reps(5) mname(m1)

global rflow max_features(5) min_samples_leaf(1) max_samples(.7)
global rfhigh max_features(5) min_samples_leaf(10) max_samples(.7)

ddml E[Y|X], mname(m1) learner(Y_m1): pystacked $Y $X            || ///
                               method(ols)                       || ///
                               method(lassocv)                   || ///
                               method(ridgecv)                   || ///
                               method(rf) opt($rflow)            || ///
                               method(rf) opt($rfhigh), type(reg)
ddml E[D|X], mname(m1) learner(D_m1): pystacked $D $X            || ///
                               method(ols)                       || ///
                               method(lassocv)                   || ///
                               method(ridgecv)                   || ///
                               method(rf) opt($rflow)            || ///
                               method(rf) opt($rfhigh), type(reg)

ddml desc, mname(m1) learners

ddml crossfit, mname(m1)
ddml estimate, mname(m1) robust

ddml extract, mname(m1) show(pystacked)

ddml estimate, mname(m0) replay 
 
**** Partially linear IV model.

use https://statalasso.github.io/dta/AJR.dta, clear
global Y logpgp95
global D avexpr
global Z logem4
global X lat_abst edes1975 avelf temp* humid* steplow-oilres
set seed 42

ddml init iv, kfolds(30)

ddml E[Y|X]: reg $Y $X
ddml E[Y|X], vtype(none): rforest $Y $X, type(reg)
ddml E[D|X]: reg $D $X
ddml E[D|X], vtype(none): rforest $D $X, type(reg)
ddml E[Z|X]: reg $Z $X
ddml E[Z|X], vtype(none): rforest $Z $X, type(reg)

ddml crossfit
ddml estimate, robust

ddml estimate, spec(8) rep(1) allcombos
ivreg Y2_rf (D2_rf = Z2_rf), nocons

**** Interactive model--ATE and ATET estimation.

webuse cattaneo2, clear
global Y bweight
global D mbsmoke
global X mage prenatal1 mmarried fbaby mage medu
set seed 42

ddml init interactive, kfolds(5) reps(5)

ddml E[Y|X,D]: reg $Y $X
ddml E[Y|X,D]: pystacked $Y $X, type(reg) method(gradboost)
ddml E[D|X]: logit $D $X
ddml E[D|X]: pystacked $D $X, type(class) method(gradboost)

ddml crossfit

ddml estimate
ddml estimate, atet trim(0)

**** Interactive IV model--LATE estimation.

use http://fmwww.bc.edu/repec/bocode/j/jtpa.dta,clear
global Y earnings
global D training
global Z assignmt
global X sex age married black hispanic
set seed 42

ddml init interactiveiv, kfolds(5)

ddml E[Y|X,Z]: reg $Y $X
ddml E[Y|X,Z]: pystacked $Y c.($X)# #c($X), type(reg) m(lassocv)
ddml E[D|X,Z]: logit $D $X
ddml E[D|X,Z]: pystacked $D c.($X)# #c($X), type(class) m(lassocv)
ddml E[Z|X]: logit $Z $X
ddml E[Z|X]: pystacked $Z c.($X)# #c($X), type(class) m(lassocv)

ddml crossfit
ddml estimate

**** High-dim IV

use https://statalasso.github.io/dta/BLP_CHS.dta, clear
global Y y
global D price
global X hpwt air mpd space
global Z Zbase*
set seed 42

ddml init ivhd

ddml E[Y|X]: reg $Y $X
ddml E[Y|X]: pystacked $Y $X, type(reg)

ddml E[D|Z,X], learner(Dhat_reg): reg $D $X $Z
ddml E[D|Z,X], learner(Dhat_pystacked): pystacked $D $X $Z, type(reg)

ddml E[D|X], learner(Dhat_reg) vname($D): reg {D} $X
ddml E[D|X], learner(Dhat_pystacked) vname($D): pystacked {D} $X, type(reg)
 
ddml crossfit
ddml estimate

ddml estimate, spec(8) rep(1) allcombos
gen Dtilde = $D - Dhat_pystacked_h_1
gen Zopt = Dhat_pystacked_1 - Dhat_pystacked_h_1
 
ivreg Y2_pystacked_1 (Dtilde=Zopt), nocons

log close