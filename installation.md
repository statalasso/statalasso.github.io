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
## lassopack and pdslasso (January 15, 2019)

The latest versions of **lassopack** (v1.2) and **pdslasso** (v1.1) are available through the SSC repository:

	ssc install lassopack
	ssc install pdslasso

Note that **pdslasso** requires **lassopack** to be installed. 

Alternatively you can download the packages via our website:

	net install lassopack, from("https://raw.githubusercontent.com/statalasso/lassopack/master/lassopack_v12/") 
	net install pdslasso, from("https://raw.githubusercontent.com/statalasso/pdslasso/master/pdslasso_v11/") 
		
Add `replace` to overwrite existing versions of the packages. 
We update the Github version of the packages more frequently. 
Currently, both SSC and Github version are identical.

## lassologit 

**lassologit** is currently only available from Github:

	net install lassologit, from("https://raw.githubusercontent.com/statalasso/lassologit/master/lassologit_v01/") 

## Verify installation

To check that the packages were installed correctly, 
type e.g.
	
	whichpkg lassopack

which requires the user-written package **whichpkg**. 
