          . clear all


          . insheet using ///
                           https://statalasso.github.io/dta/housing.csv,  ///
                           clear comma

          (14 vars, 506 obs)

          . set seed 789

          . gen train=rnormal()

          . replace train=train>.75
          (506 real changes made)

          . pystacked medv crim-lstat if train, ///
                   type(regress) pyseed(243) method(gradboost)

          Single base learner: no stacking done.
          ---------------------------------------
            Method         |      Weight
          -----------------+---------------------
            gradboost      |      1.0000000

          . predict double ygb if !train

          . pystacked medv crim-lstat if train, ///
                   type(regress) pyseed(243) method(gradboost) ///
                   cmdopt1(learning_rate(.01))

          Single base learner: no stacking done.
          ---------------------------------------
            Method         |      Weight
          -----------------+---------------------
            gradboost      |      1.0000000

          . predict double ygb2 if !train

          . pystacked medv crim-lstat if train, ///
                   type(regress) pyseed(243) method(gradboost) ///
                   cmdopt1(learning_rate(.01) n_estimators(1000))

          Single base learner: no stacking done.
          ---------------------------------------
            Method         |      Weight
          -----------------+---------------------
            gradboost      |      1.0000000

          . predict double ygb3 if !train

          . gen double rgb_sq=(medv-ygb)^2
          (112 missing values generated)

          . gen double rgb2_sq=(medv-ygb2)^2
          (112 missing values generated)

          . gen double rgb3_sq=(medv-ygb3)^2
          (112 missing values generated)

          . sum rgb* if!train

              Variable |        Obs        Mean    Std. Dev.       Min        Max
          -------------+---------------------------------------------------------
                rgb_sq |        394    20.08567    83.25935   8.54e-06   830.1214
               rgb2_sq |        394    32.50195    87.89791   .0010292   780.5784
               rgb3_sq |        394    19.92709    83.60578   .0000584   828.6569

          . pystacked medv crim-lstat if train, ///
                   type(regress) pyseed(243) method(lassocv)  

          Single base learner: no stacking done.
          ---------------------------------------
            Method         |      Weight
          -----------------+---------------------
            lassocv        |      1.0000000

          . predict double ylasso1 if !train

          . pystacked medv crim-lstat if train, ///
                   type(regress) pyseed(243) method(lassocv) ///
                   pipe1(poly2)

          Single base learner: no stacking done.
          ---------------------------------------
            Method         |      Weight
          -----------------+---------------------
            lassocv        |      1.0000000

          . predict double ylasso2 if !train

          . gen double rlasso1_sq=(medv-ylasso1)^2
          (112 missing values generated)

          . gen double rlasso2_sq=(medv-ylasso2)^2
          (112 missing values generated)

          . sum *sq if!train

              Variable |        Obs        Mean    Std. Dev.       Min        Max
          -------------+---------------------------------------------------------
                rgb_sq |        394    20.08567    83.25935   8.54e-06   830.1214
               rgb2_sq |        394    32.50195    87.89791   .0010292   780.5784
               rgb3_sq |        394    19.92709    83.60578   .0000584   828.6569
            rlasso1_sq |        394     29.7029    91.87267   .0000137   1025.592
            rlasso2_sq |        394     21.2016    72.14927   .0000444   790.9036



