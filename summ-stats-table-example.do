

// PRELIMINARIES

clear all 
set scheme s1mono 
set more off

** sort out your working directory
cd "C:\Users\pj\Dropbox\ECON-460\data-assignments\methods1"


// GETTING STARTED

** load data
webuse set https://pjakiela.github.io/ECON523/exercises
webuse E1-CohenEtAl-data.dta

** you can learn about the baseline variables by typing 

desc b_*

** you can see summary statistics on the baseline variables by typing
** which is stata shorthand for summarize [all the variables that start with b_]

sum b_*


// USING TABSTAT

** look at the help file for the tabstat command

*help tabstat

** simplest possible use of tabstat

tabstat b_*

** tabstat with the summary statistics we want, but not pretty

tabstat b_*, stat(mean sd min max N)

** here is the table we want

tabstat b_*, stat(mean sd min max N) col(stat) save


// SAVING TABSTAT RESULTS IN A MATRIX

mat mystats = r(StatTotal)
mat list mystats

** oriented the wrong way so we use 

mat mystats = mystats'
mat list mystats

* clean up the names of the columns and rows

matrix colnames mystats = Mean SD Minimum Maximum Observations
matrix rownames mystats = Education "Malaria Knowledge" "Household Size" "Acres of Land" "Distance to Health Center" Age "Age Data Missing"
mat list mystats

// EXPORTING TO EXCEL

putexcel set mysummstats.xlsx, replace

putexcel A2 = matrix(mystats), names 

** we don't want to have so many digits for the numbers that are not round - what can we do?

** one option is:  putexcel A2 = matrix(mystats), names nformat(#.##)
** but this doesn't actually look great either

** so we can try the matmap command

matmap mystats roundstats, map(round(@,0.01))
putexcel A2 = matrix(roundstats), names // comment out the nformat line

** we can also add a title and a border
putexcel A1:F1 = "Table 1:  Summary Statistics", bold merge border(bottom)
putexcel (A2:F2), bold border(bottom) 
putexcel A9:F9, border(bottom)

** now we have a pretty good table


// EXPORTING TO WORD

putdocx clear
putdocx begin
putdocx table tbl1 = matrix(roundstats), rownames colnames ///
border(top, double) border(bottom, double) ///
border(insideH, nil) border(insideV, nil) border(start, nil) border(end, nil) ///
cellmargin(all, 0.1 cm) 

putdocx save mysummstats, replace

* you might like leading zeros but we can't have nice things in word
* also you might like a title and some table notes, but you can't have those nice things either (without messing up your borders)
* and no interior borders
* so often better to start in excel and paste to word at the last minute





