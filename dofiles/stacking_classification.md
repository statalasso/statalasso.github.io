<pre id="stlog-1" class="stlog"><samp>. insheet using ///
&gt;         https://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.data, ///
&gt;     clear comma
(58 vars, 4,601 obs)

. 
. set seed 42

. gen u = runiform()

. sort u

. 
. pystacked v58 v1-v57 if _n&lt;=3000                || ///
&gt;                         m(logit) pipe(poly2)    || ///
&gt;                         m(rf) opt(n_estimators(1000)) || ///
&gt;                         m(gradboost) opt(n_estimators(1000)) || ///
&gt;                         m(nnet)                                 || ///
&gt;                         m(nnet) opt(hidden_layer_sizes(50 50 50)) || ///
&gt;                         m(nnet) opt(hidden_layer_sizes(200)) || ///
&gt;                         , type(class) pyseed(123) njobs(-1) 
---------------------------------------
  Method         |      Weight
-----------------+---------------------
  logit          |      0.0000000
  rf             |      0.2479815
  gradboost      |      0.6318673
  nnet           |      0.0317621
  nnet           |      0.0038639
  nnet           |      0.0845252

.                         
. predict spam, class

. tab spam v58 if _n&lt;=3000, cell

+-----------------+
| Key             |
|-----------------|
|    frequency    |
| cell percentage |
+-----------------+

           |          v58
      spam |         0          1 |     Total
-----------+----------------------+----------
         0 |     1,792          2 |     1,794 
           |     59.73       0.07 |     59.80 
-----------+----------------------+----------
         1 |         1      1,205 |     1,206 
           |      0.03      40.17 |     40.20 
-----------+----------------------+----------
     Total |     1,793      1,207 |     3,000 
           |     59.77      40.23 |    100.00 

. tab spam v58 if _n&gt;3000, cell

+-----------------+
| Key             |
|-----------------|
|    frequency    |
| cell percentage |
+-----------------+

           |          v58
      spam |         0          1 |     Total
-----------+----------------------+----------
         0 |       964         43 |     1,007 
           |     60.21       2.69 |     62.90 
-----------+----------------------+----------
         1 |        31        563 |       594 
           |      1.94      35.17 |     37.10 
-----------+----------------------+----------
     Total |       995        606 |     1,601 
           |     62.15      37.85 |    100.00 

. 
. pystacked, table holdout
---------------------------------------
  Method         |      Weight
-----------------+---------------------
  logit          |      0.0000000
  rf             |      0.2479815
  gradboost      |      0.6318673
  nnet           |      0.0317621
  nnet           |      0.0038639
  nnet           |      0.0845252

Number of holdout observations: 1601

Confusion matrix: In-Sample and Out-of-Sample
------------------------------------------------------------
  Method         | Weight      In-Sample       Out-of-Sample
                 |             0       1         0       1  
-----------------+------------------------------------------
  STACKING     0 |    .      1792       1       964      31
  STACKING     1 |    .         2    1205        43     563
  logit        0 | 0.000     1087     706       571     424
  logit        1 | 0.000       73    1134        40     566
  rf           0 | 0.248     1792       1       961      34
  rf           1 | 0.248        0    1207        46     560
  gradboost    0 | 0.632     1792       1       960      35
  gradboost    1 | 0.632        2    1205        43     563
  nnet         0 | 0.032     1747      46       946      49
  nnet         1 | 0.032      106    1101        72     534
  nnet         0 | 0.004     1572     221       831     164
  nnet         1 | 0.004       45    1162        33     573
  nnet         0 | 0.085     1746      47       947      48
  nnet         1 | 0.085      114    1093        70     536

. pystacked, graph(subtitle(Spam data)) lgraph(plotopts(msymbol(i) ylabel(0 1, format(%3.1f)))) holdou
&gt; t
---------------------------------------
  Method         |      Weight
-----------------+---------------------
  logit          |      0.0000000
  rf             |      0.2479815
  gradboost      |      0.6318673
  nnet           |      0.0317621
  nnet           |      0.0038639
  nnet           |      0.0845252

Number of holdout observations: 1601
</samp></pre>
