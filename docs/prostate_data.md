---
title: "Prostate data"
permalink: /docs/prostate_data/
layout:  single
sidebar:
  nav: "docs"
---

The dataset is available through Hastie et al. (2009) on the [authors' website](https://web.stanford.edu/~hastie/ElemStatLearn/).  The
following variables are included in the dataset of 97 men:

**Predictors**

| ----------|:-------------------------------------------------:|
| lcavol    | log(cancer volume)				|
| lweight   | log(prostate weight)				|
| age       | patient age					|
| lbph      | log(benign prostatic hyperplasia amount)		|
| svi       | seminal vesicle invasion				|
| lcp       | log(capsular penetration)				|
| gleason   | Gleason score					|
| pgg45     | percentage Gleason scores 4 or 5			|

**Outcome**
	
| ----------|:-------------------------------------------------:|
| lpsa 	    | log(prostate specific antigen)			|

To load prostate cancer data:

	. insheet using
	    https://web.stanford.edu/~hastie/ElemStatLearn/datasets/prostate.data, clear
	    tab
