*** aa, 02oct2018

/* replication for:
Ahrens, Achim, Christian B. Hansen, and Mark E. Schaffer. 
"LASSOPACK and PDSLASSO: Prediction, model selection and causal 
inference with regularized regression." 
London Stata Conference 2018. 
No. 12. Stata Users Group, 2018.
*/

clear
insheet using "https://raw.githubusercontent.com/statalasso/statalasso.github.io/master/dta/housing.csv", comma

set seed 123

global model medv crim-lstat

gen training=(_n <= 253)

rlasso $model if training
estimates store m_rlasso
cap drop *_rlasso
predict double v_r_rlasso if !training, r
predict double t_r_rlasso if training, r

cvlasso $model if training, lopt postest  seed(123) //nfold(5)
estimates store m_cvlasso
cap drop *_cvlasso
predict double v_r_cvlasso if !training, r
predict double t_r_cvlasso if training, r

lasso2 $model if training 
estimates store m_lasso2
foreach ic in aic aicc bic ebic {
	estimates restore m_lasso2
	lasso2, lic(`ic') postest
	estimates store m_`ic'
	cap drop *_`ic'
	predict double v_r_`ic' if !training, r
	predict double t_r_`ic' if training, r
}
*

reg $model if training
estimates store m_ols
cap drop *_ols
predict double v_r_ols if !training, r  
predict double t_r_ols if training, r  

stepwise, pr(.05): reg medv crim-lstat if training
estimates store m_stepwise
cap drop *_step
predict double v_r_stepwise if !training, r
predict double t_r_stepwise if training, r

foreach mthd in rlasso ols stepwise cvlasso aic aicc bic ebic {
	gen double v_rmse_`mthd' = (v_r_`mthd')^2 if !training
	gen double t_rmse_`mthd' =  (t_r_`mthd')^2 if training
	estimates restore m_`mthd'
	estadd local mthd `mthd'
	sum v_rmse_`mthd' if !training 
	estadd scalar rmse_out = sqrt(r(mean))
	sum t_rmse_`mthd' if training 
	estadd scalar rmse_in = sqrt(r(mean))
}
*

// requires estout to be installed
esttab m_ols m_stepwise m_rlasso m_cvlasso m_aic m_aicc m_bic m_ebic ///
			, not scalars(mthd rmse_out rmse_in) replace
