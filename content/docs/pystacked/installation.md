---
title: Installation
weight: 20
---

## Installation

You can get the lastest versions from Github:  
```
net install pystacked, ///
	from(https://raw.githubusercontent.com/aahrens1/pystacked/main) replace
```

Please check for updates on a regular basis.

{{< hint warning >}} 
`pystacked` requires at least Stata 16 (or higher), a Python installation and [scikit-learn](https://scikit-learn.org/stable/) (0.24 or higher). Python and scikit-learn are available for free.
{{< /hint >}}

### Setting up Python

If you haven't set up Python for Stata, type `help python` and check [this Stata blog post](https://blog.stata.com/2020/08/18/stata-python-integration-part-1-setting-up-stata-to-use-python/) for how to set up Python for Stata on your system.

In short, you can either install Python manually (e.g. from [www.python.org/](https://www.python.org/downloads/))
or use a distribution such as [Anaconda](https://www.anaconda.com/products/individual#Downloads). Anaconda is
in most cases the easier method. 

After you have installed Python, you might also need to tell Stata where your Python installation is located. You 
can do this using `python set exec`. Note that you will usually have more than one Python installation on your system, since Python is shipped with all common operating systems (yet, usually an old version). `python search` will show all 
Python installations Stata can find.

### Updating scitkit-learn

`pystacked` requires scikit-learn 0.24 or higher. You can check your scikit-learn version using:

```
. python: import sklearn
. python: sklearn.__version__
```

If you use Anaconda, you can use the Anaconda Navigator (or the `conda` command line tool) to update packages. Otherwise you can use 
`pip` (see [here](https://docs.python.org/3/installing/index.html#)). 

For example, if your Python installation is located in /usr/local/bin/python3.9, you could update scikit-learn by typing 
```
/usr/local/bin/python3.9 -m pip install -U scikit-learn
```
into the terminal, or directly in Stata (restart required):
```
. shell /usr/local/bin/python3.9 -m pip install -U scikit-learn
```

### Offline installation

If you want to use `pystacked` in an offline environment, 
we recommend to download the packages from the [Github repository](https://github.com/aahrens1/pystacked). Click the green button "Code" 
and "Download ZIP". Then run `net install` as above but `from()`
should refer to the downloaded and unzipped repository folder. 

### Verify installation

To check that the packages were installed correctly, 
type e.g.
	
	whichpkg pystacked

which requires the user-written package **whichpkg**. 

We recommend to add this to your log files to facilitate reproducibility.