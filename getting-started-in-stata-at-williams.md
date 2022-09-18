# Getting Started in Stata

Williams students can download Stata from [Williams OIT](https://oit.williams.edu/software/).  Search 
for Stata on the OIT webpage, and then click on the Stata SE option.  From there, scroll down 
to select the Mac or Windows option as appropriate.  When you click on the Mac or Windows link, 
you'll be taken to a google doc where you can download the Stata installer.  Save this to a folder 
on your computer and then go to the place where you've saved it and double click on the installer program
to begin installing Stata on your computer.  After you install Stata, you'll need to enter the serial number, 
code, and authorization listed in the google doc the first time you open Stata.  

## Tutorial Videos

Once you've installed Stata, Williams ECON's [Stata Tutorial Videos](https://pjakiela.github.io/stata/) 
can provide a good introduction to Stata.  You can also use Stata's help files by typing 
`help` followed by the name of any Stata command into the Stata command window.  Key commands 
that you may want to explore as you get started are `describe`, `summarize`, `tabulate`, and 
`codebook`.  These will help you familiarize yourself with any Stata data set.

## Downloading Data

Here is a simple do file that will download a data set from the web:
```
clear all
webuse set https://pjakiela.github.io/ECON523/exercises
webuse E1-CohenEtAl-data.dta
```
The data come from [Jessica Cohen, Pascaline Dupas, and Simone Schaner's 2015 paper 
on take-up of malaria treatment medication in rural Kenya](https://www.aeaweb.org/articles?id=10.1257/aer.20130267).  It 
is a great paper, but in this case we are primarily interested in having a compact, clean data set 
to use as we explore Stata's functionality.

Once you've downloaded the data set, see if you can do the following tasks:

- `count` the number of observations in the data set
- `describe` the variables in the data set
- `tabulate` the values of a particular variable
- use `summarize` to find the mean and standard deviation of a variable
- use `summarize` to find the median of a variable
- determine how many observations are missing information on a particular variable
- `rename` a variable
- change the label associated with a variable
- `generate` a new variable
- `replace` some values of a variable with alternative values
