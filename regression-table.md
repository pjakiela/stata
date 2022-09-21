# A Regression Table

The stata commands `eststo` and `esttab` allow you to make attractive, 
self-contained tables with very little effort.  Before you begin, set up a do file that 
downloads your data by following the instructions [here](https://pjakiela.github.io/stata/making-tables.html).

## Storing Regression Results with `eststo`

`eststo` is a Stata command that allows you to save the results of a regression.  Immediately after you run 
any regression, your results are saved in a collection of local macros and matrices (you can see what is saved 
by typing `return list` and `ereturn list` immediately after running your regreession).  These locals are 
over-written as soon as you run another regression - so we need to save them somewhere.  This is what `eststo` does.

`eststo` is very easy to use.  You can simply type `eststo` after running any regression.  Alternatively, you can preceed 
each regression command with `eststo:` as in:
```
eststo:  c_act coartemprice
```
By default, `eststo` saves the results from your first regression as `est1`, the results from your second regression 
as `est2`, est.  But you can provide alternative names if you prefer:  just type `eststo` followed by your preferred name 
for a particular specification (either after running the regression or before the colon in a single line of code).

To see which regression results are currently stored in memory, type `eststo dir`.  The erase them and start fresh, 
type `eststo clear`.  

## Exporting Regression Results
 
