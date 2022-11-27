clear all 

adopath ++ /Users/kahrens/MyProjects/pystacked/ 

cap cd /Users/kahrens/MyProjects/statalasso_website/static/dofiles/

cap log close
log using parallel, replace tex

insheet using ///
    https://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.data, ///
    clear comma

set seed 42
gen uni=runiform()
sort uni

timer on 1
pystacked v58 v1-v57, type(class) methods(rf gradboost nnet) ///
            cmdopt1(n_estimators(1000))
timer off 1

timer on 2
pystacked v58 v1-v57, type(class) methods(rf gradboost nnet) ///
            cmdopt1(n_jobs(-1) n_estimators(1000))
timer off 2

timer on 3
pystacked v58 v1-v57, type(class) methods(rf gradboost nnet) ///
            cmdopt1(n_estimators(1000)) njobs(-1)
timer off 3

timer list
