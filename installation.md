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
## SSC version

You can get **lassopack** and **pdslasso** from SSC:
	
	ssc install lassopack
	ssc install pdslasso

Note that **pdslasso** requires **lassopack** to be installed. 

Add `replace` to overwrite existing versions of the packages. 
	
## Github installation

Please note that we update the SSC versions less frequently. You can get the lastest versions from github:  
	
	net install lassopack, from("https://raw.githubusercontent.com/statalasso/lassopack/master/") 
	net install pdslasso, from("https://raw.githubusercontent.com/statalasso/pdslasso/master/") 

Please check for updates on a regular basis.

## Installing old versions:

We keep old versions of **lassopack** and **pdslasso** on github to 
facilitate reproducibility.
For example, to install version 1.2 of lassopack, simply use

	net install lassopack, from("https://raw.githubusercontent.com/statalasso/lassopack/master/lassopack_v12")

Check out our github repositories [here](https://github.com/statalasso/lassopack) and [here](https://github.com/statalasso/pdslasso)
to see which old versions are available.

## lassologit 

We have integrated the lassologit programs into lassopack (as of version 1.3). You only need to install **lassopack**.

## Verify installation

To check that the packages were installed correctly, 
type e.g.
	
	whichpkg lassopack

which requires the user-written package **whichpkg**. 

We recommend to add this to your log files to facilitate reproducibility.
