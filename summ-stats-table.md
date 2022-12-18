# A Summary Statistics Table

Before you begin, set up a do file that 
downloads data from the paper 
[Price Subsidies, Diagnostic Tests, and Targeting of Malaria Treatment: Evidence from a Randomized Controlled Trial](https://www.aeaweb.org/articles?id=10.1257/aer.20130267) by following the instructions [here](https://pjakiela.github.io/stata/making-tables.html). 

The data set contains seven baseline variables, each of which begins with the prefix `b_`.  These variables 
contain information about the characteristics of households in the sample measured prior to the start of the 
randomized trial.  This page explains how to make a table that summarizes the characteristics of these variables (means, 
standard deviations, etc.).

<br>

## Storing Summary Statistics

The command 
```
summarize b_*
```
will produce summary statistics on all the variables beginning with `b_`.  

<br>

## Exporting a Table to Excel

Now that you have your results stored in a Stata matrix, you can export it to Excel 
using the `putexcel` command (in fact, `putexcel` is a useful command for exporting matrices 
or individual statistics - read the help file!).

We start with a `putexcel set` step, which tells Stata the name of the Excel file where we want 
to write our results.  So, for example, to create an Excel file called `mysummstats.xlsx`, we could type 
```
putexcel set mysummstats.xlsx, replace
```
This file will appear in the working directory once we write something to it (which is why 
it is important to set your working directory carefully).  The second `putexcel` step is very 
straightforward:  the command is `putexcel` followed by the coordinates of the cell where we want to put 
the upper left corner of our matrix; then after the equal sign, we call our matrix.  So, we could type:
```
putexcel A2 = matrix(mystats), names 
```
The `names` option tell Excel to use the row and column names that we so painstakingly added 
to the `mystats` matrix.  

Try this.  If you run your do file from the top, you should see an Excel file that looks something like this:  

![Excel table 1](excel-summstats.png)  

Not bad, but still not exactly what we're looking for.  How can we improve the table?  

One way to truncate numbers is to use the `matmap` function in Stata.  `matmap` allows you to apply a Stata function, 
in this case the `round` function, to every cell of a Stata matrix.  The command
```
matmap mystats roundstats, map(round(@,0.01))
```
generates a new Stata matrix, `roundstats` which rounds numbers to the nearest 0.01.  We can then export this matrix 
to Excel (over-writing `mystats`) using the `putexcel` command.

One nice thing about `putexcel` is that we can modify the formatting after we've exported out main results matrix.  So, 
to add a border to the bottom of the table, we could use the command
```
putexcel A9:F9, border(bottom)
```
You can use similar code to add a border to the top, add a title across the row of cells above the table, or apply other 
formatting.  it is worth exploring the help file to see what else you can do.

<br>

## Exporting a Table to Word

If you prefer to export your table to Microsoft Word, you can do that using the `putdocx` command - but be aware 
that it is much less flexible than `putexcel`.  The operation of writing your table to a word document all occurs in one step,
so you can't modify table formatting or add a title or notes after the fact.  If we wanted to export our summary statistics 
table to word, we could use the code
```
putdocx clear
putdocx begin
putdocx table tbl1 = matrix(roundstats), ///
rownames colnames ///
border(top, double) border(bottom, double) ///
border(insideH, nil) border(insideV, nil) ///
border(start, nil) border(end, nil) ///
cellmargin(all, 0.1 cm) 
putdocx save mysummstats, replace
```

An alternative approach is to use the `estpost` command after `tabstat`, following 
the instructions provided in [The Stata to LaTeX Guide](https://medium.com/the-stata-guide/the-stata-to-latex-guide-6e7ed5622856), 
which is useful even if you don't intend to export your results to LaTeX.

<br>

## A do File

An example do file that executes all of these commands is available [here](summ-stats-example.do).


