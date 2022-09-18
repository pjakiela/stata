# A Summary Statistics Table

The data set contains 7 baseline variables, each of which begins with the prefix `b_`.  Use the 
command
```
describe b_*
```
to list these variables along with their labels (`*` is a wildcard:  it tells Stata to look for all variables 
that begin with `b_`, regardless of what comes next).  These variables contain information about 
the characteristics of households in the sample measured prior to the start of the 
randomized trial.  
 
If you type the command 
```
sum b_*
``` 
Stata will report summary statistics about the baseline variables.  Which summary statistics are reported?

## Stata's `tabstat` Command

One of the sumplest ways to export a similar table to Word or Excel is to use the `tabstat` command.  Try 
typing the command 
```
tabstat b_*
```
to see one way that `tabstat` can work.  We are going to make a summary statistics table that contains 
the mean, the standard deviation, the minimum and maximum values, and the number of observations for each 
baseline variable.  Try to use the help file to figure out how to get `tabstat` to report all of these 
statistics in one table.

Once you succeed, your Stata output will probably look something like this:
![tabstat output](tabstat1.png)  
This **is** a table reporting the summary statistics that we are interested in, but it is not 
something that we would like to include in one of our papers!  Because the variable names are 
truncated, we can't even tell which variables are included.  However, if you try adding 
`col(stat) save` at the end of your `tabstat` command, your output should look better - and your results 
will be temporarily saved in Stata's local memory as the matrix `r(StatTotal)`.
