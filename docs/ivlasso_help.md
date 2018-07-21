---
title: "Help file: ivlasso and pdslasso"
permalink: /docs/ivlasso_help/
layout:  single
sidebar:
  nav: "docs"
toc:  false
classes:  wide
---

<pre id="stlog-1" style="font-size: 12px" class="sthlp"><b>help pdslasso, help ivlasso</b>
-------------------------------------------------------------------------------------------------------------------

<b><u>Title</u></b>

    <b>pdslasso</b> and<b> ivlasso</b> --
                 Progams for post-selection and post-regularization OLS or IV estimation and inference

<a name="stlog-1-syntax"></a><b><u>Syntax</u></b>

        <b>pdslasso</b> <i>depvar</i> <i>regressors</i> <b>(</b><i>hd_controls</i><b>)</b> [<b>if</b> <i>exp</i>] [<b>in</b> <i>range</i>] [ <b>,</b> <b>partial(</b><i>varlist</i><b>)</b> <b>pnotpen(</b><i>varlist</i><b>)</b>
              <b>aset(</b><i>varlist</i><b>)</b> <b>post(</b><i>method</i><b>)</b> <b><u>r</u></b><b>obust</b> <b><u>cl</u></b><b>uster(</b><i>var</i><b>)</b> <b>fe</b> <b>noftools</b> <b>rlasso</b>[<b>(</b><i>name</i><b>)</b>] <b>sqrt</b> <b><u>noi</u></b><b>sily</b>
              <b><u>lopt</u></b><b>ions(</b><i>options</i><b>)</b> <b><u>olsopt</u></b><b>ions(</b><i>options</i><b>)</b> <b><u>noc</u></b><b>onstant</b> ]

        <b>ivlasso</b> <i>depvar</i> <i>regressors</i> [<b>(</b><i>hd_controls</i><b>)</b>] <b>(</b><i>endog</i><b>=</b><i>instruments</i><b>)</b> [<b>if</b> <i>exp</i>] [<b>in</b> <i>range</i>] [ <b>,</b> <b>partial(</b><i>varlist</i><b>)</b>
              <b>pnotpen(</b><i>varlist</i><b>)</b> <b>aset(</b><i>varlist</i><b>)</b> <b>post(</b><i>method</i><b>)</b> <b><u>r</u></b><b>obust</b> <b><u>cl</u></b><b>uster(</b><i>var</i><b>)</b> <b>fe</b> <b>noftools</b> <b>rlasso</b>[<b>(</b><i>name</i><b>)</b>] <b>sqrt</b>
              <b><u>noi</u></b><b>sily</b> <b><u>lopt</u></b><b>ions(</b><i>options</i><b>)</b> <b><u>ivopt</u></b><b>ions(</b><i>options</i><b>)</b> <b>first</b> <b>idstats</b> <b><u>supscore</u></b><b>ci</b> <b>ssgamma(</b><i>real</i><b>)</b> <b>ssgridmin(</b><i>real</i><b>)</b>
              <b>ssgridmax(</b><i>real</i><b>)</b> <b>ssgridpoints(</b><i>integer 100</i><b>)</b> <b>ssgridmat(</b><i>name</i><b>)</b> <b><u>noc</u></b><b>onstant</b> ]

        Note: <b>pdslasso</b> requires <b>rlasso</b> to be installed; <b>ivlasso</b> also requires <b>ranktest</b>.  See help rlasso and help
              ranktest or click on ssc install lassopack or ssc install ranktest to install.

        Note: the <b>fe</b> option will take advantage of the <a href="#stlog-1-SG2016"><b>ftools</b></a> package (if installed) for the fixed-effects
              transform; the speed gains using this package can be large.  See help ftools or click on ssc
              install ftools to install.

        Note: <b>ivlasso</b> also supports the simpler <b>pdslasso</b> syntax.

    <i>Options</i>               Description
    -------------------------------------------------------------------------------------------------------------
    <b>partial(</b><i>varlist</i><b>)</b>       controls and instruments to be partialled-out prior to lasso estimation
    <b>pnotpen(</b><i>varlist</i><b>)</b>       controls and instruments always included, not penalized by lasso
    <b>aset(</b><i>varlist</i><b>)</b>          controls and instruments in amelioration set, always included in post-lasso
    <b>post(</b><i>method</i><b>)</b>           <i>pds</i>, <i>lasso</i> or <i>plasso</i>; which estimation results are to be posted in <b>e(</b><i>b</i><b>)</b> and <b>e(</b><i>V</i><b>)</b>
    <b><u>r</u></b><b>obust</b>                 heteroskedastic-robust VCE; lasso penalty loadings account for heteroskedasticity
    <b><u>cl</u></b><b>uster(</b><i>var</i><b>)</b>           cluster-robust VCE; lasso penalty loadings account for clustering
    <b>fe</b>                     fixed-effects model (requires data to be <a href="http://www.stata.com/help.cgi?xtset"><b>xtset</b></a>)
    <b>noftools</b>               do not use FTOOLS package for fixed-effects transform (slower; rarely used)
    <b>rlasso</b>[<b>(</b><i>name</i><b>)</b>]         store and display intermediate lasso and post-lasso results from rlasso with optional
                            prefix <i>name</i> (if just <b>rlasso</b> is specified the default prefix is _ivlasso_ or
                            _pdslasso_)
    <b>sqrt</b>                   use sqrt-lasso instead of standard lasso
    <b><u>noi</u></b><b>sily</b>                display step-by-step intermediate <b>rlasso</b> estimation results
    <b><u>lopt</u></b><b>ions(</b><i>options</i><b>)</b>      lasso options specific to <b>rlasso</b> estimation; see <a href="http://www.stata.com/help.cgi?rlasso"><b>help rlasso</b></a>
    <b><u>olsopt</u></b><b>ions(</b><i>options</i><b>)</b>    (<b>pdslasso</b> only) options specific to PDS OLS estimation of structural equation
    <b><u>ivopt</u></b><b>ions(</b><i>options</i><b>)</b>     (<b>ivlasso</b> only) options specific to PDS OLS or IV estimation of structural equation
    <b>first</b>                  (<b>ivlasso</b> only) display and store first-stage results for 2SLS
    <b>idstats</b>                (<b>ivlasso</b> only) request weak-identification statistics for 2SLS
    <b><u>noc</u></b><b>onstant</b>             suppress constant from regression
    -------------------------------------------------------------------------------------------------------------

    <i>Sup-score test</i>        Description
    (<b>ivlasso</b> only)        
    -------------------------------------------------------------------------------------------------------------
    <b>sscset</b>                 request sup-score weak-identification-robust confidence set
    <b>ssgamma(</b><i>real</i><b>)</b>          significance level for sup-score weak-identification-robust tests and confidence
                            intervals (default=0.05, 5%)
    <b>ssgridmin(</b><i>real</i><b>)</b>        minimum value for grid search for sup-score weak-identification-robust confidence
                            intervals (default=grid centered at OLS estimate)
    <b>ssgridmax(</b><i>real</i><b>)</b>        maximum value for grid search for sup-score weak-identification-robust confidence
                            intervals (default=grid centered at OLS estimate)
    <b>ssgridpoints(</b><i>real</i><b>)</b>     number of points in grid search for sup-score weak-identification-robust confidence
                            intervals (default=100)
    <b>ssgridmat(</b><i>name</i><b>)</b>        user-supplied Stata r x k matrix of r jointly hypothesized values for the k endogenous
                            regressors to be tested using the sup-score test
    <b>ssomitgrid(</b><i>name</i><b>)</b>       supress display of sup-score test results with user-supplied grid
    <b>ssmethod(</b><i>name</i><b>)</b>         "abound" (default) = use conservative critical value (asymptotic bound)
                            c*sqrt(N)*invnormal(1-gamma/(2p)); "simulate" = simulate distribution to obtain
                            p-values for sup-score test; "select" = reject if <b>rlasso</b> selects any instruments
    -------------------------------------------------------------------------------------------------------------

    Postestimation:

        <b>predict</b> [<a href="http://www.stata.com/help.cgi?datatypes"><i>type</i></a>] <a href="http://www.stata.com/help.cgi?newvar"><i>newvar</i></a> [<a href="http://www.stata.com/help.cgi?if"><i>if</i></a>] [<a href="http://www.stata.com/help.cgi?in"><i>in</i></a>] [<b>,</b> <b>resid</b> <b>xb</b> ]

    <b>pdslasso</b> and <b>ivlasso</b> may be used with time-series or panel data, in which case the data must be tsset or
    xtset first; see help <a href="http://www.stata.com/help.cgi?tsset"><b>tsset</b></a> or <a href="http://www.stata.com/help.cgi?xtset"><b>xtset</b></a>.

    All varlists may contain time-series operators or factor variables; see help varlist.


<b><u>Contents</u></b>

    <a href="#stlog-1-description">Description</a>
    <a href="#stlog-1-computation">Computational notes</a>
    <a href="#stlog-1-examples">Examples of usage</a>
    <a href="#stlog-1-saved_results">Saved results</a>
    <a href="#stlog-1-references">References</a>
    <a href="#stlog-1-acknowledgements">Acknowledgements</a>
    <a href="#stlog-1-citation">Citation of pdslasso and ivlasso</a>


<a name="stlog-1-description"></a><b><u>Description</u></b>

    <b>pdslasso</b> and <b>ivlasso</b> are routines for estimating structural parameters in linear models with many controls
    and/or instruments.  The routines use methods for estimating sparse high-dimensional models, specifically the
    lasso (Least Absolute Shrinkage and Selection Operator, Tibshirani <a href="#stlog-1-Tib1996"><b>1996</b></a>) and the square-root-lasso (Belloni
    et al. <a href="#stlog-1-BCW2011"><b>2011</b></a>, <a href="#stlog-1-BCW2014"><b>2014</b></a>).  Two approaches are implemented in <b>pdslasso</b> and <b>ivlasso</b>:

          1. The "post-double-selection" (PDS) methodology of Belloni et al. (<a href="#stlog-1-BCCH2012"><b>2012</b></a>, <a href="#stlog-1-BCH2013"><b>2013</b></a>, <a href="http://www.stata.com/help.cgi?rlasso#BCH2014"><b>2014</b></a>, <a href="#stlog-1-BCH2015"><b>2015</b></a>, <a href="#stlog-1-BCHK2016"><b>2016</b></a>),
               denoted "PDS methodology" below.

          2. The "post-regularization" methodology of Chernozhukov, Hansen and Spindler (<a href="#stlog-1-CHS2015"><b>2015</b></a>), denoted "CHS
               methodology" below.

    The implemention of these methods in <b>pdslasso</b> and <b>ivlasso</b> uses the separate Stata program <a href="http://www.stata.com/help.cgi?rlasso"><b>rlasso</b></a>, which
    provides lasso and sqrt-lasso estimation with data-driven penalization; see <a href="http://www.stata.com/help.cgi?rlasso"><b>rlasso</b></a> for details.

    The intution behind the methodology is most clearly seen from the PDS methodology applied to the case where a
    researcher has an outcome variable <i>y</i>, a structural or causal variable of interest <i>d</i>, and a large set of
    potential control variables <i>x1, x2, x3, ...</i>.  The problem the researcher faces is that the "right" set of
    controls is not known.  In traditional practice, this presents her with a difficult choice:  use too few
    controls, or the wrong ones, and omitted variable bias will be present; use too many, and the model will
    suffer from overfitting.

    The PDS methodology uses the lasso estimator to select the controls.  Specifically, the lasso is used twice:
    (1) estimate a lasso regression with <i>y</i> as the dependent variable and the control variables <i>x1, x2, x3, ...</i> as
    regressors; (2) estimate a lasso regression with <i>d</i> as the dependent variable and again the control variables
    <i>x1, x2, x3, ...</i> as regressors.  The lasso estimator achieves a sparse solution, i.e., most coefficients are
    set to zero.  The final choice of control variables to include in the OLS regression of <i>y</i> on <i>d</i> is the union
    of the controls selected selected in steps (1) and (2), hence the name "post-double selection" for the
    methodolgy.  The PDS methodology can be employed to select instruments as well as controls in instrumental
    variables estimation.

    The CHS methodology is closely related.  Instead of using the lasso-selected controls and instruments in a
    post-regularization OLS or IV estimation, the selected variables are used to construct orthogonalized
    versions of the dependent variable, the exogenous and/or endogenous causal variables of interest and to
    construct optimal instruments from the lasso-selected IVs.  The orthogonalized versions are based either on
    the lasso or post-lasso estimated coefficients; the post-lasso is OLS applied to lasso-selected variables.
    See Chernozhukov et al. (<a href="#stlog-1-CHS2015"><b>2015</b></a>) for details.

    The set of variables selected by the lasso and used in the OLS post-lasso estimation and in the PDS
    structural estimation can be augmented by variables that were penalized but not selected by the lasso.  The
    penalized variables that are used in this way to augment the post-lasso and PDS estimations are called the
    "amelioration set" and can be specified with the <b>aset(</b><i>varlist</i><b>)</b> option.  This option affects only the CHS
    post-lasso-based and PDS estimations; the CHS lasso-based orthogonalized variables are unaffected.  See
    Chernozhukov et al. (<a href="#stlog-1-BCH2014"><b>2014</b></a>) for details.

    <b>pdslasso</b> and <b>ivlasso</b> report the PDS-based and the two (lasso and post-lasso) CHS-based estimations.  If the
    <b>sqrt</b> option is specified, instead of the lasso the sqrt-lasso estimator is used; see <a href="http://www.stata.com/help.cgi?rlasso"><b>rlasso</b></a> for further
    details and references.

    If the IV model is weakly identified (the instruments are only weakly correlated with the endogenous
    regressors) Belloni et al. (<a href="#stlog-1-BCCH2012"><b>2012</b></a>, <a href="#stlog-1-BCH2013"><b>2013</b></a>) suggest using weak-identification-robust hypothesis tests and
    confidence sets based the Chernozhukov et al. (<a href="#stlog-1-CCK2013"><b>2013</b></a>) sup-score test.  The intuition behind the sup-score test
    is similar to that of the Anderson-Rubin (<a href="#stlog-1-AR1949"><b>1949</b></a>) test.  Consider the simplest case (a single endogenous
    regressor <i>d</i> and no exogenous regressors or controls) where the null hypothesis is that the coefficient on <i>d</i>
    is <i>H0:beta=b0</i>.  If the null is true, then the structural residual is simply <i>e=y-b0*d</i>.  Under the additional
    assumption that the instruments are valid (orthogonal to the true disturbance), they should be uncorrelated
    with <i>e</i>.

    The sup-score tests reported by <b>ivlasso</b> are in effect high-dimensional versions of the Anderson-Rubin test.
    The test is implemented in <a href="http://www.stata.com/help.cgi?rlasso"><b>rlasso</b></a>; see <a href="http://www.stata.com/help.cgi?rlasso"><b>help rlasso</b></a> for details.  Specifically, <b>ivlasso</b> reports sup-score
    tests of statistical significance of the instruments where the dependent variable is <i>e=y-b0*d</i>, the
    instruments are regressors, and <i>b0</i> is a hypothesized value of the coefficient on <i>d</i>; a large test statistic
    indicates rejection of the null H0:<i>beta=b0</i>.  The default is to use a conservative (asymptotic bound) critical
    value as suggested by Belloni et al. (<a href="#stlog-1-BCCH2012"><b>2012</b></a>, <a href="#stlog-1-BCH2013"><b>2013</b></a>) (option <b>ssmethod(</b><i>abound</i><b>)</b>).  Alternative methods are to use
    p-values obtained by simulation via a multiplier bootstrap (option <b>ssmethod(</b><i>simulate</i><b>)</b>), or to estimate a
    lasso regression with the instruments as regressors, and if (no) instruments are selected we (fail to) reject
    the null <i>H0:beta=b0</i> at the <i>gamma</i> significance level (option <b>ssmethod(</b><i>select</i><b>)</b>).

    A <i>100*(1-gamma)%</i> sup-score-based confidence set can be constructed by a grid search over the range of
    hypothesized values of <i>beta</i>.  <b>ivlasso</b> reports the result of the sup-score test of the null <i>H0:beta=0</i> with the
    <b>idstats</b> option, and in addition, for the single endogenous regressor case only, reports sup-score confidence
    sets with the <b>sscset</b> option.  For the multiple-endogenous regressor case, sets of jointly hypothesized values
    for the componets of <i>beta</i> can be tested using the <b>ssgridmat(</b><i>name</i><b>)</b> option.  The matrix provided in the option
    should be an r x k Stata matrix, where each row contains a set of values that together specify a null
    hypothesis for the coefficients of the k endogenous regressors.  This option allows the user to specify a
    grid search in multiple dimensions.

<a name="stlog-1-computation"></a><b><u>Computational notes</u></b>

    The various options available for the underlying calls to <b>rlasso</b> can be controlled via the option
    <b>loptions(</b><i>rlasso option list</i><b>)</b>.  The <b>rlasso</b> option <b>center</b>, to center moments in heteroskedastic and
    cluster-robust loadings, will be a commonly-employed option.  This can be specified by <b>lopt(</b><i>center</i><b>)</b>.

    Another <b>rlasso</b> option that may often be used is to "pre-standardize" the data to have unit variance prior to
    computing the lasso coefficients with the <b>prestd</b> option.  This is a computational alternative to the <b>rlasso</b>
    default of standardizing "on the fly" (i.e., incorporating the standardization into the lasso penalty
    loadings).  This is specified by <b>lopt(</b><i>prestd</i><b>)</b>.  The results are equivalent in theory.  The <b>prestd</b> option can
    lead to improved numerical precision or more stable results in the case of difficult problems; the cost is (a
    typically small) computation time required to standardize.

    <b>rlasso</b> implements a version of the lasso with data-dependent penalization and, for the heteroskedastic and
    clustered cases, regressor-specific penalty loadings; see <a href="http://www.stata.com/help.cgi?rlasso"><b>rlasso</b></a> for details.  Note that specification of
    <b>robust</b> or <b>cluster(</b>.<b>)</b> as options to <b>pdslasso</b> or <b>ivlasso</b> automatically implies the use of robust or
    cluster-robust lasso penalty loadings.  Penalty loadings and VCE type can be separately controlled via the
    <b>olsoptions(</b>.<b>)</b> (for <b>pdslasso</b>) or <b>ivoptions(</b>.<b>)</b> (for <b>ivlasso</b>) vs. <b>loptions(</b><i>rlasso option list</i><b>)</b>; for example,
    <b>olsoptions(</b><i>cluster</i><b>(</b><i>clustvar</i><b>))</b> + <b>loptions(</b><i>robust</i><b>)</b> would use heteroskedastic-robust penalty loadings for the
    lasso estimations and a cluster-robust covariance estimator for the PDS and CHS estimations of the structural
    equation.

    Either the <b>partial(</b><i>varlist</i><b>)</b> option or the <b>pnotpen(</b><i>varlist</i><b>)</b> option can be used for variables that should not
    be penalized by the lasso.  By the Frisch-Waugh-Lovell Theorem for the lasso (Yamada <a href="http://www.stata.com/help.cgi?rlasso#Yam2017"><b>2017</b></a>), the estimated
    lasso coefficients are the same in theory whether the unpenalized regressors are partialled-out or given zero
    penalty loadings, so long as the same penalty loadings are used for the penalized regressors in both cases.
    Although the options are equivalent in theory, numerical results can differ in practice because of the
    different calculation methods used; see <a href="http://www.stata.com/help.cgi?rlasso#notpen"><b>rlasso</b></a> for further details.  The constant, if present, is always
    unpenalized or partialled-out.  The <b>partial(</b><i>varlist</i><b>)</b> option always partials out the constant (if present)
    along with the variables specified in <i>varlist</i>; to partial out just the constant, specify <b>partial(</b><i>_cons</i><b>)</b>.
    Partialling-out of controls is done by <b>ivlasso</b>; partialling-out of instruments is done in the lasso
    estimation by <b>rlasso</b>.

    The lasso and sqrt-lasso estimations are obtained via numerical methods (coordinate descent).  Results can be
    unstable for difficult problems (e.g., if the scaling of variables covers a wide range of magnitudes).  Using
    variables that are all measured on a similar scale will help (as usual).  Partialling-out variables is
    usually preferable to specifying them as unpenalized.  See <a href="http://www.stata.com/help.cgi?rlasso"><b>rlasso</b></a> for discussion of the various options for
    controlling the numerical methods used.

    The sup-score-based tests reported by <b>ivlasso</b> come in three versions:  (a) using lasso-orthogonalized
    variables, where the variables have first been orthogonalized with respect to the high-dimensional controls
    using the lasso; (b) using post-lasso-orthogonalized variables; (c) using the variables without any
    orthogonalization.  The orthogonalizations use the same lasso settings as in the main estimation.  After
    orthgonalization, <i>e~ = y~ - b0*d~</i> is constructed (where a tilde indicates an orthogonalized variable), and
    then the sup-score test is conducted using <i>e~</i> and the instruments.  Versions (a) and (b) are not reported if
    there are no high-dimensional controls.  Version (c) is available if there are high-dimensional controls but
    only if the <b>method(</b><i>select</i><b>)</b> option is used.  The sup-score-based tests are not available if the specification
    also includes either exogenous causal regressors or unpenalized instruments.

    For large datasets, obtaining the p-value for the sup-score test by simulation (multiplier bootstrap,
    <b>ssmethod(</b><i>simulate</i><b>)</b> option) can be time-consuming.  In such cases, using the default method of a conservative
    (asymptotic bound) critical value (<b>ssmethod(</b><i>abound</i><b>)</b> option) will be much faster.

    The grid search to construct the sup-score confidence set can be controlled by the <b>ssgridmin</b>, <b>ssgridmax</b> and
    <b>ssgridpoints</b> options.  If these options are not specified by the user, a 100-point grid centered on the OLS
    estimator is used.

    The <b>fe</b> fixed-effects option is equivalent to (but computationally faster and more accurate than) specifying
    unpenalized panel-specific dummies.  The fixed-effects ("within") transformation also removes the constant as
    well as the fixed effects.  The panel variable used by the <b>fe</b> option is the panel variable set by <a href="http://www.stata.com/help.cgi?xtset"><b>xtset</b></a>.

    <b>rlasso</b>, like the lasso in general, accommodates possibly perfectly-collinear sets of regressors.  Stata's
    <a href="http://www.stata.com/help.cgi?fvvarlist"><b>factor variables</b></a> are supported by <b>rlasso</b>.  Users therefore have the option of specifying as high-dimensional
    controls or instruments one or more complete sets of factor variables or interactions with no base levels
    using the <i>ibn</i> prefix.  This can be interpreted as allowing the lasso to choose the members of the base
    category.

    For a detailed discussion of an R implementation of this methodology, see Spindler et al. (<a href="#stlog-1-SCH2016"><b>2016</b></a>).

<a name="stlog-1-examples"></a><b><u>Examples using data from Acemoglu-Johnson-Robinson (2001)</u></b>

    Load and reorder AJR data for Table 6 and Table 8 (datasets need to be in current directory).
        . clear
        . (click to download maketable6.zip from economics.mit.edu)
        . unzipfile maketable6
        . (click to download maketable8.zip from economics.mit.edu)
        . unzipfile maketable8
        . use maketable6
        . merge 1:1 shortnam using maketable8
        . keep if baseco==1
        . order shortnam logpgp95 avexpr lat_abst logem4 edes1975 avelf, first
        . order indtime euro1900 democ1 cons1 democ00a cons00a, last

    Examples with exogenous regressors:

    Replicate OLS results in Panel C, col. 9.
        . reg logpgp95 avexpr lat_abst edes1975 avelf temp* humid* steplow-oilres

    Basic usage: select from high-dim controls.
        . pdslasso logpgp95 avexpr (lat_abst edes1975 avelf temp* humid* steplow-oilres)

    As above, hetoroskedastic-robust.
        . pdslasso logpgp95 avexpr (lat_abst edes1975 avelf temp* humid* steplow-oilres), rob

    Specify that latitude is an unpenalized control to be partialled out.
        . pdslasso logpgp95 avexpr (lat_abst edes1975 avelf temp* humid* steplow-oilres), partial(lat_abst)

    Specify that latitude is an unpenalized control using the notpen option (equivalent).
        . pdslasso logpgp95 avexpr (lat_abst edes1975 avelf temp* humid* steplow-oilres), pnotpen(lat_abst)

    Specify that latitude is in the amelioration set.
        . pdslasso logpgp95 avexpr (lat_abst edes1975 avelf temp* humid* steplow-oilres), aset(lat_abst)

    Example with endogenous regressor, high-dimensional controls and low-dimensional instrument:

    Replicate IV results in Panels A &amp; B, col. 9.
        . ivreg logpgp95 (avexpr=logem4) lat_abst edes1975 avelf temp* humid* steplow-oilres, first

    Select controls; specify that logem4 is an unpenalized instrument to be partialled out.
        . ivlasso logpgp95 (avexpr=logem4) (lat_abst edes1975 avelf temp* humid* steplow-oilres), partial(logem4)

    Example with endogenous regressor and high-dimensional instruments and controls:

    Select controls and instruments; specify that logem4 is an unpenalized instrument and lat_abst is an
    unpenalized control; request weak identification stats and first-stage results.
        . ivlasso logpgp95 (lat_abst edes1975 avelf temp* humid* steplow-oilres) (avexpr=logem4
            euro1900-cons00a), partial(logem4 lat_abst) idstats first

    Replay first-stage estimation. (Can also use <b>est restore</b> to make this the current estimation results.)
        . est replay _ivlasso_avexpr

    Select controls and instruments; specify that lat_abst is an unpenalized control; request weak identification
    stats and sup-score confidence sets.
        . ivlasso logpgp95 (lat_abst edes1975 avelf temp* humid* steplow-oilres) (avexpr=logem4
            euro1900-cons00a), partial(lat_abst) idstats sscset

    As above but heteroskedastic-robust and use grid options to control grid search and test level; also set seed
    in <b>rlasso</b> options to make multiplier-bootstrap p-values replicable.
        . ivlasso logpgp95 (lat_abst edes1975 avelf temp* humid* steplow-oilres) (avexpr=logem4
            euro1900-cons00a), partial(lat_abst) rob idstats sscset ssgridmin(0) ssgridmax(2) ssgamma(0.1)
            lopt(seed(1))

<a name="stlog-1-examples"></a><b><u>Examples using data from Angrist-Krueger (</u></b><a href="#stlog-1-AK1991"><b><u>1991</u></b></a><b><u>)</u></b>

    Load AK data and rename variables (dataset needs to be in current directory).  NB: this is a large dataset
    (330k observations) and estimations may take some time to run on some installations.
        . clear
        . (click to download asciiqob.zip from economics.mit.edu)
        . unzipfile asciiqob.zip
        . infix lnwage 1-9 educ 10-20 yob 21-31 qob 32-42 pob 43-53 using asciiqob.txt
        . xtset pob

    Table VII (1930-39) col 2. Year and state of birth = yob &amp; pob.
        . ivregress 2sls lnwage i.pob i.yob (educ=i.qob i.yob#i.qob i.pob#i.qob)

    Fixed effects; select year controls and IVs; IVs are QOB and QOBxYOB.
        . ivlasso lnwage (i.yob) (educ=i.qob i.yob#i.qob), fe

    Fixed effects; select year controls and IVs; IVs are QOB, QOBxYOB, QOBxSOB.
        . ivlasso lnwage (i.yob) (educ=i.qob i.yob#i.qob i.pob#i.qob), fe

    All dummies &amp; interactions incl. base levels.
        . ivlasso lnwage (i.yob) (educ=ibn.qob ibn.yob#ibn.qob ibn.pob#ibn.qob), fe

<b><u>Example using data from Belloni et al. (</u></b><a href="#stlog-1-BCH2015"><b><u>2015</u></b></a><b><u>)</u></b>

    Load dataset on eminent domain (available at journal website).
        . clear
        . import excel using CSExampleData.xlsx, first

    Settings used in Belloni et al. (<a href="#stlog-1-BCH2015"><b>2015</b></a>) - results as in journal replication file (not text):
    (Store <b>rlasso</b> intermediate results for replay later.)
        . ivlasso CSIndex (NumProCase = Z*), nocons robust rlasso lopt(lalt corrnum(0) maxupsiter(100))
        . estimates replay _ivlasso_step5

<a name="stlog-1-saved_results"></a><b><u>Saved results</u></b>

    <b>ivlasso</b> saves the following in <b>e()</b>:

    scalars       
      <b>e(</b><i>N</i><b>)</b>               sample size
      <b>e(</b><i>xhighdim_ct</i><b>)</b>     number of all high-dimensional controls
      <b>e(</b><i>zhighdim_ct</i><b>)</b>     number of all high-dimensional instruments
      <b>e(</b><i>N_clust</i><b>)</b>         number of clusters in cluster-robust estimation
      <b>e(</b><i>N_g</i><b>)</b>             number of groups in fixed-effects model
      <b>e(</b><i>ss_gamma</i><b>)</b>        significance level in sup-score tests and CIs
      <b>e(</b><i>ss_level</i><b>)</b>        test level in % in sup-score tests and CIs (=100*(1-gamma))
      <b>e(</b><i>ss_gridmin</i><b>)</b>      min grid point in sup-score CI
      <b>e(</b><i>ss_gridmax</i><b>)</b>      max grid point in sup-score CI
      <b>e(</b><i>ss_gridpoints</i><b>)</b>   number of grid points in sup-score CI

    macros        
      <b>e(</b><i>cmd</i><b>)</b>             pdslasso or ivlasso
      <b>e(</b><i>depvar</i><b>)</b>          name of dependent variable
      <b>e(</b><i>dexog</i><b>)</b>           name(s) of exogenous structural variable(s)
      <b>e(</b><i>dendog</i><b>)</b>          name(s) endogenous structural variable(s)
      <b>e(</b><i>xhighdim</i><b>)</b>        names of high-dimensional control variables
      <b>e(</b><i>zhighdim</i><b>)</b>        names of high-dimensional instruments
      <b>e(</b><i>method</i><b>)</b>          lasso or sqrt-lasso
      <b>e(</b><i>ss_null</i><b>)</b>         result of sup-score test (reject/fail to reject)
      <b>e(</b><i>ss_null_l</i><b>)</b>       result of lasso-orthogonalized sup-score test (reject/fail to reject)
      <b>e(</b><i>ss_null_pl</i><b>)</b>      result of post-lasso-orthogonalized sup-score test (reject/fail to reject)
      <b>e(</b><i>ss_cset</i><b>)</b>         confidence interval for sup-score test
      <b>e(</b><i>ss_cset_l</i><b>)</b>       confidence interval for lasso-orthogonalized sup-score test
      <b>e(</b><i>ss_cset_pl</i><b>)</b>      confidence interval for post-lasso-orthogonalized sup-score test
      <b>e(</b><i>ss_method</i><b>)</b>       simulate, abound or select

    matrices      
      <b>e(</b><i>b</i><b>)</b>               posted coefficient vector
      <b>e(</b><i>V</i><b>)</b>               posted variance-covariance matrix
      <b>e(</b><i>beta_pds</i><b>)</b>        PDS coefficient vector
      <b>e(</b><i>V_pds</i><b>)</b>           PDS variance-covariance matrix
      <b>e(</b><i>beta_lasso</i><b>)</b>      CHS lasso-based coefficient vector
      <b>e(</b><i>V_lasso</i><b>)</b>         CHS lasso-based variance-covariance matrix
      <b>e(</b><i>beta_plasso</i><b>)</b>     CHS post-lasso-based coefficient vector
      <b>e(</b><i>V_plasso</i><b>)</b>        CHS post-lasso-based variance-covariance matrix
      <b>e(</b><i>ss_citable</i><b>)</b>      sup-score test results used to construct confidence sets
      <b>e(</b><i>ss_gridmat</i><b>)</b>      sup-score test results using user-specified grid

    functions     
      <b>e(</b><i>sample</i><b>)</b>          


<a name="stlog-1-references"></a><b><u>References</u></b>

<a name="stlog-1-AR1949"></a>    Anderson, T. W. and Rubin, H. 1949.  Estimation of the Parameters of Single Equation in a Complete System of
        Stochastic Equations.  <i>Annals of Mathematical Statistics</i> 20:46-63.  
        https://projecteuclid.org/euclid.aoms/1177730090

<a name="stlog-1-AK1991"></a>    Angrist, J. and Kruger, A. 1991.  Does compulsory school attendance affect schooling and earnings?  <i>Quarterly</i>
        <i>Journal of Economics</i> 106(4):979-1014.  http://www.jstor.org/stable/2937954

<a name="stlog-1-BCW2011"></a>    Belloni, A., Chernozhukov, V. and Wang, L. 2011.  Square-root lasso: Pivotal recovery of sparse signals via
        conic programming.  <i>Biometrika</i> 98:791-806.  https://doi.org/10.1214/14-AOS1204

<a name="stlog-1-BCCH2012"></a>    Belloni, A., Chen, D., Chernozhukov, V. and Hansen, C. 2012.  Sparse models and methods for optimal
        instruments with an application to eminent domain.  <i>Econometrica</i> 80(6):2369-2429.  
        http://onlinelibrary.wiley.com/doi/10.3982/ECTA9626/abstract

<a name="stlog-1-BCH2013"></a>    Belloni, A., Chernozhukov, V. and Hansen, C. 2013.  Inference for high-dimensional sparse econometric models.
        In <i>Advances in Economics and Econometrics: 10th World Congress</i>, Vol. 3: Econometrics, Cambridge
        University Press: Cambridge, 245-295.  http://arxiv.org/abs/1201.0220

<a name="stlog-1-BCH2014"></a>    Belloni, A., Chernozhukov, V. and Hansen, C. 2014.  Inference on treatment effects after selection among
        high-dimensional controls.  <i>Review of Economic Studies</i> 81:608-650.  https://doi.org/10.1093/restud/rdt044

<a name="stlog-1-BCH2015"></a>    Belloni, A., Chernozhukov, V. and Hansen, C. 2015.  High-dimensional methods and inference on structural and
        treatment effects.  <i>Journal of Economic Perspectives</i> 28(2):29-50.  
        http://www.aeaweb.org/articles.php?doi=10.1257/jep.28.2.29

<a name="stlog-1-BCHK2016"></a>    Belloni, A., Chernozhukov, V., Hansen, C. and Kozbur, D. 2016.  Inference in High Dimensional Panel Models
        with an Application to Gun Control.  <i>Journal of Business and Economic Statistics</i> 34(4):590-605.  
        http://amstat.tandfonline.com/doi/full/10.1080/07350015.2015.1102733

<a name="stlog-1-BCW2014"></a>    Belloni, A., Chernozhukov, V. and Wang, L. 2014.  Pivotal estimation via square-root-lasso in nonparametric
        regression.  <i>Annals of Statistics</i> 42(2):757-788.  https://doi.org/10.1214/14-AOS1204

<a name="stlog-1-CCK2013"></a>    Chernozhukov, V., Chetverikov, D. and Kato, K. 2013.  Gaussian approximations and multiplier bootstrap for
        maxima of sums of high-dimensional random vectors.  <i>Annals of Statistics</i> 41(6):2786-2819.  
        https://projecteuclid.org/euclid.aos/1387313390

<a name="stlog-1-CHS2015"></a>    Chernozhukov, V. Hansen, C., and Spindler, M. 2015.  Post-selection and post-regularization inference in
        linear models with many controls and instruments.  <i>American Economic Review: Papers &amp; Proceedings</i>
        105(5):486-490.  http://www.aeaweb.org/articles.php?doi=10.1257/aer.p20151022

<a name="stlog-1-SG2016"></a>    Correia, S. 2016.  FTOOLS: Stata module to provide alternatives to common Stata commands optimized for large
        datasets.  https://ideas.repec.org/c/boc/bocode/s458213.html

<a name="stlog-1-SCH2016"></a>    Spindler, M., Chernozhukov, V. and Hansen, C. 2016.  High-dimensional metrics.
        https://cran.r-project.org/package=hdm.

<a name="stlog-1-Tib1996"></a>    Tibshirani, R. 1996.  Regression Shrinkage and Selection via the Lasso.  <i>Journal of the Royal Statistical</i>
        <i>Society. Series B (Methodological)</i> 58(1):267-288.  https://doi.org/10.2307/2346178

<a name="stlog-1-Yam2017"></a>    Yamada, H. 2017.  The Frisch-Waugh-Lovell Theorem for the lasso and the ridge regression.  <i>Communications in</i>
        <i>Statistics - Theory and Methods</i> 46(21):10897-10902.  http://dx.doi.org/10.1080/03610926.2016.1252403


<a name="stlog-1-acknowledgements"></a><b><u>Acknowledgements</u></b>

    Thanks to Sergio Correia for advice on the use of the FTOOLS package.


<a name="stlog-1-citation"></a><b><u>Citation of pdslasso and ivlasso</u></b>

    <b>pdslasso</b> and <b>ivlasso</b> are not official Stata commands.  They are free contributions to the research community,
    like a paper.  Please cite it as such:

    Ahrens, A., Hansen, C.B., Schaffer, M.E. 2018.  pdslasso and ivlasso: Progams for post-selection and
        post-regularization OLS or IV estimation and inference.  http://ideas.repec.org/c/boc/bocode/s458459.html


<b><u>Authors</u></b>

        Achim Ahrens, Economic and Social Research Institute, Ireland
        achim.ahrens@esri.ie
        
        Christian B. Hansen, University of Chicago, USA
        Christian.Hansen@chicagobooth.edu

        Mark E Schaffer, Heriot-Watt University, UK
        m.e.schaffer@hw.ac.uk


<b><u>Also see</u></b>

       Help:  <a href="http://www.stata.com/help.cgi?rlasso"><b>rlasso</b></a>, <a href="http://www.stata.com/help.cgi?lasso2"><b>lasso2</b></a>, <a href="http://www.stata.com/help.cgi?cvlasso"><b>cvlasso</b></a> (if installed)
</pre>
