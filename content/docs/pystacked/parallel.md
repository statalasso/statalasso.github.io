---
title: Parallelization
weight: 14
bookToC: false
---

## Parallelization

`pystacked` can be run in parallel, even without a StataMP license.

Here, we use `pystacked` with `njobs(-1)` which indicates that we want to use all available CPUs. 

```
. clear all 
. insheet using ///
  https://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.data, ///
  clear comma
. set seed 42
. gen u = runiform()
. sort u

. timer on 1
. pystacked v58 v1-v57, type(class) pyseed(123) methods(rf gradboost nnet) ///
             cmdopt1(n_estimators(1000))
. timer off 1

. timer on 2
. pystacked v58 v1-v57, type(class) pyseed(123) methods(rf gradboost nnet) ///
             cmdopt1(n_estimators(1000)) njobs(-1)
. timer off 2

. timer list
   1:     29.54 /        1 =      29.5380
   2:     19.26 /        1 =      19.2600   
```

If you don't want to use all CPUs, you can use, for example, `n_jobs(4)` to ask for 4 CPUs; see also the [scikit-learn documentation](https://scikit-learn.org/stable/glossary.html).

{{< hint warning >}} 
You can change the backend used for parallelization using `backend()`; the default is 'loky' under Linux/MacOS and 'threading' under Windows. See [here](https://scikit-learn.org/stable/modules/generated/sklearn.utils.parallel_backend.html) for more information.
{{< /hint >}}