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
## lassopack and pdslasso

The latest versions of **lassopack** (v1.3) and **pdslasso** (v1.1) are available through the SSC repository:

	ssc install lassopack
	ssc install pdslasso

Note that **pdslasso** requires **lassopack** to be installed. 

Alternatively you can download the packages via our website:

	net install lassopack, from("https://raw.githubusercontent.com/statalasso/lassopack/master/lassopack_v13/") 
	net install pdslasso, from("https://raw.githubusercontent.com/statalasso/pdslasso/master/pdslasso_v11/") 
		
Add `replace` to overwrite existing versions of the packages. 

*Note:* We update the Github version of the packages more frequently. 
Please check for updates on a regular basis.

## lassologit 

We have integrated the lassologit programs into lassopack (as of version 1.3). You only need to install **lassopack**.

## Verify installation

To check that the packages were installed correctly, 
type e.g.
	
	whichpkg lassopack

which requires the user-written package **whichpkg**. 
