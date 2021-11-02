

clear all 
adopath ++ /Users/kahrens/MyProjects/pystacked/ 

webdoc init stacking_regression, replace logall plain

insheet using ///
	https://statalasso.github.io/dta/housing.csv,  ///
	clear comma
set seed 789
gen train=rnormal()
replace train=train>.75


pystacked medv crim-lstat if train,				///
	type(regress) pyseed(123)					///
	methods(ols lassoic lassoic rf gradboost)			///
	pipe1(poly2) pipe3(poly2) cmdopt5(learning_rate(0.01)		///
	n_estimators(1000))
	

pystacked medv crim-lstat if train                                       || ///
                 m(ols) pipe(poly2)                                      || ///
                 m(lassoic)                                              || ///
                 m(lassoic) pipe(poly2)                                  || ///
                 m(rf)                                                   || ///
                 m(gradboost) opt(learning_rate(0.01) n_estimators(1000))   ///
                 , type(regress) pyseed(123) 

pystacked medv crim-lstat if train                                        || ///
                 m(ols) pipe(poly2)                                       || ///
                 m(lassoic)                                               || ///
                 m(lassoic) pipe(poly2)                                   || ///
                 m(rf)                                                    || ///
                 m(gradboost) opt(learning_rate(0.01) n_estimators(1000)) 	 ///
                 , type(regress) pyseed(123) finalest(ridge)
				 
predict double yh, xb
predict double ytrans, transf
list yh ytrans* if _n <= 5

pystacked, graph holdout
pystacked, table holdout
