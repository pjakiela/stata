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

<br>

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

<br>

## Saving `tabstat` Results as a Matrix

When you use `tabstat` with the `save` option, Stata automatically stores your summary statistics 
in a local matrix called `r(StatTotal)`.  To keep those results from disappearing when you run another command, 
we need to save them in a new matrix with a name of our choosing.  We can do this by using the commands
```
mat mystats = r(StatTotal)
```
where `mat` is short for matrix.  To see what is contained in the matrix `mystats`, type:
```
mat list mystats
```
Unfortunately, this matrix doesn't look exactly the way we want our summary statistics table to look:  even 
though we used the `col(stat)` option with `tabstat`, the different variables are columns rather than rows 
in our matrix; and the variable names are not self-explanatory.  

We can fix this in two steps.  First, we need to transpose our `mystats` matrix by adding the command 
```
matrix mystats = matrix(mystats)'
```
to our do file.  Use the `mat list` command again to see that our matrix is now set up correctly.  

We can also use the commands `matrix rownames` and `matrix colnames` to change the names associated 
with the rows and columns of our matrix.  For example, we could change the headings of the last 
three columns from **Max**, **Min**, and **N** to **Maximum**, **Minimum**, and **Observations** using the command
```
matrix colnames mystats = Mean SD Minimum Maximum Observations
```
