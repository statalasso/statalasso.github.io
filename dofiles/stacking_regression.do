

clear all 
adopath ++ /Users/kahrens/MyProjects/pystacked/ 

cap cd /Users/kahrens/MyProjects/statalasso_website/static/dofiles/

cap log close
log using stacking_regression, replace text

insheet using ///
    https://statalasso.github.io/dta/housing.csv,  ///
    clear comma
set seed 789
gen train=runiform()
replace train=train>.75


pystacked medv crim-lstat if train,                              ///
    type(regress)                                                ///
    methods(ols lassoic lassoic rf gradboost)                    ///
    pipe1(poly2) pipe3(poly2) cmdopt5(learning_rate(0.01)        ///
    n_estimators(1000))

pystacked medv crim-lstat                                                 || ///
                 m(ols) pipe(poly2)                                       || ///
                 m(lassoic)                                               || ///
                 m(lassoic) pipe(poly2)                                   || ///
                 m(rf)                                                    || ///
                 m(gradboost) opt(learning_rate(0.01) n_estimators(1000)) | ///
                 if train , type(regress)

pystacked medv crim-lstat                                                 || ///
                 m(ols) pipe(poly2)                                       || ///
                 m(lassoic)                                               || ///
                 m(lassoic) pipe(poly2)                                   || ///
                 m(rf)                                                    || ///
                 m(gradboost) opt(learning_rate(0.01) n_estimators(1000)) ///
                 if train, type(regress) finalest(singlebest)

predict double yh, xb
predict double ybase, basexb
list yh ybase* if _n <= 5

pystacked, graph holdout
graph export /Users/kahrens/MyProjects/statalasso_website/static/img/stacking_regression_tutorial.png, replace  
pystacked, table holdout

log close
