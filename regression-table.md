# A Regression Table

The stata commands `eststo` and `esttab` allow you to make attractive, 
self-contained tables with very little effort.  Before you begin, set up a do file that 
downloads data from the paper 
[Price Subsidies, Diagnostic Tests, and Targeting of Malaria Treatment: Evidence from a Randomized Controlled Trial](https://www.aeaweb.org/articles?id=10.1257/aer.20130267) by following the instructions [here](https://pjakiela.github.io/stata/making-tables.html).

<br>

## Storing Regression Results with `eststo`

`eststo` is a Stata command that allows you to save the results of a regression.  Immediately after you run 
any regression, your results are saved in a collection of local macros and matrices (you can see what is saved 
by typing `ereturn list` immediately after running your regreession).  These locals are 
over-written as soon as you run another regression - so we need to save them somewhere.  This is what `eststo` does.

`eststo` is very easy to use.  You can simply type `eststo` after running any regression.  Alternatively, you can preceed 
each regression command with `eststo:`, as you can see in this example:
```
eststo:  c_act coartemprice
```
By default, `eststo` saves the results from your first regression as `est1`, the results from your second regression 
as `est2`, est.  But you can provide alternative names if you prefer:  just type `eststo` followed by your preferred name 
for a particular specification (either after running the regression or before the colon in a single line of code).  

To see which regression results are currently stored in memory, type `eststo dir`.  The erase them and start fresh, 
type `eststo clear`.  It is worth taking a look at the help file for `eststo` to familiarize yourself with its syntax before proceeding.

<br>

## Exporting Regression Results to Word
 
Suppose you run the following regressions and you want to export your results as a regression table:
```
eststo clear
eststo:  reg c_act coartemprice
eststo:  reg c_act coartemprice b_*
```
Simply typing `esttab` after storing the results of these regressions will produce a decent-looking regression table 
in Stata's output window:

![esttab results](esttab1.png)

If you want to export this table to a word document, you can instead used the command 
```
esttab using myregtable.rtf, replace
```
which will save a rich text format file in your working directory, which you can then open using word.

We can clean the table up considerably by labeling our variables using the `label var` command.  Labels 
should be short, so that they do not wrap over multiple lines in your table.  They should also be self-expanatory, 
though you can include additional information in the table notes when necessary.  

Having relabeled the data, you can use `esttab` to generate a new version of your regression table.  By playing 
around with `esttab`'s `varwidth()` and `modelwidth()` options, you can make sure that your columns are wide enough 
to contain your variable labels.  This gives you a fairly professional looking table:

![moah esttab results](esttab2.png) 

Of course, before publishing this table, you'd want to find out why your two regression specifications include 
different numbers of observations!  You might also try replacing the t-statistics with standard errors using 
`esttab`'s `se` option, or keeping only the coefficients on price using the `keep` option.  Be sure to use the 
`addnotes()` option to add any relevant information in the table notes.

<br>

## Exporting Regression Results to LaTeX or Excel

The `esttab` command can also be used to export regression results to 
Excel or LaTeX.  To export to Excel, just name your new file as a csv file rather 
than an rtf file:
```
esttab using myregtable.csv, replace
```
A nice thing about exporting to Excel is that you can make additional modifications 
(for example, to format borders) using the `putexcel` command.

`esttab` can also export your table to LaTeX - all you need to do 
is give your new file a name that ends in tex.  For example, 
if you export your regression results using the code 
```
esttab using myregtable.tex, label b(2) se(2) nostar replace ///
   title(Regression table\label{tab1})
 ```
you can compile a pdf of the table in overleaf or any other LaTeX compiler 
with the LaTeX code:
```
\documentclass[12pt]{article}
\begin{document}
\input{myregtable.tex}
\end{document}
```

<br>

## A do File

A do file containing the code used in these examples is available 
[here](reg-table-example.do).
