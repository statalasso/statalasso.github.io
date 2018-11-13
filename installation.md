---
layout: single
author_profile: false
sidebar:
  nav: "docs"
toc:  false
classes:  wide
---

<script type="text/javascript" async
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

<div markdown="1">
## SSC versions (September 9, 2018)

Both *LASSOPACK* and *PDSLASSO* are available through the SSC repository:

	ssc install lassopack
	ssc install pdslasso

Note that *PDSLASSO* requires *LASSOPACK* to be installed. 

## Latest versions

You can download the latest version of **lassopack** (v1.1.01, 8Nov2018) and **pdslasso** (v1.0.10, 8Nov2018) from our github repositories as follows:

	net install lassopack, from("https://raw.githubusercontent.com/statalasso/lassopack/master/lassopack_v1101/") ///
		replace
	net install pdslasso, from("https://raw.githubusercontent.com/statalasso/pdslasso/master/pdslasso_v1010/") ///
		replace
		
These version includes a few more bug fixes. We encourage you to try it out. Feedback welcome. 
