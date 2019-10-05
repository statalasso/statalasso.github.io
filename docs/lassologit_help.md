---
title: "Help file: lassologit"
permalink: /docs/lassologit_help/
layout:  single
sidebar:
  nav: "docs"
toc:  false
classes:  wide
---

<pre id="stlog-1" style="font-size: 12px" class="sthlp">-------------------------------------------------------------------------------------------------------------
<b>help lassologit</b>                                                                       <i>lassologit</i> package v0.1
<b>help rlassologit</b>                                                                                <i>first release</i>
<b>help cvlassologit</b>
-------------------------------------------------------------------------------------------------------------

<b><u>Title</u></b>

    <b>lassologit</b> -- Main program for regularized logistic regression

    <b>cvlassologit</b> -- Program for <i>K</i>-fold cross-validation with logistic regression

    <b>rlassologit</b> -- Program for regularized logistic regression with rigorous penalization


<a name="stlog-1-syntax"></a><b><u>Syntax</u></b>

    <u>Full syntax</u>

        <b>lassologit</b> <i>depvar</i> <i>regressors</i> [<b>if</b> <i>exp</i>] [<b>in</b> <i>range</i>] [<b>,</b> <b><u>postl</u></b><b>ogit</b> <b><u>nocon</u></b><b>stant</b> <b><u>l</u></b><b>ambda(</b><i>numlist</i><b>)</b>
              <b><u>lc</u></b><b>ount(</b><i>integer</i><b>)</b> <b><u>lminr</u></b><b>atio(</b><i>real</i><b>)</b> <b><u>lmax</u></b><b>(</b><i>real</i><b>)</b> <b>lambdan</b> <b>lic(</b><i>string</i><b>)</b> <b><u>ebicx</u></b><b>i(</b><i>real</i><b>)</b> <b><u>postres</u></b><b>ults</b>
              <b><u>notp</u></b><b>en(</b><i>varlist</i><b>)</b> <b>spsi(</b><i>matrix</i><b>)</b> <b>nostd</b> <b>stdcoef</b> <b>holdout(</b><i>varname</i><b>)</b> <b><u>lossm</u></b><b>easure(</b><i>string</i><b>)</b> <b><u>tolo</u></b><b>pt(</b><i>real</i><b>)</b>
              <b><u>tolz</u></b><b>ero(</b><i>real</i><b>)</b> <b><u>maxi</u></b><b>ter(</b><i>int</i><b>)</b> <b><u>quadp</u></b><b>rec</b> <b><u>noseqr</u></b><b>ule</b> <b><u>plot</u></b><b>path(</b><i>method</i><b>)</b> <b><u>plotv</u></b><b>ar(</b><i>varlist</i><b>)</b>
              <b><u>ploto</u></b><b>pt(</b><i>string</i><b>)</b> <b><u>plotl</u></b><b>abel</b> <b>long</b> <b><u>verb</u></b><b>ose</b> <b>ic(</b><i>string</i><b>)</b> <b><u>nopro</u></b><b>gressbar</b>]

        <b>cvlassologit</b> <i>depvar</i> <i>regressors</i> [<b>if</b> <i>exp</i>] [<b>in</b> <i>range</i>] [<b>,</b> <b><u>postl</u></b><b>ogit</b> <b><u>nocon</u></b><b>stant</b> <b><u>l</u></b><b>ambda(</b><i>numlist</i><b>)</b>
              <b><u>lc</u></b><b>ount(</b><i>integer</i><b>)</b> <b><u>lminr</u></b><b>atio(</b><i>real</i><b>)</b> <b><u>lmax</u></b><b>(</b><i>real</i><b>)</b> <b>lambdan</b> <b>lopt</b> <b>lse</b> <b><u>postres</u></b><b>ults</b> <b><u>notp</u></b><b>en(</b><i>varlist</i><b>)</b>
              <b>spsi(</b><i>matrix</i><b>)</b> <b>nostd</b> <b><u>tolo</u></b><b>pt(</b><i>real</i><b>)</b> <b><u>tolz</u></b><b>ero(</b><i>real</i><b>)</b> <b><u>maxi</u></b><b>ter(</b><i>int</i><b>)</b> <b><u>quadp</u></b><b>rec</b> <b><u>noseqr</u></b><b>ule</b> <b><u>nf</u></b><b>olds(</b><i>integer</i><b>)</b>
              <b><u>foldv</u></b><b>ar(</b><i>varname</i><b>)</b> <b><u>savefoldv</u></b><b>ar(</b><i>new varname</i><b>)</b> <b>seed(</b><i>integer</i><b>)</b> <b><u>strat</u></b><b>ified</b> <b>storeest(</b><i>string</i><b>)</b>
              <b><u>lossm</u></b><b>easure(</b><i>string</i><b>)</b> <b>plotcv</b> <b><u>ploto</u></b><b>pt(</b><i>string</i><b>)</b> <b>long</b> <b><u>verb</u></b><b>ose</b> <b>tabfold</b>]

        <b>rlassologit</b> <i>depvar</i> <i>regressors</i> [<b>if</b> <i>exp</i>] [<b>in</b> <i>range</i>] [<b>,</b> <b><u>postl</u></b><b>ogit</b> <b><u>nocon</u></b><b>stant</b> <b>gamma(</b><i>real</i><b>)</b> <b>c(</b><i>real</i><b>)</b>
              <b>holdout(</b><i>varname</i><b>)</b> <b><u>lossm</u></b><b>easure(</b><i>string</i><b>)</b> <b><u>tolo</u></b><b>pt(</b><i>real</i><b>)</b> <b><u>tolz</u></b><b>ero(</b><i>real</i><b>)</b> <b><u>maxi</u></b><b>ter(</b><i>int</i><b>)</b> <b><u>quadp</u></b><b>rec</b>
              <b><u>noseqr</u></b><b>ule</b> <b><u>verb</u></b><b>ose</b>]


    <u>Options</u>

    <i>Estimators</i>            Description
    -------------------------------------------------------------------------------------------------------
    <b><u>postl</u></b><b>ogit</b>              use post-estimation logit.  <b>lassologit</b>: If lambda is a list, post-estimation OLS
                            results are displayed and returned in <b>e(betas)</b>.  If lambda is a scalar (or
                            <b>rlassologit</b> is used), post-estimation OLS is always displayed, and this option
                            controls whether standard or post-estimation OLS results are stored in <b>e(b)</b>.
                            <b>cvlassologit</b>: post-estimation logit is used for cross-validation.
    <b><u>nocon</u></b><b>stant</b>             suppress constant from estimation (not recommended).
    -------------------------------------------------------------------------------------------------------

    <i>Lambda(s)</i>             Description
    -------------------------------------------------------------------------------------------------------
    <b><u>l</u></b><b>ambda(</b><i>numlist</i><b>)</b>        a scalar lambda value or list of descending lambda values. Each lambda value
                            must be greater than 0.  If not specified, the default list is used which is
                            given by <b>exp(rangen(log(lmax),log(lminratio*lmax),lcount))</b> (see <a href="http://www.stata.com/help.cgi?mf_range"><b>mf_range</b></a>).
    <b><u>lc</u></b><b>ount(</b><i>integer</i><b>)</b>†       number of lambda values for which the solution is obtained. Default is 50.
    <b><u>lminr</u></b><b>atio(</b><i>real</i><b>)</b>†       ratio of minimum to maximum lambda. <b>lminratio</b> must be between 0 and 1. Default
                            is 1/1000.
    <b><u>lmax</u></b><b>(</b><i>real</i><b>)</b>†            maximum lambda value.
    <b>lambdan</b>                uses <i>lambda</i>:=<i>lambda</i>/<i>N</i> in the objective function.  This makes <i>lambda</i> comparable
                            with <i>glmnet</i> (Friedman, Hastie &amp; Tibshirani, <a href="#stlog-1-Friedman2010"><b>2010</b></a>).
    <b>lic(</b><i>string</i><b>)</b>            <b>lassologit</b>: after first <b>lassologit</b> estimation using list of lambdas, estimate
                            model corresponding to minimum information criterion.  'aic', 'bic', 'aicc',
                            and 'ebic' (the default) are allowed.  Note the lower case spelling.  See
                            <a href="#stlog-1-informationcriteria">Information criteria</a> for the definition of each information criterion.
    <b><u>ebicx</u></b><b>i(</b><i>real</i><b>)</b>           <b>lassologit</b>: controls the <i>xi</i> parameter of the EBIC.  <i>xi</i> needs to lie in the [0,1]
                            interval.  <i>xi</i>=0 is equivalent to the BIC.  The default choice is
                            <i>xi</i>=1-log(n)/(2*log(p)).
    <b>lopt</b>                   <b>cvlassologit</b>: after cross-validation, estimate model with lambda that minimized
                            the mean-squared prediction error
    <b>lse</b>                    <b>cvlassologit</b>: after cross-validation, estimate model with largest lambda that is
                            within one standard deviation from lopt
    <b><u>postres</u></b><b>ults</b>            Used in combination with <b>lic()</b>, <b>lse</b> or <b>lopt</b>.  Stores estimation results of the
                            model selected by information criterion in <b>e()</b>.
    -------------------------------------------------------------------------------------------------------
    The above options are only applicable for <b>lassologit</b> and <b>cvlassologit</b>.  † Not applicable if
    <b><u>l</u></b><b>ambda(</b><i>numlist</i><b>)</b> is specified.

    <i>Rigorous lambda</i>       Description
    -------------------------------------------------------------------------------------------------------
    <b>gamma(</b><i>real</i><b>)</b>            specifies the significance level <i>gamma</i> for the rigorous lambda. The default is
                            0.05/max((p*log(n),n)).
    <b>c(</b><i>real</i><b>)</b>                specified slack parameter <i>c</i> for the rigorous lambda (default = 1.1)
    -------------------------------------------------------------------------------------------------------
    The above options are only applicable for <b>rlassologit</b>.

    <i>Loadings &amp; standardization</i> Description
    -------------------------------------------------------------------------------------------------------
    <b><u>notp</u></b><b>en(</b><i>varlist</i><b>)</b>        sets penalty loadings to zero for predictors in <i>varlist</i>.  Unpenalized predictors
                            are always included in the model.
    <b>spsi(</b><i>matrix</i><b>)</b>           a row-vector of penalty loadings (in standard units); overrides the default
                            which is a vector of ones.  The size of the vector should equal the number of
                            predictors (excluding partialled out variables and excluding the constant).
    <b>nostd</b>                  do not standardize the predictors. Default is to standardize predictors to have
                            unit variance.
    <b>stdcoef</b>                return coefficient estimates in standardized units.  Default is to return
                            coefficients in original units.
    -------------------------------------------------------------------------------------------------------

    <i>Optimization</i>          Description
    -------------------------------------------------------------------------------------------------------
    <b><u>tolo</u></b><b>pt(</b><i>real</i><b>)</b>           tolerance for lasso shooting algorithm (default=1e-10)
    <b><u>tolz</u></b><b>ero(</b><i>real</i><b>)</b>          minimum below which coeffs are rounded down to zero (default=1e-4)
    <b><u>maxi</u></b><b>ter(</b><i>int</i><b>)</b>           maximum number of iterations for the lasso shooting algorithm (default=10,000)
    <b><u>quadp</u></b><b>rec</b>               use <a href="http://www.stata.com/help.cgi?mf_quadcross"><b>mf_quadcross</b></a> instead of <a href="http://www.stata.com/help.cgi?mf_cross"><b>mf_cross</b></a> in the shooting algorithm. This will slow
                            down the program (considerably) but lead to (in our experience minor) gains in
                            precision.  This will also disable the sequential strong rule, see next.
    <b><u>noseqr</u></b><b>ule</b>              disables use of sequential strong rule, which discards some predictors before
                            running the shooting algorithm (see Section 5 in Tibshirani et al., <a href="#stlog-1-Tib2012"><b>2012</b></a>).  The
                            sequential rule leads to speed gains.  NB: sequential rule is automatically
                            disabled if intercept is omitted.
    -------------------------------------------------------------------------------------------------------

    <i>Cross-validation</i>      Description
    -------------------------------------------------------------------------------------------------------
    <b>nfolds(</b><i>integer</i><b>)</b>        the number of folds used for <i>K</i>-fold cross-validation. Default is 5.
    <b>foldvar(</b><i>varname</i><b>)</b>       user-specified variable with fold IDs, ranging from 1 to #folds.  If not
                            specified, fold IDs are randomly generated such that each fold is of
                            approximately equal size.
    <b>savefoldvar(</b><i>varname</i><b>)</b>   saves the fold ID variable.
    <b>seed(</b><i>real</i><b>)</b>             set seed for the generation of a random fold variable. Only relevant if fold
                            variable is randomly generated.
    <b><u>strat</u></b><b>ified</b>             observations are divided into folds such that number of successes / failures is
                            approximately the same across folds.  Recommended especially if share of
                            successes is close to 0 or 1.
    <b>storeest(</b><i>string</i><b>)</b>       saves <b>lassologit</b> results from each step of the cross-validation in <i>string1</i>, ...,
                            <i>stringK</i> where <i>K</i> is the number of folds.  Intermediate results can be restored
                            using <a href="http://www.stata.com/help.cgi?estimates+restore"><b>estimates restore</b></a>.
    <b>holdout(</b><i>varname</i><b>)</b>       defines a holdout sample. <b>lassologit</b> and <b>rlassologit</b> only.  <i>varname</i> should be a
                            binary variable where 1 indicates that observations are excluded from the
                            estimation.  Estimated loss is returned in <b>e(loss)</b>.
    <b><u>lossm</u></b><b>easure(</b><i>string</i><b>)</b>    loss measure used for cross-validation or for the holdout sample.  "deviance"
                            and "class" (miss-classification error) are supported. Deviance is the default.
    -------------------------------------------------------------------------------------------------------
    Only applicable for <b>cvlassologit</b>.

<a name="stlog-1-plottingopts"></a>    <i>Plotting </i><i>lassologit</i> Description
    -------------------------------------------------------------------------------------------------------
    <b><u>plot</u></b><b>path(</b><i>method</i><b>)</b>       plots the coefficients path as a function of the L1-norm (<i>norm</i>), lambda (<i>lambda</i>)
                            or the log of lambda (<i>lnlambda</i>)
    <b><u>plotv</u></b><b>ar(</b><i>varlist</i><b>)</b>       list of variables to be included in the plot
    <b><u>ploto</u></b><b>pt(</b><i>string</i><b>)</b>        additional plotting options passed on to <a href="http://www.stata.com/help.cgi?line"><b>line</b></a>.  For example, use
                            <b>plotopt(legend(off))</b> to turn off the legend.
    <b><u>plotl</u></b><b>abel</b>              displays variable labels in graph.
    -------------------------------------------------------------------------------------------------------
    <i>Note:</i> Plotting with <b>lassologit</b> is not available if lambda is a scalar value.

<a name="stlog-1-plottingopts"></a>    <i>Plotting </i><i>cvlassologit</i> Description
    -------------------------------------------------------------------------------------------------------
    <b>plotcv</b>                 plots the coefficients path as a function of the L1-norm (<i>norm</i>), lambda (<i>lambda</i>)
                            or the log of lambda (<i>lnlambda</i>)
    <b><u>ploto</u></b><b>pt(</b><i>string</i><b>)</b>        additional plotting options passed on to <a href="http://www.stata.com/help.cgi?line"><b>line</b></a>.  For example, use
                            <b>plotopt(legend(off))</b> to turn off the legend.
    -------------------------------------------------------------------------------------------------------

    <i>Display options</i>       Description
    -------------------------------------------------------------------------------------------------------
    <b>long</b>†                  show long output, applicable for <b>lassologit</b> and <b>cvlassologit</b>.
    <b><u>ver</u></b><b>bose</b>                show additional output
    <b>tabfold</b>                <b>cvlassologit</b>: show frequency table of fold variable
    <b>ic(</b><i>string</i><b>)</b>†            controls which information criterion is shown in the output.  'aic', 'bic',
                            'aicc', and 'ebic' (the default' are allowed).  Note the lower case spelling.
                            See <a href="#stlog-1-informationcriteria">Information criteria</a> for the definition of each information criterion.
    <b><u>nopro</u></b><b>gressbar</b>          <b>lassologit</b>: do not show progressbar
    -------------------------------------------------------------------------------------------------------


    <u>Replay syntax</u>

    <b>lassologit</b> and <b>cvlassologit</b> support replay syntay.  The replay syntax can be used to retrieve
    estimation results for the models selected by information criteria (using the <b>lic()</b>) option or the
    model selected by cross-validation (using <b>lse</b> or <b>lopt</b>).

        <b>lassologit</b> [<b>,</b> <b><u>plot</u></b><b>path(</b><i>method</i><b>)</b> <b><u>plotv</u></b><b>ar(</b><i>varlist</i><b>)</b> <b><u>ploto</u></b><b>pt(</b><i>string</i><b>)</b> <b><u>plotl</u></b><b>abel</b> <b>long</b> <b><u>postres</u></b><b>ults</b>
              <b>lic(</b><i>string</i><b>)</b> <b>ic(</b><i>string</i><b>)</b>]

        <b>cvlassologit</b> [<b>,</b> <b><u>plot</u></b><b>path(</b><i>method</i><b>)</b> <b><u>plotv</u></b><b>ar(</b><i>varlist</i><b>)</b> <b><u>ploto</u></b><b>pt(</b><i>string</i><b>)</b> <b><u>plotl</u></b><b>abel</b> <b>long</b> <b><u>postres</u></b><b>ults</b>
              <b>lic(</b><i>string</i><b>)</b> <b>ic(</b><i>string</i><b>)</b>]


    <u>Prediction</u>

        <b>predict</b> [<a href="http://www.stata.com/help.cgi?datatypes"><i>type</i></a>] <a href="http://www.stata.com/help.cgi?newvar"><i>newvar</i></a> [<a href="http://www.stata.com/help.cgi?if"><i>if</i></a>] [<a href="http://www.stata.com/help.cgi?in"><i>in</i></a>] [<b>,</b> <b>xb</b> <b><u>p</u></b><b>r</b> <b><u>c</u></b><b>lass</b> <b><u>postl</u></b><b>ogit</b> <b>lse</b> <b>lopt</b> <b>lic(</b><i>string</i><b>)</b> <b><u>noi</u></b><b>sily</b>

    <i>Predict options</i>       Description
    -------------------------------------------------------------------------------------------------------
    <b>xb</b>                     compute predicted values (the default)
    <b><u>p</u></b><b>r</b>                     predicted probabilities
    <b><u>c</u></b><b>lass</b>                  predicted class (either 1 or 0)
    <b><u>postl</u></b><b>ogit</b>              use post-logit (default is to use <b>e(b)</b>
    <b>lic(</b><i>string</i><b>)</b>            after <b>lassologit</b>: selects which information criterion to use for prediction.
    <b>lopt</b>                   after <b>cvlassologit</b>: use lambda that minimizes the mean-squared prediction error
    <b>lse</b>                    after <b>cvlassologit</b>: use largest lambda that is within one standard deviation
                            from lopt
    <b><u>noi</u></b><b>sily</b>                show estimation output if re-estimation required
    -------------------------------------------------------------------------------------------------------


    <u>Notes</u>

    All varlists may contain time-series operators or factor variables; see help varlist.


<b><u>Contents</u></b>

    <a href="#stlog-1-description">Description</a>
    <a href="#stlog-1-coordinate">Coordinate descent algorithm</a>
    <a href="#stlog-1-penalization">Penalization level</a>
    <a href="#stlog-1-crossvalidation">Cross-validation</a>
    <a href="#stlog-1-informationcriteria">Information criteria</a>
    <a href="#stlog-1-rigorous">Rigorous penalization</a>
    <a href="#stlog-1-technical">Technical notes</a>
    <a href="#stlog-1-example">Example using Spam data</a>
    <a href="#stlog-1-example_data">--Data set</a>
    <a href="#stlog-1-example_intro">--Introduction</a>
    <a href="#stlog-1-example_information">--Information criteria</a>
    <a href="#stlog-1-example_cv">--Cross-validation</a>
    <a href="#stlog-1-example_rigorous">--Rigorous penalization</a>
    <a href="#stlog-1-example_prediction">--Prediction</a>
    <a href="#stlog-1-example_holdout">--Holdout option</a>
    <a href="#stlog-1-example_plot_lassologit">--Plotting with lassologit</a>
    <a href="#stlog-1-example_plot_cvlassologit">--Plotting with cvlassologit</a>
    <a href="#stlog-1-saved_results">Saved results</a>
    <a href="#stlog-1-references">References</a>
    <a href="#stlog-1-website">Website</a>
    <a href="#stlog-1-installation">Installation</a>
    <a href="#stlog-1-acknowledgements">Acknowledgements</a>
    <a href="#stlog-1-citation">Citation of lassologit</a>


<a name="stlog-1-description"></a><b><u>Description</u></b>

    <b>lassologit</b> implements logistic lasso regression.  The logistic lasso maximizes the penalized log
    likelihood:

        max  1/N sum_i { y(i) * log p(x(i)) + (1-y(i)) * log(1-p(x(i))) }
                                        - lambda * ||Psi*beta||[1], 
        
    where

    y(i)       is a binary response that is either 1 or 0,
    beta       is a <i>p</i>-dimensional parameter vector,
    x(i)       is a <i>p</i>-dimensional vector of predictors for observation i,
    p(x(i))    is the probability that y(i) takes the value 1 given x(i); p(x(i)) = exp(x(i)'beta) / (1 +
                exp(x(i)'beta)),
    lambda     is the overall penalty level,
    ||.||[1]   denotes the L(1) vector norm,
    Psi        is a <i>p</i> by <i>p</i> diagonal matrix of predictor-specific penalty loadings. Note that <b>lassologit</b>
                treats Psi as a row vector.
    N          number of observations
        
    <b>lassologit</b> uses coordinate descent algorithms for logistic lasso as described in <a href="#stlog-1-Friedman2010"><b>Friedman 2010</b></a>, Section
    3.


<a name="stlog-1-penalization"></a><b><u>Penalization level: choice of lambda</u></b>

    Penalized regression methods rely on tuning parameters that control the degree and type of
    penalization.  Logistic lasso relies on the tuning parameter <i>lambda</i> which determines the level
    penalization.  We offer three approaches for selecting the "optimal" lambda value implemented in
    <b>lassologit</b>, <b>cvlassologit</b> and <b>rlassologit</b>:

    (1) The penalty level may be chosen by cross-validation in order to optimize out-of-sample prediction
    performance.  <i>K</i>-fold cross-validation is implemented in <b>cvlassologit</b>.

    (2) Theoretically justified and feasible penalty levels and loadings are available for the logistic
    lasso via <b>rlassologit</b>.

    (3) Lambda can also be selected using information criteria.  <b>lassologit</b> calculates four information
    criteria:  Akaike Information Criterion (AIC; Akaike, <a href="#stlog-1-Akaike1974"><b>1974</b></a>), Bayesian Information Criterion (BIC;
    Schwarz, <a href="#stlog-1-Schwarz1978"><b>1978</b></a>), Extended Bayesian information criterion (EBIC; Chen &amp; Chen, <a href="#stlog-1-Chen2008"><b>2008</b></a>) and the corrected AIC
    (AICc; Sugiura, <a href="#stlog-1-Sugiura1978"><b>1978</b></a>, and Hurvich, <a href="#stlog-1-Hurvich1989"><b>1989</b></a>).


<a name="stlog-1-crossvalidation"></a><b><u>K-fold cross-validation</u></b>

    <b>cvlassologit</b> implements <i>K</i>-fold cross-validation.  The purpose of cross-validation is to assess the
    out-of-sample prediction (classification) performance.

    <u>Cross-validation procedure</u>

    <i>K</i>-fold cross-validation divides the data randomly (or based on the user-specified <b>foldvar(</b><i>varname</i><b>)</b> into
    <i>K</i> folds, i.e., data partitions of approximately equal size. In each step, one fold is left out of the
    estimation (training) sample and used for validation.  The prediction (classification) performance is
    assessed based on loss measures.  <b>cvlassologit</b> offers two loss measures:  deviance and
    miss-classification error (defined below).  For more information, see <a href="http://www.stata.com/help.cgi?cvlasso"><b>cvlasso</b></a> (for the linear case).

    <u>Stratified cross-validation</u>

    Simple <i>K</i>-fold cross-validation might fail with randomly generated folds, or produce misleading results,
    if the share of successes (y=1) or failures (y=0) is low. The <b><u>strat</u></b><b>ified</b> option ensures that the number
    of success/failures is approximately the same across folds.  The <b>tabfold</b> option can be useful in this
    context; it asks <b>cvlassologit</b> to show the frequency distribution of successes/failures across folds.

    <u>Loss measures</u>

    The prediction performance is assessed based on two loss measures:  deviance and miss-classification.
    Deviance is the default and is defined as:

        Deviance = -2 * {y0 :* log(p0) :+ (1:-y0):*log(1:-p0)} 

    where y0 is the response in the validation data and p0 are the predicted probabilities.

    The missclassification error is the average number of wrongly classified cases, and can be specified
    using <b>lossmeasure(</b><i>class</i><b>)</b>.


<a name="stlog-1-informationcriteria"></a><b><u>Information criteria</u></b>
 
    The information criteria supported by <b>lassologit</b> are the Akaike information criterion (AIC, Akaike,
    <a href="#stlog-1-Akaike1974"><b>1974</b></a>), the Bayesian information criterion (BIC, Schwarz, <a href="#stlog-1-Schwarz1978"><b>1978</b></a>), the corrected AIC (Sugiura, <a href="#stlog-1-Sugiura1978"><b>1978</b></a>;
    Hurvich, <a href="#stlog-1-Hurvich1989"><b>1989</b></a>), and the Extended BIC (Chen &amp; Chen, <a href="#stlog-1-Chen2008"><b>2008</b></a>).  These are given by (omitting dependence on
    lambda and alpha):

        AIC     = -2*LL + 2*<i>df</i>
        BIC     = -2*LL + <i>df</i>*log(N) 
        AICc    = AIC + (2*<i>df</i>(<i>df</i>+1))/(N-<i>df</i>-1)
        EBIC    = BIC + 2*<i>xi</i>*<i>df</i>*log(p)

    where LL is the log-likelihood and <i>df</i>(lambda,alpha) is the effective degrees of freedom, which is a
    measure of model complexity.  <i>df</i> is approximated by the number of predictors selected.

    By default, <b>lassologit</b> displays EBIC in the output, but all four information criteria are stored in
    <b>e(aic)</b>, <b>e(bic)</b>, <b>e(ebic)</b> and <b>e(aicc)</b>.  See help file of <a href="http://www.stata.com/help.cgi?lasso2"><b>lasso2</b></a> for more information.


<a name="stlog-1-rigorous"></a><b><u>Rigorous penalization</u></b>

    The theory-driven ("rigorous") penalty level used by <b>rlassologit</b> is:

        lambda = <i>c</i>/2 sqrt(<i>N</i>) Phi^(-1)(1-<i>gamma</i>)

    where <i>c</i> is a slack parameter (default = 1.1), Phi(.) is the standard normal CDF and <i>gamma</i> is the
    significance level.  The default for <i>gamma</i> is 0.05/max((p*log(n),n)).  The approach requires the
    predictors to be standardized such that mean(x(i)^2)=1.  The penalty level is motivated by
    self-normalized moderate deviation theory, and is aimed at overruling the noise associated with the
    data-generating process.  See Belloni, Chernozhukov &amp; Wei (<a href="#stlog-1-Belloni2016"><b>2016</b></a>).

<a name="stlog-1-technical"></a><b><u>Technical notes</u></b>

    <u>Standardization</u>

    <b>lassologit</b> centers and standardizes the predictors before estimation.  The coefficient estimates are
    returned in original scale. If the <b>stdcoef</b> option is used, coefficients are returned in standardized
    units.  <b>nostd</b> can be used to estimate with predictors in original scale.

    <u>Constant</u>

    The constant is not penalized by default.  Thus, the constant is always included in the model.  To omit
    the constant, use <b><u>nocons</u></b><b>tant</b> (not recommended).


<a name="stlog-1-example"></a><b><u>Example using Spam data</u></b>

<a name="stlog-1-example_data"></a>    <u>Data set</u>

    For demonstration we consider the Spambase Data Set from the Machine Learning Repository.  The data
    includes 4,601 observations and 57 variables.  The aim is to predict whether an email is spam (i.e.,
    unsolicited commercial e-mail) or not.  Each observation corresponds to one email.

    Predictors    
      v1-v48    percentage of words in the e-mail that match a specific <i>word</i>, i.e. 100 * (number of times
                  the word appears in the e-mail) divided by total number of words in e-mail.  To see which
                  word each predictor corresponds to, see link below.
      v49-v54   percentage of characters in the e-mail that match a specific <i>character</i>, i.e. 100 * (number
                  of times the character appears in the e-mail) divided by total number of characters in
                  e-mail.  To see which character each predictor corresponds to, see link below.
      v55       average length of uninterrupted sequences of capital letters
      v56       length of longest uninterrupted sequence of capital letters
      v57       total number of capital letters in the e-mail

    Outcome       
      v58       denotes whether the e-mail was considered spam (1) or not (0).
 
    For more information about the data see https://archive.ics.uci.edu/ml/datasets/spambase.

    Load spam data.
        . insheet using https://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.data,
            clear comma

<a name="stlog-1-example_intro"></a>    <u>Introduction to </u><b><u>lassologit</u></b>

    The basic syntax for <b>lassologit</b> is to specify the dependent variable followed by a list of predictors:

        . lassologit v58 v1-v57

    The output of <b>lassologit</b> shows the penalty levels (lambda), the number of predictors included (s), the
    L1-Norm, one information criterion (EBIC by default), McFadden's Pseudo-R-squared and which predictors
    are included/removed from the model.

    By default, one line per knot is shown. Knots are points at which predictors enter or leave the model.
    By specifying <b>long</b>, an extended output with one row for each lambda is shown.

        . lassologit, long

    To obtain the logistic lasso estimate for a scalar lambda or a list of lambdas, the <b>lambda(</b><i>numlist</i><b>)</b>
    option can be used.  For example:

        . lassologit v58 v1-v57, lambda(40 20)
        . ereturn list

    And for one lambda:

        . lassologit v58 v1-v57, lambda(40)
        . ereturn list

    Note that output and the objects stored in <b>e()</b> depend on whether lambda is only one value or a list of
    more than one value.

<a name="stlog-1-example_information"></a>    <u>Information criteria</u>

    To estimate the model selected by one of the information criteria, use the <b>lic()</b> option:

        . lassologit v58 v1-v57
        . lassologit, lic(ebic)
        . lassologit, lic(aicc)

    In the above example, we use the replay syntax that works similar to a post-estimation command.  The
    same can also be achieved in one line:

        . lassologit v58 v1-v57, lic(ebic)

    When <b>lic()</b> is used, <b>lassologit</b> reports the logistic lasso estimates and the post-logit estimates (from
    applying logit estimation to the model selected by the logitistic lasso) for the value of lambda
    selected by the specified information criterion.

    Note that <b>lic()</b> does not change the estimation results in memory. The advantage is that this way <b>lic()</b>
    can be used multiple times to compare results without that we need to re-estimate the model.

    To store the model selected by one of the information criteria, use <b><u>postres</u></b><b>ults</b>:

        . lassologit, lic(ebic) postresults

<a name="stlog-1-example_cv"></a>    <u>Cross-validation with </u><b><u>cvlassologit</u></b>

    <b>cvlassologit</b> implements <i>K</i>-fold cross-validation where the data is by default randomly partitioned.

    Here, we use <i>K</i>=3 and <b>seed(</b><i>123</i><b>)</b> to set the seed for reproducibility.  (Be patient, this takes a minute.)

        . cvlassologit v58 v1-v57, nfolds(3) seed(123)

    The output shows the prediction performance measured by deviance for each lambda value.  To estimate
    the model selected by cross-validation we can specify <b>lopt</b> or <b>lse</b> using the replay syntax.

        . cvlassologit, lopt
        . cvlassologit, lse

    The data is by default randomly partitioned into <i>K</i> folds. The <b>tabfold</b> option asks <b>lassologit</b> to show
    the frequency distribution of successes (1) and failures (0) across folds.

        . cvlassologit v58 v1-v57, nfolds(3) seed(123) tabfold

    In small samples, we might end up with a low number of success or failures in some folds.  The
    <b><u>strat</u></b><b>ified</b> option can help with this:  it ensures that the number of successes (1) and failures (0) is
    approximately the same across folds:

        . cvlassologit v58 v1-v57, nfolds(3) seed(123) tabfold stratified

    As with <b>lassologit</b>, we can use the <b>long</b> option for an extended outout.

        . cvlassologit, long

<a name="stlog-1-example_rigorous"></a>    <u>Rigorous penalization with </u><b><u>rlassologit</u></b>

    Lastly, we consider the logistic lasso with rigorous penalization:

        . rlassologit v58 v1-v57

    <b>rlassologit</b> displays the logistic lasso solution and the post-logit solution.

    The rigorous lambda is returned in <b>e(lambda)</b> and is equal to 79.207801.

        . di e(lambda)

    We get the same result when specifying the rigorous lambda manually using the <b>lambda()</b> option of
    <b>lassologit</b>:

        . lassologit v58 v1-v57, lambda(79.207801)

<a name="stlog-1-example_prediction"></a>    <u>Prediction</u>

    After selecting a model, we can use <b>predict</b> to obtain predicted probabilities or linear predictions.

    First, we select a model using <b>lic()</b> in combination with <b>postresults</b> as above:

        . lassologit v58 v1-v57
        . lassologit, lic(ebic) postresults

    Then, we use <b>predict</b>:

        . predict double phat, pr
        . predict double xbhat, xb

    <b><u>p</u></b><b>r</b> saves the predicted probability of success and <b>xb</b> saves the linear predicted values.

    Note that the use of <b><u>postres</u></b><b>ults</b> is required.  Without <b><u>postres</u></b><b>ults</b> the results of the estimation with
    the selected penalty level are not stored.

    The approach for <b>cvlassologit</b> is very similar:

        . cvlassologit v58 v1-v57
        . cvlassologit, lopt postresults
        . predict double phat, pr

    In the case of <b>rlassologit</b>, we don't need to select a specific penalty level and we also don't need to
    specify <b><u>postres</u></b><b>ults</b>.

        . rlassologit v58 v1-v57
        . predict double phat, pr

<a name="stlog-1-example_holdout"></a>    <u>Assessing prediction accuracy with </u><b><u>holdout()</u></b>

    We can leave one partition of the data out of the estimation sample and check the accuracy of
    prediction using the <b>holdout(</b><i>varname</i><b>)</b> option.

    We first define a binary holdout variable:

        . gen myholdout = (_n&gt;4500)

    There are 4,601 observations in the sample, and we exclude observations 4,501 to 4,601 from the
    estimation.  The holdout variable should be set to 1 for all observations that we want to use for
    assessing classification accuracy.

        . lassologit v58 v1-v57, holdout(myholdout)
        . mat list e(loss)

        . rlassologit v58 v1-v57, holdout(myholdout)
        . mat list e(loss)

    The loss measure is returned in <b>e(loss)</b>.  As with cross-validation, deviance is used by default.
    <b>lossmeasure(</b><i>class</i><b>)</b> will return the average number of miss-classifications.

<a name="stlog-1-example_plot_lassologit"></a>    <u>Plotting with </u><b><u>lassologit</u></b>

    <b>lassologit</b> supports plotting of the coefficient path over lambda.  Here, we create the plot using the
    replay syntax, but the same can be achieved in one line:

        . lassologit v58 v1-v57
        . lassologit, plotpath(lambda) plotvar(v1-v5) plotlabel plotopt(legend(off))

    In the above example, we use the following settings:  <b>plotpath(</b><i>lambda</i><b>)</b> plots estimates against lambda.
    <b>plotvar(</b><i>v1-v5</i><b>)</b> restricts the set of variables plotted to <i>v1-v5</i> (to avoid that the graph is too
    cluttered).  <b>plotlabel</b> puts variable labels next to the lines.  <b>plotopt(</b><i>legend</i><b>(</b><i>off</i><b>))</b> turns the legend
    off.

<a name="stlog-1-example_plot_cvlassologit"></a>    <u>Plotting with </u><b><u>cvlassologit</u></b>

    The <b>plotcv</b> option creates a graph of the estimates loss a function of lambda:

        . cvlassologit v58 v1-v57, nfolds(3) seed(123)
        . cvlassologit v58 v1-v57, plotcv

    The vertical solid red line indicates the value of lambda that minimizes the loss function.  The dashed
    red line corresponds to the largest lambda for which MSPE is within one standard error of the minimum
    loss.


<a name="stlog-1-saved_results"></a><b><u>Saved results</u></b>

    <u>lassologit with single lambda and rlassologit</u>

    scalars       
      <b>e(N)</b>               sample size
      <b>e(cons)</b>            =1 if constant is present, 0 otherwise
      <b>e(p)</b>               number of predictors excluding intercept
      <b>e(std)</b>             =1 if predictors are standardized
      <b>e(lcount)</b>          number of lambda values
      <b>e(ll0)</b>             log-likelihood of null model
      <b>e(total_success)</b>   number of successes
      <b>e(total_trials)</b>    number of trials
      <b>e(N_holdout)</b>       observations in holdout sample
      <b>e(lmax)</b>            largest lambda value
      <b>e(lmin)</b>            smallest lambda value
      <b>e(lambda)</b>          penalty level
      <b>e(ll)</b>              log-likelihood
      <b>e(shat)</b>            number of selected regressors
      <b>e(shat0)</b>           number of selected and unpenalized regressors including constant (if present)
      <b>e(tss)</b>             total sum of squares
      <b>e(aic)</b>             minimum AIC
      <b>e(bic)</b>             minimum BIC
      <b>e(aicc)</b>            minimum AICc
      <b>e(ebic)</b>            minimum EBIC

    macros        
      <b>e(cmd)</b>             command name
      <b>e(depvar)</b>          name of dependent variable
      <b>e(varX)</b>            all predictors
      <b>e(varXmodel)</b>       penalized predictors
      <b>e(selected)</b>        selected predictors
      <b>e(selected0)</b>       selected predictors including constant

    matrices      
      <b>e(b)</b>               posted coefficient vector. By default used for prediction.
      <b>e(beta_post)</b>       post-logit coefficient vector
      <b>e(beta_dense)</b>      logistic lasso coefficient vector without zeros
      <b>e(beta_post_dense)</b> post-logit coefficient vector without zeros
      <b>e(beta_std)</b>        logitistic lasso coefficient vector in standard units
      <b>e(beta_std_post)</b>   post-logit coefficient vector in standard units
      <b>e(beta)</b>            logistic lasso coefficient vector
      <b>e(sdvec)</b>           vector of standard deviations of the predictors
      <b>e(sPsi)</b>            penalty loadings in standard units
      <b>e(Psi)</b>             = <b>e(sPsi)</b> :* <b>e(sdvec)</b>
      <b>e(loss)</b>            estimated loss if <b>holdout()</b> is used

    <u>lassologit with multiple lambdas</u>

    scalars       
      <b>e(N)</b>               sample size
      <b>e(cons)</b>            =1 if constant is present, 0 otherwise
      <b>e(p)</b>               number of predictors excluding intercept
      <b>e(std)</b>             =1 if predictors are standardized
      <b>e(lcount)</b>          number of lambda values
      <b>e(ll0)</b>             log-likelihood of null model
      <b>e(total_success)</b>   number of successes
      <b>e(total_trials)</b>    number of trials
      <b>e(N_holdout)</b>       observations in holdout sample
      <b>e(aicmin)</b>          minimum AIC
      <b>e(bicmin)</b>          minimum BIC
      <b>e(aiccmin)</b>         minimum AICc
      <b>e(ebicmin)</b>         minimum EBIC
      <b>e(aicid)</b>           lambda ID of minimum AIC
      <b>e(bicid)</b>           lambda ID of minimum BIC
      <b>e(aiccid)</b>          lambda ID of minimum AICc
      <b>e(ebicid)</b>          lambda ID of minimum EBIC
      <b>e(aiclambda)</b>       lambda corresponding to minimum AIC
      <b>e(biclambda)</b>       lambda corresponding to minimum BIC
      <b>e(aicclambda)</b>      lambda corresponding to minimum AICc
      <b>e(ebiclambda)</b>      lambda corresponding to minimum EBIC
      <b>e(loss)</b>            estimated loss if <b>holdout()</b> is used

    macros        
      <b>e(cmd)</b>             command name
      <b>e(depvar)</b>          name of dependent variable
      <b>e(varX)</b>            all predictors
      <b>e(varXmodel)</b>       penalized predictors

    matrices      
      <b>e(betas)</b>           posted coefficient matrix
      <b>e(betas_std)</b>       posted coefficient matrix in standard units
      <b>e(lambdas)</b>         vector of lambdas
      <b>e(aic)</b>             vector of AIC values
      <b>e(aicc)</b>            vector of AICc values
      <b>e(bic)</b>             vector of BIC values
      <b>e(ebic)</b>            vector of EBIC values
      <b>e(ll)</b>              vector of log-likelihood values
      <b>e(l1norm)</b>          vector of L1-norm
      <b>e(shat)</b>            number of included predictors
      <b>e(shat0)</b>           number of included predictors including intercept
      <b>e(sdvec)</b>           vector of standard deviations of the predictors
      <b>e(sPsi)</b>            penalty loadings in standard units
      <b>e(Psi)</b>             = <b>e(sPsi)</b> :* <b>e(sdvec)</b>


    <u>cvlassologit</u>

    scalars       
      <b>e(N)</b>               number of observations
      <b>e(lunique)</b>         lunique
      <b>e(lambdan)</b>         =1 if <b>lambdan</b> option is used
      <b>e(mlossmin)</b>        number of observations
      <b>e(lmin)</b>            smallest lambda used for CV
      <b>e(lmax)</b>            maximum lambda used for CV
      <b>e(lse)</b>             number of observations
      <b>e(lopt)</b>            number of observations
      <b>e(lseid)</b>           lambda ID corresponding to <b>e(lse)</b>
      <b>e(loptid)</b>          lambda ID corresponding to <b>e(lopt)</b>
      <b>e(nfolds)</b>          number of folds

    macros        
      <b>e(cmd)</b>             command name
      <b>e(depvar)</b>          name of dependent variable
      <b>e(varX)</b>            all predictors
      <b>e(lossmeasure)</b>     loss measure (<i>deviance</i> or <i>class</i>)

    matrices      
      <b>e(lambdas)</b>         vector of lambda values used for cross-validation
      <b>e(mloss)</b>           mean cross-validated loss
      <b>e(loss)</b>            cross-validated loss for each fold; a matrix of size <i>nfolds</i> x <i>lcount</i>
      <b>e(cvsd)</b>            estimate of standard error of mean cross-validated loss
      <b>e(cvlower)</b>         = <b>e(mloss)</b> - <b>e(cvsd)</b>
      <b>e(cvupper)</b>         = <b>e(mloss)</b> + <b>e(cvsd)</b>

    <u>Estimation sample (always returned)</u>

    functions     
      <b>e(sample)</b>          estimation sample


<a name="stlog-1-references"></a><b><u>References</u></b>

<a name="stlog-1-Akaike1974"></a>    Akaike, H. (1974). A new look at the statistical model identification. <i>IEEE Transactions on Automatic</i>
        <i>Control</i>, 19(6), 716–723.  https://doi.org/10.1109/TAC.1974.1100705

<a name="stlog-1-Belloni2016"></a>    Belloni, A., Chernozhukov, V., &amp; Wei, Y. (2016). Post-Selection Inference for Generalized Linear Models
        With Many Controls.  <i>Journal of Business &amp; Economic Statistics</i>, 34(4), 606–619.  
        https://doi.org/10.1080/07350015.2016.1166116

<a name="stlog-1-Belloni2017"></a>    Belloni, A., Chernozhukov, V., Fernández-Val, I., &amp; Hansen, C. (2017).  Program Evaluation and Causal
        Inference With High-Dimensional Data.  <i>Econometrica</i>, 85(1), 233–298.  
        https://doi.org/10.3982/ECTA12723

<a name="stlog-1-Fu1998"></a>    Fu, W. J. (1998). Penalized Regressions: The Bridge Versus the Lasso. <i>Journal of Computational and</i>
        <i>Graphical Statistics</i> 7(3), 397–416.  https://doi.org/10.2307/1390712

<a name="stlog-1-Friedman2007"></a>    Friedman, J., Hastie, T., Höfling, H., &amp; Tibshirani, R. (2007). Pathwise coordinate optimization. <i>The</i>
        <i>Annals of Applied Statistics</i> 1(2), 302–332.  https://doi.org/10.1214/07-AOAS131

<a name="stlog-1-Friedman2010"></a>    Friedman, J., Hastie, T., &amp; Tibshirani, R. (2010). Regularization Paths for Generalized Linear Models
        via Coordinate Descent. <i>Journal of Statistical Software</i> 33(1), 1–22.  
        https://doi.org/10.18637/jss.v033.i01

<a name="stlog-1-Hastie2009"></a>    Hastie, T., Tibshirani, R., &amp; Friedman, J. (2009). The Elements of Statistical Learning (2nd ed.). New
        York: Springer-Verlag.  https://web.stanford.edu/~hastie/ElemStatLearn/

<a name="stlog-1-Hurvich1989"></a>    Hurvich, C. M., &amp; Tsai, C.-L. (1989). Regression and time series model selection in small samples.
        <i>Biometrika</i>, 76(2), 297–307.  http://doi.org/10.1093/biomet/76.2.297

<a name="stlog-1-Schwarz1978"></a>    Schwarz, G. (1978). Estimating the Dimension of a Model. <i>The Annals of Statistics</i>, 6(2), 461–464.  
        https://doi.org/10.1214/aos/1176344136

<a name="stlog-1-Sugiura1978"></a>    Sugiura, N. (1978). Further analysts of the data by akaike’ s information criterion and the finite
        corrections. <i>Communications in Statistics - Theory and Methods</i>, 7(1), 13–26.  
        http://doi.org/10.1080/03610927808827599

<a name="stlog-1-Tib1996"></a>    Tibshirani, R. (1996). Regression Shrinkage and Selection via the Lasso. <i>Journal of the Royal</i>
        <i>Statistical Society. Series B (Methodological)</i> 58(1), 267–288.  https://doi.org/10.2307/2346178

<a name="stlog-1-Tib2012"></a>    Tibshirani, R., Bien, J., Friedman, J., Hastie, T., Simon, N., Taylor, J., &amp; Tibshirani, R. J. (2012).
        Strong rules for discarding predictors in lasso-type problems.  <i>Journal of the Royal Statistical</i>
        <i>Society. Series B (Statistical Methodology)</i>, 74(2), 245–266.  http://www.jstor.org/stable/41430939

<a name="stlog-1-Kooji2007"></a>    Van der Kooij A (2007). Prediction Accuracy and Stability of Regrsssion with Optimal Scaling
        Transformations. Ph.D. thesis, Department of Data Theory, University of Leiden.  
        http://hdl.handle.net/1887/12096


<a name="stlog-1-website"></a><b><u>Website</u></b>

    Please check our website https://statalasso.github.io/ for more information.


<a name="stlog-1-installation"></a><b><u>Installation</u></b>

    To get the latest stable version of <b>lassologit</b> from our website, check the installation instructions at
    https://statalasso.github.io/installation/.  We update the stable website version more frequently than
    the SSC version.

    To verify that <b>lassologit</b> is correctly installed, click on or type whichpkg lassologit (which requires 
    <a href="http://www.stata.com/help.cgi?whichpkg"><b>whichpkg</b></a> to be installed; ssc install whichpkg).

<a name="stlog-1-citation"></a><b><u>Citation of lassologit</u></b>

    <b>lassologit</b> is not an official Stata command. It is a free contribution to the research community, like
    a paper. Please cite it as such:

    Ahrens, A., Hansen, C.B., Schaffer, M.E. 2019.  lassologit: Stata module for logistic lasso regression.
        http://ideas.repec.org/c/boc/bocode/XXXXX.html


<b><u>Authors</u></b>

        Achim Ahrens, Economic and Social Research Institute, Ireland
        achim.ahrens@esri.ie
        
        Christian B. Hansen, University of Chicago, USA
        Christian.Hansen@chicagobooth.edu

        Mark E Schaffer, Heriot-Watt University, UK
        m.e.schaffer@hw.ac.uk
        

<b><u>Also see</u></b>

       Help: <a href="http://www.stata.com/help.cgi?lasso2"><b>lasso2</b></a>, <a href="http://www.stata.com/help.cgi?cvlasso"><b>cvlasso</b></a>, <a href="http://www.stata.com/help.cgi?rlasso"><b>rlasso</b></a>, <a href="http://www.stata.com/help.cgi?ivlasso"><b>ivlasso</b></a>, <a href="http://www.stata.com/help.cgi?pdslasso"><b>pdslasso</b></a> (if installed).
</pre>