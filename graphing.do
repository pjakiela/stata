//Graphing -- huge topic

//Your best friend when it comes to graphing is the following command:
help twoway

clear all
cd "/Users/tristanwille/Desktop/Stata Modules/Graphs"
sysuse auto

//Simple scatterplot
twoway scatter price weight

//schemes are a good way to customize a graph without having to get bogged down with options

twoway scatter mpg price, scheme(s1mono)
twoway scatter mpg price, scheme(s2color)
twoway scatter mpg price, scheme(economist)

help scheme

//you can also graph plots on top of other plots
reg price weight
predict resid_price

twoway (scatter price weight) (line resid_price weight)

//You can also add options
twoway scatter price weight, mcolor(red) msymbol(diamond) msize(vsmall)
//to save a graph:
graph export scatterplot.png, replace


//other important graph -- histogram
hist price

