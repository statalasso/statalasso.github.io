clear all 

adopath ++ /Users/kahrens/MyProjects/pystacked/ 


cap cd /Users/kahrens/MyProjects/statalasso_website/static/dofiles/

cap log close
log using single_case, replace tex

insheet using ///
		https://statalasso.github.io/dta/housing.csv,  ///
		clear comma
		
set seed 789
gen train=runiform()
replace train=train>.75

set seed 42

pystacked medv crim-lstat if train, ///
	type(regress) method(gradboost)
predict double ygb if !train

_pyparse, type(reg) method(gradboost) print

pystacked medv crim-lstat if train, ///
	type(regress) method(gradboost) ///
	cmdopt1(learning_rate(.01))
predict double ygb2 if !train

pystacked medv crim-lstat if train, ///
	type(regress) pyseed(243) method(gradboost) ///
	cmdopt1(learning_rate(.01) n_estimators(1000))
predict double ygb3 if !train

pystacked, table holdout

gen double rgb_sq=(medv-ygb)^2 if  !train
gen double rgb2_sq=(medv-ygb2)^2 if  !train
gen double rgb3_sq=(medv-ygb3)^2 if !train
sum rgb* if!train

pystacked medv crim-lstat if train, ///
	type(regress) method(lassocv)  
predict double ylasso1 if !train

pystacked medv crim-lstat if train, ///
	type(regress) method(lassocv) ///
	pipe1(poly2)
predict double ylasso2 if !train

gen double rlasso1_sq=(medv-ylasso1)^2
gen double rlasso2_sq=(medv-ylasso2)^2
sum *sq if!train

pystacked, table holdout

log close
