---
title: "Installation"
weight:  20
---

## SSC version

You can get **lassopack** from SSC:
	
	ssc install lassopack

Add `replace` to overwrite existing versions of the packages. 
	
## Github installation

Please note that we update the SSC versions less frequently. You can get the lastest versions from github:  
	
	net install pdslasso, ///
		from("https://raw.githubusercontent.com/statalasso/pdslasso/master/") 

Please check for updates on a regular basis.

## Installing old versions:

We keep old versions of **lassopack** on github to 
facilitate reproducibility.
For example, to install version 1.2 of lassopack, simply use

	net install lassopack, ///
		from("https://raw.githubusercontent.com/statalasso/lassopack/master/lassopack_v12")

Check out our github repositories [here](https://github.com/statalasso/lassopack) and [here](https://github.com/statalasso/pdslasso)
to see which old versions are available.

## Offline installation

If you want to use **lassopack** in an offline environment, 
we recommend to download the packages from the Github repositories. The links to 
repositories are above; click the green button "Code" 
and "Download ZIP". Then run `net install` as above but `from()`
should refer to the downloaded and unzipped repository folder. 

## Verify installation

To check that the packages were installed correctly, 
type e.g.
	
	whichpkg lassopack

which requires the user-written package **whichpkg**. 

We recommend to add this to your log files to facilitate reproducibility.