# Getting Started in Stata

Williams students can download Stata from [Williams OIT](https://oit.williams.edu/software/).  Search 
for Stata on the OIT webpage, and then click on the Stata SE option.  From there, scroll down 
to select the Mac or Windows option as appropriate.  You'll be taken to a google doc where you can 
download the Stata installer.  After you install Stata, you'll need to enter the serial number, 
code, and authorization listed in the google doc the first time you open Stata.  

## Tutorial Videos

Once you've installed Stata, Williams ECON's [Stata Tutorial Videos](https://pjakiela.github.io/stata/) 
can provide a good introduction to Stata.  You can also use Stata's help files by typing 
`help` followed by the name of any Stata command into the Stata's command window.  Key commands 
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
is a great paper, but their replication files also make a nice and nicely-cleaned data set to use 
when familiariazing yourself with Stata's functionality.
