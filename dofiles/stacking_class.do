clear all 

adopath ++ /Users/kahrens/MyProjects/pystacked/ 

webdoc init stacking_classification, replace logall plain

insheet using ///
	https://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.data, ///
    clear comma

set seed 42
gen u = runiform()
sort u

pystacked v58 v1-v57 if _n<=3000		|| ///
			m(logit) pipe(poly2) 	|| ///
			m(rf) opt(n_estimators(1000)) || ///
			m(gradboost) opt(n_estimators(1000)) || ///
			m(nnet)  				|| ///
			m(nnet) opt(hidden_layer_sizes(50 50 50)) || ///
			m(nnet) opt(hidden_layer_sizes(200)) || ///
			, type(class) pyseed(123) njobs(-1) 
			
predict spam, class
tab spam v58 if _n<=3000, cell
tab spam v58 if _n>3000, cell

pystacked, table holdout
pystacked, graph(subtitle(Spam data)) lgraph(plotopts(msymbol(i) ylabel(0 1, format(%3.1f)))) holdout
