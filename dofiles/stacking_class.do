clear all 

adopath ++ /Users/kahrens/MyProjects/pystacked/ 

cap cd /Users/kahrens/MyProjects/statalasso_website/static/dofiles/

cap log close
log using stacking_classification, replace tex

insheet using ///
    https://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.data, ///
    clear comma

set seed 42
gen uni=runiform()
sort uni

pystacked v58 v1-v57                                  || ///
            m(logit) pipe(poly2)                      || ///
            m(rf) opt(n_estimators(1000))             || ///
            m(gradboost) opt(n_estimators(1000))      || ///
            m(nnet)                                   || ///
            m(nnet) opt(hidden_layer_sizes(50 50 50)) || ///
            m(nnet) opt(hidden_layer_sizes(200))      || ///
            if _n<=3000 , type(class) njobs(-1)

predict spam, class
tab spam v58 if _n<=3000, cell
tab spam v58 if _n>3000, cell

pystacked, table holdout
pystacked, graph(subtitle(Spam data)) ///
            lgraph(plotopts(msymbol(i) ///
            ylabel(0 1, format(%3.1f)))) holdout
graph export /Users/kahrens/MyProjects/statalasso_website/static/img/stacking_class_tutorial.png, replace  

log close
