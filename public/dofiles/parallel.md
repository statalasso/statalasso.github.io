          . clear all 


          . adopath ++ /Users/kahrens/MyProjects/pystacked/ 
            [1]              "/Users/kahrens/MyProjects/pystacked/"
            [2]  (BASE)      "/Applications/Stata 16/ado/base/"
            [3]  (SITE)      "/Applications/Stata 16/ado/site/"
            [4]              "."
            [5]  (PERSONAL)  "/Users/kahrens/Documents/Stata/ado/personal/"
            [6]  (PLUS)      "/Users/kahrens/Library/Application Support/Stata/ado/plus/"
            [7]  (OLDPLACE)  "~/ado/"

          . insheet using ///
                   https://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.data, ///
               clear comma

          (58 vars, 4,601 obs)

          . set seed 42

          . gen u = runiform()

          . sort u

          . timer on 1

          . pystacked v58 v1-v57  , type(class) pyseed(123) methods(rf gradboost nnet) ///
                       cmdopt1(n_estimators(1000))

          ---------------------------------------
            Method         |      Weight
          -----------------+---------------------
            rf             |      0.5960047
            gradboost      |      0.3618474
            nnet           |      0.0421479

          . timer off 1

          . timer on 2

          . pystacked v58 v1-v57  , type(class) pyseed(123) methods(rf gradboost nnet) ///
                       cmdopt1(n_jobs(-1) n_estimators(1000))

          ---------------------------------------
            Method         |      Weight
          -----------------+---------------------
            rf             |      0.5960047
            gradboost      |      0.3618474
            nnet           |      0.0421479

          . timer off 2

          . timer on 3

          . pystacked v58 v1-v57  , type(class) pyseed(123) methods(rf gradboost nnet) ///
                       cmdopt1(n_estimators(1000)) njobs(-1)

          ---------------------------------------
            Method         |      Weight
          -----------------+---------------------
            rf             |      0.5960047
            gradboost      |      0.3618474
            nnet           |      0.0421479

          . timer off 3

          . timer list
             1:     29.54 /        1 =      29.5380
             2:     13.87 /        1 =      13.8730
             3:     19.26 /        1 =      19.2600



