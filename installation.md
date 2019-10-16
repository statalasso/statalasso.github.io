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

The latest version of **pdslasso** (v1.1) is available through the SSC repository:

	ssc install pdslasso
	
Alternatively you can download **pdslasso** via our website:
	
	net install pdslasso, from("https://raw.githubusercontent.com/statalasso/pdslasso/master pdslasso_v11/") 

Note that **pdslasso** requires **lassopack** to be installed. 

The latest stable version of **lassopack** (v1.3.1, 16th October 2019) is currently only available via github:

	net install lassopack, from("https://raw.githubusercontent.com/statalasso/lassopack/master/lassopack_v131/") 
		
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
