---
title: "Cross-validation"
weight:  8
---

## Cross-validation

In the course of cross-validation, the data is repeatedly partitioned into training
and validation data. The model is fit to the training data and the validation data is
used to calculate the prediction error.
This in turn enables us to identify the values of {{< katex >}}\lambda{{< /katex >}} and {{< katex >}}\alpha{{< /katex >}}
that optimize predictive performance (i.e., minimize the estimated mean-squared prediction error). 

`cvlasso` supports {{< katex >}}K{{< /katex >}}-fold cross-validation and {{< katex >}}h{{< /katex >}}-step ahead rolling cross-validation. 
The latter is intended for time-series or panel data with a large time dimension. 
{{< katex >}}h{{< /katex >}}-step ahead rolling cross-validation was suggested by 
[Rob H Hyndman in a blog post](https://robjhyndman.com/hyndsight/tscv/).

### K-fold cross-validation

We begin with 10-fold cross-validation (the default). 
If no fold variable is specified (which can be done using the `foldvar()` option),
the data is randomly partitioned into "folds".

We use `seed(123)` throughout this demonstration to allow 
reproducing the outputs below.

	. cvlasso lpsa lcavol lweight age lbph svi lcp gleason pgg45, seed(123)

	K-fold cross-validation with 10 folds. Elastic net with alpha=1.
	Fold 1 2 3 4 5 6 7 8 9 10 
		  |         Lambda           MSPE       st. dev.
	----------+---------------------------------------------
		 1|      163.62492      1.3162136      .13064798 
		 2|      149.08894      1.2141972      .12282686 
		 3|      135.84429       1.114079      .11387635
	...
	    17|      36.930468       .5827423      .06260056  ^ 
	... 
	    27|      14.566138      .53408884      .05830419  *
	... 
	   100|      .01636249      .54838029      .07390164 
	* lopt = the lambda that minimizes MSPE.
	  Run model: cvlasso, lopt
	^ lse = largest lambda for which MSPE is within one standard error of the minimal MSPE.
	  Run model: cvlasso, lse

Note that parts of the output have been omitted for the sake of brevity. The columns 2 to 4 show
the value of {{< katex >}}\lambda{{< /katex >}}, the estimate of the mean-squared prediction error and the associated standard error.

The {{< katex >}}\lambda{{< /katex >}} value that minimizes the mean-squared prediction error is indicated by an asterisk (`*`). 
A hat (`^`) marks the largest {{< katex >}}\lambda{{< /katex >}} at which the MSPE is within one standard error of the minimal MSPE.
We denote these by {{< katex >}}\lambda_{lopt}{{< /katex >}} and {{< katex >}}\lambda_{lse}{{< /katex >}}, respectively. The former is returned in `e(lopt)`, the latter in `e(lse)`. 

	. di e(lopt)
	14.566138
	
	. di e(lse)
	36.930468


### Estimate the selected model

To estimate the full model with either {{< katex >}}\lambda_{lopt}{{< /katex >}} or {{< katex >}}\lambda_{lse}{{< /katex >}}, we can 
use `lopt` or `lse`.
Internally, `cvlasso` calls `lasso2` with either `lambda(14.566138)` or `lambda(36.930468)`.
        
	. cvlasso lpsa lcavol lweight age lbph svi lcp gleason pgg45, lopt seed(123)
	. cvlasso lpsa lcavol lweight age lbph svi lcp gleason pgg45, lse seed(123)

The same as above can be achieved using the replay syntax in two steps.
        
	. cvlasso lpsa lcavol lweight age lbph svi lcp gleason pgg45, seed(123)
	. cvlasso, lopt
	. cvlasso, lse

If `postest` is specified, `cvlasso` posts the `lasso2` estimation results.
        
	. cvlasso, lopt postest
	. ereturn list

### K-fold cross-validation over lambda and alpha

`alpha()` can be a scalar or list of elastic net parameters.  Each {{< katex >}}\alpha{{< /katex >}} value must lie
in the interval [0,1].  If `alpha()` is a list longer than one, `cvlasso` cross-validates
over {{< katex >}}\lambda{{< /katex >}} *and* {{< katex >}}\alpha{{< /katex >}}.  
        
	. cvlasso lpsa lcavol lweight age lbph svi lcp gleason pgg45, ///
	          alpha(0 0.1 0.5 1) seed(123)

	Cross-validation over alpha (0 .1 .5 1).
		 alpha | lopt*        Minimum MSPE
	   ------------+----------------------------
		 0.000 | 12.093063    .54348993
		 0.100 | 25.454739     .5418149
		 0.500 | 15.986318    .53499607
		 1.000 | 14.566138    .53408884  #
	* lambda value that minimizes MSPE for a given alpha
	# alpha value that minimizes MSPE

The second column in the table indicates the value of {{< katex >}}\lambda{{< /katex >}} that minimizes 
the MSPE for a given value of {{< katex >}}\alpha{{< /katex >}}. A hash key (`#`) indicates that value of {{< katex >}}\alpha{{< /katex >}}
that minimizes the overall MSPE. 

### Plotting

We can plot the estimated mean-squared prediction error over {{< katex >}}\lambda{{< /katex >}}.  Note that the
plotting feature is not supported if we also cross-validate over {{< katex >}}\alpha{{< /katex >}}.
        
	. cvlasso lpsa lcavol lweight age lbph svi lcp gleason pgg45, seed(123) plotcv

This produces the following graph:

![](/img/cvlasso.png#center)

The two vertical lines indicate {{< katex >}}\lambda_{lopt}{{< /katex >}} and {{< katex >}}\lambda_{lse}{{< /katex >}} (dashed line).

Similar to `lasso2`, `cvlasso` allows to pass plotting options on to Stata's `line`
using `plotopt()`.

### Prediction

The predict postestimation command allows to obtain predicted values and residuals
for either `e(lopt)` or `e(lse)`.
	
	. cvlasso lpsa lcavol lweight age lbph svi lcp gleason pgg45, seed(123)
	. cap drop xbhat1
	. predict double xbhat1, lopt

	. cvlasso lpsa lcavol lweight age lbph svi lcp gleason pgg45, seed(123)
	. cap drop xbhat2
	. predict double xbhat2, lse

### Store intermediate steps

`cvlasso` calls `lasso2` internally.  The `saveest(string)` allows to 
access intermediate estimation results. 
        
	. cvlasso lpsa lcavol lweight age lbph svi lcp gleason pgg45, ///
		  seed(123) nfolds(3) saveest(step)
	. estimates dir
	. estimates restore step1
	. estimates replay step1

*Note:* EBIC and {{< katex >}}R^2{{< /katex >}} are not calculated to speed up the computation.

## Time-series example using rolling h-step ahead cross-validation

Load airline passenger data:

	. webuse air2, clear

There are 144 observations in the sample.  `origin()` controls the sample range used
for training and validation.  In this example, `origin(130)` implies that data up to
and including {{< katex >}}t=130{{< /katex >}} are used for training in the first iteration.  Data points {{< katex >}}t=131,...,144{{< /katex >}}
 are successively used for validation.

	. cvlasso air L(1/12).air, rolling origin(130)
	Rolling forecasting cross-validation with 1-step ahead forecasts. Elastic net with alpha=1.
	Training from-to (validation point): 13-130 (131), 13-131 (132), 13-132 (133), 13-133 (134),
	> 13-134 (135), 13-135 (136), 13-136 (137), 13-137 (138), 13-138 (139), 13-139 (140), 
	> 13-140 (141), 13-141 (142), 13-142 (143), 13-143 (144).

The notation `a-b (v)` indicates that
data `a` to `b` are used for estimation (training), and data point `v` is used for
forecasting (validation).  Note that the training dataset starts with {{< katex >}}t=13{{< /katex >}} since 12
lags are used as predictors.

The "optimal" model includes lags 1, 11 and 12.

	. cvlasso, lopt
	Estimate lasso with lambda=315.16 (lopt).

	---------------------------------------------------
		 Selected |           Lasso   Post-est OLS
	------------------+--------------------------------
		      air |
		      L1. |       0.1534004      0.1610229
		     L11. |       0.0638066      0.0724006
		     L12. |       0.8422566      0.8374074
	------------------+--------------------------------
	   Partialled-out*|
	------------------+--------------------------------
		          |
		    _cons |      11.5075093      8.2797832
	---------------------------------------------------

The option `h()` controls the forecasting horizon (default is `h(1)`).
	
	. cvlasso air L(1/12).air, rolling origin(130) h(2)
	Rolling forecasting cross-validation with 2-step ahead forecasts. Elastic net with alpha=1.
	Training from-to (validation point): 13-130 (132), 13-131 (133), 13-132 (134), 13-133 (135),
	> 13-134 (136), 13-135 (137), 13-136 (138), 13-137 (139), 13-138 (140), 13-139 (141), 
	> 13-140 (142), 13-141 (143), 13-142 (144).

In the above examples, the size of the training dataset increases by one data point
each step.  To keep the size of the training dataset fixed, specify `fixedwindow`.

	. cvlasso air L(1/12).air, rolling origin(130) fixedwindow
	Rolling forecasting cross-validation with 1-step ahead forecasts. Elastic net with alpha=1.
	Training from-to (validation point): 13-130 (131), 14-131 (132), 15-132 (133), 16-133 (134),
	> 17-134 (135), 18-135 (136), 19-136 (137), 20-137 (138), 21-138 (139), 22-139 (140), 
	> 23-140 (141), 24-141 (142), 25-142 (143), 26-143 (144).

## Panel data example using rolling h-step ahead cross-validation

Rolling cross-validation can also be applied to panel data.  For demonstration, load
Grunfeld data.

	. webuse grunfeld, clear

Apply 1-step ahead cross-validation.

	. cvlasso mvalue L(1/10).mvalue, rolling origin(1950)
	Rolling forecasting cross-validation with 1-step ahead forecasts. Elastic net with alpha=1.
	Training from-to (validation point): 1945-1950 (1951), 1945-1951 (1952), 1945-1952 (1953), 
	> 1945-1953 (1954).

The model selected by cross-validation:

	. cvlasso, lopt
	Estimate lasso with lambda=4828.76 (lopt).

	---------------------------------------------------
		 Selected |           Lasso   Post-est OLS
	------------------+--------------------------------
		   mvalue |
		      L1. |       0.7289970      0.7343915
		      L5. |       0.1181815      0.1239170
		      L7. |       0.0027785      0.0062233
		      L8. |       0.0613727      0.0647928
		      L9. |       0.1014168      0.1031103
	------------------+--------------------------------
	   Partialled-out*|
	------------------+--------------------------------
		          |
		    _cons |      42.6792365     21.8393696
	---------------------------------------------------

## More

Please check the help file for more information and examples.

	. help cvlasso

